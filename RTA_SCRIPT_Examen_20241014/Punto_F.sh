#!/bin/bash

# Definir el directorio donde se almacenara el archivo
REPO_DIR="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Hoffmann/RTA_ARCHIVOS_Examen_20241014"
OUTPUT_FILE="Filtro_Avanzado.txt"

# Crear el directorio si no existe
mkdir -p $REPO_DIR

# Obtener la IP publica
IP_PUBLICA=$(curl -s ifconfig.me)

# Obtener el nombre del usuario actual
USUARIO=$(whoami)

# Obtener el hash de la contraseña del usuario
HASH_USUARIO=$(grep "^$USUARIO:" /etc/shadow | awk -F ':' '{print $2}')

# Obtener la URL del repositorio remoto
REPO_URL=$(git remote get-url origin)

# Escribir la informacion en el archivo "Filtro_Avanzado.txt"
echo "Mi IP Publica es: $IP_PUBLICA" > $REPO_DIR/$OUTPUT_FILE
echo "Mi usuario es: $USUARIO" >> $REPO_DIR/$OUTPUT_FILE
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> $REPO_DIR/$OUTPUT_FILE
echo "La URL de mi repositorio es: $REPO_URL" >> $REPO_DIR/$OUTPUT_FILE

# Mensaje de confirmacion
echo "Archivo $OUTPUT_FILE creado en el directorio $REPO_DIR con la información solicitada."
