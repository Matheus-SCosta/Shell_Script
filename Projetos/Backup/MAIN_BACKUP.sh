#!/bin/bash

dir="/home/servidor/Documents/backup/"
echo -e "\n"
echo "MENU DE OPÇÕES PARA BACKUPS, ESCOLHA UMA DAS OPÇÕES PARA CONTINUAR: "


while true; do
        echo "===================================================================="
        echo "Digite 1 e ENTER para fazer backup de todos os usuários"
        echo "Digite 2 e ENTER para fazer restauração"
        echo "Digite 3 e ENTER para verificar os usuários que tem backups configurados"
        echo "Digite 0 e ENTER para sair"
        echo -e "\n"
        read -p ": " opcao
        echo -e "\n"
        case $opcao in
                "1") ./backup.sh ;;
                "2") ./restauracao.sh ;;
                "3")  if [ -d "$dir" ]; then
                        echo "Usuários com backup configurados" && echo "==================================" && for i in $(ls $dir); do echo $i ; done && echo -e "\n"
                      else
                        echo -e "\n"
                        echo "Nenhum usuário com backup configurado! Necessário realizar algum backup em opção 1 e ENTER"
                        echo -e "\n"
                        fi ;;
                "0") break ;;
        esac
done



