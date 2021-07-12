# Saída do comando ls –l. Deseja-se imprimir apenas o nome do arquivo, seguido do 
#nome do usuário dono e do grupo dono
#-rw-r--r-- 1 root root 2981 dez 3 07:59 adduser.conf
#-rw-r--r-- 1 root root 44 dez 3 08:05 adjtime
#drwxr-xr-x 2 root root 4096 dez 26 06:15 alternatives
#drwxr-xr-x 8 root root 4096 dez 10 05:56 apache2
#drwxr-xr-x 3 root root 4096 dez 3 08:04 apm
#drwxr-xr-x 3 root root 4096 dez 10 06:12 apparmor.d
#drwxr-xr-x 6 root root 4096 dez 26 06:14 apt
#-rw-r--r-- 1 root root 1863 mai 15 2017 bash.bashrc
#-rw-r--r-- 1 root root 45 mar 22 2014 bash_completion




#!/bin/bash

ls -l | awk 'NR>=2 {print "arquivo: "$9"\ndono: "$3"\ngrupo: "$4"\n"}'
