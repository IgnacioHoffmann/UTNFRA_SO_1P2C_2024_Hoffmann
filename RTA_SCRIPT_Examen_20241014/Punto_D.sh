#!/bin/bash

# Crear la estructura de directorios
mkdir -p ~/Estructura_Asimetrica/correo
mkdir -p ~/Estructura_Asimetrica/cliente

# Crear archivos cartas_ del 1 al 100 en ambos directorios
for i in {1..100}; do
  touch ~/Estructura_Asimetrica/correo/cartas_$i
  touch ~/Estructura_Asimetrica/cliente/cartas_$i
done

# Crear archivos carteros_ del 1 al 10 solo en la carpeta correo
for i in {1..10}; do
  touch ~/Estructura_Asimetrica/correo/carteros_$i
done

# Validación de la estructura creada
tree ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4
