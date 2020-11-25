# Listando os diretorios de uma pasta

#!/bin/bash

ls -l | grep ^d > diretorios
cat diretorios | grep -E -o '[a-zA-Z0-9]+$'
rm diretorios
