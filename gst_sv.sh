#! /bin/bash
#-----Name: David Soto Noche 
#-----Date: 02/07/2019
#-----Program: Gestion system file server
#-----Instruccion instalar script en la carpera /

opcion=""

tecla=0
tecla1=0
user=""
grupo=""
permiso=""
delete=""
confirmacion=""
confirma="y"

clear
echo "Gestor de Sistema V 0.1"
echo ""
echo "Menu de gestion FHS"

echo "1- Archivador" #1
echo "2- G.P.P"
echo "3- Mantenimiento"
echo "4- Exit"
read -n 1 -p "Seleccione una opcion: " opcion
echo ""


case $opcion in 

1 ) echo "Menu Archivador" #1

tecla=0
tecla1=0
confirma=""
yes="y"
archivo=""
archivo1=""
carpeta=""
documento=""
ruta=""
dt-nombre=""
dt-destino=""
dt-capacidad=""
dt-num_pkg=0
cnt=""

clear
echo "Menu de Gestion de Archivos"
echo "1-Busqueda de Archivos"
echo "2-Busqueda de Carpetas"
echo "3-Volcado de Datos"
echo "4-Comprimir"
read -n 1 -p "pulsa una opcion: " tecla

	case $tecla in 

	1) read -p "Escriba el nombre del archivo: " archivo
	   if [ "$archivo" != "$cnt" ]
	   then	 
	   ruta=$(find / -name $archivo)
	   echo $ruta
	   	if [ $archivo = $archivo ]
	   		then
	   		read -p "Quiere mas informacion del archivo Y o N: " confirma
	   		if [ $confirma = $yes ]	
	   			then
	   			file $ruta
	   			fi
	   		fi
       fi
       ;;

    2) read -p "Escriba el nombre de la carpeta: " carpeta
	   if [ "$carpeta" != "$cnt"]
	   then
	   ruta=$(find / -name $carpeta)
	   echo $ruta
	   if [ $carpeta  = $carpeta ]
	   		then
	   		read -p "Quiere mas informacion del archivo Y o N: " confirma
	   		if [ $confirma = $yes ]	
	   			then
	   			file $ruta
	   			fi
	   		fi
       fi
       ;;
    
    3) read -p "Escriba el nombre del archivo, destino y capacidad de los paquetes separados por (,): " dt-nombre dt-destino dt-capacidad dt-num_pkg
	   if [ "$dt-nombre" != "$cnt" ]
	   then
	   dd if=/$dt-nombre of=/$dt-destino bs=$dt-capacidad count=$dt-num_pkg
	   fi
       ;;

    4) read -p "1-Comprimir 
				2-Descomprimir
				3-Empaquetar"
	   case $tecla1 in
	   	1) read -p "Escriba el nombre del archivo: " archivo1
		   tar cvfz $archivo1
		;;
		2) read -p "Escriba el nombre del archivo: " archivo1
		   tar xvf $archivo1
		;;
		3) read -p "Escriba el nombre del archivo: " archivo1
		   tar cvf $archivo1
		;;
		esac
	esac 

;; #1





2 ) while [ $tecla -ne 2 ]
	   do
		echo "Menu usuario, grupos y permisos" #2
		echo "1-Listado de usuarios "
		echo "2-Comprueba permisos"
		echo "3-Modifica un usuarios"
		echo "4-Modifica permisos"
		read -p "pulsa una opcion: " tecla

	
case $tecla in 

	1) cut -d: -f1-3  "/etc/passwd"
	   read -p "Quiere modificar un usuario Y o N: " confirmacion
	  
	   if [ $confirmacion = $confirma ]
	    then

	   		while [ $tecla1 -ne 4 ]
	   			do
	   				
	   				echo "1) Crear"
	   				echo "2) Modificar permisos"
	   				echo "3) eliminar"
	   				echo "4) Exit"
	   				echo "recuerde separe con (,)"
	   				read -p "Eliga una opcion: " tecla1
	   		
	   				case $tecla1 in

	   					1) read -p "Escriba el nombre del nuevo usuario y en el grupo que pertenece: " user grupo
							useradd -g $grupo -d /home/$user -m -s /bin/bash $user
							passwd $user
							;;
						2) read -p "Escriba usuario y permisos: " usuario permiso
							chmod $permiso /home/$usuario 
							;;
						3) read -p "Escriba el usuario a eliminar" delete
							userdel -r $delete
							;;
					
					esac
			done 
		fi
	;;

	2) read -p "Escriba ruta y documento: " documento
		ls -lg $documento 
		;;
	3) read -p "Escriba el documento a eliminar y ruta: " documento
		rm -r $documento
		;;
    esac       
done
;;  #2
	

3 ) echo "Menu Mantenimiento" 
;;
esac
