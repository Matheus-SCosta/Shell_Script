# Lista 14 (Scripts de Inicialização)


# 1 - Escreva um script que exiba a data atual e uma mensagem motivacional aleatória. Faça que esse script seja executado todas as vezes que seu usuário faça login no sistema.

# R= Nessa questão eu criei dentro do diretório /etc um arquivo chamado scriptInicializacao com o seguinte conteúdo:

#!/bin/bash

data=$(date "+%a, %d/%M/%Y")
echo "====================================="
echo -e "\n$data"
echo -e "\nQUEM FAZ SEU FUTURO É VOCÊ!!!!\n"
echo -e "=====================================\n"


# R= E dentro do arquivo /etc/profile eu adicionei uma linha com "source /etc/scriptInicializacao", para que cada usuário ao logar receba a mensagem.




# 2 - Escreva um script que remova todos os arquivos da pasta /home/<seu_user>/tmp. Faça que este script seja executado todas as vezes que o computador for ligado.


# R= Nessa questão eu também criei dentro do diretório /etc um arquivo chamado scriptInicializacao2 com o seguinte conteúdo:


#!/bin/bash

rm -rf /home/matheus/tmp/*



# R= Usei a mesma forma da questão 1, dentro do arquivo /etc/profile eu adicionei uma linha com "source /etc/scriptInicializacao2" e logando com o usuário root o arquivos do diretório /home/matheus/tmp/ sejam removidos. Foi a forma que consegui fazer
