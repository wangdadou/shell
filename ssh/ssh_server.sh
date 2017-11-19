#!/bin/bash
# @desc   - ssh server
# @anthor - wangjia

source "/Users/wangjia/coder/github/shell/ssh/common_ssh.sh"
init_server_info_arr "/Users/wangjia/coder/github/shell/ssh/ssh_conf/server.conf"
interact_user
connect_by_line "${lines[${user_choose}]}"