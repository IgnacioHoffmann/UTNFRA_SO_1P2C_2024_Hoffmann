#!/bin/bash

# Particionar el disco de 10GB en 10 particiones lógicas iguales de 1GB cada una
(
echo n   # Nueva partición
echo e   # Tipo de partición extendida
echo     # Número de partición por defecto (2)
echo     # Primer sector por defecto
echo     # Usar todo el disco para la partición extendida

# Crear 10 particiones lógicas de 1GB dentro de la extendida
for i in {5..14}; do
    echo n   # Nueva partición lógica
    echo     # Número de partición por defecto
    echo +1000M  # Tamaño de la partición lógica (1GB)
done

echo w   # Escribir los cambios
) | sudo fdisk /dev/sdc

# Recargar la tabla de particiones
sudo partprobe /dev/sdc

# Formatear las particiones como ext4
for i in {5..14}; do
    mkfs.ext4 /dev/sdc${i}  # Formatear las particiones lógicas
done

# Crear directorios de montaje si no existen
mkdir -p /Examenes-UTN/alumno_1/parcial_{1..3}
mkdir -p /Examenes-UTN/alumno_2/parcial_{1..3}
mkdir -p /Examenes-UTN/alumno_3/parcial_{1..3}
mkdir -p /Examenes-UTN/profesores

# Montar las particiones en las carpetas correspondientes
mount /dev/sdc5 /Examenes-UTN/alumno_1/parcial_1
mount /dev/sdc6 /Examenes-UTN/alumno_1/parcial_2
mount /dev/sdc7 /Examenes-UTN/alumno_1/parcial_3
mount /dev/sdc8 /Examenes-UTN/alumno_2/parcial_1
mount /dev/sdc9 /Examenes-UTN/alumno_2/parcial_2
mount /dev/sdc10 /Examenes-UTN/alumno_2/parcial_3
mount /dev/sdc11 /Examenes-UTN/alumno_3/parcial_1
mount /dev/sdc12 /Examenes-UTN/alumno_3/parcial_2
mount /dev/sdc13 /Examenes-UTN/alumno_3/parcial_3
mount /dev/sdc14 /Examenes-UTN/profesores

# Agregar los montajes a /etc/fstab para que sean persistentes
echo "/dev/sdc5 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc6 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc7 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc8 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc9 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc10 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc11 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc12 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc13 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/sdc14 /Examenes-UTN/profesores ext4 defaults 0 0" >> /etc/fstab
