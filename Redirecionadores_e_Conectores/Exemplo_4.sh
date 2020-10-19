3 - Script que execute o comando ping para o site www.google.com e que, ao mesmo tempo que exibe o resultado na tela, salve este resultado no arquivo /tmp/report.txt

#!/bin/bash
ping www.google.com.br | tee /tmp/report.txt
