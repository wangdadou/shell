#!/bin/bash
# @desc   - ssh server
# @anthor - wangjia
cd `dirname $0`
dir_path=`pwd`
source "${dir_path}/common_ssh.sh"
init_server_info_arr "${dir_path}/server_conf/server.conf"
interact_user
connect_by_line "${lines[${user_choose}]}"