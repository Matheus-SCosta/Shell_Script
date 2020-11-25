# Script que cria 26 diretórios com nomes de A a Z. Dentro de cada diretório criado deve ser criado um arquivo com o nome do diretório e extensão .py (exemplo A.py, B.py ...). O conteúdo de cada um destes arquivos deve ser:
#!/usr/bin/env python3
# print(“Rapi Hellow Uin!”)
# dando permissão de execução para cada arquivo gerado.




#!/bin/bash
for i in {A..Z}; do
	mkdir ${i}
	cd ${i}
	echo -e '#!/usr/bin/env python3 \nprint("Rapi Hellow Uin!")' > ${i}.py
	chmod +x ${i}.py
	cd ..
done
