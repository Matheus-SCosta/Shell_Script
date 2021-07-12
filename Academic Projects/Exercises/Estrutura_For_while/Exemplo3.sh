# script que usa a ferramenta md5 para verificar a existência de arquivos com o mesmo conteúdo no diretório atual. Caso existam, imprime o nome dos arquivos duplicados.

#!/bin/bash 


contador=0
for i in $(ls); do
	md5=$(cat $i | md5sum)
	for j in $(ls); do
		md5_2=$(cat $j | md5sum)
		if [[ $md5 == $md5_2 ]] && [[ $i != $j ]]; then
			echo "arquivos $i e $j tem o mesmo conteúdo"
			contador=$contador+1
		fi
	done
done
if (( $contador == 0 )); then
	echo "Não existe arquivos iguais"
fi
