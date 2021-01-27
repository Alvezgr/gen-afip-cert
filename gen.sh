#!/bin/sh
read -p "Ingrese nombre de la empresa :" name
openssl genrsa -out $name.key 2048
read -p "Ingrese el CUIT sin espacio ni guiones: " cuit
openssl req -new -key $name.key -subj "/C=AR/O=$name /CN=Dajoalas/serialNumber=CUIT $cuit" -out $name.csr
echo "La clave publica es $name.key y el certificado $name.csr"
echo "Puede copiar el certificado y la clave respectivamente"
cat $name.csr
cat $name.key
