#!/usr/bin/expect -f
# @author  : wangjia
# @time    : 2016/03/12 11:10
# desc    :  expect 登录

set timeout 3
#接受传入参数,
#参数1是 user@ip,
#参数2 password
set user_ip [lindex ${argv} 0]
set password [lindex ${argv} 1]

#套壳 根据 expect 发送 对应信息
spawn ssh ${user_ip}
# 根据期望做出对应的动作，自动输入密码
expect {
    "*assword:*" { send  "${password}\r"}
}
#将操作权交还给用户
interact

