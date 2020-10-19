
#Nesse exemplo um script que recebe o nome de um diretório como argumento de linha de comando. todos os arquivos deste diretório devem ser compactados. O nome do arquivo compactado deve ser dd.mm.yy.zip (dd = dia, mm = mês, yy = ano). Nesse exemplo, todas as resposta, sendo erros ou não, estão sendo passadas para /dev/null.

touch $(date +%d.%m.%y)
read -p "Diretorio a ser compactado : " diretorio
tar cvf $(date +%d.%m.%y) $diretorio &>/dev/null
