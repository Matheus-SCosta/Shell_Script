
# 3. Considere a saída do comando history. Deseja-se fazer uma lista de todos os comandos que
#foram executados. Nenhum comando deve aparecer mais de uma vez na lista.
#	546 source /home/gov/venv-tasks/bin/activate
#	547 cd django/
#	548 ls
#	549 cd tasks_project/
#	550 ls
#	551 ./manage.py runserver 0:8888
#	552 ls
#	553 cd /etc
#	554 ls
#	555 ls -l
#	556 ls -l | head
#	2
#	557 history
#	558 history | head
#	559 history


#!/bin/bash

history | awk 'NF>=2 {print $2}' | sort -n | uniq


# OU

#!/bin/bash

read -p "Arquivo : " arq
cat ${arq} | awk 'NF>=2 {print $2}' | sort -n | uniq´
