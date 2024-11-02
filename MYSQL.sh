#!/bin/bash

# Actualizar paquetes e instalamos MySQL Server
sudo apt-get update
sudo apt-get install -y mysql-server

# Configurar MySQL para permitir conexiones remotas poniendo la ip del servidor MYSQL y reiniciamos el servicio
sudo sed -i "s/bind-address.*/bind-address = 192.168.57.11/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Quitamos gateway por defecto para que no tenga salida a internet
ip route del default


# Crear el usuario y darle permisos a la base de datos que importaremos en el apache

sudo mysql -u root -e "CREATE USER 'godino'@'192.168.57.10' IDENTIFIED BY '1234';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON lamp_db.* TO 'godino'@'192.168.57.10';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
