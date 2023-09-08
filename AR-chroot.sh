#!/bin/bash
source /etc/profile
command_chroot="$(command -v chroot)"
command_mount="$(command -v mount)"
id_num="$(id -u)"
directory="$2"
program="$3"
if [ "$id_num" != "0" ]; then echo "To run chroot, have to be root" ; exit; fi
if [ "$directory" == "$NULL"  ]; then directory="$(pwd)"; fi
####
case "$1" in
"complete")
echo "mounting all resources and giving chroot"
$command_mount -o bind /proc $directory/proc
$command_mount -o bind /sys $directory/sys
$command_mount -o bind /dev $directory/dev
$command_mount -o bind /dev/pts $directory/dev/pts
$command_mount -o bind /run $directory/run
$command_chroot $directory
source /etc/profile
;;
"umount")
echo "umounting all resources"
for a  in 1 2 3 4 5 6; do
umount $directory/proc/ &> /dev/null
umount $directory/sys/  &> /dev/null
umount $directory/dev/  &> /dev/null
umount $directory/dev/pts/ &> /dev/null
umount $directory/run/ &> /dev/null
done
echo "ok. umounted all resources"
;;
"minimal")
echo "giving chroot"
$command_chroot $directory
;;
"program")
echo "Run program: $program from chroot: $directory"
$command_chroot $directory $program
;;
"mount")
echo "mouting all resources"
$command_mount -o bind /proc $directory/proc
$command_mount -o bind /sys $directory/sys
$command_mount -o bind /dev $directory/dev
$command_mount -o bind /dev/pts $directory/dev/pts
$command_mount -o bind /run $directory/run
echo "ok. mounted all resources"
;;
*)
echo " Run chroot with:     $0 mount,umount,minimal,complete [ directory ]"
echo " $0 mount:            mount chroot directories  [ directory ]"
echo " $0 umount:           umount chroot directories [ directory ]"
echo " $0 minimal:          do only chroot [ directory ]"
echo " $0 program:          run program from chroot directory [ directory ] [ program ]"
echo " $0 complete:         do both: mount and chroot [ directory ]"
;;
esac
exit
