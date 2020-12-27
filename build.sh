#!/bin/bash

crear_entorno()
{
	#Creamos unos directorios
	for dia in {lunes,martes,miercoles,jueves,viernes,sabado,domingo};do mkdir -p $ROOTE/diario/$dia;done
	for dir in {documentos,musica,fotos,videos,programas};do mkdir -p $ROOTE/datos/$dir;done
	
	dd if=/dev/zero of=/tmp/10k count=10 bs=1K
	dd if=/dev/zero of=/tmp/20k count=20 bs=1K
	dd if=/dev/zero of=/tmp/30k count=30 bs=1K
	dd if=/dev/zero of=/tmp/40k count=40 bs=1K
	dd if=/dev/zero of=/tmp/50k count=50 bs=1K

	#Creamos unos archivos
	for num in {1,2,3,4,5}
	do
		cp /tmp/40k $ROOTE/datos/musica/cancion$num
		cp /tmp/30k $ROOTE/datos/fotos/foto$num
		cp /tmp/50k $ROOTE/datos/videos/video$num
		cp /tmp/10k $ROOTE/datos/documentos/doc$num
		cp /tmp/20k $ROOTE/datos/programas/programa$num
	done	
	for dia in {lunes,martes,miercoles,jueves,viernes,sabado,domingo}
	do
		for num in {1,2,3,4,5}
		do
			cp /tmp/10k $ROOTE/diario/$dia/archivo$num
		done
		
	done

	#Creamos unos enlaces
	ln -s $ROOTE/diario/lunes $ROOTE/diario/martes/ayer
	ln -s $ROOTE/diario/martes $ROOTE/diario/miercoles/ayer
	ln -s $ROOTE/diario/miercoles $ROOTE/diario/jueves/ayer
	ln -s $ROOTE/diario/jueves $ROOTE/diario/viernes/ayer
	ln -s $ROOTE/diario/viernes $ROOTE/diario/sabado/ayer
	ln -s $ROOTE/diario/sabado $ROOTE/diario/domingo/ayer
	ln -s $ROOTE/diario/domingo $ROOTE/diario/lunes/ayer

	ln -s $ROOTE/diario/lunes $ROOTE/diario/domingo/manhana
	ln -s $ROOTE/diario/martes $ROOTE/diario/lunes/manhana
	ln -s $ROOTE/diario/miercoles $ROOTE/diario/martes/manhana
	ln -s $ROOTE/diario/jueves $ROOTE/diario/miercoles/manhana
	ln -s $ROOTE/diario/viernes $ROOTE/diario/jueves/manhana
	ln -s $ROOTE/diario/sabado $ROOTE/diario/viernes/manhana
	ln -s $ROOTE/diario/domingo $ROOTE/diario/sabado/manhana
}

ROOTE=/var/entorno

[ -d $ROOTE ] || crear_entorno

