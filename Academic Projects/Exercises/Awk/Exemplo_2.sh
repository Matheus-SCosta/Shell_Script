#2 - Considere o seguinte arquivo de entrada com a lista dos dez nomes mais comuns no Brasil para
#Meninos e Meninas. Pede-se que o arquivo seja separado em dois, um apenas para meninos e
#outro para meninas.
#	
#	Ranking Meninos Ranking Meninas
#	1 Miguel 1 Sophia
#	2 Davi 2 Alice
#	3 Arthur 3 Julia
#	4 Pedro 4 Isabella
#	5 Gabriel 5 Manuela
#	6 Bernardo 6 Laura
#	7 Lucas 7 Luiza
#	8 Matheus 8 Valentina
#	9 Rafael 9 Giovanna
#       10 Heitor 10 MariaEduarda


#!/bin/bash 

read -p "arquivo : " arq
awk 'NR>=2 {print $2}' < ${arq} > arq_meninos
awk 'NR>=2 {print $4}' < ${arq} > arq_meninas
echo "arquivo com nome dos meninos está em arq_meninos e arquivo com nome de meninas em arq_meninas"
