script que tenha uma função ping_test. Esta recebe um endereço IP como parâmetro, pinga para este IP (sem exibir nada na tela) e exibe OK se o endereço estiver acessível e FALHA caso contrário.


function ping_test () {
        ping -c 2 $1 > arq_aux
        ultimaLinha=$(cat arq_aux |  wc -l)
        ping_sucesso=$(cat arq_aux | awk 'NR=='$(( ultimaLinha-1 ))' {print $4}')
        if [ $ping_sucesso -eq 0 ]; then
                echo "FALHA"
        else
                echo "OK"
        fi

}

ping_test 8.8.8.8
