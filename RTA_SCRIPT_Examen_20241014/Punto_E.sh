#!/bin/bash

# Definir el directorio donde se almacenara el archivo
REPO_DIR="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Hoffmann/RTA_ARCHIVOS_Examen_20241014"
OUTPUT_FILE="Filtro_Basico.txt"

# Crear el directorio si no existe
mkdir -p $REPO_DIR

# Obtener la informacion de la memoria RAM total
MEM_TOTAL=$(grep MemTotal /proc/meminfo)

# Obtener la informacion del fabricante del chassis
CHASSIS_INFO=$(sudo dmidecode -t chassis | grep "Manufacturer")

# Escribir la informacion en el archivo "Filtro_Basico.txt"
echo "Informacion de la Memoria RAM Total:" > $REPO_DIR/$OUTPUT_FILE
echo "$MEM_TOTAL" >> $REPO_DIR/$OUTPUT_FILE
echo "" >> $REPO_DIR/$OUTPUT_FILE

echo "Información del Fabricante del Chassis:" >> $REPO_DIR/$OUTPUT_FILE
echo "$CHASSIS_INFO" >> $REPO_DIR/$OUTPUT_FILE

# Mensaje de confirmacion
echo "Archivo $OUTPUT_FILE creado en el directorio $REPO_DIR con la información solicitada."
