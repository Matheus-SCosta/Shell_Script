#!/bin/bash

dir="/home/servidor/Documents/backup/"
echo -e "\n"
echo "BACKUPS OPTIONS MENU, CHOOSE ONE OF THE OPTIONS TO CONTINUE:"


while true; do
        echo "===================================================================="
        echo "Type 1 and ENTER to back up all users"  # Realizar backup de todas as maquinas que estão no arquivo de configuração backup.conf
        echo "Type 2 and ENTER to restore" # Fazer restauração de usuário especifico informado pelo usuário
        echo "Type 3 and ENTER to check users who have backups configured" # Verificar as maquinas com backup armazenado
        echo "Type 4 and ENTER to view disk usage for backups performed" # Verificar uso de disco para cada usuário que tem backup realizado
        echo "Type 0 and ENTER to exit"  # Opção para sair
        echo -e "\n"
        read -p ": " opcao
        echo -e "\n"
        case $opcao in
                "1") ./backup.sh ;;
                "2") ./restoration.sh ;;
                "3")  if [ -d "$dir" ]; then
                        echo "Backup users configured" && echo "==================================" && for i in $(ls $dir); do echo $i ; done && echo -e "\n"
                      else
                        echo -e "\n"
                        echo "No backup users configured! It is necessary to perform some backup in option 1 and ENTER"
                        echo -e "\n"
                        fi ;;
                "4") ./useDisc.sh ;;
                "0") break ;;
        esac
done


