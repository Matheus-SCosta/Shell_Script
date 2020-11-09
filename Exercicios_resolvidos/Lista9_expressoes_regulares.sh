


# 1 - Escreva um script que, baseado em opções de linha de comando:
# a - Liste apenas os diretórios de uma pasta  
# b - Liste apenas os executáveis
# c - Liste apenas os scripts shell

# a)

ls -l | grep ^d > diretorios
cat diretorios | grep -E -o '[a-zA-Z0-9]+$'
rm diretorios

# b)

ls -F > arquivos
cat arquivos | grep -E '[a-zA-Z0-9]+.[a-zA-Z0-9]+[*]'
rm arquivos


# c)

#!/bin/bash

for i in $(ls); do
	cat ${i} 2>/dev/null | grep -E -o '[^y]+/[bin]+/[bash]+' &>/dev/null >> echo ${i} >> arq_aux
done
cat arq_aux
rm arq_aux


# 2 - Escreva um script que remova as linhas em branco de um arquivo. Adicione uma opção para que o script conte as linhas em branco de um arquivo, em vez de removê-las.

#!/bin/bash

read -p "Digite 1 para returar linhas em branco de um arquivo e 2 para contar linhas em branco de um arquivo: " opc
	case ${opc} in
		"1") read -p "Digite o nome de um arquivo: " arq
		     linhas=$(cat ${arq} | grep -E '^$' | wc -l)
		     echo "Arquivo ${arq} contém ${linhas} linhas em branco" ;;

		"2") read -p "Digite um arquivo para tirar linhas em branco: " arq
		     cat $arq | grep -E '[^$]' >> arq_aux
		     cat arq_aux
		     rm arq_aux ;;
	esac






# 3 - Escreva um script que valide um número qualquer em formato moeda do Brasil: R$ 1.000,00. Validar significa dizer se o número está no padrão ou não.
 

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




# 4 - Escreva um script que valide as seguintes regras para criação de senha: pelo menos uma letra maiúscula, uma letra minúscula e um número. Validar significa receber uma senha e dizer se esta obedece ao padrão ou não.


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
