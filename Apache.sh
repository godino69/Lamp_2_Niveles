#!/bin/bash

# Actualizar paquetes e instalar Apache, php, git y el cliente de MySQL
sudo apt update
sudo apt install -y apache2 php libapache2-mod-php php-mysql mysql-client git

# Copiar el fichero de configuracion de apache por defecto, editar la copia y desabilitar el fichero por defecto y habilitar la copia editada.
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/practica.conf
sudo sed -i 's|/var/www/html|/var/www/html/practica/src|g' /etc/apache2/sites-available/practica.conf
sudo a2dissite 000-default.conf
sudo a2ensite practica.conf

# Reiniciar Apache para aplicar la nueva configuración
sudo systemctl restart apache2

# Clonar el repositorio en /var/www/html/practica
sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git /var/www/html/practica

# Crear variable de la contraseña del usuario creado en MYSQL
Contrasena="1234"

#Editar fichero config.php añadiendole los datos de nuestra base de datos y usuario
sudo sed -i "s|define('DB_HOST', '.*');|define('DB_HOST', '192.168.57.11');|" /var/www/html/practica/src/config.php
sudo sed -i "s|define('DB_NAME', '.*');|define('DB_NAME', 'lamp_db');|" /var/www/html/practica/src/config.php
sudo sed -i "s|define('DB_USER', '.*');|define('DB_USER', 'godino');|" /var/www/html/practica/src/config.php
sudo sed -i "s|define('DB_PASSWORD', '.*');|define('DB_PASSWORD', '1234');|" /var/www/html/practica/src/config.php

# Importar el archivo SQL de base de datos
mysql -h 192.168.57.11 -u godino -p$Contrasena < /var/www/html/practica/db/database.sql

# Eliminar archivos innecesarios
sudo rm /var/www/html/practica/README.md
sudo rm -R /var/www/html/practica/db
