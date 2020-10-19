read -p "Digite a 1º extensao: " extensao1
read -p "Digite a 2º extensao: " extensao2
read -p "Digite a 3º extensao: " extensao3
read -p "Digite a 4º extensao: " extensao4
read -p "Digite a 5º extensao: " extensao5

ls *.${extensao1} >/dev/null 2>/dev/null && echo *.{extensao1}>> lista.txt || echo "Extensao 1 não existente"
ls *.${extensao2} >/dev/null 2>/dev/null && echo *.{extensao2}>> lista.txt || echo "Extensao 2 não existente"
ls *.${extensao3} >/dev/null 2>/dev/null && echo *.{extensao3}>> lista.txt || echo "Extensao 3 não existente"
ls *.${extensao4} >/dev/null 2>/dev/null && echo *.{extensao4}>> lista.txt || echo "Extensao 4 não existente"
ls *.${extensao5} >/dev/null 2>/dev/null && echo *.{extensao5}>> lista.txt || echo "Extensao 5 não existente"
