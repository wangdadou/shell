#!/bin/bash
# utils for interacting with user
# author : wangjia_yql@qq.com

## situation : display the msg , user choose YES(y) or NO(n)
## ${1} param1 : message
interactYN(){
    #reset input,同时避免污染外部
    inputtttttt="default"
    while [[ "${inputtttttt}" != "y"  &&  "${inputtttttt}" != "n" ]]
    do
        read -p "${1}(y/n): " inputtttttt
    done
    echo "${inputtttttt}"
}