2 - Considere o seguinte arquivo de entrada com a lista dos dez nomes mais comuns no Brasil para
Meninos e Meninas. Pede-se que o arquivo seja separado em dois, um apenas para meninos e
outro para meninas.


Ranking Meninos Ranking Meninas
1 Miguel 1 Sophia
2 Davi 2 Alice
3 Arthur 3 Julia
4 Pedro 4 Isabella
5 Gabriel 5 Manuela
6 Bernardo 6 Laura
7 Lucas 7 Luiza
8 Matheus 8 Valentina
9 Rafael 9 Giovanna
10 Heitor 10 MariaEduarda


#!/bin/bash 

read -p "arquivo : " arq
awk 'NR>=2 {print $2}' < ${arq} > arq_meninos
awk 'NR>=2 {print $4}' < ${arq} > arq_meninas
echo "arquivo com nome dos meninos está em arq_meninos e arquivo com nome de meninas em arq_meninas"





4. Dado um arquivo com todos os downloads efetuados pelos usuários no último mês, deseja-se
totalizar quanto cada usuário baixou. Segue o formato do arquivo:

Nelson www.google.com.br 250
Arr445 www.testes.com/dbz.wmv 20050
Nelson www.uol.com.br 300
Vianna debian.org/9.7.0.iso 800555


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






6. Dado um arquivo com nomes e notas de alunos, imprima a lista de alunos aprovados, i.e. com
média maior ou igual a 70. Segue o formato do arquivo:
Nelson Antunes de Coimbra 100 100 100
José Edyson 50 100 50
Joao das Neves Pereira Pádua e Talz 100 0 100
Amanda Selfie 100 70 70






{
	acc=0
	for( i=1; i<=NF; i++ )
	{
		if( $i ~ /[0-9]+/ ) acc = acc+$i;
	}

	if( acc/3.0 >= 70 )
	{
		for( j=1; j<=NF; j++ )
		{
			if( $j ~ /[^0-9]+/ ) printf $j" ";
		}
		printf "\n";
	}
}




8. Melhore o script da questão anterior para que além do número de aprovados e reprovados, seja
exibido um histograma das médias, isto é, o número de médias entre 0 e 9.9999, o número de
médias entre 10 e 1.9999, ...., o número de médias entre 8 e 9.99999 e o número de médias entre
9 e 10.



{

	acc = 0;
	for (i=1; i<=NF; i++)
	{
		if(${i} ~/[0-9]+/ ) acc = acc+${i};

	}
	media = acc/3.0
	if (media >= 90)
		medias_nove_a_dez++;
	if (media >= 80 && media <= 99.9)
		medias_oito_a_nove_ponto_nove++;
	if (media >= 10.9)
		medias_um_ponto_nove_a_dez++;
	if (media <= 99.9)
		medias_zero_a_nove_ponto_nove++;
	if (media >= 70)
		aprovado++;
	if (media < 70)
		reprovado++;

}

END {
	print aprovado " aprovados"
	print reprovado " reprovados"
	print medias_zero_a_nove_ponto_nove " médias maiores que 0 a menores que 9.9"
	print medias_um_ponto_nove_a_dez " médias maiores que 1.9 a 10"
	print medias_oito_a_nove_ponto_nove " médias entre 8 e 9.9"
	print medias_nove_a_dez " médias entre 9 a 10"
} 




10. Uma empresa possui uma política de criação de nomes de usuários: dado o nome completo da
pessoa, usar o primeiro nome seguido pela primeira letra de cada sobrenome (ou conectivo da
dos de). Exemplo: Thiago Gouveia da Silva ganha o nome de usuário ThiagoGdS, enquanto
Josias de Pádua Maranhão Ayres Junior, ganha o nome de usuário JosiasdPMAJ. Foi enviada
uma lista contendo os dados dos funcionários da empresa para que você criasse os usuários. Sua
tarefa é, dado a entrada, criar uma lista com os nomes de usuários que devem ser criados. Segue
o Formato da lista:

Thiago Gouveia da Silva
34 Anos
Professor
João Pessoa

Josias de Pádua Maranhão Ayres Júnior
26 Anos
Pedreiro
Campina Grande

Victor Hugo de la France
79 Anos
Escritor
França

Manequias dos Arais de Fortal
45 Anos
Padeiro e Confeiteiro, mas também faz tudo
Belo Jardim, mas também Arraial do Cabo



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
