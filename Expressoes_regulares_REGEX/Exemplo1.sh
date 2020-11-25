# script que valida as seguintes regras para criação de senha: pelo menos uma letra maiúscula, uma letra minúscula e um número. Validar significa receber uma senha e dizer se esta obedece ao padrão ou não.


#!/bin/bash

read -p "Crie sua senha: " senha
echo ${senha} > senha

letramaiuscula=$(cat senha | grep -E -o '[A-Z]+')
letraminuscula=$(cat senha | grep -E -o '[a-z]+')
numero=$(cat senha | grep -E -o '[0-9]+')

if [ -n "${letramaiuscula}" ]; then
	if [ -n "${letraminuscula}" ] ; then
		if [ -n "${numero}" ]; then
			echo "Senha válida"
		else
			echo "Senha inválida"
		fi
	else
		echo "Senha inválida"
	fi
else
	echo "Senha inválida"
fi

rm senha
