#!/bin/bash
sudo passwd ubuntu
sudo apt update && sudo apt upgrade -y

echo "Você gostaria de instalar a interface gráfica? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
		sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
else
		echo "Prosseguindo."
fi

#saber versão java
# VERSION=”$(java -version 2>&1 | grep version | cut -d’”’ -f2)”
# if [ “${VERSION}” ];
# then
#   echo “Cliente possui java instalado: ${VERSION}”
# else
#   echo “Cliente não possui java instalado”
# fi

#instalação java default
java --version
if [ $? -eq 0 ];
then
	echo "Java já está instalado"
else
	echo "Gostaria de instalar o Java? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install default-jre -y
	fi
fi

#Criando docker
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
# sudo docker –-version
sudo docker ps
# Pull ele está baixando o MYSQL.
sudo docker pull mysql:5.7
sudo docker images
# Ele cria as configurações do mysql..
# Caso não consiga executar o banco pelo java descomentar linha abaixo.
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=gerencie" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
# Aqui ele já começa a rodar o banco.
# sudo docker exec -it ContainerBD bash


#Criando jar executável
cd .. 
cd ..
sudo git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git
cd JAR/gerencie/target
java -jar gerencie-1.0-SNAPSHOT-jar-with-dependencies.jar
