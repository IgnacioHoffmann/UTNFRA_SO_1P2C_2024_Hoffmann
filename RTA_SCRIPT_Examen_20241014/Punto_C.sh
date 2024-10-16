#!/bin/bash

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Obtener el hash de la contraseña del usuario vagrant
VAGRANT_HASH=$(grep vagrant /etc/shadow | awk -F ':' '{print $2}')

# Crear usuarios y asignarles el hash del usuario vagrant
sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A1
echo "p1c2_2024_A1:$VAGRANT_HASH" | sudo chpasswd -e

sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A2
echo "p1c2_2024_A2:$VAGRANT_HASH" | sudo chpasswd -e

sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A3
echo "p1c2_2024_A3:$VAGRANT_HASH" | sudo chpasswd -e

sudo useradd -m -G p1c2_2024_gProfesores -s /bin/bash p1c2_2024_P1
echo "p1c2_2024_P1:$VAGRANT_HASH" | sudo chpasswd -e

# Asignar permisos a las carpetas
sudo mkdir -p /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

sudo mkdir -p /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/alumno_2
sudo chmod 760 /Examenes-UTN/alumno_2

sudo mkdir -p /Examenes-UTN/alumno_3
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/alumno_3
sudo chmod 700 /Examenes-UTN/alumno_3

sudo mkdir -p /Examenes-UTN/profesores
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 775 /Examenes-UTN/profesores

# Crear archivos de validación en las carpetas correspondientes
su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
