#!/bin/bash
#Author: Jesus Angosto
# TW: @jdangosto

if [ -e /usr/bin/steghide ];then 
	echo "Se ha encontrado steghide instalado en su sistema"
	echo
else
echo "Steghide no se encuentra instalado en su sistema, por favor instalelo antes de continuar"
fi

if [ $1 ] && [ $2 ]; then
for line in $(cat $2);
do
	$(steghide extract -q -sf $1 -p $line 2>/dev/null)
	var=$?
	if [ $var -eq 0 ]
	then
		echo		
		echo "Se ha encontrado la passphrase: $line "
		echo "Y es la correcta para extraer el fichero oculto en la imagen"
		echo
		echo "************************************************************"
		echo "Author: @jdangosto"
		echo "************************************************************"	  
		break
	fi
done
else
	echo "************************************************************************************"
	echo "Debes de pasar la imagen y el diccionario: Usage: stegForce.sh [imagen] [diccionario]"
	echo "************************************************************************************"
fi


