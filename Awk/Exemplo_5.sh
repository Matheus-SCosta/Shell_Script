# Uma empresa possui uma política de criação de nomes de usuários: dado o nome completo da
#pessoa, usar o primeiro nome seguido pela primeira letra de cada sobrenome (ou conectivo da
#dos de). Exemplo: Thiago Gouveia da Silva ganha o nome de usuário ThiagoGdS, enquanto
#Josias de Pádua Maranhão Ayres Junior, ganha o nome de usuário JosiasdPMAJ. Foi enviada
#uma lista contendo os dados dos funcionários da empresa para que você criasse os usuários. Sua
#tarefa é, dado a entrada, criar uma lista com os nomes de usuários que devem ser criados. Segue
#o Formato da lista:


#	Thiago Gouveia da Silva
#	34 Anos
#	Professor
#	João Pessoa
#
#	Josias de Pádua Maranhão Ayres Júnior
#	26 Anos
#	Pedreiro
#	Campina Grande
#
#	Victor Hugo de la France
#	79 Anos
#	Escritor
#	França
#
#	Manequias dos Arais de Fortal
#	45 Anos
#	Padeiro e Confeiteiro, mas também faz tudo
#	Belo Jardim, mas também Arraial do Cabo



#!/bin/bash

rm nomes_usuarios 2>/dev/null
awk 'NR==1' < lista > arq_aux
top -b -n1 | awk '/^$/{print;getline;print}' < lista >> arq_aux
cat arq_aux | tr -s "\n" > arq_aux2
cp arq_aux2 arq_aux
rm arq_aux2

linha=1

while read linha; do
	primeiro_nome=$(cat arq_aux | awk 'NR=='$linha' {print $1}')
	seg=$(cat arq_aux | awk 'NR=='$linha' {print $2}' | grep -E -o '^[a-zA-Z]')
	ter=$(cat arq_aux | awk 'NR=='$linha' {print $3}' | grep -E -o '^[a-zA-Z]')
	qua=$(cat arq_aux | awk 'NR=='$linha' {print $4}' | grep -E -o '^[a-zA-Z]')
	qui=$(cat arq_aux | awk 'NR=='$linha' {print $5}' | grep -E -o '^[a-zA-Z]')
	sex=$(cat arq_aux | awk 'NR=='$linha' {print $6}' | grep -E -o '^[a-zA-Z]')
	seti=$(cat arq_aux | awk 'NR=='$linha' {print $7}' | grep -E -o '^[a-zA-Z]')

	echo ${primeiro_nome}${seg}${ter}${qua}${qui}${sex}${seti} >> nomes_usuarios
	linha=$(( linha + 1 ))

done < arq_aux
echo "Novo usuários criados estão no arquivo nomes_usuários"
