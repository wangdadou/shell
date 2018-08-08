## shell 
### ssh_tool
​	远程连接服务器脚本工具，配置好服务器信息，免输密码（借助 expect）、密钥信息直接登录。

​	主要思想就是将连接信息配置化，借助 expect 代替人工。

#### 使用说明

* 在目录`server_conf` 配置个人服务器信息，如下：

````
id  desc            username    ip              connect-type   key-path/password
1)  server1         ec2-user    52.133.11.11    key            {key_pathxxx}
2)  server2         root        120.111.11.12   password       {password}
````

`server_conf`说明：

​	connect-type - 连接方式，待选【password 】【key】

​	key-path/password - key文件绝对路径或密码

* 为 ssh_server.sh 添加可执行权限

  ````
  chmod +x ssh_server.sh
  ````

* 运行 

  ````
  ➜  ssh git:(master) : ./ssh_server.sh
    id  desc            username    ip              connect-type   key-path/password
    1)  server1         ec2-user    52.133.11.11    key            {key_pathxxx}
    2)  server2         root        120.111.11.12   password       {password}
   which server to connect? Input the server id : 1
  ssh -i {key_pathxxx} ec2-user@52.133.11.11
  ````

额外说明：

​	采用密码方式连接到远程终端时，自动输入密码代替人工输入这个需要安装 expect支持，参考[expect spawn、linux expect 用法小记](https://www.centos.bz/2013/07/expect-spawn-linux-expect-usage/), [expect(1) - Linux man page](https://linux.die.net/man/1/expect)。

​	如果不想装这个工具，仍然可以选择手动输入密码，可以将`common_ssh.sh`中的 44-46行注释掉即可，

```
  #  elif [ "${server_info_arr[4]}" = "password" ]
  #  then
  #     pw_login "${server_info_arr[2]}@${server_info_arr[3]}" "${server_info_arr[5]}";
```

