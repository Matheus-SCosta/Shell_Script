#!/bin/bash

CLI='/root/valida-app/roles/slave/files/jenkins-cli.jar'
java -jar /root/valida-app/roles/slave/files/jenkins-cli.jar -s http://10.0.20.52:8080/  -auth mateus-costa:mudar123 list-jobs > todos.txt

for JOB in $(cat todos.txt); do
        echo $JOB
        java -jar ${CLI} -s http://10.0.20.52:8080/ -auth mateus-costa:mudar123  get-job ${JOB} > ${JOB}.xml
done < todos.txt


for i in $(ls); do echo $i; aws s3 cp $i s3://jenkins-lab-jobs/migracao/; sleep 10; done


###################JENKINS9090

#!/bin/bash

CLI='/root/jobs/jenkins-cli.jar'
java -jar /root/jobs/jenkins-cli.jar -s http://172.16.1.224:9090/  -auth user:pass list-jobs > todos.txt

for JOB in $(cat todos.txt); do
        echo $JOB
        java -jar ${CLI} -s http://172.16.1.224:9090/ -auth user:pass  get-job ${JOB} > ${JOB}.xml
done < todos.txt

############### MANDAR PARA S3
for i in $(ls); do echo $i; aws s3 cp $i s3://jenkins-lab-jobs/migracao/; sleep 10; done


########################################################

java -jar jenkins-cli.jar -s http://10.0.20.52:8080/ -auth user:pass create-job ENCRIPTOGRAFIA_CHAVES_PGP_TESTE_XML < ENCRIPTOGRAFIA_CHAVES_PGP.xml


################### CRIAR A PARTIR DA NOVA LISTA
#!/bin/bash

CLI='/root/valida-app/roles/slave/files/jenkins-cli.jar'

for JOB in $(cat list2.txt); do
        echo $JOB
        java -jar ${CLI} -s http://10.50.2.5:8080/ -auth user:pass  create-job ${JOB} < ${JOB}.xml
done < list2.txt



sed -i 's/marketpay.com.br/connect.dock.tech/g' ./*.xml