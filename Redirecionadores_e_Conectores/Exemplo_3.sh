6 - Considere o script

#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} &>>arquivo3.log && echo “$(date +%H:%M) ${a}: criado!” &>>arquivo3.log
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} &>>arquivo3.log && echo “$(date +%H:%M) ${b}: removido!” &>>arquivo3.log
done


#Para substituir todo ‘:’ da saída por ‘-’. Seria simples executar
#./loop.sh | tr ‘:’ ‘-’
#contudo este comando não faz substituições na saída de erros. Nesse exemplo usei redirecionadores de modo que o comando tr consiga substituir os caracteres tanto da saída de erro quanto da saída padrão.




#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} 2>erros.log && echo “$(date +%H:%M) ${a}: criado!” || cat erros.log | tr ':' '-'
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} 2>erros.log && echo “$(date +%H:%M) ${b}: removido!” || cat erros.log | tr ':' '-'
done
