# Lamp_2_Niveles
## Fichero Vagrantfile
Para crear nuestro fichero de vagrant tendriamos que poner el siguiente comando: **vagrant init**
Una vez hemos creado el fichero Vagrantfile tendremos que edictarlo como se muestra en la imágen para poder crear las dos máquinas. En primer lugar creariamos la de MYSQL porque sino nos daria error cuando en el aprovisionamiento creemos los usuarios y tablas.
![image](https://github.com/user-attachments/assets/61f6eb3f-50a7-4205-8af6-ab8a84e72389)

## Fichero Aprovisionamiento MYSQL
En el fichero MYSQL.sh lo que haremos sera automatizar todo el proceso de instalar mysq-server, configurar las conexiones remotas a la base de datos, quitarle la salida a internet y crear y dar permisos a un usuario que utilizaremos en el apache. Lo editaremos de la misma forma que en la imagen.
![image](https://github.com/user-attachments/assets/fc5378d0-6825-4228-a3de-e6da85bfc829)

## Fichero Aprovisionamiento Apache
En el fichero Apache.sh lo que haremos sera instalar apache, php, git y el cliente de MySQL, hacer una copia del fichero por defecto, editarlo y hablitarlo, clonar el respositorio que se nos proporciona, editar el fichero config.php e importar la base de datos. Lo editaremos de la misma forma que en la imagen.
![image](https://github.com/user-attachments/assets/52f1aa67-8829-43a8-9b8d-de7b37b9b02b)

## Sitio web
Aqui podemos apreciar que hemos hecho todo lo anterior bien y al poner en el buscardor http://localhost:8080/ nos aparece nuestra pagina web de la base de datos.
![image](https://github.com/user-attachments/assets/29296a57-1152-4d7c-8125-a43a694d5ba6)
