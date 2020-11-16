# Script que remove todos os números de telefone de um arquivo de entrada, alterando o seu valor para **CENSURADO**.

#!/bin/bash

read -p "Digite o arquivo com telefone: " arquivo_com_telefones
sed -E 's/[(0-9)+ [0-9]+/ **CENSURADO** /' < ${arquivo_com_telefones} > arq_aux
rm ${arquivo_com_telefones}
cp arq_aux ${arquivo_com_telefones}
rm arq_aux


#obs: usei como exemplo o arquivo telefones.txt

#     maria (83) 966532145
#     joão (83) 963654123
#     lucas (83) 9867452364
#     antonia (83) 9656897451

