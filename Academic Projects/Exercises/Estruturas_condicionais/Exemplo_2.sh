#Script exibe o arquivo mais recente (cuja criação ou modificação foi realizada mais tarde) do diretório atual.



#!/bin/bash
maior_data=0
maior_horario=00:00
maior_minuto=0
maior_hora=0
for i in $(ls); do
	data=$(ls -l ${i} | awk '{print $7}')
	horario=$(ls -l ${i} | awk '{print $8}')
	hora=$( echo ${horario} | cut  -d: -f1 )
	minutos=$( echo ${horario} | cut -d: -f2 )
	nome_arq=$(ls -l ${i} | awk '{print $9}')
	if [ ${data} -gt ${maior_data} ]; then
		maior_data=${data}
		nome_arquivo=${nome_arq}
		maior_minuto=${minutos}
		maior_hora=${hora}
	elif [ ${data} -eq ${maior_data} ]; then
		if [ ${hora} -gt ${maior_hora} ]; then
			nome_arquivo=${nome_arq}
			maior_minuto=${minutos}
			maior_hora=${hora}
		elif [ ${hora} -eq ${maior_hora} ]; then
			if [ ${minutos} -gt ${maior_minuto} ]; then
				nome_arquivo=${nome_arq}
				maior_minuto=${minutos}
			fi
		fi
	fi
done

echo "Arquivo mais recente criado ou alterado: ${nome_arquivo}"	

