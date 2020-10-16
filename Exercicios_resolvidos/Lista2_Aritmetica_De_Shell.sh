#1 - Escreva um script que peça para o usuário digitar um número inteiro. Armazene este número da variável a. Faça a variável a receber o valor a + 1. Imprima na tela o valor de a.

read -p "digite um número inteiro: " a
a=$((${a}+1))
echo ${a}



#2 - Escreva um script que receba dois números inteiros como argumentos de linha de comando, digamos a e b, e imprima o primeiro elevado ao segundo, ou seja a elevado a b. 


numero1=${1}
numero2=${2}
echo $((${numero1}**${numero2}))



#3 - Escreva um script que peça para o usuário digitar um número e diga se este número é par ou ímpar.

read -p "Digite um número: " numero
((${numero} % 2 == 0)) && echo "Numero Par" || echo "Numero Impar"




#4 - Escreva um script que recebe 3 nomes de arquivo como parâmetros de linha de comando, checa se estes arquivos existem (caso não exista algum, deve sair do programa), e imprime a soma dos números de linhas dos 3 arquivos. Utilize substituição de shell e o comando wc -l para contar o número de linhas de cada arquivo.


read -p "Arquivo 1: " arq1
ls ${arq1} &>/dev/null && echo "arquivo existe" || echo "arquivo não existe" 
ls ${arq1} &>/dev/null || exit 1 

read -p "Arquivo 2: " arq2
ls ${arq2} &>/dev/null && echo "arquivo existe" || echo "arquivo não existe" 
ls ${arq2} &>/dev/null || exit 1

read -p "Arquivo 3: " arq3
ls ${arq3} &>/dev/null && echo "arquivo existe" || echo "arquivo não existe" 
ls ${arq3} &>/dev/null || exit 1

linhas_arq1=$(cat ${arq1} | wc -l)
linhas_arq2=$(cat ${arq2} | wc -l)
linhas_arq3=$(cat ${arq3} | wc -l)

somadeLinhas=$(($linhas_arq1+$linhas_arq2+linhas_arq3))
echo "Total de linhas=${somadeLinhas}"




#5 - Escreva um script que recebe 3 nomes de diretórios como parâmetros de linha de comando, checa se estes diretórios existem (caso não exista algum, deve sair do programa), e imprime a soma do número arquivos (ou diretórios) dentro dos diretórios passados. Utilize substituição de shell e o comando ls | wc -l para contar o número de arquivos de cada diretório.

read -p "diretorio 1: " dir1
ls ${dir1} &>/dev/null && echo "diretorio existe" || echo "diretorio não existe" 
ls ${dir1} &>/dev/null || exit 1 

read -p "diretorio 2: " dir2
ls ${dir2} &>/dev/null && echo "diretorio existe" || echo "diretorio não existe" 
ls ${dir2} &>/dev/null || exit 1

read -p "diretorio 3: " dir3
ls ${dir3} &>/dev/null && echo "diretorio existe" || echo "diretorio não existe" 
ls ${dir3} &>/dev/null || exit 1

arquivos_dir1=$(ls ${dir1} | wc -l)
arquivos_dir2=$(ls ${dir2} | wc -l)
arquivos_dir3=$(ls ${dir3} | wc -l)

soma_arquivos=$(($arquivos_dir1+$arquivos_dir2+$arquivos_dir1))
echo "Total de arquivos nos 3 diretorios = ${soma_arquivos}"




#6 - Escreva um script que use o arquivo /etc/passwd para contar o número de usuários do sistema. Adicionalmente, use grep, wc -l e substituição de shell para verificar quantos usuários usam /bin/bash como interpretador de comandos padrão. Use aritmética do shell para calcular quantos usuários não usam /bin/bash como interpretador de comandos padrão.



diretorio=/etc/passwd

usuarios_de_sistema=$(cat $diretorio | wc -l)

usuarios_que_usam_bin_bash=$(grep "/bin/bash" $diretorio | wc -l)

usuarios_que_nao_usam_bin_bash=$(($usuarios_de_sistema-$usuarios_que_usam_bin_bash))

echo "Diretorio /etc/passwd tem ${usuarios_de_sistema} usuários, deste ${usuarios_que_usam_bin_bash} estão usando o /bin/bash como interpretador de comandos e ${usuarios_que_nao_usam_bin_bash} não estão usando"




#7 - Escreva um script que soma 3 números passados como argumentos de linha de comando.

numero1=${1}
numero2=${2}
numero3=${3}

soma=$((${numero1}+${numero2}+${numero3}))
echo ${soma}.




#8 - [OPCIONAL] Escreva um script que melhore o script da questão anterior para que funcione com números fracionários.


numero1=${1}
numero2=${2}
numero3=${3}

soma=$((${numero1}+${numero2}+${numero3} | bc))
echo ${soma}

**** professor como estou usando o bash do repl.it cujo não fornece a opção para baixar o bc, então não pude testar os exemplos com bc, mas acredito que estejam certos. Porém eu fiz exemplo pelo python cujo testado.


numero1=${1}
numero2=${2}
numero3=${3}

soma=$(python -c "print(${numero1}+${numero2}+${numero3})")
echo ${soma}




#9 - [OPCIONAL] Escreva um script que recebe dois números inteiros como parâmetros de linha de comando, digamos a e b, e imprime a porcentagem que a é de b e a porcentagem que b é de a.

read -p "numero1: " numero1
read -p "numero2: " numero2
porcentagem_numero2_de_numero1=$(((100/${numero1})*${numero2}))

porcentagem_numero1_de_numero2=$(((100/${numero2})*${numero1}))

echo "${numero2} seria ${porcentagem_numero2_de_numero1}% de ${numero1}"

echo "${numero1} seria ${porcentagem_numero1_de_numero2}% de ${numero2}"




**** professor como estou usando o bash do repl.it cujo não fornece a opção para baixar o bc, então não pude testar os exemplos com bc, mas acredito que estejam certos. Porém eu fiz exemplo pelo python cujo testado.


read -p "numero1: " numero1
read -p "numero2: " numero2
porcentagem_numero2_de_numero1=$(python -c "print((100/${numero1})*${numero2})")
porcentagem_numero1_de_numero2=$(python -c "print((100/${numero2})*${numero1})")



echo "${numero2} seria ${porcentagem_numero2_de_numero1}% de ${numero1}"

echo "${numero1} seria ${porcentagem_numero1_de_numero2}% de ${numero2}"



