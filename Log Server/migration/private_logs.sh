#!/bin/bash


# Colocando o nome em maiúsculo de todos os emissores que possuem tomcat e a mensagem de cada emissor no array TOMCATS_ATIVOS, para exibição no MENU
ls -l /usr/local/tomcat > tomcatsLogTX
while read linha; do
    tomcats=$(echo ${linha} | awk '{print $9}')
    tomcat=$(echo ${tomcats} | cut -d '-' -f 1)
    if [ ${tomcat} == 'tomcat' ]; then
        emissor=$(echo ${tomcats} | cut -d '-' -f 2 )
        EMISSOR=$(echo ${tomcats} | cut -d '-' -f 2 | tr '[a-z]' '[A-Z]')
        MSG="Visualizar_logs_de_aplicação_${emissor}"
        TOMCATS_ATIVOS=( ${TOMCATS_ATIVOS[*]} ${EMISSOR} ${MSG} )
    fi
done < tomcatsLogTX




# Menu para escolha do emissor

MENU=$(dialog --stdout --menu "Escolha os LOGS para Visualizar" 0 0 0 "${TOMCATS_ATIVOS[@]}" "" \ )

# Caso a opção CANCELAR do MENU seja selecionada
if [ -z "${MENU}" ]; then exit;

else
    while : ; do    
        # Menu para mostrar os logs do emissor selecionado
        for EMISSOR in ${TOMCATS_ATIVOS[*]}; do
 
        
            # Quando o EMISSOR for o selecionado no MENU será feito definição de variaveis  para exibição no MENU_APP
            if [ ${MENU} == ${EMISSOR} ]; then
            
                emissor=$( echo ${EMISSOR} | tr '[A-Z]' '[a-z]' )
                PATH_LOGS_APP="/home/neus/logs/${emissor}"
                ls -l ${PATH_LOGS_APP} | awk '{print $9}' | cut -d '/' -f 5 > arquivos_log
                echo Catalina.out >> arquivos_log
                ARQUIVOS_LOGS_APP=( "CATALINA" "Visualizar_logs_catalina" )
            
                # Feito algumas manipulações para exibição no MENU_APP (retirado o .log do nome de cada arquivo e colocado o nome em maiúsculo), 
                # e criado uma mensagem para colocar no array ARQUIVOS_LOGS_APP para passar para o MENU_APP. Criado o array arquivo_logs_app para utilização futura no código
                for arquivo in $(cat arquivos_log); do
                    arquivo_logs_app=( ${arquivo_logs_app[*]} ${arquivo} )
                    arquivo=$(echo ${arquivo} | sed -E 's/.log//')
                    msg="Visualizar_logs_${arquivo}"
                    arquivo=$(echo ${arquivo} | tr '[a-z]' '[A-Z]' )
                    if [ ${arquivo} != 'CATALINA.OUT' ]; then
                        ARQUIVOS_LOGS_APP=( ${ARQUIVOS_LOGS_APP[*]} ${arquivo} ${msg} )
                    fi
                done

                # Menu para escolha do log a visualizar

                MENU_APP=$( dialog --stdout --menu "Visualizador de Logs ${EMISSOR}" 0 0 0  "${ARQUIVOS_LOGS_APP[@]}" "" "" "" \ )
                
                # Caso a opção CANCELAR do MENU_APP seja selecionada
                if [ -z "${MENU_APP}" ]; then exit;
                
                else
                    log=$( echo ${MENU_APP} | cut -d '.' -f 1 )
                    rotate=$( echo ${MENU_APP} | cut -d '.' -f 2 )
                    # Fazendo ajuste no nome dos arquivo escolhido para visualizar no MENU_APP, para colocar o .log cujo retirado anteriormente para exibição
                    if [ ${MENU_APP} == 'CATALINA' ]; then
                        extensao='CATALINA.OUT'
                    elif [[ ${MENU_APP} =~ [a-zA-Z0-9]+-[0-9]+ ]]; then 
                        log=$( echo ${MENU_APP} | cut -d '-' -f 1 )
                        rotate=$( echo ${MENU_APP} | cut -d '-' -f 2 )
                        extensao=$( echo "${log}.log-${rotate}")
                    else
                        log=$( echo ${MENU_APP} | cut -d '.' -f 1 )
                        rotate=$( echo ${MENU_APP} | cut -d '.' -f 2 )
                        if [ "$log" != "$rotate" ]; then
                            extensao=$( echo "${log}.log.${rotate}" )
                        else
                            extensao=$( echo ${log}.log )
                        fi
                    fi
                    
                    
                    # colocando o nome do arquivo de log todo em minusculo
                    nome_arquivo=$( echo ${extensao} | tr '[A-Z]' '[a-z]')
                    
                    
                    # pegar o nome do arquivo todo em minusculo na variavel nome_arquivo e comparar com os nomes originais do logs presentes no array arquivos_logs_app
                    # Isso é necessário caso tenha algum arquivo que possua no seu nome letras minusculas e maiusculas, como "parcelaProtegida.log"
                    for arquivo_log in ${arquivo_logs_app[*]};do
                        arquivo=$( echo ${arquivo_log} | tr '[A-Z]' '[a-z]' )
                        
                        # dando um less no arquivo
                        if [ ${arquivo} == ${nome_arquivo} ]; then if [ ${log} == "CATALINA" ]; then less /usr/local/tomcat/tomcat-${emissor}/logs/catalina.out; break;
                        else less /home/neus/logs/${emissor}/${arquivo_log}; break; fi
                        fi   
                    done
                fi
            fi
        done
    done
fi
