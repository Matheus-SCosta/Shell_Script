# Considerando o seguinte arquivo ips.txt:

8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54

# Usei um laço while para executar 4 pings para cada ip. Listando os IPs que não foram possíveis acessar.



#!/bin/bash

while read linha; do
	echo " "
	echo " "
	echo "DANDO PING EM: ${linha}
	echo " "
	echo " "
	ip=${linha}
	ping -c 4 ${ip}
done < ips.txt
