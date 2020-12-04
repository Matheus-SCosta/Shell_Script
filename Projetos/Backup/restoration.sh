#!/bin/bash


CONF="restoration.conf"
read -p "User to restore: " user
stty -echo && printf "Password: " && read password && stty echo  # para não mostrar na tela a senha que será digitada
printf "\n"



source $CONF



# Pecorrendo o vetor do arquivo de configuração para encontrar o usuário informado para fazer a restauração
for i in ${REMOTE_USER[@]};do
        if [ $i == $user ]; then # se o usuário existe no arquivo de configuração
                echo -e "\nRestore for user ${REMOTE_USER[$i]} is in progress, wait a few seconds for confirmation\n"
                dir=$(ls ${SOURCE[$i]} 2>/dev/null) # listo tudo no caminho relativo /home/servidor/Documents/backup/user, caso não exista esse diretorio significa que para esse usuário não há backup realizado $                if [ -n "$dir" ]; then # caso o caminho relativo /home/servidor/Documents/backup/user exista a variavel dir terá conteudo e entrará na condição

                        # Apagando todos os arquivos do diretorio /home/user
                        sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} rm -rf ${REMOTE_DIR[$i]}*

                        # Transferir arquivo(os) compactado(os) para a maquina cliente
                        sshpass -p $password scp ${SOURCE[$i]} ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]}:${REMOTE_DIR[$i]}

                        # para buscar no cliente o arquivo compactado sendo da data atual ou não, mas sendo o mais recente
                        ULTIMA_LINHA=$(sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} ls -l | wc -l) # ultimo arquivo criado será sempre a ultima linha do comando ls -l
                        BACKUP=$(sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} ls -l ${REMOTE_DIR[$i]} | awk 'NR=='$ULTIMA_LINHA' {print $9}') # a 9º coluna da linha, será o nome do arquivo

                        # ssh no cliente e descompactação de arquivo no cliente
                        sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} tar -vzxf $BACKUP >/dev/null && echo "$BACKUP file transferred to ${REMOTE_USER[$i]} ${REMOTE_HOST[$i]} and unzipped into $$
                        # movendo os arquivos para o diretorio atual /home/user
                        sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} mv ${REMOTE_DIR_AUX[$i]} ${REMOTE_DIR[$i]}

                        # Apagando o home e o arquivo de backups compactados do diretorio atual /home/user
                        TODOS_ARQUIVOS_BACKUP=$(sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} ls | grep -E 'backup-'[0-9]+'-'[0-9]+'-'[0-9]+'-'[0-9]+'-'[0-9]+'-'[0-9]+'.tar.gz') # pega todos os$                        sshpass -p $password ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} rm -rf home $TODOS_ARQUIVOS_BACKUP  # remove o diretorio home descompactado e todos os arquivos compactados de backup
                        exit 1  # Ao chegar nesse ponto, o usuário existe no arquivo de configuração, e existia backup desse usuário e o backup já foi realizado

                else    # quando o usuário existe, porém não há backup realizado para ele
                        echo -e "\nThere are no backups performed for this user, perform backup in option 1 and ENTER to later perform the restore\n"
                        exit 1
                fi
        fi
done
echo "User not found"  # se o usuário nao existir no arquivo de configuração
