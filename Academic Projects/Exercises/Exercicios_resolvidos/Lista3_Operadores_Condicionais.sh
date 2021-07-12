1 - Escreva um script que receba um nome de arquivo como parâmetro de linha de comando e, usando apenas uma linha de comando e operadores condicionais (&& e || ) imprima SIM caso o arquivo exista e NAO, caso contrário.


arquivo=${1}
ls ${arquivosi} &>/dev/null && echo "SIM" || echo "NAO"




2 - Escreva um script que peça para o usuário digitar 3 nomes de arquivo e imprima o nome daquele que possui o maior número de linhas.




read -p "Digite arquivo 1: " arq1
read -p "Digite arquivo 2: " arq2
read -p "Digite arquivo 3: " arq3

linhasarq1=$(cat ${arq1} | wc -l)
linhasarq2=$(cat ${arq2} | wc -l)
linhasarq3=$(cat ${arq3} | wc -l)

(( linhasarq1 > linhasarq2)) && (( linhasarq1 > linhasarq3)) && echo "Arquivo 1 possui mais linhas" 
(( linhasarq2 > linhasarq1)) && (( linhasarq2 > linhasarq3)) && echo "Arquivo 2 possui mais linhas"
(( linhasarq3 > linhasarq1)) && (( linhasarq3 > linhasarq2)) && echo "Arquivo 3 possui mais linhas"




3 - Escreva um script que receba três nomes de arquivos como argumentos de linha de comando e imprima estes nomes em ordem crescente de número de linhas.





arq1=${1}
arq2=${2}
arq3=${3}

linhasarq1=$(cat ${arq1} | wc -l)
linhasarq2=$(cat ${arq2} | wc -l)
linhasarq3=$(cat ${arq3} | wc -l)


(( linhasarq1 > linhasarq2 )) && (( linhasarq1 > linhasarq3)) && maior=$arq1
(( linhasarq1 > linhasarq2 )) && (( linhasarq1 < linhasarq3)) && meio=$arq1
(( linhasarq1 < linhasarq2 )) && (( linhasarq1 > linhasarq3)) && meio=$arq1
(( linhasarq1 < linhasarq2 )) && (( linhasarq1 < linhasarq3)) && menor=$arq1

(( linhasarq2 > linhasarq1 )) && (( linhasarq2 > linhasarq3)) && maior=$arq2
(( linhasarq2 > linhasarq1 )) && (( linhasarq2 < linhasarq3)) && meio=$arq2
(( linhasarq2 < linhasarq1 )) && (( linhasarq2 > linhasarq3)) && meio=$arq2
(( linhasarq2 < linhasarq1 )) && (( linhasarq2 < linhasarq3)) && menor=$arq2

(( linhasarq3 > linhasarq1 )) && (( linhasarq3 > linhasarq2)) && maior=$arq3
(( linhasarq3 > linhasarq1 )) && (( linhasarq3 < linhasarq2)) && meio=$arq3
(( linhasarq3 < linhasarq1 )) && (( linhasarq3 > linhasarq2)) && meio=$arq3
(( linhasarq3 < linhasarq1 )) && (( linhasarq3 < linhasarq2)) && menor=$arq3

echo "Maior: ${maior}"
echo "Meio: ${meio}"
echo "Menor: ${menor}"






4 - Escreva um script que receba três nomes de diretórios como argumentos de linha de comando e imprima estes nomes em ordem crescente de quantidade de arquivos.




diretorio1=${1}
diretorio2=${2}
diretorio3=${3}

arquivosdiretorio1=$(ls ${diretorio1} | wc -l)
arquivosdiretorio2=$(ls ${diretorio2} | wc -l)
arquivosdiretorio3=$(ls ${diretorio3} | wc -l)


(( arquivosdiretorio1 > arquivosdiretorio2 )) && (( arquivosdiretorio1 > arquivosdiretorio3)) && maior=$diretorio1
(( arquivosdiretorio1 > arquivosdiretorio2 )) && (( arquivosdiretorio1 < arquivosdiretorio3)) && meio=$diretorio1
(( arquivosdiretorio1 < linhasarquivosdiretorio2arq2 )) && (( arquivosdiretorio1 > arquivosdiretorio3)) && meio=$diretorio1
(( arquivosdiretorio1 < arquivosdiretorio2 )) && (( arquivosdiretorio1 < arquivosdiretorio3)) && menor=$diretorio1

