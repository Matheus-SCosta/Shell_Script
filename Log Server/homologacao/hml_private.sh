#!/bin/bash


#script: Visualizar os logs dos domains qa private
#autor: Matheus Costa
#data: 07/06/2021


# Separando os tomcats existentes em /home/logtx/TST e colocando os nomes em maiusculo no array TST_QA_PRIVATE_UPPER e minúsculos em TST_QA_PRIVATE_LOWER, cujo será usados na função menu()
function separando_apps_qaprivate() { 
PATH_TOMCATS="/efs/volumes/logs/HML-PRIVATE/"
ls -l ${PATH_TOMCATS} | egrep 'h[a-z0-9]+' | awk '{print $9}' > app.txt
while read app; do
    HML_PRIVATE_LOWER=( ${HML_PRIVATE_LOWER[*]} ${app} )
    MSG="Visualizar_logs_de_aplicação_$(echo ${app})"
    APPS=$(echo ${app} | tr '[:lower:]' '[:upper:]')
    HML_PRIVATE_UPPER=( ${HML_PRIVATE_UPPER[*]} ${APPS} ${MSG} )
done < app.txt
rm -rf app.txt
}

# Mostrando menu com os nomes dos tomcats e separando os nomes dos logs que existem para o tomcat escolhido no MENU dentro do array ARQUIVOS_LOGS_APP, cujo será usado na função menu_logs()
function menu() {
    ARQUIVOS_LOGS_APP=()
    MENU=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${HML_PRIVATE_UPPER[@]}" "" \ )
    if [ -z "${MENU}" ]; then exit; fi ## Caso a opção "Cancelar" seja selecionada o shell sairá da função
    APP=$(echo ${MENU} | tr '[:upper:]' '[:lower:]')
    PATH_LOGS="/efs/volumes/logs/HML-PRIVATE/${APP}"
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
        PATH_LOGS_APP="/efs/volumes/logs/HML-PRIVATE/${APP}/${LOG}"
        less ${PATH_LOGS_APP}
    done
}

# Chamando as funções
separando_apps_qaprivate
menu
menu_logs