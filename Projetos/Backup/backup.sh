#!/bin/bash

# definir variáveis do script
INICIO=$(date +%s)
DATA=$(date "+%Y-%m-%d")
BACKUP="backup-$DATA.tar.gz"
CONF="backup.conf"

source $CONF

# verificar se o diretório de backup foi criado
for USER in ${REMOTE_USER[@]}; do
    if [ ! -d "$SOURCE/$USER" ]; then
        mkdir -p "$SOURCE/$USER"
    fi
done

# verificar se arquivo de configuração foi criado
if [ ! -f "$CONF" ]; then
    echo "Arquivo de configuração não encontrado em $CONF"
    exit 1
fi

# remover backups antigos do servidor
BACKUPS_PARA_REMOVER=($(find $SOURCE -type f -name '*.tar.gz' -mtime +30))
if [ ${#BACKUPS_PARA_REMOVER[@]} -gt 0 ]; then
    for REMOVER in ${BACKUPS_PARA_REMOVER[@]}; do
        echo "$REMOVER tem mais de 30 dias...  deletando"
        rm -rf $REMOVER
    done
fi

for i in ${!REMOTE_USER[@]}; do

    # compactar arquivos do cliente
    echo "Compactando os arquivos do diretório ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} ${REMOTE_DIR[$i]} em $BACKUP"
    ssh ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]} -p ${REMOTE_PORT[$i]} tar -cvzf "$BACKUP" "${REMOTE_DIR[$i]}"

    # enviar arquivo compactado para servidor
    echo "Iniciando o RSYNC para ${REMOTE_HOST[$i]}"
    rsync --remove-source-files -e "ssh -p ${REMOTE_PORT[$i]}" --stats -hav ${REMOTE_USER[$i]}@${REMOTE_HOST[$i]}:$BACKUP "$SOURCE/${REMOTE_USER[$i]}"

done


# calcular o tempo de execução
FIM=$(date +%s)
RUNTIME=$((FIM - INICIO))
MINUTOS=$((RUNTIME / 60))

# mostrar tempo de execução
echo "Script finalizado em $MINUTOS minutos."



