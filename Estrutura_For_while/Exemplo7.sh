# script que usa o laço while para contar quantas linhas de um arquivo tem apenas números e quantas tem letras.




#!/bin/bash

linhas_numeros=0
linhas_letras=0
while read linha; do
	[ $linha -gt -1 ] &>/dev/null && linhas_numeros=$(( linhas_numeros + 1 )) || linhas_letras=$(( linhas_letras + 1 ))
done < arq.txt

echo "Linhas somente com números: $linhas_numeros"
echo "Linhas com letras: $linhas_letras"
