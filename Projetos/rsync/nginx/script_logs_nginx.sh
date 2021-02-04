#!/bin/bash

source script_logs_nginx.conf
 
#verificando se a chave existe
ls ${chave} &>/dev/null || echo -e "Chave ${chave} não existente \nTransferencia de logs não realizada \nVerificar em /home/centos/script_logs_nginx.conf"
ls ${chave} &>/dev/null || exit 1
 
 
#testando se o usuário é existente no servidor  de logs ou se o ip está incorreto

existencia_usuario=true
ssh -i ${chave} ${usuario}@${ip_destino} pwd &>/dev/null || existencia_usuario=false
if [ ${existencia_usuario} == "false" ];then
        echo -e "Usuário ${usuario} não existente em ${ip_destino} ou ${ip_destino} não pertence ao servidor de logs \nTransferencia de logs não realizada \nVerificar em /home/centos/script_logs_nginx.conf"
        exit 1
fi
 
#Verificando existência de diretório de destino no servidor de logs
ssh -i chave.pem ${usuario}@${ip_destino} test -d ${diretorio_destino} && existencia_diretorio_destino=true || existencia_diretorio_destino=false
if [ $existencia_diretorio_destino == "false" ];then
        echo -e "Diretório ${diretorio_destino} não existe em ${ip_destino} \nTransferencia de logs não realizada \nVerificar em /home/centos/script_logs_nginx.conf"
fi
 
#verificar se o Path dos logs nginx existe
if [ -d ${PATH_logs} ]; then
        echo -e "Diretório ${diretorio_destino} não existe em serviço local \nTransferencia de logs não realizada \nVerificar em /home/centos/script_logs_nginx.conf"
fi
 
#Comando
rsync -ahvpu --progress -e "ssh -i ${chave}" ${PATH_logs} ${usuario}@${ip_destino}:${diretorio_destino} 2>/dev/null

