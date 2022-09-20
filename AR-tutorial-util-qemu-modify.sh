#!/bin/bash
source /etc/profile

#### para valor vacio
if [ "$1" == "$NULL" ]; then echo  "### launch: $0 status|start|stop|restart|mount|umount  imagen-hd [ imagen.iso ]"; exit ; fi

##### variables a modificar
qemu_name="Qemu VM linux debian"
architecture="qemu-system-i386"
qemu_vm="/qemu/debian-testing-i386.qcow2"
qemu_cdrom="$NULL"

#### variables estaticas
if [ "$qemu_cdrom"  == "$NULL" ]; then qemu_cdrom="" ; else qemu_cdrom="-cdrom $qemu_cdrom -boot d"; fi
command_qemu="$(command -v $architecture)"
qemu_options="-m 2G -machine type=pc,accel=kvm -k es -smp 4 -rtc base=localtime -display vnc=0.0.0.0:0"
qemu_full="$command_qemu $qemu_options $qemu_vm $qemu_cdrom"

##### #### status|stop|start|restart

##### with status
if [ "$1" == "status" ]
then ps -Af | grep -i  "$architecture"
echo " [  ok  ] [ status ] [ $architecture listed ]"
exit; fi

##### with stop
if [ "$1" == "stop" ]
then killall -9 "$architecture"
echo " [ ok ] [ stopped ] [ La maquina virtual detenida: $qemu_name ]"
exit; fi

##### with start
if [ "$1" == "start" ]
then
$qemu_full &
echo " [ ok ] [ started ] [ La maquina virtual iniciada: $qemu_name ]"
exit; fi

##### with restart
if [ "$1" == "restart" ] ; then
$0 stop
$0 start
echo " [ ok ] [ restarted ] [ La maquina virtual reiniciada ] [ $qemu_name ]"
exit; fi

#### #### mount:
#### secuencia de montaje de nbd
if [ "$1" == "mount" ] && [  -f "$2" ]; then

#### carga el modulo del kernel
modprobe nbd max_part=8

#### conecta un disco
qemu-nbd --connect=/dev/nbd0 $2

#### lista las particiones
fdisk /dev/nbd0 -l

#### monta la imagen de qemu
mkdir -p $HOME/mnt/nbd0p1 &> /dev/null
MKDIR -P $HOME/mnt/nbd0p2 &> /dev/null
umount $HOME/mnt/nbd0p* &> /dev/null
mount /dev/nbd0p1 $HOME/mnt/nbd0p1/ &> /dev/null
mount /dev/nbd0p2 $HOME/mnt/nbd0p2/ &> /dev/null
echo "OK. qemu image mounted in $HOME/mnt/nbd0p1 and nbd0p2"
exit; fi

#### #### umount:
#### desmonta y desconecta la imagen de qemu
if [ "$1" = "umount" ]; then
umount $HOME/mnt/nbd0p* &> /dev/null
qemu-nbd --disconnect /dev/nbd0 &> /dev/null
echo "Ok. Umounted $HOME/mnt/nbd0p*"
exit; fi

#### otros parametros
$0

##### end script
exit
