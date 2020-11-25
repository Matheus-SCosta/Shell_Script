#!/bin/bash


CONF="restauracao.conf"
DATA=$(date "+%Y-%m-%d")
BACKUP="backup-$DATA.tar.gz"
read -p "User to restore: " user
read -p "Password client restoration : " password

source $CONF

# Pecorrendo o vetor para encontrar o usuário informado para fazer a restauração
for i in ${REMOTE_USER[@]};do
        # Quando encontrar
        if [ $i == $user ]; then
                # Apagando todos os arquivos do diretorio /home/user
                sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} rm -rf ${REMOTE_DIR[$i]}*

                # Transferir arquivo compactado para a maquina cliente
                sshpass -p $password scp ${SOURCE[$i]} ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]}:${REMOTE_DIR[$i]}

                # ssh no cliente e descompactação de arquivo no cliente
                sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} tar -vzxf $BACKUP >/dev/null && echo "Arquivo $BACKUP transferido para $REMOTE_USER $REMOTE_HOST e descompactado em $REMOTE_USER"

                # movendo os arquivos para o diretorio atual /home/user
                sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} mv ${REMOTE_DIR_AUX[$i]} ${REMOTE_DIR[$i]}

                # Apagando o home e o arquivo compactado do diretorio atual
                sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} rm -rf home $BACKUP
                exit 1
        fi
done
echo "User not found"
