# Script que recebe o nome de um arquivo e um número (x) como parâmetros de linha de comando. O script deve imprimir a linha número x do arquivo.

#!/bin/bash

read -p "Arquivo: " arquivo
read -p "Nº da linha: " x

head -${x} < ${arquivo} | tail -1
