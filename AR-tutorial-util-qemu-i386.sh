#!/bin/bash
source /etc/profile

if [ "$1" == "$NULL" ]; then echo "### Another qemu machine i386 for vnc, Needed root for mount|umount ";
echo  "### launch: $0 status|start|stop|restart|mount|umount  imagen-hd [ imagen.iso ]"; exit ; fi

##### variables
qemu_locker="/tmp/mi-qemu-locker"
qemu_name="linux debian"
qemu_vm="-hda $2"
if [ "$3"  == "$NULL" ]; then qemu_cdrom="" ; else qemu_cdrom="-cdrom $3 -boot d"; fi
qemu_user=""
qemu_exec="/usr/bin/qemu-system-i386"
qemu_options="-m 2G -machine type=pc,accel=kvm -k es -smp 4 -rtc base=localtime -display vnc=0.0.0.0:0"
qemu_command="$qemu_user $qemu_exec $qemu_options $qemu_cdrom $qemu_vm"

##### #### status|stop|start|restart

##### with status
if [ "$1" = "status" ] && [ -f "$qemu_locker" ]; then
echo "[ status ] [ running ] [ La maquina virtual esta corriendo: $qemu_name  ]"
ps -af | grep -i qemu 
exit; fi

if [ "$1" = "status" ] && [ ! -f "$qemu_locker" ]; then
echo "[ status ] [ stopped ] [ La maquina virtual esta detenida: $qemu_name ]"
ps -af | grep -i qemu 
exit; fi

##### with stop
if [ "$1" = "stop" ]; then
rm $qemu_locker &> /dev/null
killall -9 qemu-system-i386 &> /dev/null
echo "[ ok ] [ stopped ] [ La maquina virtual detenida: $qemu_name ]"
exit; fi

##### with start
if [ "$1" = "start" ] ; then $0 stop &> /dev/null
touch $qemu_locker &> /dev/null
$qemu_command &
echo "[ ok ] [ started ] [ La maquina virtual iniciada: $qemu_name ]"
exit; fi

##### with restart
if [ "$1" = "restart" ] ; then $0 stop &> /dev/null
$0 stop
$0 start
exit; fi

#### #### mount:
#### secuencia de montaje de nbd
if [ "$1" = "mount" ] && [  -f "$2" ]; then

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

##### end script
exit
