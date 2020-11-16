# Lista 10 (Sed)

# Todas as soluções devem usar o comando sed com expressões regulares.

#1 - Escreva um script que, baseado em opções de linha de comando:
#a - Remova todas as letras de um arquivo.

#!/bin/bash

read -p "arquivo: " arq
sed -E 's/[a-z]+//g' < ${arq} > arq_aux
rm ${arq}
cp arq_aux ${arq}
rm arq_aux

#b - Remova todos os dígitos de um arquivo.

#!/bin/bash

read -p "arquivo: " arq
sed -E 's/[0-9]+//g' < ${arq} > arq_aux
rm ${arq}
cp arq_aux ${arq}
rm arq_aux


#c - Remova todos os caracteres que não são letras nem dígitos de um arquivo.

#!/bin/bash

read -p "arquivo: " arq
sed -E 's/[^a-z0-9]//g' < ${arq} > arq_aux
rm ${arq}
cp arq_aux ${arq}
rm arq_aux


#2 - Dado um arquivo cuja primeira linha é o título e as linhas seguintes são ítens de uma lista. Escreva um script que crie um arquivo html completo usando o conteúdo do arquivo de entrada. Exemplo de arquivo:

#	Lista de IPs
#	8.8.8.8
#	8.8.4.4
#	127.0.0.1
#	123.123.123.1


#!/bin/bash

read -p "arquivo: " arq
sed -E 's/^/<p>/' < ${arq} > arq_aux
awk '{print $0"</p>"}' arq_aux > arq_aux1
sed -E 's/^/   /' < arq_aux1 > arq_aux2
sed -E -e '1i <head>' -e '2i <body>' < arq_aux2 > arq_html
sed -i '$s/$/\n/' arq_html
sed -i '$i ''</body>''' arq_html
sed -i '$i ''</head>''' arq_html
cat arq_html

rm arq_au*




#3 - Escreva um script que remova todos os números de telefone de um arquivo de entrada, alterando o seu valor para **CENSURADO**.

#!/bin/bash

read -p "Digite o arquivo com telefone: " arquivo_com_telefones
sed -E 's/[(0-9)+ [0-9]+/ **CENSURADO** /' < ${arquivo_com_telefones} > arq_aux
rm ${arquivo_com_telefones}
cp arq_aux ${arquivo_com_telefones}
rm arq_aux


#obs: usei como exemplo o arquivo telefones.txt

#maria (83) 966532145
#joão (83) 963654123
#lucas (83) 9867452364
#antonia (83) 9656897451
#...

#...


#4 - Escreva um script que, dado uma lista de CPFs no formato xxxxxxxxxxx, coloque cada cpf no formato xxx.xxx.xxx-xx.

#!/bin/bash

read -p "Arquivo: " arq
sed 's/\(...\)\(...\)\(...\)\(..\)/\1.\2.\3-\4/' < ${arq} > arq_aux
rm ${arq}
cp arq_aux ${arq}
rm arq_aux

