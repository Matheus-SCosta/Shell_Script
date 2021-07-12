#!/bin/bash

#script: Visualizar os logs dos domains qa private
#autor: Matheus Costa
#data: 06/07/2021



APP="SGR"
PATH_LOGS="/usr/local/${APP}"
ls -l ${PATH_LOGS} | grep -v -E *.jar | grep -v start.sh | awk '{print $9}' > nomes_logs.txt
sed -i '1d' nomes_logs.txt


function separando_logs() {
    while read nomes_logs; do
        ARQUIVOS_LOGS_APP_SGR_LOWER=( ${ARQUIVOS_LOGS_APP_SGR_LOWER[*]} ${nomes_logs} )
        MSG="Visualizar_logs_de_aplicação_$(echo ${nomes_logs})"
        APPS=$(echo ${nomes_logs} | tr '[:lower:]' '[:upper:]')
        ARQUIVOS_LOGS_APP_SGR_UPPER=( ${ARQUIVOS_LOGS_APP_SGR_UPPER[*]} ${APPS} ${MSG} )
    done < nomes_logs.txt
    rm -rf nomes_logs.txt
}

function menu_logs() {
    while : ; do
        MENU_LOGS=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${ARQUIVOS_LOGS_APP_SGR_UPPER[@]}" "" \ )
        if [ -z "${MENU_LOGS}" ]; then exit; fi ## Caso a opção "Cancelar" seja selecionada a função menu será novamente chamada
        LOG=$(echo ${MENU_LOGS} | tr '[:upper:]' '[:lower:]')
        PATH_LOGS_APP="${PATH_LOGS}/${LOG}"
        less ${PATH_LOGS_APP}
    done
}

separando_logs
menu_logs