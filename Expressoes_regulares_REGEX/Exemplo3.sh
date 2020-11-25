# Lista apenas arquivos executáveis

#!/bin/bash

ls -F > arquivos
cat arquivos | grep -E '[a-zA-Z0-9]+.[a-zA-Z0-9]+[*]'
rm arquivos
