#!/bin/bash
source /etc/profile

#### para valor vacio
if [ "$1" == "$NULL" ]; then echo  "### launch: $0 [ -null ] status|start|stop|restart|mount|umount  [ imagen-hd ] [ imagen.iso ] "; exit ; fi

#### para mandar al sunidero la salida
if [ "$1" == "-null" ]; then $0 $2 $3 $4 &> /dev/null ; exit ; else  first_option=$1 ; second_option=$2 ; third_option=$3; fi

##### variables a modificar ####
qemu_name="Qemu VM"
architecture="qemu-system-i386"
memory_ram="1500M"
processor_smp="4"

#### variables estaticas
if [ "$second_option"  == "$NULL" ] ; then qemu_vm="/qemu/debian-i386.qcow2" ; else qemu_vm=$second_option ; fi
if [ "$third_option"   == "$NULL" ] ; then qemu_cdrom="" ; else qemu_cdrom="-cdrom $third_option -boot menu=on"; fi
display_vnc=":0"
command_qemu="$(command -v $architecture)"
qemu_options="-m $memory_ram -machine type=pc,accel=kvm -k es -smp $processor_smp -rtc base=localtime -display vnc=$display_vnc"
qemu_full="$command_qemu $qemu_options $qemu_vm $qemu_cdrom"

##### #### status|stop|start|restart

##### whith probe
if [ "$first_option" == "probe" ]
then echo $qemu_full
echo " [ ok ] [ probe ]"
exit; fi

##### with status
if [ "$first_option" == "status" ]
then ps -Af | grep -i  "$architecture"
echo " [  ok  ] [ status ] [ $architecture listed ]"
exit; fi

##### with stop
if [ "$first_option" == "stop" ]
then killall -9 "$architecture"
echo " [ ok ] [ stopped ] [ La maquina virtual detenida: $qemu_name ]"
exit; fi

##### with start
if [ "$first_option" == "start" ]
then
$qemu_full &
echo " [ ok ] [ started ] [ La maquina virtual iniciada: $qemu_name ]"
exit; fi

##### with restart
if [ "$first_option" == "restart" ] ; then
$0 stop  &> /dev/null
$0 start $2 $3 &> /dev/null
echo " [ ok ] [ restarted ] [ La maquina virtual reiniciada ] [ $qemu_name ]"
exit; fi

#### #### mount:
#### secuencia de montaje de nbd
if [ "$first_option" == "mount" ] && [  -f "$second_option" ]; then

#### carga el modulo del kernel
modprobe nbd max_part=8

#### conecta un disco
qemu-nbd --connect=/dev/nbd0 $second_option

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
if [ "$first_option" = "umount" ]; then
umount $HOME/mnt/nbd0p* &> /dev/null
qemu-nbd --disconnect /dev/nbd0 &> /dev/null
echo "Ok. Umounted $HOME/mnt/nbd0p*"
exit; fi

#### otros parametros
$0

##### end script
exit