(( arquivosdiretorio2 > arquivosdiretorio1 )) && (( arquivosdiretorio2 > arquivosdiretorio3)) && maior=$diretorio2
(( arquivosdiretorio2 > arquivosdiretorio1 )) && (( arquivosdiretorio2 < arquivosdiretorio3)) && meio=$diretorio2
(( arquivosdiretorio2 < arquivosdiretorio1 )) && (( arquivosdiretorio2 > arquivosdiretorio3)) && meio=$diretorio2
(( arquivosdiretorio2 < arquivosdiretorio1 )) && (( arquivosdiretorio2 < arquivosdiretorio3)) && menor=$diretorio2

(( arquivosdiretorio3 > arquivosdiretorio1 )) && (( arquivosdiretorio3 > arquivosdiretorio2)) && maior=$diretorio3
(( arquivosdiretorio3 > arquivosdiretorio1 )) && (( arquivosdiretorio3 < arquivosdiretorio2)) && meio=$diretorio3
(( arquivosdiretorio3 < arquivosdiretorio1 )) && (( arquivosdiretorio3 > arquivosdiretorio2)) && meio=$diretorio3
(( arquivosdiretorio3 < arquivosdiretorio1 )) && (( arquivosdiretorio3 < arquivosdiretorio2)) && menor=$diretorio3

echo "Maior: ${maior}"
echo "Meio: ${meio}"
echo "Menor: ${menor}"






#5 - Escreva um script que recebe o nome de um arquivo como argumento de linha de comando e imprime GOOD caso este arquivo exista e possua mais que 5 linhas.




arquivo=${1}
ls ${arquivo} &>/dev/null || echo "arquivo não existe"
ls ${arquivo} &>/dev/null || exit 1
linhasarquivo=$(cat ${arquivo} | wc -l)
(( $linhasarquivo > 5)) && echo "GOOD"





#6 - Escreva um script que recebe o nome de 3 arquivos como parâmetros de linha de comando e pede para o usuário digitar uma palavra (denominada texto proibido). Imprima na tela o NOME dos arquivos que possuem este texto proibido, e mova estes arquivos (que possuem o texto proibido) para a pasta /tmp.




arq1=${1}
arq2=${2}
arq3=${3}
read -p "Digite uma palavra: " textoproibido
grep "$textoproibido" $arq1 &>/dev/null && mv $arq1 /tmp
grep "$textoproibido" $arq2 &>/dev/null && mv $arq2 /tmp
grep "$textoproibido" $arq3 &>/dev/null && mv $arq3 /tmp





#7 - Escreva um script que use o comando id para verificar se o mesmo foi executado com usuário root. Caso positivo, deve exibir uma mensagem de erro e sair do script. use substituição de shell e os  operadores condicionais (&& e || ) para resolver este problema em apenas uma linha.




(( $(id -u) == 0)) && echo "ERROR - script running on the root user" && exit 1                             #usei o id do root que obti atraves do comando id -u. Esse id sendo 0, o script apresenta erro e sai. 






8 - [PESQUISA] Quando usamos o pip (|) para conectar dois ou mais comandos, a variável $? toma o valor de sucesso ou falha do último comando da sequência. Como verificar o sucesso/falha dos outros comandos na sequência do pipe.

Exemplo de sequência:
	cat a.txt | tr ‘.’ ‘,’ | sort | grep -v “x”

como saber o retorno (sucesso/falha) dos comandos sort e tr ?




O usuário ao invés do usuário usar o pipe(|) entre os comandos, ele pode usar o &&, pois ele só executará o próximo comando caso o anterior dê certo pois ele verificará automaticamente o $? do comando anterior, logo se caso utilizar todos, então todos deram certo.

Exemplo: cat a.txt &&  tr ‘.’ ‘,’ &&  sort &&  grep -v “x”


