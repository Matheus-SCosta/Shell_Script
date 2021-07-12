# script que valida um número qualquer em formato moeda do Brasil: R$ 1.000,00. Validar significa dizer se o número está no padrão ou não.
 

#!/bin/bash

read -p "Digite um número qualquer: " numero

echo ${numero} > testemoeda

a=$(cat testemoeda | grep -E '[0-9]{1,3}.[0-9]{1,3},[0-9]{2}')

if [ -n "${a}" ]; then
	echo "No padrão"
else
	echo "Fora do padrão"
fi

rm testemoeda
