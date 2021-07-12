#!/bin/bash


#script: Visualizar os logs de lab-app-tst-a 10.50.1.13
#autor: Matheus Costa
#data: 09/06/2021

PATH_APPS="/home/neus/logs/"
ls -l ${PATH_APPS} | awk '{print $9}' | sed '1d' > apps.txt

function separando_apps () {
    while read app; do
        TST_APP_TST_A_LOWER=( ${TST_APP_TST_A_LOWER[*]} ${app} )
        MSG="Visualizar_logs_de_aplicação_$(echo ${app})"
        APPS=$(echo ${app} | tr '[:lower:]' '[:upper:]' | cut -d '.' -f 1)
        TST_APP_TST_A_UPPER=( ${TST_APP_TST_A_UPPER[*]} ${APPS} ${MSG} )  
    done < apps.txt
    rm -rf apps.txt
}

# Mostrando menu com os nomes dos tomcats e separando os nomes dos logs que existem para o tomcat escolhido no MENU dentro do array ARQUIVOS_LOGS_APP, cujo será usado na função menu_logs()
function menu() {
    ARQUIVOS_LOGS_APP=()
    MENU=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${TST_APP_TST_A_UPPER[@]}" "" \ )
    if [ -z "${MENU}" ]; then exit; fi ## Caso a opção "Cancelar" seja selecionada o shell sairá da função
    APP=$(echo ${MENU} | tr '[:upper:]' '[:lower:]')
    PATH_LOGS="/home/neus/logs/${APP}"
    ls -l ${PATH_LOGS} > nome_logs.txt 
    sed -i '1d' nome_logs.txt
    while read log; do
        nome_arquivos_logs=$(echo ${log} | awk '{print $9}' | sed 's/.log//')
        NOME_ARQUIVOS_LOGS=$(echo ${log} | awk '{print $9}' | tr '[:lower:]' '[:upper:]' | sed 's/.LOG//')
        MSG="Visualizar_logs_${nome_arquivos_logs}"
        ARQUIVOS_LOGS_APP=( ${ARQUIVOS_LOGS_APP[*]} ${NOME_ARQUIVOS_LOGS} ${MSG} )
    done < nome_logs.txt
    rm -rf nome_logs.txt
}

# Mostrando os logs disponíveis na aplicação escolhida no menu anterior
function menu_logs() {
    while : ; do
        MENU_LOGS=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${ARQUIVOS_LOGS_APP[@]}" "" \ )
        if [ -z "${MENU_LOGS}" ]; then menu; fi ## Caso a opção "Cancelar" seja selecionada a função menu será novamente chamada

        LOG=$(echo ${MENU_LOGS} | tr '[:upper:]' '[:lower:]' | cut -d '.' -f 1)
        ROTATE=$(echo ${MENU_LOGS} | tr '[:upper:]' '[:lower:]' | cut -d '.' -f 2)
        if [  ${LOG} != ${ROTATE} ]; then LOG=$(echo "${LOG}.log.${ROTATE}"); else LOG=$(echo "${LOG}.log"); fi
        PATH_LOGS_APP="/home/neus/logs/${APP}/${LOG}"
        less ${PATH_LOGS_APP}
    done
}


separando_apps
menu
menu_logs