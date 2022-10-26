#!/bin/bash
sudo passwd ubuntu

sudo apt update && sudo apt upgrade

sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

sudo apt install rdesktop

sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret

java -version
if [ $? -eq 0 ];
then
echo "java instalado"
else
echo "java nao instalado"
echo "gostaria de instalar o java? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo apt install default-jre -y
fi
fi

git clone https://github.com/Gerencie-Monitoramento-de-totens/JAR.git

cd JAR/gerencie/target/

java -jar gerencie-1.0-SNAPSHOT-jar-with-dependencies.jar
