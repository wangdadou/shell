#!/bin/bash
# @author  : wangjia
# contact : wangjia_yql@qq.com
# desc    : final ssh
# server_info_array : id  desc  username  outsite-ip  insite-ip    connect-type  key-path/password

#读取配置文件
# @param1 $1服务器信息配置表
function init_server_info_arr(){
    conf_file_path=$1;
    lineCount=0;
    while read oneLine
    do
        lines[lineCount]=${oneLine}
        let lineCount++;
    done < ${conf_file_path}
    print_server_list
}

#服务器信息打印
function print_server_list(){
    for i in "${!lines[@]}";
    do
        echo "  ${lines[i]}"
    done
}

# 用户选择需要连接的服务器
function interact_user(){
    read -p " which server to connect? Input the server id : " user_choose
    input_check "${user_choose}"
}

#进行连接
# @param1 配置文件的行
function connect_by_line(){
    choose_server=$1;
    #按空格分割成数组
    server_info_arr=(${choose_server// / })
    if [ "${server_info_arr[4]}" == "key" ]
    then
        echo "ssh -i "${server_info_arr[5]}" "${server_info_arr[2]}@${server_info_arr[3]}""
        ssh -i "${server_info_arr[5]}" "${server_info_arr[2]}@${server_info_arr[3]}";
    elif [ "${server_info_arr[4]}" = "password" ]
    then
        pw_login "${server_info_arr[2]}@${server_info_arr[3]}" "${server_info_arr[5]}";
    else
        echo "ssh "${server_info_arr[2]}@${server_info_arr[3]}""
        ssh "${server_info_arr[2]}@${server_info_arr[3]}";
    fi
}

#账号密码登录 expect 脚本调用
# @param1  用户登录名@IP eg.. root@123.23.12.22
# @param2  password
function pw_login(){
    /Users/wangjia/coder/github/shell/ssh/expect_login.sh  $1 $2
}

#用户交互 输入检查
function input_check(){
    input=$1
    if [[ ${input} =~ ^[1-9]+$ ]] && [ ${input} -lt ${lineCount} ]
    then
        input="pass"
    else
        echo " wrong enter"
        exit
    fi
}

