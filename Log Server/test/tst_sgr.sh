#!/bin/bash

#script: Visualizar os logs teste SGR
#autor: Matheus Costa
#data: 07/07/2021

ls -l /usr/local/SGR | grep -v -E *.jar | egrep -v "[a-z]+-[a-z]+.log.[0-9]" | grep -v -E start.sh | awk '{print $9}' | sed '1d' > USR_SGR.txt
#-rw-rw-r--. 1 ucards ucards   2498852 Jul  7 00:01 sgr-web.log
#-rw-r--r--. 1 ucards ucards   6799405 Jul  7 12:09 worker-agent.log
#-rw-r--r--. 1 ucards ucards   5177994 Jul  7 12:09 worker-job.log
#-rw-r--r--. 1 ucards ucards   2007892 Jul  7 12:09 worker-merge.log


ls -l /var/log/sgr/*/$(date +"%Y-%m") | egrep "[a-z]+-[a-z]+.$(date +"%Y-%m-%d").log" | awk '{print $9}' > VAR_SGR.txt

#-rw-r--r--. 1 ucards ucards  8133283 Jul  7 12:21 worker-agent.2021-07-07.log
#-rw-r--r--. 1 ucards ucards 1011814 Jul  7 12:21 worker-merge.2021-07-07.log
#-rw-r--r--. 1 ucards ucards 152739 Jul  7 00:01 sgr-web.2021-07-07.log

function separando_logs() {
    LOGS_UPPER=()
    while read log; do
        MSG="Visualizar_logs_de_aplicação_$(echo ${log})"
        nome_log=$(echo "USR-SGR-${log}")
        USR_LOGS_LOWER=( ${LOGS_LOWER[*]} ${nome_log} )
        LOG=$(echo ${nome_log} | tr '[:lower:]' '[:upper:]')
        LOGS_UPPER=( ${LOGS_UPPER[*]} ${LOG} ${MSG} )
    done < USR_SGR.txt
    rm -rf USR_SGR.txt

    while read log; do
        MSG="Visualizar_logs_de_aplicação_$(echo ${log})"
        nome_log=$(echo "VAR-SGR-${log}")
        LOGS_LOWER=( ${LOGS_LOWER[*]} ${nome_log} )
        LOG=$(echo ${nome_log} | tr '[:lower:]' '[:upper:]')
        LOGS_UPPER=( ${LOGS_UPPER[*]} ${LOG} ${MSG} )
    done < VAR_SGR.txt
    rm -rf VAR_SGR.txt
}


function menu() {
    while : ; do
        MENU_LOGS=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${LOGS_UPPER[@]}" "" \ )
        if [ -z "${MENU_LOGS}" ]; then exit; fi ## Caso a opção "Cancelar" seja selecionada a função menu será novamente chamada
        logs=$(echo ${MENU_LOGS} | tr '[:upper:]' '[:lower:]' | sed "s/[a-z][a-z][a-z]-sgr-//")
        if [[ ${MENU_LOGS} =~ ^VAR ]]; then 
            PATH_LOGS="/var/log/sgr/*/$(date +"%Y-%m")"
            less ${PATH_LOGS}/${logs}
        elif [[ ${MENU_LOGS} =~ ^USR ]]; then 
            PATH_LOGS="/usr/local/SGR"
            less ${PATH_LOGS}/${logs}
        fi
    done
}

separando_logs
menu