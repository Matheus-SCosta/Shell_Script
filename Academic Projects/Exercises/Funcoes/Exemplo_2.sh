# Considere o seguinte arquivo:

#	12 10 13 14
#	6 5 -9 11 12 4
#	15
#	12 3
#	21 1 2 3 4 5 6 7 8 9
#	6

#  script para encontrar o menor e o maior número do arquivo apresentado acima.


function maior_menor() {
        maior=0
        menor=0
        for i in $(cat $1); do
                if [ $i -gt $maior ]; then
                        maior=$i
                elif [ $i -lt $menor ]; then
                        menor=$i
                fi
        done
        echo "Maior: $maior  -  Menor: $menor"
}


resultado=$(maior_menor arquivo)
echo $resultado
