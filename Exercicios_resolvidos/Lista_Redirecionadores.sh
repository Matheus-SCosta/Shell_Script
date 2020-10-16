01 - Escreva um script chamado help_red.sh que exibe uma ajuda sobre redirecionadores. Para cada redirecionador estudado ( >, >>, 2>, 2>>, &>, &>>, <, <<, <<<, e | ) o script deve imprimir o redirecionador, uma explicação sobre o seu funcionamento e um exemplo útil de uso.


#!/bin/bash


echo "Ajuda sobre redirecionadores"
echo "> - Redireciona a saida padrão para um arquivo, o sobrescrevendo"
echo ">> - Redireciona a saida padrão para um arquivo, adicionando ao seu conteúdo já existente
echo "2> - Redireciona a saida padrão de erros para um arquivo, o sobrescrevendo"
echo "2>> - Redireciona a saida padrão de erros para um arquivos, adicionando ao seu conteúdo já existente"
echo "&> - Redireciona todas as saidas de um comando (erros e acertos) da saida padrão a um arquivo, o sobrescrevendo"
echo "&>> - Redireciona todas as saidas de um comando (erros e acertos) da saida padrão a um arquivo, adicionando ao conteúdo nele já existente"
echo "< - Utiliza um arquivo como entrada padrão"
echo "<< - Para direcionar a entrada padrão para um documento escrito no bash"
echo " <<< - Permite usar string como entrada padrão para um comando"



2 - Considere o seguinte arquivo a.txt:

obase=16
43^2 - (11^3 + 31/4)
10+10

Escreva um script que use o programa bc e redirecionadores de entrada para resolver estas contas. Faça uma versão usando pipe e outra sem usar pipe.



sem usar o pipe:  

#!/bin/bash
bc < a.txt



usando o pipe: 

#!/bin/bash
cat a.txt | bc




3 - O comando ping é usado frequentemente para verificar a conectividade entre dois hosts em uma rede. Adicionalmente, este também pode ser usado para gerar relatórios sobre a qualidade da rede. Escreva um script que execute o comando ping para o site www.google.com e que, ao mesmo tempo que exibe o resultado na tela, salve este resultado no arquivo /tmp/report.txt


#!/bin/bash
ping www.google.com.br | tee /tmp/report.txt






4 - Considere o script:

#!/bin/bash
workdir=”/tmp/workdir”
mkdir $workdir
cd $workdir
ls $1 || echo “Por favor crie o arquivo ${workdir}/${1}”
ls $1 || exit 1
ls $2 || echo “Por favor crie o arquivo ${workdir}/${2}”
ls $2 || exit 1
ls $3 || echo “Por favor crie o arquivo ${workdir}/${3}”
ls $3 || exit 1
cat $1 $2 $3 | tr ‘ ‘ ‘\n’ | sort | grep -v “comentario”



Altere o script apresentado para que não exiba nenhuma mensagem de erro na tela. (Exceto pelo comando da linha 3, este deve ser permitido a exibir suas mensagens de erro).



#!/bin/bash
workdir=”/tmp/workdir” 2>/dev/null
mkdir $workdir 2>/dev/null
cd $workdir
ls $1 2>/dev/null 2>/dev/null || echo “Por favor crie o arquivo ${workdir}/${1}”
ls $1 2>/dev/null 2>/dev/null || exit 1
ls $2 2>/dev/null 2>/dev/null || echo “Por favor crie o arquivo ${workdir}/${2}”
ls $2 2>/dev/null 2>/dev/null || exit 1
ls $3 2>/dev/null 2>/dev/null || echo “Por favor crie o arquivo ${workdir}/${3}”
ls $3 2>/dev/null 2>/dev/null || exit 1
cat $1 $2 $3 2>/dev/null | tr ‘ ‘ ‘\n’ | sort | grep -v “comentario”





5 - Considere o script loop.sh:

#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} && echo “$(date +%H:%M) ${a}: criado!”
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} && echo “$(date +%H:%M) ${b}: removido!”
done



Execute o script acima de modo que todas as mensagens de sucesso sejam salvas no arquivo 1.log e que as mensagens de erro sejam salvas no arquivo 2.log.





#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} 2>>arquivo2.log && echo “$(date +%H:%M) ${a}: criado!” >>arquivo1.log
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} 2>>arquivo2.log && echo “$(date +%H:%M) ${b}: removido!” >>arquivo1.log
done





Execute o script novamente de modo que todas as mensagens de sucesso e erro sejam salvas no arquivo 3.log.





#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} &>>arquivo3.log && echo “$(date +%H:%M) ${a}: criado!” &>>arquivo3.log
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} &>>arquivo3.log && echo “$(date +%H:%M) ${b}: removido!” &>>arquivo3.log
done




6 - [PESQUISA] Considere o script apresentado na questão anterior. Suponha que você queira substituir todo ‘:’ da saída por ‘-’. Seria simples executar

./loop.sh | tr ‘:’ ‘-’

contudo este comando não faz substituições na saída de erros. Como usar redirecionadores de modo que o comando tr consiga substituir os caracteres tanto da saída de erro quanto da saída padrão?




#!/bin/bash
while true; do
	a=$(( ${RANDOM} % 10 ))
	touch ${a} 2>erros.log && echo “$(date +%H:%M) ${a}: criado!” || cat erros.log | tr ':' '-'
	sleep 1
b=$(( ${RANDOM} % 10 ))
	rm ${b} 2>erros.log && echo “$(date +%H:%M) ${b}: removido!” || cat erros.log | tr ':' '-'
done


