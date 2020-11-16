# Dado um arquivo cuja primeira linha é o título e as linhas seguintes são ítens de uma lista. Escrevi um script que cria um arquivo html completo usando o conteúdo do arquivo de entrada. Exemplo de arquivo:

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
