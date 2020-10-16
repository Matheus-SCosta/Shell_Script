# Esse script recebe uma lista de arquivos como parâmetros de linha de comando e exibe na tela os arquivos que são executáveis.

#!/bin/bash
for i in $*; do
	if [ -x ${i} ]; then
		echo "arquivo ${i} é executável"
	fi
done
