#4. Dado um arquivo com todos os downloads efetuados pelos usuários no último mês, deseja-se
#totalizar quanto cada usuário baixou. Segue o formato do arquivo:

#	Nelson www.google.com.br 250
#	Arr445 www.testes.com/dbz.wmv 20050
#	Nelson www.uol.com.br 300
#	Vianna debian.org/9.7.0.iso 800555


#!/bin/bash

usuario1="Nelson"
usuario2="Arr445"
usuario3="Vianna"
cont_usuario1=0
cont_usuario2=0
cont_usuario3=0
while read linha; do
	usuario=$(echo ${linha} | awk '{print $1}')
	if [ ${usuario} == ${usuario1} ]; then
		donwloads=$(echo ${linha} | awk '{print $3}')
		cont_usuario1=$(( cont_usuario1 + ${donwloads} ))
	elif [ ${usuario} == ${usuario2} ]; then
		donwloads=$(echo ${linha} | awk '{print $3}')
		cont_usuario2=$(( cont_usuario2 + ${donwloads} ))
	elif [ ${usuario} == ${usuario3} ]; then
		donwloads=$(echo ${linha} | awk '{print $3}')
		cont_usuario3=$(( cont_usuario3 + ${donwloads} ))
	fi
done < arq_donwloads
echo "usuario ${usuario1}: ${cont_usuario1} donwloads"
echo "usuario ${usuario2}: ${cont_usuario2} donwloads"
echo "usuario ${usuario3}: ${cont_usuario3} donwloads"

done

