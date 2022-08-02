#!/bin/bash
if [ "$1" != "$NULL" ] && [ -f  $1 ] ; then echo "obteniendo deb de un fwiptables.."
else echo "launch $0 file-location-of-fwiptables" ; exit ; fi
programa="$1"
version="$( cat $1  | grep -i fversion= | cut -d "\"" -f 2 )"
ruta="/tmp/deb-fwiptables"
#### crea la estructura de directorios
mkdir -p $ruta/usr/bin
mkdir -p $ruta/DEBIAN
cp $1 $ruta/usr/bin/fwiptables-cmd
#### crea el archivo control
echo "Package: fwiptables" &> $ruta/DEBIAN/control
echo "Priority: optional" &>> $ruta/DEBIAN/control
echo "Section: misc" &>> $ruta/DEBIAN/control
echo "Maintainer: f-iptables" &>> $ruta/DEBIAN/control
echo "Architecture: all" &>> $ruta/DEBIAN/control
echo "Version: $version" &>> $ruta/DEBIAN/control
echo "Depends: " &>> $ruta/DEBIAN/control
echo "Description:  Fran FireWall fwiptables Generator." &>> $ruta/DEBIAN/control
echo " One simple FRONT-END for iptables linux, which COMMAND-LINE with CLI-MENU with GUI-MENU and with GUI-SHELL." &>> $ruta/DEBIAN/control
#### empaqueta el archivo
chown root:root $ruta -R
echo "file write in /tmp/$programa.deb"
rm /tmp/$programa.deb &> /dev/null
$(which dpkg) -b $ruta /tmp/$programa.deb
rm $ruta -R
exit
