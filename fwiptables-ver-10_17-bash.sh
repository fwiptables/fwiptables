#!/bin/bash
#### #### #### #### for shell bash:
#### #### #### #### #!/bin/bash
####
#### #### #### #### for shell zsh:
#### #### #### #### #!/bin/zsh
#### #### #### #### emulate -L bash
####
#### File:        fwiptables-cmd
#### Description: Command Fran FireWall fwiptables Generator
#### Author:      Francisco Garcia <fwiptables@gmx.com>
#### Copyright:   (c) 2020-2023 Francisco Garcia <fwiptables@gmx.com>
####
#### This program is free software; you can redistribute it and/or modify
#### it under the terms of the GNU General Public License as published by
#### the Free Software Foundation; either version 2 of the License, or
#### (at your option) any later version.
####
#### This program is distributed in the hope that it will be useful,
#### but WITHOUT ANY WARRANTY; without even the implied warranty of
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#### GNU General Public License for more details.
####
#### You should have received a copy of the GNU General Public License along
#### with this program; if not, write to the Free Software Foundation, Inc.,
#### 51 Franklin St, Fifth Floor, Boston MA 02110-1301 USA
####
####
####                 ## fwiptables license in source program
####   English: This program has gpl license GPL v2, this program is copyleft, it is free.
####   Spanish: Este programa tiene licencia GPL v2, este programa es copyleft, esto es libre.
####
####
####                 ## fwiptables comments in source program
####   English: The comments are in english language and spanish language
####   Spanish: Los comentarios estan en idioma ingles y en idioma español
####
####
####                 ## Report bugs and Sum ideas
####   Email: fwiptables@gmx.com
####
####
#####################################################################################
#####################################################################################
####
####
####     #### english: stablished the path        #### spanish: establece el path
####
####
source /etc/profile
PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
####
####
##########    english: are you root: uid 0 ?                ##########
##########    spanish: eres admnistrador: identificador 0 ? ##########
#### :rutina-inicial-admin:
####
####
if [ "$(id -u)" != "0" ] ; then echo
echo
echo "### [ info ] [ fwiptables needs to be root to work ]"
echo "### [ fail ] [ Be root to work with fwiptables in your system ] [ Try with root user ]"
echo
exit ; fi
####
####
#### :rutina-final-admin:
##########    english: iptables support         ##########
##########    spanish: iptables soporte         ##########
#### :rutina-inicial-support-iptables:
####
####
command_iptables_legacy="$(command -v iptables-legacy)"
command_iptables_nft="$(command -v iptables-nft)"
####
####
if [ "$command_iptables_legacy" == "$NULL" ] || [ "$command_iptables_nft" == "$NULL" ] ; then echo
echo
echo "### [ info ] [ fwiptables needs iptables legacy and needs iptables nft to work ]"
echo "### [ fail ] [ it needs as necesary iptables to works with fwiptables in your system operative linux ]"
echo
fi
####
####
#### :rutina-final-support-iptables:
##########     english name, description and version    ##########
##########     spanish: nombre, descripcion y version   ##########
#### :rutina-inicial-enviroment:
####
####
cmd_binary="$0"             ;
cmd_file="$(basename $0)"   ;
cmd_config="fwiptables-cmd" ;
cmd_version="cmd-10-17"     ;
cmd_name="fwiptables, FireWall With iptables"               ;
cmd_description="fwiptables, One Mini Script in one-file"   ;
cmd_license="GPL v2, License General Public version 2"      ;
####
#### set directory installed
####
directory_installed="/usr/bin"
####
#### prepare directory data
####
PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
if [ "$HOME" == "$NULL" ] ; then default_root_home="/root"; else default_root_home="$HOME"; fi
####
#### set directory data
####
directory_data="$default_root_home/.config/$cmd_config"
####
#### web homepage oficial
####
web_homepage_sourceforge="https://sourceforge.net/projects/f-iptables/" ;
web_homepage_github="https://github.com/fwiptables/fwiptables" ;
web_hompage_devuan="https://git.devuan.org/fwiptables/fwiptables" ;
####
#### web homepage download
####
web_download_sourceforge="https://sourceforge.net/projects/f-iptables/files/latest/download" ;
web_download_github="https://github.com/fwiptables/fwiptables/releases" ;
web_download_devuan="https://git.devuan.org/fwiptables/fwiptables/releases" ;
####
####
#### :rutina-final-enviroment:
##########    english: options priority        ##########
##########    spanish: prioridad de opciones   ##########
#### :rutina-inicial-order-options:
####
####
command_sed="$(command -v sed)"
#### #### english: option for default    #### spanish: opcion por defecto
zero_dir="$(pwd)" ;
#### #### english: option for default    #### spanish: opcion por defecto
zero_option="$cmd_binary" ;
#### #### english: variables to launch   #### spanish: variables a lanzar
first_option="$(echo $1 | $command_sed s/\\///g -)"  ;                       
#### #### english: variable without "/"  #### spanish: variable sin "/"
second_option="$(echo $2 | $command_sed s/\\///g -)" ;                       
#### #### english: variable without "/"  #### spanish: variable sin "/"
third_option="$(echo $3 | $command_sed s/\\///g -)"  ;                       
#### #### english: variable without "/"  #### spanish: variable sin "/"
quarter_option="$(echo $4 | $command_sed s/\\///g -)"  ;
####
####
##########   english: profile y support X11       ##########
##########   spanish: profile y soporte de X11    ##########
#### :rutina-inicial-x11-or-wayland:
####
####
X11_OR_WAYLAND="$XDG_SESSION_TYPE"
####
####
#### Support wayland to root
#### english: add auth xhost for root for graphicall use 
#### spanish: añade autorización xhost para root para uso grafico
####
####
#### WAYLAND_DISPLAY=":0"
XDG_RUNTIME_DIR="/run/user/0"
####
####
#### Support x11 to root
#### english: add auth xhost for root for graphicall use 
#### spanish: añade autorización xhost para root para uso grafico
####
####
command_xhost="$(command -v xhost)" ; 
if [ "$(logname)" != "$NULL" ]; then 
sudo -u "$(logname)" $command_xhost +SI:localuser:root &> /dev/null
$command_xhost +SI:localuser:root &> /dev/null ; fi
####
####
#### deprecated
## sudo -u "$(logname)" $command_xhost +SI:localuser:root &> /dev/null
## sudo -u "$(logname)" command_xhost +root@127.0.0.1 &> /dev/null
## sudo -u "$(logname)" command_xhost +INET:root@127.0.0.1 &> /dev/null
## sudo -u "$(logname)" command_xhost +INET6:root@127.0.0.1 &> /dev/null
## sudo -u "$(logname)" command_xhost +DNET:root@127.0.0.1 &> /dev/null
## sudo -u "$(logname)" command_xhost +KRB:root@127.0.0.1 &> /dev/null
## sudo -u "$(logname)" command_xhost +NIS:root@127.0.0.1 &> /dev/null
####
####
#### :rutina-final-x11-or-wayland:
##########  english: config-ariables: variables to declare     ##########
##########  spanish: config-variables: variables para declarar  ##########
#### :rutina-inicial-config-variables:
####
####
list_rules_conceptual=""   ; 
config_ip4_localhost="127.0.0.1"    ;
config_ip6_localhost="::1"    ;
client_port_tcp="ssh,http,https"     ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     ;
server_port_tcp=""     ;
server_port_udp=""     ;
logserver_prefix_input="fwlog-input::"     ; 
logserver_prefix_output="fwlog-output::"     ;
logserver_port_tcp="no"     ;
logserver_port_udp="no"     ;
time_server_waiting="9s"    ;
allow_dmz_ip4="no"    ; 
allow_dmz_ip6="no"    ;
allow_forward_ip4="no"    ; 
allow_forward_ip6="no"    ; 
allow_gateway_ip4="no"    ;
allow_gateway_ip6="no"    ;
allow_input_all="no"    ;
allow_input_bandwidth="no"    ;
allow_input_maxconnect="no"    ;
allow_input_ping="no"     ;
allow_input_state="no"    ;
allow_shield_maxtries="no"    ;
allow_mac_blacklist="no"    ; 
allow_mac_whitelist="no"    ;
allow_net_blacklist="no"    ;
allow_net_whitelist="no"     ; 
allow_others_protocols="no"     ;
allow_output_all="no"     ; 
allow_output_bandwidth="no"     ;
allow_output_gid="no"     ;
allow_output_maxconnect="no"     ;
allow_output_ping="no"     ;
allow_output_state="no"     ;
allow_output_uid="no"     ; 
config_dmz_ip4=""     ;
config_dmz_ip6=""     ;
config_input_bandwidth="12512"     ; 
config_input_maxconnect="72"     ; 
config_input_state="new,related,established"     ;
config_shield_maxtries="12"     ;
config_mac_blacklist=""     ;
config_mac_whitelist=""     ;
config_net_blacklist="yandex.com,baidu.com,google.com"     ;
config_net_whitelist="deb.debian.org"     ; 
config_others_protocols="icmp,igmp"     ;
config_output_bandwidth="512"     ;
config_output_gid="root"     ;
config_output_maxconnect="72"     ;
config_output_state="new,related,established"     ;
config_output_uid="root"     ;
net_ipv4_client="0/0"     ; 
net_ipv4_server="0/0"     ;
net_ipv6_client="::/0"     ;
net_ipv6_server="::/0"     ;
####
####
#### :rutina-final-config-variables:
##########   english: search programs: programs path           ##########
##########   spanish: busca los programas: ruta de programas   ##########
#### :rutina-inicial-command:
####
####
command_editor="$(command -v editor)"   #list-commands ;
command_vi="$(command -v vi)"   #list-commands ;
command_vim="$(command -v vim)"   #list-commands ;
command_pico="$(command -v pico)"   #list-commands ;
command_nano="$(command -v nano)"   #list-commands ;
command_arp="$(command -v arp)"   #list-commands ;
command_arp_scan="$(command -v arp-scan)"   #list-commands ;
command_arptables="$(command -v arptables)"   #list-commands ;
command_bash="$(command -v bash)"   #list-commands ;
command_bc="$(command -v bc)"   #list-commands ;
command_obash="$(command -v obash)" #list-commands ;
command_curl="$(command -v curl)"   #list-commands ;
command_cut="$(command -v cut)"   #list-commands ;
command_date="$(command -v date)"   #list-commands ;
command_dd="$(command -v dd)"   #list-commands ;
command_dhclient="$(command -v dhclient)"   #list-commands ;
command_dhclient_script="$(command -v dhclient-script)"   #list-commands ;
command_dhcpcd="$(command -v dhcpcd)"   #list-commands ;
command_dialog="$(command -v dialog)"   #list-commands ;
command_whiptail="$(command -v whiptail)"   #list-commands ;
command_dig="$(command -v dig)"   #list-commands ;
command_ebtables="$(command -v ebtables)"   #list-commands ;
command_elinks="$(command -v elinks)"   #list-commands ;
command_find="$(command -v find)"   #list-commands ;
command_fmt="$(command -v fmt)"   #list-commands ;
command_geoiplookup="$(command -v geoiplookup)"   #list-commands ;
command_glxgears="$(command -v glxgears)"   #list-commands ;
command_gpg="$(command -v gpg)"   #list-commands ;
command_grep="$(command -v grep)"   #list-commands ;
command_egrep="$(command -v egrep)"   #list-commands ;
command_halt="$(command -v halt)"   #list-commands ;
command_host="$(command -v host)"   #list-commands ;
command_ifconfig="$(command -v ifconfig)"   #list-commands ;
command_ip="$(command -v ip)"   #list-commands ;
command_ip6tables_legacy="$(command -v ip6tables-legacy)"   #list-commands ;
command_ip6tables_nft="$(command -v ip6tables-nft)"   #list-commands ;
command_iperf="$(command -v iperf)"   #list-commands ;
command_iptables_legacy="$(command -v iptables-legacy)"   #list-commands ;
command_iptables_nft="$(command -v iptables-nft)"   #list-commands ;
command_iw="$(command -v iw)"   #list-commands ;
command_links="$(command -v links)"   #list-commands ;
command_links2="$(command -v links2)"   #list-commands ;
command_ls="$(command -v ls)"   #list-commands ;
command_lsof="$(command -v lsof)"   #list-commands ;
command_lynx="$(command -v lynx)"   #list-commands ;
command_m2r="$(command -v m2r)"   #list-commands ;
command_md5sum="$(command -v md5sum)"   #list-commands ;
command_mdp="$(command -v mdp)"   #list-commands ;
command_mpg123="$(command -v mpg123)"   #list-commands ;
command_mpg321="$(command -v mpg321)"   #list-commands ;
command_netstat="$(command -v netstat)"   #list-commands ;
command_netstat_nat="$(command -v netstat-nat)"   #list-commands ;
command_nmap="$(command -v nmap)"   #list-commands ;
command_ntpdate="$(command -v ntpdate)"   #list-commands ;
command_openssl="$(command -v openssl)"   #list-commands ;
command_ping="$(command -v ping)"   #list-commands ;
command_rdate="$(command -v rdate)"   #list-commands ;
command_reboot="$(command -v reboot)"   #list-commands ;
command_resolveip="$(command -v resolveip)"   #list-commands ;
command_route="$(command -v route)"   #list-commands ;
command_sed="$(command -v sed)"   #list-commands ;
command_shc="$(command -v shc)"   #list-commands ;
command_shutdown="$(command -v shutdown)"   #list-commands ;
command_sleep="$(command -v sleep)"   #list-commands ;
command_sntp="$(command -v sntp) -S"   #list-commands ;
command_ss="$(command -v ss)"   #list-commands ;
command_sysctl="$(command -v sysctl)"   #list-commands ;
command_tcpdump="$(command -v tcpdump)"   #list-commands ;
command_tee="$(command -v tee)"   #list-commands ;
command_timeout="$(command -v timeout)"   #list-commands ;
command_torify="$(command -v torify)"   #list-commands ;
command_traceroute="$(command -v traceroute)"   #list-commands ;
command_txt2html="$(command -v txt2html)"   #list-commands ;
command_uname="$(command -v uname)"   #list-commands ;
command_wget="$(command -v wget)"   #list-commands ;
command_wpa_passphrase="$(command -v wpa_passphrase)"   #list-commands ;
command_wpa_supplicant="$(command -v wpa_supplicant)"   #list-commands ;
command_xrandr="$(command -v xrandr)"   #list-commands ;
command_zenity="$(command -v zenity)"   #list-commands ;
command_yad="$(command -v yad)"   #list-commands ;
command_zgrep="$(command -v zgrep)"   #list-commands ;
command_logname="$(command -v logname)" #list-commands ;
command_lpinfo="$(command -v lpinfo)"   #list-commands ;
command_lpstat="$(command -v lpstat)"   #list-commands ;
command_lsblk="$(command -v lsblk)"   #list-commands ;
command_lsusb="$(command -v lsusb)"   #list-commands ;
command_lscpu="$(command -v lscpu)"   #list-commands ;
command_lspci="$(command -v lspci)"   #list-commands ;
command_lsgpu="$(command -v lsgpu)"   #list-commands ;
command_lshw="$(command -v lshw)"   #list-commands ;
####
####
#### :rutina-final-command:
##########  english: permanent files: files and folders from fwiptables          ##########
##########  spanish: archivos permanentes: archivos y carpetas desde fwiptables  ##########
#### :rutina-inicial-files:
####
####
#### english: permanent directory:   permanent directory and path directory config files
#### spanish: directorio permanente: directorios permanentes y ruta de directorios de los archivos de configuracion
####
####
#### english: directory tree 
#### spanish: arbol de directorio
####
####
directory_fwrecover="$directory_data/fwiptables-fwrecover"
directory_default="$directory_data/fwiptables-default"
directory_config="$directory_data/fwiptables-config"
directory_log="$directory_data/fwiptables-log"
directory_shell="$directory_data/fwiptables-shell"
####
####
#### english: templates cfg
#### spanish: plantillas cfg
####
####
defaultcfg="$directory_config/default-full-english.cfg"             
defaultfullcfg_eng="$directory_config/default-full-english.cfg"     
defaultfullcfg_spa="$directory_config/default-full-spanish.cfg"     
defaultminicfg_eng="$directory_config/default-mini-english.cfg"     
defaultminicfg_spa="$directory_config/default-mini-spanish.cfg"
####
####
#### english: default config to shell
#### spanish: default config to shell
####
####
default_preferences="$directory_shell/default_preferences"
####
####
#### english: file log:     log files and path files config files
#### spanish: archivos log: archivos log y ruta de los archivos de configuracion
####
####
default_filelog="$directory_log/default_filelog"
default_autolog="$directory_log/default_autolog"
####
####
##########    english: temporal files
##########    spanish: archivos temporales
####
####
#### english: temporal directory probe if /run/fwiptables else /root/.cache/fwiptables
#### spanish: directorio temporal
####
####
if [ -d "/run" ]; then mkdir /run/fwiptables &> /dev/null ; directory_cache="/run/fwiptables"; fi
if [ ! -d "/run" ]; then directory_cache="$default_root_home/.cache/fwiptables" ; fi
####
####
#### 
####
####
directory_temporal="$directory_cache"
####
####
#### english: temporal files
#### spanish: archivos temporales
####
####
temporal_text="$directory_temporal/$first_option-$second_option-$third_option"
temporal_textfinal="$directory_temporal/$first_option-$second_option-$third_option-textfinal"
temporal_gui="$directory_temporal/$first_option-$second_option-$third_option"
temporal_guifinal="$directory_temporal/$first_option-$second_option-$third_option-guifinal"
output_log="$directory_temporal/$first_option-$second_option-$third_option"
output_logfinal="$directory_temporal/$first_option-$second_option-$third_option-logfinal"
####
####
#### :rutina-final-files:
##########   english: if sane config directory                       ##########
##########   spanish: comprobar sanos directorios de configuracion   ##########
#### :rutina-inicial-dir-sane:
####
####
command_mkdir="$(command -v mkdir)"
####
####
if [ ! -d "$directory_temporal" ]; then $command_mkdir -p $directory_temporal &> /dev/null ; fi
if [ ! -d "$directory_data" ]; then $command_mkdir -p $directory_data &> /dev/null ; fi
if [ ! -d "$directory_temporal" ]; then $command_mkdir -p $directory_temporal &> /dev/null ; fi
if [ ! -d "$directory_config" ]; then $command_mkdir -p "$directory_config" &> /dev/null ; fi
if [ ! -d "$directory_fwrecover" ]; then $command_mkdir -p "$directory_fwrecover" &> /dev/null ; fi
if [ ! -d "$directory_default" ]; then $command_mkdir -p "$directory_default" &> /dev/null ; fi
if [ ! -d "$directory_log" ]; then $command_mkdir -p "$directory_log" &> /dev/null ; fi
if [ ! -d "$directory_shell" ]; then $command_mkdir -p "$directory_shell" &> /dev/null ; fi
####
####
#### :rutina-final-dir-sane:
##########   english: the basic system variables         ##########
##########   spanish: las variables basicas del sistema  ##########
#### :rutina-inicial-system-variables:
####
####
#### english: when there is not first_option #### choose "list_options" or "clasic_options"      
#### spanish: cuando no hay first_option #### choose "list_options" or "clasic_options"         
####
####
without_first_option=       ## fwiptables-file-default ## when there is not one first_option
####
####
####       #### english: for all predefined system firewall: EXCEPT custom, and wizards, and load
####       #### spanish: para todos los cortafuegos predefinidos del sistema: EXCEPTO custom, y wizards, y load
allow_use_legacy=""                       ## fwiptables-file-default ## void or no
allow_use_nft="no"                        ## fwiptables-file-default ## void or no
allow_use_ipv4=""                         ## fwiptables-file-default ## void or no
allow_use_ipv6=""                         ## fwiptables-file-default ## void or no
####       #### english: separate all rules: separate all rules, void or no
####       #### spanish: separar todas las reglas: separar todas las reglas, vacio o no
allow_separate_rules=""                   ## fwiptables-file-default ## void or no
####       #### english: ssh shield configured to works with ports choose ports tcp
####       #### spanish: ssh escudo configurado para funcionar con elegidos puertos tcp
config_shield_port="22"                   ## fwiptables-file-default ##  void o ports
####       #### english: ssh tries per ip before shield per hour
####       #### spanish: intentos ssh por ip antes del escudo por hora
config_shield_maxtries="10"               ## fwiptables-file-default ## void or no
####       #### english: close with deny is or DROP or REJECT
####       #### spanish: cierra con denegacion es o DROP or REJECT
config_close_deny="DROP"                  ## fwiptables-file-default ## DROP or REJECT
####       #### english: auto log from command input
####       #### spanish: automatico log de linea introducida
allow_save_autolog=""                     ## fwiptables-file-default ## void or no
####       #### english: show date and show time
####       #### spanish: muestra la fecha y el tiempo
allow_show_time="no"                      ## fwiptables-file-default ## void or no
####       #### english: void for automatic command #### spanish: vacio para comando automatico
#### favorite_text_editor        ... for example nano
favorite_text_editor=""                    ## fwiptables-file-default ## or void for automatic or specify command
#### favorite_text_dialog        .... or dialog or whiptail
favorite_text_dialog=""                    ## fwiptables-file-default ## or void for automatic or specify command
#### favorite_graphicall_dialog  zenity
favorite_graphicall_dialog=""               ## fwiptables-file-default ## or void for automatic or specify command
#### favorite_text_brwoser       ... for example elinks
favorite_text_browser=""                    ## fwiptables-file-default ## or void for automatic or specify command
#### favorite_date_command       ... for example ntpdate
favorite_date_command=""                    ## fwiptables-file-default ## or void for automatic or specify command
####       #### english: curl server for default for test the public ip
####       #### spanish: servidor de curl por defecto para testear la ip publica    
serverip_discover_ipv4="https://ifconfig.co/ip"        ## fwiptables-file-default ## default http://ifconfig.co/ip
serverip_discover_ipv6="https://ifconfig.co/ip"        ## fwiptables-file-default ## default http://ifconfig.co/ip
####       #### english: iperf server for default for test net SPEED                 
####       #### spanish: servidor de iperf por defecto para testear VELOCIDAD de internet    
serverip_iperf_ipv4="ping.online.net"                 ## fwiptables-file-default ## default ping.online.net
serverport_iperf_ipv4="5001"                          ## fwiptables-file-default ## default 5201
serverip_iperf_ipv6="ping6.online.net"                ## fwiptables-file-default ## default ping.online.net
serverport_iperf_ipv6="5001"                          ## fwiptables-file-default ## default 5201
#### #### english: look  #### spanish: apariencia
graphic_window_dimension="--width=950 --height=650"   ## fwiptables-file-default ## default: "--width=950 --height=650"
#### #### english: look  #### spanish: apariencia
quad="####" ; 
cinco="#####" ;
tab="     " ;
title_md="### " ;
text_md="  " ;
brake_md="---" ;
tabz="### _ _ _ _ _ _ _ " ;
cincuenta="##################################################" ;
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
head_waiting_txt="$title_md [ info ] [ txt ] [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_cli="$title_md [ info ] [ cli ] [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_gui="$title_md [ info ] [ gui ] [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_log="$title_md [ info ] [ log ] [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_web="$title_md [ info ] [ web ] [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_help="$title_md [ info ] [ help: help in rst txt format ]   [ press control-c to cancel ] "
head_waiting_info="$title_md [ info ] [ info: info in clear txt format ] [ press control-c to cancel ] "
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
head_autolog="[ $cmd_binary ] [ $cmd_version ] [ $(date) ] [ $first_option $second_option $third_option ]"
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
give_cover="$title_md #[ $cmd_config $cmd_version ] [ $X11_OR_WAYLAND ] [ Options: $cmd_file options ]"
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
#### give_fail="### #[ fail ] | First Option: $first_option | Choose one valid first option |"
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
give_load="$title_md [ _ok_ ] [ Load firewall ] [ Firewall With iptables ]"
#### #### english: [characters to show] #### spanish: [caracteres a mostrar]
give_preferences="$title_md [ Configure ] [ $cmd_binary preferences-modify ]"
#### #### english: echo void            #### spanish: impresion vacia
nada="echo -n" ; 
#### #### english: echo void            #### spanish: impresion vacia
nada="$(echo -n)" ; 
#### #### info list rules
message_info_rules="$title_md [ Configure ] [ $cmd_binary preferences-modify ]"
#### #### english: without cli or gui   #### spanish: sin cli o gui
message_without_cli="$title_md [ fail ] [ cli ] [ Without support for output cli for this option ]"
message_without_gui="$title_md [ fail ] [ gui ] [ Without support for output gui for this option ]"
message_without_web="$title_md [ fail ] [ web ] [ Without support for output web for this option ]"
message_without_help="$title_md [ fail ] [ help in rst ] [ Without support for output rst for this option ]"
message_without_info="$title_md [ fail ] [ info in txt ] [ Without support for output info for this option ]"
message_without_info="$title_md [ fail ] [ log ] [ Without support for output log for this option ]"
message_without_info="$title_md [ fail ] [ null ] [ Without support for output null for this option ]"
####       #### english: close from graphicall with timeout in seconds #####
####       #### spanish: cierre desde graficos con retardo en segundos #####
time_close_graphicall="1"
####       #### english: message to close graphicall with timeout in seconds #####
####       #### spanish: mensage de cierre para graficos con retardo en segundos #####
mensage_with_timeout="Closing gui menu in $time_close_graphicall seconds"
####       #### english: autovariables        #### spanish: autovariables
launch_rules_firewall="no" ;   #  autoconfigure with launch iptables rules
####       #### english: [download web link]  #### spanish: [descarga del enlace web]
mensage_license_gpl="https://sourceforge.net/p/f-iptables/code/ci/master/tree/LICENSE.txt?format=raw"
####
####
#### :rutina-final-system-variables:
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-update-variables:
####
####
####     #### english: launch default for update variables
####     #### spanish: lanza default para actualizar variables
####
####
####
####
if [ -f "$default_preferences"   ]; then source $default_preferences ; fi
if [ "$first_option" = "$NULL" ]; then first_option="$without_first_option"; fi
####
####
####  realice sane very important variables post by default_preferences
####
####
case "$allow_use_legacy"          in "no") ;; *) allow_use_legacy=""    ;; esac
case "$allow_use_nft"             in "no") ;; *) allow_use_nft=""       ;; esac
case "$allow_use_ipv4"            in "no") ;; *) allow_use_ipv4=""      ;; esac
case "$allow_use_ipv6"            in "no") ;; *) allow_use_ipv6=""      ;; esac
case "$config_close_deny"      in
"ACCEPT") ;;
"DROP")   ;;
"REJECT") ;;
"RETURN") ;;
"LOG")    ;;
*) config_close_deny="REJECT"  ;; esac
####
####
#### :rutina-final-update-variables:
##########      english: search favorite date: favorite date command        ##########
##########      spanish: busca preferida fecha: favorita comando de fecha   ##########
#### :rutina-inicial-favorite-date-command:
####
####
if [ "$favorite_date_command" == "$NULL" ]; then
if [ "$command_rdate"   != "$NULL" ]; then  favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then  favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then  favorite_date_command="$command_ntpdate"         ; fi
fi
####
####
#### :rutina-final-favorite-date-command:
##########      english: search favorite text editor: favorite editor text     ##########
##########      spanish: busca preferido editor: favorite editor de texto     ##########
#### :rutina-inicial-favorite-text-editor:
####
####
if [ "$favorite_text_editor" == "$NULL" ]; then
if [ "$command_vi"  != "$NULL" ]  ; then    favorite_text_editor="$command_vi"      ; fi
if [ "$command_vim"  != "$NULL" ]  ; then   favorite_text_editor="$command_vim"     ; fi
if [ "$command_nano"  != "$NULL" ] ; then   favorite_text_editor="$command_nano"    ; fi
if [ "$command_pico" != "$NULL" ] ; then  favorite_text_editor="$command_pico"      ; fi
if [ "$command_editor" != "$NULL" ] ; then  favorite_text_editor="$command_editor"  ; fi
fi
####
####
#### :rutina-final-favorite-text-editor:
##########      english: search favorite text dialog: favorite text dialog     ##########
##########      spanish: busca preferido text dialogo: favorite text dialog    ##########
#### :rutina-inicial-favorite-text-dialog:
####
####
if [ "$favorite_text_dialog" == "$NULL" ]; then
if [ "$command_dialog"  != "$NULL" ]  ; then  favorite_text_dialog="$command_dialog"    ; fi
if [ "$command_whiptail" != "$NULL" ] ; then  favorite_text_dialog="$command_whiptail"  ; fi
fi
####
####
#### :rutina-final-favorite-text-dialog:
##########      english: search favorite dialog: favorite dialog     ##########
##########      spanish: busca preferido dialogo: favorite dialog   ##########
#### :rutina-inicial-favorite-graphicall-dialog:
####
####
if [ "$favorite_graphicall_dialog" == "$NULL" ]; then
if [ "$command_zenity"  != "$NULL" ] ; then  favorite_graphicall_dialog="$command_zenity"   ; fi
if [ "$command_yad"     != "$NULL" ] ; then  favorite_graphicall_dialog="$command_yad"      ; fi
fi
####
####
#### :rutina-final-favorite-graphicall-dialog:
##########      english: search favorite browser: favorite browser     ##########
##########      spanish: busca preferido navegador: favorite browser   ##########
#### :rutina-inicial-favorite-text-browser:
####
####
if [ "$favorite_text_browser" == "$NULL" ]; then
if [ "$command_links"  != "$NULL" ] ; then  favorite_text_browser="$command_links"   ; fi
if [ "$command_links2" != "$NULL" ] ; then  favorite_text_browser="$command_links2"  ; fi
if [ "$command_lynx"   != "$NULL" ] ; then  favorite_text_browser="$command_lynx"    ; fi
if [ "$command_elinks" != "$NULL" ] ; then  favorite_text_browser="$command_elinks"  ; fi
fi
####
####
#### :rutina-final-favorite-text-browser:
##########      english: search favorite dhcp Discover ip net     ##########
##########      spanish: busca preferido dhcp Descubre la ip      ##########
#### :rutina-inicial-favorite-dhcp-command:
####
####
if [ "$favorite_dhcp_command" == "$NULL" ]; then
if [ "$command_dhcpcd"  != "$NULL" ] ;         then  favorite_dhcp_command="$command_dhcpcd"           ; fi
if [ "$command_dhclient_script" != "$NULL" ] ; then  favorite_dhcp_command="$command_dhclient_script"  ; fi
if [ "$command_dhclient"   != "$NULL" ] ;      then  favorite_dhcp_command="$command_dhclient"         ; fi
fi
####
####
#### :rutina-final-favorite-dhcp-command:
##########      english: search favorite date: favorite date command        ##########
##########      spanish: busca preferida fecha: favorita comando de fecha   ##########
#### :rutina-inicial-favorite-date-command:
####
####
if [ "$favorite_date_command" == "$NULL" ]; then
if [ "$command_rdate"   != "$NULL" ]; then  favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then  favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then  favorite_date_command="$command_ntpdate"         ; fi
fi
####
####
#### :rutina-final-favorite-date-command:
##########      english: search favorite text music player             ##########
##########      spanish: busca preferida texto reproductor de musica   ##########
#### :rutina-inicial-favorite-text-music:
####
####
command_cvlc="$(command -v cvlc)"
command_mpg123="$(command -v mpg123)"
command_mpg321="$(command -v mpg321)"
if [ "$favorite_text_music" == "$NULL" ]; then
if [ "$command_cvlc" != "$NULL" ]; then  favorite_text_music="$command_cvlc"     ; fi
if [ "$command_mpg123" != "$NULL" ]; then  favorite_text_music="$command_mpg123" ; fi
if [ "$command_mpg321" != "$NULL" ]; then  favorite_text_music="$command_mpg321" ; fi
fi
####
####
#### :rutina-final-favorite-text-music:
##########      english: search favorite graphicall music player            ##########
##########      spanish: busca preferida grafica reproductor de musica      ##########
#### :rutina-inicial-favorite-graphicall-music:
####
####
#### favorite_graphicall_music=""
#### command_qmmp="$(command -v qmmp)"
#### command_vlc="$(command -v vlc)"
#### if [ "$favorite_graphicall_music" == "$NULL" ]; then
#### if [ "$command_qmmp" != "$NULL" ]; then  favorite_graphicall_music="$command_qmmp"  ; fi
#### if [ "$command_vlc" != "$NULL" ]; then  favorite_graphicall_music="$command_vlc"    ; fi
#### fi
####
####
#### :rutina-final-favorite-graphicall-music:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-simple:
####
####
####
####
##########     ALIAS SIMPLE
##########     ALIAS SIMPLE
####
####
####
####
#### english:  alias firewall-list with conceputal firewall-conceptual:
####
####
#### english:  alias firewall-list with numeral firewall-numeral:
####
####
case "$first_option" in
"ls4")    list_rules_conceptual="" ; first_option="-txt" ; second_option="list4"  ;;
"ls6")    list_rules_conceptual="" ; first_option="-txt" ; second_option="list6"  ;;
"list4")  list_rules_conceptual="" ; first_option="-txt" ; second_option="list4"  ;;
"list6")  list_rules_conceptual="" ; first_option="-txt" ; second_option="list6"  ;;
"status") list_rules_conceptual="" ; first_option="status" ;;
"list-alltables") list_rules_conceptual="" ;;
"list-filter4")   list_rules_conceptual="" ;;
"list-filter5")   list_rules_conceptual="" ;;
"list-nat4")   list_rules_conceptual="" ;;
"list-nat6")   list_rules_conceptual="" ;;
"list-raw4")   list_rules_conceptual="" ;;
"list-raw6")   list_rules_conceptual="" ;;
"list-mangle4")   list_rules_conceptual="" ;;
"list-mangle6")   list_rules_conceptual="" ;;
"list-security4")   list_rules_conceptual="" ;;
"list-security6")   list_rules_conceptual="" ;;
"lsn4")    list_rules_conceptual="no" ; first_option="-txt" ; second_option="listn4"  ;;
"lsn6")    list_rules_conceptual="no" ; first_option="-txt" ; second_option="listn6"  ;;
"listn4")  list_rules_conceptual="no" ; first_option="-txt" ; second_option="listn4"  ;;
"listn6")  list_rules_conceptual="no" ; first_option="-txt" ; second_option="listn6"  ;;
"statusn") list_rules_conceptual="no" ; first_option="statusn"  ;;
"listn-alltables") list_rules_conceptual="no" ; first_option="list-alltables" ;;
"listn-filter4")   list_rules_conceptual="no" ; first_option="list-filter4"   ;;
"listn-filter6")   list_rules_conceptual="no" ; first_option="list-filter6"   ;;
"listn-nat4")   list_rules_conceptual="no" ; first_option="list-nat4" ;;
"listn-nat6")   list_rules_conceptual="no" ; first_option="list-nat6" ;;
"listn-raw4")   list_rules_conceptual="no" ; first_option="list-raw4" ;;
"listn-raw6")   list_rules_conceptual="no" ; first_option="list-raw6" ;;
"listn-mangle4")   list_rules_conceptual="no" ; first_option="list-mangle4"     ;;
"listn-mangle6")   list_rules_conceptual="no" ; first_option="list-mangle6"     ;;
"listn-security4")   list_rules_conceptual="no" ; first_option="list-security4" ;;
"listn-security6")   list_rules_conceptual="no" ; first_option="list-security6" ;;
esac
case "$list_rules_conceptual" in "$NULL") list_rules_conceptual="" ;; *) list_rules_conceptual=" -n"  ;; esac
####
####
#### english:  alias alias simple for output gui, -txt or -cli or -gui and more
####
####
if [ "$first_option" == "-tui-menu"   ] || [ "$first_option" == "--tui-menu"  ] ; then first_option="cli-menu"  ; fi
if [ "$first_option" == "-cli-menu"   ] || [ "$first_option" == "--cli-menu"  ] ; then first_option="cli-menu"  ; fi
if [ "$first_option" == "-gui-menu"   ] || [ "$first_option" == "--gui-menu"  ] ; then first_option="gui-menu"  ; fi
if [ "$first_option" == "-gui-roll"   ] || [ "$first_option" == "--gui-roll"  ] ; then first_option="gui-roll-zenity"  ; fi
if [ "$first_option" == "-gui-rock"   ] || [ "$first_option" == "--gui-rock"  ] ; then first_option="gui-roll"  ; fi
if [ "$first_option" == "-gui-shell"  ] || [ "$first_option" == "--gui-shell" ] ; then first_option="gui-shell-zenity"  ; fi
if [ "$first_option" == "-gui-shell"  ] || [ "$first_option" == "--gui-shell" ] ; then first_option="gui-shell" ; fi
####
####  it are in favorites alias:
#### if [ "$first_option" == "cli-menu"  ] ;  then $cmd_binary cli-menu-   ; exit ; fi
#### if [ "$first_option" == "gui-menu"  ] ;  then $cmd_binary gui-menu-   ; exit ; fi
####
#### is are not in favorites alias:
if [ "$first_option" == "gui-roll"  ] ;  then first_option="gui-roll-zenity"   ; fi
if [ "$first_option" == "gui-shell" ] ;  then first_option="gui-shell-zenity"  ; fi
####
####
if [ "$first_option" == "--text" ] || [ "$first_option" == "-text" ]   ; then first_option="txt"  ; fi
if [ "$first_option" == "--tui"  ] || [ "$first_option" == "-tui" ]    ; then first_option="cli"  ; fi
if [ "$first_option" == "--txt"  ] || [ "$first_option" == "-txt"  ]   ; then first_option="txt"  ; fi
if [ "$first_option" == "--cli"  ] || [ "$first_option" == "-cli"  ]   ; then first_option="cli"  ; fi
if [ "$first_option" == "--gui"  ] || [ "$first_option" == "-gui"  ]   ; then first_option="gui"  ; fi
if [ "$first_option" == "--web"  ] || [ "$first_option" == "-web"  ]   ; then first_option="web"  ; fi
if [ "$first_option" == "--tor"  ] || [ "$first_option" == "-tor"  ]   ; then first_option="tor"  ; fi
if [ "$first_option" == "--help" ] || [ "$first_option" == "-help"  ]  ; then first_option="help" ; fi
if [ "$first_option" == "-h"   ] || [ "$first_option" == "--help"  ] ; then first_option="help" ; fi
if [ "$first_option" == "-t"   ] || [ "$first_option" == "--txt"  ]  ; then first_option="txt"  ; fi
if [ "$first_option" == "-c"   ] || [ "$first_option" == "--cli"  ]  ; then first_option="cli"  ; fi
if [ "$first_option" == "-g"   ] || [ "$first_option" == "--gui"  ]  ; then first_option="gui"  ; fi
if [ "$first_option" == "-i"   ] || [ "$first_option" == "--info"  ] ; then first_option="info" ; fi
if [ "$first_option" == "-w"   ] || [ "$first_option" == "--web"  ]  ; then first_option="web"  ; fi
if [ "$first_option" == "-l"   ] || [ "$first_option" == "--log"  ]  ; then first_option="log"  ; fi
if [ "$first_option" == "-n"   ] || [ "$first_option" == "--null"  ] ; then first_option="null" ; fi
if [ "$first_option" == "-s"   ] || [ "$first_option" == "--silent"  ] ; then first_option="null" ; fi
if [ "$first_option" == "silent"   ] || [ "$first_option" == "-silent"  ] ; then first_option="null" ; fi
####
####
if [ "$first_option" == "-cli-menu-dialog"  ] || [ "$first_option" == "--cli-menu-dialog"  ] ; 
then first_option="cli-menu-dialog"  ; fi
if [ "$first_option" == "-cli-menu-whiptail"  ] || [ "$first_option" == "--cli-menu-whiptail"  ] ; 
then first_option="cli-menu-whiptail"  ; fi
if [ "$first_option" == "-gui-menu-zenity"  ] || [ "$first_option" == "--gui-menu-zenity"  ] ; 
then first_option="gui-menu-zenity"  ; fi
if [ "$first_option" == "-gui-menu-yad"  ] || [ "$first_option" == "--gui-menu-yad"  ] ;
then first_option="gui-menu-yad"  ; fi
if [ "$first_option" == "-gui-roll-zenity"  ] || [ "$first_option" == "--gui-roll-zenity"  ] ; 
then first_option="gui-roll-zenity"  ; fi
if [ "$first_option" == "-gui-roll-yad"  ] || [ "$first_option" == "--gui-roll-yad"  ] ;
then first_option="gui-roll-yad"  ; fi
if [ "$first_option" == "-gui-shell-zenity"  ] || [ "$first_option" == "--gui-shell-zenity"  ] ; 
then first_option="gui-shell-zenity"  ; fi
if [ "$first_option" == "-gui-shell-yad"  ] || [ "$first_option" == "--gui-shell-yad"  ] ;
then first_option="gui-shell-yad"  ; fi
####
####
if [ "$first_option" == "-cli-dialog"  ] || [ "$first_option" == "--cli-dialog"  ] ; 
then first_option="cli-dialog"  ; fi
if [ "$first_option" == "-cli-whiptail"  ] || [ "$first_option" == "--cli-whiptail"  ] ; 
then first_option="cli-whiptail"  ; fi
if [ "$first_option" == "-gui-zenity"  ] || [ "$first_option" == "--gui-zenity"  ] ; 
then first_option="gui-zenity"  ; fi
if [ "$first_option" == "-gui-yad"  ] || [ "$first_option" == "--gui-yad"  ] ;
then first_option="gui-yad"  ; fi
####
####
if [ "$first_option" == "cli-dialog" ]         ; then
favorite_text_dialog="$command_dialog"         ; first_option="cli" ; fi
if [ "$first_option" == "cli-whiptail" ]       ; then
favorite_text_dialog="$command_whiptail"       ; first_option="cli" ; fi
if [ "$first_option" == "gui-zenity"     ]   ; then 
favorite_graphicall_dialog="$command_zenity"   ; first_option="gui" ; fi
if [ "$first_option" == "gui-yad"     ]        ; then 
favorite_graphicall_dialog="$command_yad"      ; first_option="gui" ; fi
####
####
if [ "$first_option" == "cli-menu-dialog"    ] ; then 
favorite_text_dialog="$command_dialog"         ; first_option="cli-menu" ; fi
if [ "$first_option" == "cli-menu-whiptail"  ] ; then 
favorite_text_dialog="$command_whiptail"       ; first_option="cli-menu" ; fi
if [ "$first_option" == "gui-menu-zenity"  ]   ; then 
favorite_graphicall_dialog="$command_zenity"   ; first_option="gui-menu" ; fi
if [ "$first_option" == "gui-menu-yad"     ]   ; then 
favorite_graphicall_dialog="$command_yad"      ; first_option="gui-menu" ; fi
####
####
#### english: alias simple for options commons
####
####
if [ "$first_option" == "client-squid" ] ; then first_option="client-proxy" ; fi
if [ "$first_option" == "server-squid" ] ; then first_option="server-proxy" ; fi
if [ "$first_option" == "names" ] ; then first_option="names-control" ; fi
if [ "$first_option" == "options" ] ; then first_option="list-options" ; fi
if [ "$first_option" == "mini-options" ] ; then first_option="list-options" ; fi
if [ "$first_option" == "options-examples" ] ; then first_option="examples" ; fi
if [ "$first_option" == "options-mini" ] ; then first_option="options" ; fi
if [ "$first_option" == "examples" ] ; then first_option="options-examples"; fi
if [ "$first_option" == "sentlog" ] ; then first_option="filelog"; fi
if [ "$first_option" == "regen" ] ; then first_option="regen-config"; fi
if [ "$first_option" == "cfg" ] ; then first_option="names-config" ; fi
if [ "$first_option" == "cfg-custom" ] ; then first_option="custom" ; fi
if [ "$first_option" == "list-fw" ] ; then first_option="names"; fi
if [ "$first_option" == "date" ] ; then first_option="ntpdate-client"; fi
if [ "$first_option" == "ram-free" ] ; then first_option="free"; fi
if [ "$first_option" == "ram" ] ; then first_option="free"; fi
if [ "$first_option" == "free-ram" ] ; then first_option="free"; fi
if [ "$first_option" == "list-allrules" ] ; then first_option="list-alltables"; fi
####
####
#### english:  alias simple for firewall names 
####
####
if [ "$first_option" == "erase-rules" ] ; then first_option="eraserules" ; fi
if [ "$first_option" == "offline" ] ; then first_option="off-line" ; fi
if [ "$first_option" == "clientweb" ] ; then first_option="client-web" ; fi
if [ "$first_option" == "clientvpn" ] ; then first_option="client-vpn" ; fi
if [ "$first_option" == "game-minecraft" ] ; then first_option="game-minetest" ; fi
if [ "$first_option" == "game-westnoth" ] ; then first_option="game-wesnoth" ; fi
if [ "$first_option" == "allpermisive" ] ; then first_option="all-permisive" ; fi
if [ "$first_option" == "torbrowser" ] ; then first_option="client-tor" ; fi
if [ "$first_option" == "tor-browser" ] ; then first_option="client-tor" ; fi
if [ "$first_option" == "client-email" ] ; then first_option="client-mail" ; fi
if [ "$first_option" == "onlyweb-tor" ] ; then first_option="lan-tor" ; fi
if [ "$first_option" == "serversamba" ] ; then first_option="server-samba" ; fi
if [ "$first_option" == "serverprint" ] ; then first_option="server-print" ; fi
if [ "$first_option" == "serverweb" ] ; then first_option="server-web" ; fi
if [ "$first_option" == "serverssh" ] ; then first_option="server-ssh" ; fi
if [ "$first_option" == "serverlamp" ] ; then first_option="server-lamp" ; fi
if [ "$first_option" == "server-ts" ] ; then first_option="server-teamspeak" ; fi
if [ "$first_option" == "server-email" ] ; then first_option="server-mail" ; fi
####
####
#### english:  alias simple for regenerate configurations templates
####
####
case "$first_option" in
"wizard-mini"|"wizard-full"|"new-mini-config"|"new-full-config"|"nueva-mini-config"|"nueva-completa-config")
$cmd_binary regen-config ;; esac
####
####
#### :rutina-final-alias-simple:
##########    ALIAS CAMPUS
##########    ALIAS CAMPUS
#### :rutina-inicial-alias-campus:
####
####
#### output txt:   |||    General text without warnings
####
####
if [ "$first_option" == "txt" ]; then case "$second_option" in
####
####
"list4") $cmd_binary list4-ip &> $temporal_text 
cat $temporal_text | $command_grep -iv Warning:  &> $temporal_textfinal
cat $temporal_textfinal ; exit ;;
####
####
"list6") $cmd_binary list6-ip &> $temporal_text 
cat $temporal_text | $command_grep -iv Warning:  &> $temporal_textfinal
cat $temporal_textfinal ; exit ;;
####
####
"listn4") $cmd_binary listn4-ip &> $temporal_text 
cat $temporal_text | $command_grep -iv Warning:  &> $temporal_textfinal
cat $temporal_textfinal ; exit ;;
####
####
"listn6") $cmd_binary listn6-ip &> $temporal_text 
cat $temporal_text | $command_grep -iv Warning:  &> $temporal_textfinal
cat $temporal_textfinal ; exit ;;
####
####
esac ; 
$cmd_binary "$second_option" "$third_option" "$quad_option"
####
####
exit; fi
####
####
#### output cli:
####
####
if [ "$first_option" == "cli" ]
then echo "$head_waiting_cli"
if [ "$favorite_text_dialog" == "$NULL" ]; then "### [ info ] Please install or dialog or whiptail to work with cli";  exit; fi
case "$second_option" in
wizard-*) echo "$message_without_cli" ; $cmd_binary $second_option $third_option ;  exit ;;
"nueva-mini-config")  $cmd_binary $second_option $third_option ;  exit ;;
"nueva-completa-config") $cmd_binary $second_option $third_option ;  exit ;;
"new-mini-config") $cmd_binary $second_option $third_option ;  exit ;;
"new-full-config") $cmd_binary $second_option $third_option ;  exit ;;
"modify-config") $cmd_binary modify-config $third_option ; exit ;;
"preferences-modify") $cmd_binary preferences-modify ; exit ;;
"radio") echo "$message_without_cli" ; $cmd_binary $second_option $third_option ;  exit ;;
"clean-tmp") $cmd_binary $second_option $third_option ; exit ;;
####
####
*)
cmd_inicial="$($cmd_binary $second_option $third_option)"
$favorite_text_dialog --clear --notags --title "Cli Menu With $cmd_version" --msgbox "$cmd_inicial" 0 0
exit ;;
####
####
esac
fi
####
####
#### output log
####
####
if [ "$first_option" == "log" ]
then case "$second_option" in 
"wizard") echo "$message_without_log" ; exit ;;
"wizard-full") echo "$message_without_log" ; exit ;;
"new-mini-config") echo "$message_without_log" ; exit ;;
"nueva-mini-config") echo "$message_without_log" ; exit ;;
"new-full-config") echo "$message_without_log" ; exit ;;
"nueva-completa-config") echo "$message_without_log" ; exit ;;
"modify-config")  echo "$message_without_log" ; exit ;;
pc-*) echo "$message_without_log" ; exit ;;
esac 
####
####
echo "$head_waiting_log"
echo "### ### [ info ] [ $second_option $third_option $quad_option ] [ $($command_date) ]" &> $output_log
$cmd_binary $second_option $third_option $quad_option &>> $output_log
cat $output_log | $command_grep -iv Warning: &>> $default_filelog
echo "$title_md [ _ok_ ] [ Output sended to $default_filelog ] [ show file: fwiptables filelog ]" ;
exit ; fi
####
####
#### output null
####
####
if [ "$first_option" == "null" ]
then case "$second_option" in 
"wizard") echo "$message_without_null" ; exit ;;
"wizard-full") echo "$message_without_null" ; exit ;;
"new-mini-config") echo "$message_without_null" ; exit ;;
"nueva-mini-config") echo "$message_without_null" ; exit ;;
"new-full-config") echo "$message_without_null" ; exit ;;
"nueva-completa-config") echo "$message_without_null" ; exit ;;
"gpg-notes") echo "$message_without_null" ; exit ;;
"wpa-save") echo "$message_without_null" ; exit ;;
pc-*) echo "$message_without_null" ; exit ;;
esac
####
####
$cmd_binary "$second_option" "$third_option" &> /dev/null
exit ; fi
####
####
#### :rutina-final-alias-campus:
##########     english: autolog:         ##########
##########     spanish: autoguardado     ##########
#### :rutina-inicial-allow-autolog:
####
####
if [ "$allow_save_autolog" != "no" ]; then 
head_autolog="[ $cmd_binary ] [ $cmd_version ] [ $(date) ] [ $first_option $second_option $third_option ]"
echo $head_autolog >> $default_autolog ; fi
####
####
#### :rutina-final-allow-autolog:
##########     english: timespam          ##########
##########     spanish: mostrar fecha     ##########
#### :rutina-inicial-allow-timespam:
####
####
if [ "$allow_show_time" != "no" ] ; then
head_timespam="$title_md [ _ok_ ] || [ Date and Time ] [ $(date) ]"
echo $head_timespam ; fi
####
####
#### :rutina-final-allow-timespam:
##########   english: filelog: Read log fwiptables-filelog  ##########
##########   spanish: filelog: Lee log  fwiptables-filelog  ##########
#### :rutina-inicial-filelog:
####
####
if [ "$first_option" == "filelog" ] ; then
echo "$title_md [ $first_option ]  [ show $default_filelog ] "
if [ ! -f $default_filelog ]; then touch $default_filelog ; fi
echo
cat  "$default_filelog"
echo 
echo "### ### [ this file is: ] [ $default_filelog ]"
exit; fi
####
####
#### :rutina-final-fw-filelog:
##########    english: autolog: Read log fwiptables-autolog   ##########
##########    spanish: autolog: Lee log  fwiptables-autolog   ##########
#### :rutina-inicial-autolog:
####
####
if [ "$first_option" == "autolog" ] ; then
echo "$title_md [ $first_option ] [ show "$default_autolog" ] "
echo "$title_md [ info ] [ last 50 lines from file showed ] [ $default_autolog ]"
if [ ! -f $default_autolog ]; then touch $default_autolog ; fi
echo
cat  "$default_autolog" | tail -50
echo
echo "$title_md [ info ] [ last 50 lines from file showed ] [ $default_autolog ]"
exit; fi
####
####
#### :rutina-final-autolog:
##########     with first option
##########     siin primera opcion
#### :rutina-inicial-without-first-option:
####
#### to launch graphicall if X
# if [ "$first_option" == "$NULL" ] && [ "$without_first_option" == "$NULL" ] ; then 
# if [ "$X11_OR_WAYLAND" == "x11" ] && [ "$favorite_graphicall_dialog" != "$NULL" ] ; then
# echo "$title_md forward to graphicall gui-shell"
# $cmd_binary gui-shell-$(basename $favorite_graphicall_dialog) ; exit ; fi
# if [ "$X11_OR_WAYLAND" == "wayland" ] && [ "$favorite_graphicall_dialog" != "$NULL" ] ; then
# echo "$title_md forward to graphicall gui-shell"
# $cmd_binary gui-shell-$(basename $favorite_graphicall_dialog) ; exit ; fi
# without_first_option="options" ; $cmd_binary $without_first_option ; 
# exit ; fi
####
####
####
#### :rutina-final-without-first-option:
##########   english: default:  fwiptables preferences      ##########
##########   spanish: defecto:  fwiptables preferences      ##########
#### :rutina-inicial-default:
####
####
if [ "$first_option" == "default" ] ; then 
echo "$title_md [ $first_option ] [ $cmd_binary default ] [ default md ] "
echo "$title_md [ info ] [ $cmd_binary default.. ]"

echo "$title_md [ info ] [ Autoregenerate default config for fwiptables: ] [ fwiptables preferences-regen  ]"
echo "$title_md [ info ] [ Show   default config for fwiptables:         ] [ fwiptables preferences-read   ]"
echo "$title_md [ info ] [ Modify default config for fwiptables:         ] [ fwiptables preferences-modify ]"
exit; fi
####
####
#### :rutina-final-default:
##########    english: preferences-modify: modify preferences   ##########
##########    spanish: preferences-modify: modify preferences   ##########
#### :rutina-inicial-preferences-modify:
####
####
if [ "$first_option" == "preferences-modify" ]; then 
echo "$title_md [ $first_option ] [ modify the default fwiptables ] "
echo 
$favorite_text_editor $default_preferences
echo "$title_md [ info ] [ edit file $default_preferences to change variables ]"
exit; fi
####
####
#### :rutina-final-preferences-modify:
##########    english: dialog-modify: modify dialog   ##########
##########    spanish: dialog-modify: modify dialog   ##########
#### :rutina-inicial-dialog-modify:
####
####
if [ "$first_option" == "dialog-modify" ]; then 
echo "$title_md [ $first_option ] [ modify the default dialog ] "
echo 
$favorite_text_editor $default_dialogrc

echo "$title_md [ info ] [ edit file $default_dialogrc to change variables ]"
exit; fi
####
####
#### :rutina-final-dialog-modify:
##########    english: preferences-read: modify  preferences         ##########
##########    spanish: preferences-read: modifica preferencias       ##########
#### :rutina-inicial-preferences-read:
####
####
if [ "$first_option" == "preferences-read" ]; then 
echo "$title_md [ $first_option ] [ read the default fwiptables ] "
echo "$title_md [ info ] [ Show file $default_preferences to read variables ]"
####
####
#### english: show file
#### spanish: muestra el archivo
####
####
cat $default_preferences
####
####
exit; fi
####
####
#### :rutina-final-preferences-read:
##########   english: preferences-regen:  regen preferences       ##########
##########   spanish: preferences-regen:  regenera preferencias   ##########
#### :rutina-inicial-preferences-regen:
####
####
if [ "$first_option" == "preferences-regen" ] ; then
echo "$title_md [ $first_option ] [ $cmd_binary preferences-regen ] [ preferences-regen md ] "
rm $default_preferences
echo "$title_md [ _ok_ ] [ $cmd_binary deleted old configs ]"
file $cmd_binary
#### cat $cmd_binary | $command_grep fwiptables-file-default | $command_grep -iv cmd_binary &> $default_preferences 
$cmd_binary preferences-example &> $default_preferences
echo "$title_md [ _ok_ ] [ Regenerated: $cmd_binary values for default in ]"
echo "$title_md [ _ok_ ] [ Regenerated: $default_preferences ]"
exit; fi
####
####
#### :rutina-final-preferences-regen:
##########   english: preferences-example:  regen preferences       ##########
##########   spanish: preferences-example:  regenera preferencias   ##########
#### :rutina-inicial-preferences-example:
####
####
if [ "$first_option" == "preferences-example" ] ; then
echo ""
echo "$title_md default option"
echo "without_first_option=options                        ## read below"
echo "$title_md When fwiptables without its first_option: void or valid option required to works"
echo "$title_md Example1: list-options Example2: list4 example3: ip4 example4: speed-ip4"
echo "$title_md Example5: sockets Example6: gui-menu-yad Example7: gui-shell-yad"
echo ""
echo "$title_md default firewall"
echo "allow_use_legacy=                                   ## void or no"
echo "allow_use_nft=no                                    ## void or no"
echo "allow_use_ipv4=                                     ## void or no"
echo "allow_use_ipv6=no                                   ## void or no"
echo "allow_separate_rules=                               ## void or no"
echo "config_close_deny=DROP                              ## DROP or REJECT"
echo
echo "$title_md default log"
echo "allow_save_autolog=no                               ## void or no"
echo "allow_show_time=no                                  ## void or no"
echo
echo "$title_md default programs"
echo "favorite_text_editor=                               ## or void for automatic or specify command"
echo "favorite_text_music=                                ## or void for automatic or specify command"
echo "favorite_text_browser=                              ## or void for automatic or specify command"
echo "favorite_date_command=                              ## or void for automatic or specify command"
echo
echo "$title_md default text-cli and graphicall-gui"
echo "favorite_text_dialog=                               ## or void for automatic or specify command"
echo "favorite_graphicall_dialog=                         ## or void for automatic or specify command"
echo
echo "$title_md default discover ip and speed ip"
echo "serverip_discover_ipv4=https://ifconfig.co/ip       ## default http://ifconfig.co/ip"
echo "serverip_discover_ipv6=https://ifconfig.co/ip       ## default http://ifconfig.co/ip"
echo "serverip_iperf_ipv4=ping.online.net                 ## default ping.online.net"
echo "serverport_iperf_ipv4=5001                          ## default 5201"
echo "serverip_iperf_ipv6=ping6.online.net                ## default ping.online.net"
echo "serverport_iperf_ipv6=5001                          ## default 5201"
echo
echo "$title_md default dimesion graphicall"
echo "graphic_window_dimension='--width=950 --height=650' ## default '--width=950 --height=650'"
echo
echo "$title_md file generated with preferences-example"
exit; fi
####
####
#### :rutina-final-preferences-example:
##########    english: ip4 : get net info               ##########
##########    spanish: ip4 : da informacion de la red   ##########
#### :rutina-inicial-ip4:
####
####
if [ "$first_option" == "ip4" ]; then
echo "$title_md [ $first_option ]  [ show info about net ip4 ] "
echo
echo "$title_md [ info ] ### [ Network Route ] [ Route ipv4 ] ###"
if [ "$command_ip" == "$NULL" ] ; then echo "$tab [ info ] [ install ip command ]"
else $command_ip -4 route ; fi
echo
echo "$title_md [ info ] ### [ Network Listen ] ###"
echo "$text_md  for network listen: $cmd_binary sockets"
#### if [ "$command_ss" == "$NULL" ] ; then echo "$tab [ info ] [ install ss command ]"
#### else $command_ss -l  | $command_grep "\:\*" ; fi
echo
echo "$title_md [ info ] ### [ Private ip ] [ Address ipv4 ] ###"
if [ "$command_ip" == "$NULL" ] ; then echo "$tab [ info ] [ install ip command ]"
else  $command_ip -4 address | $command_grep -i  inet | $command_grep -iv 127.0.0.1 | $command_sed 's/inet//g' | cut -d "/" -f 1 ; fi
echo
echo "$title_md [ info ] ### [ Public ip ] [ Address ipv4 ] ###"
if [ "$command_curl" == "$NULL" ] ; then echo "$tab [ info ] [ install curl command ]" ; else
public_ip4="$($command_timeout -s SIGINT -v 8 $command_curl -s -4 $serverip_discover_ipv4 -w "\n"| head -1)"
if [ "$public_ip4" == "<!DOCTYPE html>" ] ; then echo "fail: public ip hidden for dns server" ;
else echo "$tab $public_ip4"; fi; fi
echo
echo "$title_md [ info ] ### [ Proxy ip ] [ Address proxy ] ###"
echo " [ info ] Proxy http:    $http_proxy"
echo " [ info ] Proxy https:   $https_proxy"
echo
echo "$title_md [ info ] ### [ domain resolve ] [ Resolv.conf ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]     ; then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"     ;
cat /etc/resolv.conf | $command_grep -E "nameserver|search"      ; fi
if [ -f /etc/resolv.conf.head ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ];       then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
exit; fi
####
####
#### :rutina-final-ip4:
##########    english: ip6 : get net info               ##########
##########    spanish: ip6 : da informacion de la red   ##########
#### :rutina-inicial-ip6:
####
####
if [ "$first_option" == "ip6" ]; then
echo "$title_md [ $first_option ]  [ show info about net ip6 ] "
echo
echo "$title_md [ info ] ### [ Network Route ] [ Route ipv6 ] ###"
if [ "$command_ip" == "$NULL" ] ; then echo "$tab [ info ] [ install ip command ]"
else $command_ip -6 route ; fi
echo
echo "$title_md [ info ] ### [ Network Listen ] ###"
echo "$text_md  for network listen: $cmd_binary sockets"
#### if [ "$command_ss" == "$NULL" ] ; then echo "$tab [ info ] [ install ss command ]"
#### else $command_ss -l  | $command_grep "\:\*" ; fi
echo
echo "$title_md [ info ] ### [ Private ip ] [ Address ipv6 ] ###"
if [ "$command_ip" == "$NULL" ] ; then echo "$tab [ info ] [ install ip command ]"
else  $command_ip -6 address | $command_grep -i  inet | $command_grep -iv  "inet6 ::1" | $command_sed 's/inet6//g' | cut -d "/" -f 1 ; fi
echo
echo "$title_md [ info ] ### [ Public ip ] [ Address ipv6 ] ###"
if [ "$command_curl" == "$NULL" ] ; then echo "$tab [ info ] [ install curl command ]" ; else
public_ip6="$($command_timeout -s SIGINT -v 8 $command_curl -s -6 $serverip_discover_ipv6 -w "\n"| head -1)"
if [ "$public_ip6" == "<!DOCTYPE html>" ] ; then echo "fail: public ip hidden for dns server" ;
else echo "$tab $public_ip6"; fi; fi
echo
echo "$title_md [ info ] ### [ Proxy ip ] [ Address proxy ] ###"
echo " [ info ] Proxy http:    $http_proxy"
echo " [ info ] Proxy https:   $https_proxy"
echo
echo "$title_md [ info ] ### [ domain resolve ] [ Resolv.conf ] ###"
if [ -f /etc/resolv.conf ]     ; then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"     ;
cat /etc/resolv.conf | $command_grep -E "nameserver|search"      ; fi
if [ -f /etc/resolv.conf.head ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]; then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ];       then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
exit; fi
####
####
#### :rutina-final-ip6:
##########    english: depends: depends            ##########
##########    spanish: dependencias: dependencias  ##########
#### :rutina-inicial-depends:
####
####
if [ "$first_option" == "depends" ]; then
echo "$title_md [ $first_option ] [ List for depends programs ] [ depends md ] "
echo
echo "$title_md [ Configuration files ]"
echo "$text_md Directory data:          $directory_data"
echo "$text_md Directory temp:          $directory_cache"
echo "$text_md File Preferences:        $default_preferences"
echo
echo "$title_md [ Log files ]"
echo "$text_md File autolog:            $default_autolog"
echo "$text_md File filelog:            $default_filelog"
echo
echo "$title_md [ Automatic interfaces  ]"
echo "$text_md Interface txt:           $command_bash"
echo "$text_md Interface cli:           $favorite_text_dialog"
echo "$text_md Interface gui:           $favorite_graphicall_dialog"
echo 
echo "$title_md [ Automatic iptables ]"
echo "$text_md iptables legacy:         $command_iptables_legacy"
echo "$text_md iptables nft:            $command_iptables_nft"
echo "$text_md ip6tables legacy:        $command_ip6tables_legacy"
echo "$text_md ip6tables nft:           $command_ip6tables_nft"
echo "$text_md arptables:               $command_arptables"
echo "$text_md ebtables:                $command_ebtables"
echo
echo "$title_md [ Automatic favorites ]"
echo "$text_md Automatic text editor:    Text editor command      :   $favorite_text_editor"
echo "$text_md Automatic text browser:   Text browser command     :   $favorite_text_browser"
echo "$text_md Automatic text date:      rdate or sntp or ntpdate :   $favorite_date_command"
echo 
exit; fi
####
####
#### :rutina-final-depends:
##########    english: options-examples: some example    ##########
##########    spanish: options-examples: algun ejemplo   ##########
#### :rutina-inicial-examples:
####
####
if [ "$first_option" == "options-examples" ]; then
echo "$title_md [ $first_option ] [ List examples ] [ examples md ] "
echo "$text_md"
echo "$title_md                        [ several examples *without optional otuput* ]              "
echo "$text_md"
echo "$text_md    $cmd_file names                    |  List firewall saved                        "
echo "$text_md    $cmd_file names-config             |  List configs saved                         "
echo "$text_md    $cmd_file speed-ip4                |  get info about speed with internet ipv4    "
echo "$text_md    $cmd_file sockets                  |  show info about listen sockets             "
echo "$text_md    $cmd_file preferences-modify       |  modify default variables                   "
echo "$text_md    $cmd_file autolog                  |  List last optiosn with $cmd_file           "
echo "$text_md    $cmd_file depends                  |  depends to $cmd_file                       "
echo "$text_md    $cmd_file version                  |  version from $cmd_file                     "
echo "$text_md"
echo "$title_md                        [ several examples *with optional output* ]                 "
echo "$text_md"
echo "$text_md        [ with optional output ]                  [ Example Description ]            "
echo "$text_md"
echo "$text_md    $cmd_file -silent client-web       |  Launch client web firewall a null output "
echo "$text_md    $cmd_file -txt list                |  List iptables rules with output txt      "
echo "$text_md    $cmd_file -cli-wiptail names       |  List firewall with output cli whiptail   "
echo "$text_md    $cmd_file -gui-yad sockets         |  List sockets ip with output gui yad      "
echo "$text_md"
echo "$text_md    $cmd_file -cli-menu-dialog         |  All options in text menu                 "
echo "$text_md    $cmd_file -gui-menu-yad            |  All options in window menu               "
echo "$text_md    $cmd_file -gui-roll-zenity         |  All options in window roll               "
echo "$text_md    $cmd_file -gui-shell-yad           |  All options in window shell              "
echo "$text_md"
exit; fi
####
####
#### :rutina-final-examples:
##########    english: version: system script, the version option              ##########
##########    spanish: version: script de sistema, la opcion mostrar version   ##########
#### :rutina-inicial-version:
####
####
if [ "$first_option" == "version" ]; then 
echo "$title_md [ $first_option ] [ Show version about ] [ version.md] "
echo "$title_md [ Name program ]"
echo "$text_md $cmd_name"
echo
echo "$title_md [ Version program ]"
echo "$text_md $cmd_version"
echo
echo "$title_md [ Description program ]"
echo "$text_md $cmd_description"
echo
echo "$title_md [ File format ]"
echo "$text_md $(file $cmd_binary | cut -d "," -f 1-2)"
echo
echo "$title_md [ MD5 sum ]"
echo "$text_md $($command_md5sum $cmd_binary)"
echo
echo "$title_md [ Launched program ]"
echo "$text_md $cmd_binary"
echo
echo "$title_md [ Binary directory ]"
echo "$text_md $directory_installed"
echo
echo "$title_md [ Cache directory  ]"
echo "$text_md $directory_cache"
echo
echo "$title_md [ Data directory   ]"
echo "$text_md $directory_data"
echo
echo "$title_md [ Default preferences ]"
echo "$text_md $default_preferences"
echo
echo "$title_md [ Default autolog ]"
echo "$text_md $default_autolog"
echo
echo "$title_md [ Default filelog ]"
echo "$text_md $default_filelog"
echo 
exit ; fi
####
####
#### :rutina-final-version:
##########    english: ver: system script, the version option              ##########
##########    spanish: ver: script de sistema, la opcion mostrar version   ##########
#### :rutina-inicial-ver:
####
####
if [ "$first_option" == "ver" ]; then 
echo "$title_md [ $first_option ] [ Show version about ] [ version.md]    "    
echo "[ _ok_ ] [ program ] $cmd_binary With Version $cmd_version          "     
echo "[ _ok_ ] [ Details ] $cmd_name | $cmd_description                   "    
echo "[ _ok_ ] [ Binary directory ] $directory_installed                  "     
echo "[ _ok_ ] [ Data directory   ] $directory_data                       "     
echo "[ _ok_ ] [ Cache directory  ] $directory_cache                      "     
exit ; fi
####
####
#### :rutina-final-ver:
##########    english: expert: system script, the version option              ##########
##########    spanish: expert: script de sistema, la opcion mostrar version   ##########
#### :rutina-inicial-expert:
####
####
if [ "$first_option" == "expert" ]; then 
echo "$title_md [ $first_option ] [ Show expert options ] [ expert.md] "
echo "$text_md expert-upgrade . upgrade the command fwiptables-cmd with command curl"
echo "$text_md expert-obash . compile fwiptables-cmd to fwiptables-bin with command obash"
exit ; fi
####
####
#### :rutina-final-expert:
##########    english: notes: notes to configure iptables      ##########
##########    spanish: notes: notas para configurar iptables   ##########
#### :rutina-inicial-notes:
####
####
if [ "$first_option" == "notes" ]; then 
echo "$title_md [ $first_option ] [ List notes about ] [ notes md ]"
echo "$text_md"
echo "$text_md"
echo "$title_md           Several notes .."
echo "$text_md"
echo "$text_md [ Notes ]"
echo "$text_md"
echo "$text_md [ legacy or nft ] whith one of them is sufficent "
echo "$text_md"
echo "$text_md [ allow shield maxtries ] limit a attack per bruteforce to us ssh server o other servers "
echo "$text_md"
echo "$text_md [ net blacklist ] excepcionals hosts has conection dropped in firewall"
echo "$text_md"
echo "$text_md [ net whitelist ] excepcionals hosts has conection allowed in firewall"
echo "$text_md"
echo "$text_md [ allow output uid/gid ] User and/or group excepcional have output conection allowed in firewall"
echo "$text_md"
echo "$text_md [ Notes ] [ Two iptables netfilter ]"
echo "$text_md"
echo "$text_md iptables-legacy   is    support for xtables" 
echo "$text_md"
echo "$text_md iptables-nft      is    support for nftables" 
echo "$text_md"
echo "$text_md"
echo "$text_md [ Notes ] necesary ports to connect with ipv4 and ipv6 in UDP protocol"
echo "$text_md"
echo "$text_md ntp    : Port necesary to update the time and date"
echo "$text_md"
echo "$text_md bootpc : Port necesary to dhcp and get ip"
echo "$text_md"
echo "$text_md domain : This port is necesary to domain resolver"
echo "$text_md"
echo "$text_md https  : This port is necesary for udp named web html5"
echo "$text_md"
echo "$text_md"
echo "$text_md [ Notes ] necesary protocols for ip v6"
echo "$text_md"
echo "$text_md ipv6-icmp : Necesary protocol in ipv6"
echo "$text_md"
echo "$text_md ipv4 protocols : ipv6 works too with old ipv4 procotols"
echo "$text_md"
echo "$text_md"
exit; fi
####
####
#### :rutina-final-notes:
##########   english: regen-config: regen-config template wizard files       ##########
##########   spanish: regen-config: regen-configera template wizard archivos ##########
#### :rutina-inicial-regen-config:
####
####
if [ "$first_option" == "regen-config" ]; then 
echo "$title_md [ $first_option ] [ Generate templates wizard and cfg ] "
echo "$title_md [ info ] [ regenerating template wizard and template cfg ]"
####
####
####    english: variables to prepare to gen files
####    spanish: variables para preparar para generar archivos
####
####
####    english: basic options in configuration file cfg
####    spanish: opciones basicas en configuracion de archivo cfg
####
####
var0="$(echo $cinco $cmd_name from $cmd_binary version $cmd_version $cinco )"
var1="$(echo $cinco BEGIN NECESARY $cinco )"
eng1="$(echo $cinco  .......... BEGIN Necesary options .......... .......... $cinco )"
spa1="$(echo $cinco INICIO .......... Opciones Necesarias .......... .......... $cinco )"
var2="$(echo $cinco NETFILTER $cinco )"
eng2="$(echo $cinco the iptables firewall netfilter, choose one or two )"
spa2="$(echo $cinco el iptables firewall netfilter, elige uno o dos )"
var3="$(echo allow_use_legacy= )"
eng3="$(echo $cinco launch xtables, void to yes or type no )"
spa3="$(echo $cinco lanza xtables, vacio para si, o escribe no )"
var4="$(echo allow_use_nft=no )"
eng4="$(echo $cinco launch nftables, void to yes or type no )"
spa4="$(echo $cinco lanza nftables, vacio para si, o escribe no )"
var5="$(echo $cinco PROTOCOL IP $cinco )"
eng5="$(echo $cinco ip protocol, modify with void or no )"
spa5="$(echo $cinco procolo ip, modificar con vacio o no )"
var6="$(echo allow_use_ipv4= )"
eng6="$(echo $cinco void to config firewall with ipv4 or no to dont configure ipv4 )"
spa6="$(echo $cinco varcio para ejecutar el firewall con ipv4 o no para no )"
var7="$(echo allow_use_ipv6=no )"
eng7="$(echo $cinco void to config firewall with ipv6 or no to dont configure ipv6 )"
spa7="$(echo $cinco varcio para ejecutar el firewall con ipv6 o no para no )"
var8="$(echo $cinco CLIENT PORTS $cinco )"
eng8="$(echo $cinco Client ports, add with ',' and join ranges with  : )"
spa8="$(echo $cinco puertos Cliente, añadir con ',' y poner rangos con : )"
var9="$(echo client_port_tcp=http,https,ssh )"
eng9="$(echo $cinco tcp ports for client )"
spa9="$(echo $cinco puertos tcp para ser cliente )"
var10="$(echo client_port_udp=domain,domain-s,bootpc,bootps,ntp,https )"
eng10="$(echo $cinco udp ports for client )"
spa10="$(echo $cinco puertos udp para ser cliente )"
var11="$(echo $cinco SERVER PORTS $cinco )"
eng11="$(echo $cinco Server ports, add with ',' and join ranges with : )"
spa11="$(echo $cinco Puertos Servidor, añadir con ',' y poner rangos con  : )"
var12="$(echo server_port_tcp=ssh )"
eng12="$(echo $cinco tcp ports for server )"
spa12="$(echo $cinco puertos tcp para servidor )"
var13="$(echo server_port_udp= )"
eng13="$(echo $cinco udp ports for server )"
spa13="$(echo $cinco puertos udp para servidor )"
var14="$(echo $cinco LOG TO SERVER PORTS $cinco )"
eng14="$(echo $cinco Log to server ports, add with ',' and join ranges with : )"
spa14="$(echo $cinco logear para puertos de Servidor, añadir con ',' y poner rangos con : )"
var15="$(echo logserver_port_tcp= )"
eng15="$(echo $cinco the tcp ports to log server )"
spa15="$(echo $cinco puertos tcp para logear servidor )"
var16="$(echo logserver_port_udp= )"
eng16="$(echo $cinco the udp ports to log server )"
spa16="$(echo $cinco puertos udp para logear servidor )"
var17="$(echo $cinco LOG PREFIX TO SERVER $cinco )"
eng17="$(echo $cinco Log to server ports with prefix )"
spa17="$(echo $cinco logear para puertos de servidor con prefijo )"
var18="$(echo logserver_prefix_input=fwlog-input:: )"
eng18="$(echo $cinco type input prefix for logserver )"
spa18="$(echo $cinco especifica prefijo de entrada para logserver )"
var19="$(echo logserver_prefix_output=fwlog-output:: )"
eng19="$(echo $cinco type output prefix for logserver )"
spa19="$(echo $cinco especifica prefijo de salida para logserver )"
var20="$(echo $cinco ALLOW MAXTRIES SHIELD $cinco )"
eng20="$(echo $cinco Put one shield for ports to new connecting, with max ip to each hour )"
spa20="$(echo $cinco Pone un escudo para los peuertos de nueva conexion, con maximo ip cada hora )"
var21="$(echo allow_shield_maxtries=no )"
eng21="$(echo $cinco void to allow one shield with max tries login in ssh for ip to each hour or no )"
spa21="$(echo $cinco vacio para permitir un escudo con los intentos maximos de logins in ssh por ip a cada hora o no )"
var22="$(echo config_shield_maxtries=12 )"
eng22="$(echo $cinco modify shield with number max of tries to log in us ssh server for ip at each hour )"
spa22="$(echo $cinco modificar escudo con los maximos intentos de logeo a nuestro servidor ssh por ip a cada hora )"
var23="$(echo config_shield_port=22 )"
eng23="$(echo $cinco modify shield ssh chaging maxtries port ssh o several ports with comma separate )"
spa23="$(echo $cinco modificar escudo ssh cambiando puerto de intentos ssh o varios puertos separados por comma )"
var24="$(echo $cinco GENERAL RULES $cinco )"
eng24="$(echo $cinco General rules in table )"
spa24="$(echo $cinco Regla general en tabla )"
var25="$(echo allow_separate_rules= )"
eng25="$(echo $cinco Void to separate the rules for each port or no )"
spa25="$(echo $cinco Vacio para separar reglas por cada puerto o no )"
var26="$(echo config_close_deny=DROP )"
eng26="$(echo $cinco choose close deny with or DROP or REJECT )"
spa26="$(echo $cinco Elige cerrar denegacion con o DROP or REJECT )"
var27="$(echo $cinco END NECESARY $cinco )"
eng27="$(echo $cinco .......... END Necesary options .......... .......... $cinco )"
spa27="$(echo $cinco FINAL .......... Opciones Necesarias .......... .......... $cinco )"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
var31="$(echo $cinco BEGIN OPTIONAL $cinco )"
eng31="$(echo $cinco .......... BEGIN Optional options .......... .......... $cinco )"
spa31="$(echo $cinco INICIO .......... Opciones opcionales .......... .......... $cinco )"
var32="$(echo $cinco choose void or no $cinco )"
eng32="$(echo $cinco Allow Other Options,  modify with void, or no )"
spa32="$(echo $cinco Permitir Otras Opciones, modificar con vacio o no )"
# var33="$(echo allow_separate_rules=no )"
# eng33="$(echo $cinco Separate the rules for each port or no )"
# spa33="$(echo $cinco separar reglas por cada puerto o no )"
# var34="$(echo allow_shield_maxtries=no )"
# eng34="$(echo $cinco void to allow one shield with max tries login in ssh for ip to each hour or no )"
# spa34="$(echo $cinco vacio para permitir un escudo con los intentos maximos de logins in ssh por ip a cada hora o no )"
var35="$(echo allow_forward_ip4=no )"
eng35="$(echo $cinco void to yes to forward ip4, or no to no )"
spa35="$(echo $cinco vacio para reenvios ip4, o no para no )"
var36="$(echo allow_forward_ip6=no )"
eng36="$(echo $cinco void to allow ip forward ip6 or no )"
spa36="$(echo $cinco vacio para permitir reenvio ip6, o no )"
var37="$(echo allow_gateway_ip4=no )"
eng37="$(echo $cinco void to allow gateway ip4 to others nets or no )"
spa37="$(echo $cinco vacio para permitir gateway ip4  a otras redes, o no )"
var38="$(echo allow_gateway_ip6=no )"
eng38="$(echo $cinco void to allow gateway ip6 to other nets or no )"
spa38="$(echo $cinco vacio para hacer gateway ip6 a otras redes o no )"
var39="$(echo allow_dmz_ip4=no )"
eng39="$(echo $cinco void to allow dmz ip4 to one host local or no )"
spa39="$(echo $cinco vacio para permitir dmz ip4  a una host local, o no )"
var40="$(echo allow_dmz_ip6=no )"
eng40="$(echo $cinco void to allow dmz ip6 to one host local or no )"
spa40="$(echo $cinco vacio para hacer dmz ip6 a una host local o no )"
var41="$(echo allow_input_all=no )"
eng41="$(echo $cinco void when the rules are to allow input to all or no )"
spa41="$(echo $cinco vacio, reglas para permitir toda entrada o no )"
var42="$(echo allow_output_all=no )"
eng42="$(echo $cinco void when the rules are to allow output to all or no )"
spa42="$(echo $cinco vacio, reglas para permitir toda salida o no )"
var43="$(echo allow_input_state=no )"
eng43="$(echo $cinco Selective Input state with void or no )"
spa43="$(echo $cinco Estado de entrada selectivo con vacio o no )"
var44="$(echo allow_output_state=no )"
eng44="$(echo $cinco Selective Output state with void or no )"
spa44="$(echo $cinco Estado de salida selectivo con vacio o no )"
var45="$(echo allow_input_bandwidth=no )"
eng45="$(echo $cinco void to limit bandwidth input in kbits/sec for all sources or no )"
spa45="$(echo $cinco vacio para limitar ancho de banda de entrada para todas las fuentes en kbits/sec o no )"
var46="$(echo allow_output_bandwidth=no )"
eng46="$(echo $cinco void to limit bandwidth output in kbits/sec for each destination or no )"
spa46="$(echo $cinco vacio limitar ancho de banda de salida en kbits/sec por cada destino o no )"
var47="$(echo allow_input_maxconnect=no )"
eng47="$(echo $cinco void to limit max number for input simultaneous connections or no )"
spa47="$(echo $cinco vacio para limitar numero de conexiones simultaneas de entrada o no )"
var48="$(echo allow_output_maxconnect=no )"
eng48="$(echo $cinco void to limit max number for output simultaneous connections or no )"
spa48="$(echo $cinco vacio para limitar numero de conexiones simultaneas de salida o no )"
var49="$(echo allow_input_ping=no )"
eng49="$(echo $cinco void to allow RECIVE PING or no )"
spa49="$(echo $cinco vacio para permitir RECIVIR PING o no )"
var50="$(echo allow_output_ping=no )"
eng50="$(echo $cinco void to allow SEND PING or no )"
spa50="$(echo $cinco vacio para permitir ENVIAR PING o no )"
var51="$(echo allow_mac_whitelist=no )"
eng51="$(echo $cinco void to allow some exceptional MAC-ADDRESS or no )"
spa51="$(echo $cinco vacio para permitir DIRECCION-MAC excepcionales o no )"
var52="$(echo allow_mac_blacklist=no )"
eng52="$(echo $cinco void to drop some excepcional MAC-ADDRESS or no )"
spa52="$(echo $cinco vacio para denegar DIRECCION-MAC excepcionales o no )"
var53="$(echo allow_net_whitelist=no )"
eng53="$(echo $cinco void to allow some exceptional HOST/IP or no )"
spa53="$(echo $cinco vacio para permitir HOST/IP excepcionales o no )"
var54="$(echo allow_net_blacklist=no )"
eng54="$(echo $cinco void to drop some excepcional HOST/IP or no )"
spa54="$(echo $cinco vacio para denegar HOST/IP excepcionales o no )"
var55="$(echo allow_output_uid=no )"
eng55="$(echo $cinco void to allow excepcional USER or no )"
spa55="$(echo $cinco vacio permite salida de paquetes de un USUARIO excepcional o no )"
var56="$(echo allow_output_gid=no )"
eng56="$(echo $cinco void to allow excepcional GROUP or no )"
spa56="$(echo $cinco vacio permite salida de paquetes de un GRUPO excepcional o no )"
var57="$(echo allow_others_protocols=no )"
eng57="$(echo $cinco void to allow other POTOCOL-IP excepcional or no )"
spa57="$(echo $cinco vacio para permitir otro PROTOCOLO-IP excepcional o no )"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
var58="$(echo $cinco Begin Variables $cinco.......... .......... $cinco.......... )"
eng58="$(echo $cinco Fill Variables )"
spa58="$(echo $cinco Rellena Variables )"
var59="$(echo $cinco Options )"
eng59="$(echo $cinco Other Options, add with , and join ranges with : )"
spa59="$(echo $cinco Otras Opciones, añadir con , y poner rangos con : )"
# var60="$(echo config_shield_maxtries=12 )"
# eng60="$(echo $cinco modify shield with number max of tries to log in us ssh server for ip at each hour )"
# spa60="$(echo $cinco modificar escudo con los maximos intentos de logeo a nuestro servidor ssh por ip a cada hora )"
# var61="$(echo config_shield_port=22 )"
# eng61="$(echo $cinco modify shield ssh chaging maxtries port ssh o several ports with comma separate )"
# spa61="$(echo $cinco modificar escudo ssh cambiando puerto de intentos ssh o varios puertos separados por comma )"
var62="$(echo config_dmz_ip4=192.168.1.7 )"
eng62="$(echo $cinco ip server ip lan to other external nets, nat prerouting )"
spa62="$(echo $cinco servidor ip lan para otras redes esternas, nat prerouting )"
var63="$(echo config_dmz_ip6=d4:12:43:01:36:2e )"
eng63="$(echo $cinco ip server ip lan to other external nets, nat prerouting )"
spa63="$(echo $cinco servidor ip lan para otras redes esternas, nat prerouting )"
var64="$(echo config_input_state=new,related,established )"
eng64="$(echo $cinco void for all or new,related,established,untracked,invalid )"
spa64="$(echo $cinco modificar con vacio o new,related,established,untracked,invalid )"
var65="$(echo config_output_state=new,related,established )"
eng65="$(echo $cinco void for all or new,related,established,untracked,invalid )"
spa65="$(echo $cinco modificar con vacio o new,related,established,untracked,invalid )"
var66="$(echo config_input_bandwidth=12512 )"
eng66="$(echo $cinco max input bandwidth in kbits/sec for all )"
spa66="$(echo $cinco maximo entrada de ancho de banda en kbit/sec para todos )"
var67="$(echo config_output_bandwidth=512 )"
eng67="$(echo $cinco max output bandwidth in kbits/sec for each ip )"
spa67="$(echo $cinco maximo salida de ancho de banda en kbits/sec para cada ip )"
var68="$(echo config_input_maxconnect=72 )"
eng68="$(echo $cinco max number for input simultaneous connections )"
spa68="$(echo $cinco maximo numero de conexiones simultaneas de entrada )"
var69="$(echo config_output_maxconnect=72 )"
eng69="$(echo $cinco max number for output simultaneous connections )"
spa69="$(echo $cinco maximo numero de conexiones simultaneas de salida )"
var70="$(echo config_mac_whitelist=d4:12:43:01:36:2e )"
eng70="$(echo $cinco allow this excepcitonal MAC-ADRESS )"
spa70="$(echo $cinco permitir estos MAC-ADDRESS excepcionales )"
var71="$(echo config_mac_blacklist=d4:12:43:01:36:2e )"
eng71="$(echo $cinco drop this excepcional MAC-ADDRESS )"
spa71="$(echo $cinco deniega estos MAC-ADDRESS excepcionales )"
var72="$(echo config_net_whitelist=wesnoth.org,sf.net,deb.debian.org )"
eng72="$(echo $cinco allow this excepcitonal HOST/IP )"
spa72="$(echo $cinco permitir estos HOST/IP excepcionales )"
var73="$(echo config_net_blacklist=facebook.com,www.facebook.com )"
eng73="$(echo $cinco drop this excepcional HOST/IP )"
spa73="$(echo $cinco deniega estos HOST/IP excepcionales )"
var74="$(echo config_output_uid=root )"
eng74="$(echo $cinco allow out packages excepcional from this USER excepcional )"
spa74="$(echo $cinco permite salida de paquetes de este USUARIO excepcional )"
var75="$(echo config_output_gid=root )"
eng75="$(echo $cinco allow out packages excepcional from this GROUP excepcional )"
spa75="$(echo $cinco permite salida de paquetes de este GRUPO excepcional )"
var76="$(echo config_others_protocols=icmp,igmp )"
eng76="$(echo $cinco allow others protocols from /etc/protocolos )"
spa76="$(echo $cinco permitir otros protocolos desde /etc/protocols )"
var77="$(echo $cinco NET CLIENT AND NET SERVER $cinco )"
eng77="$(echo $cinco Net to connect likes client or server )"
spa77="$(echo $cinco Red para conectar como cliente o server )"
var78="$(echo net_ipv4_client=0/0 )"
eng78="$(echo $cinco the net to client ipv4, all is 0/0 )"
spa78="$(echo $cinco la red cual cliente ipv4, todos es 0/0 )"
var79="$(echo net_ipv4_server=0/0 )"
eng79="$(echo $cinco the net to server ipv4, all is 0/0 )"
spa79="$(echo $cinco la red cual servidor ipv4, todos es 0/0 )"
var80="$(echo net_ipv6_client=::/0 )"
eng80="$(echo $cinco the net to client ipv6, all is ::/0 )"
spa80="$(echo $cinco la red cual cliente ipv6, todos es ::/0 )"
var81="$(echo net_ipv6_server=::/0 )"
eng81="$(echo $cinco the net to server ipv6, all is ::/0 )"
spa81="$(echo $cinco la red cual servidor ipv6, todos es ::/0 )"
var82="$(echo $cinco $cinco )"
eng82="$(echo $cinco .......... END Optional options .......... .......... $cinco )"
spa82="$(echo $cinco FINAL .......... Opciones opcionales .......... .......... $cinco )"
####
####
##########   english: continue with autogen defaults configs cfg
##########   spanish: continua con auto genera configs cfg por defecto
####
####
#### english: where save default files #### spanish: donde se guardan los archivos
####
####
me="$defaultminicfg_eng"
ms="$defaultminicfg_spa"
fe="$defaultfullcfg_eng"
fs="$defaultfullcfg_spa"
####
####
#### wizard mini-english
####
####
echo -E "$var0"  &> $me
echo -E "$var1"  "$tabz" "$eng1"  &>> "$me"
echo -E "$var2"  "$tabz" "$eng2"  &>> "$me"
echo -E "$var3"  "$tabz" "$eng3"  &>> "$me"
echo -E "$var4"  "$tabz" "$eng4"  &>> "$me"
echo -E "$var5"  "$tabz" "$eng5"  &>> "$me"
echo -E "$var6"  "$tabz" "$eng6"  &>> "$me"
echo -E "$var7"  "$tabz" "$eng7"  &>> "$me"
echo -E "$var8"  "$tabz" "$eng8"  &>> "$me"
echo -E "$var9"  "$tabz" "$eng9"  &>> "$me"
echo -E "$var10" "$tabz" "$eng10" &>> "$me"
echo -E "$var11" "$tabz" "$eng11" &>> "$me"
echo -E "$var12" "$tabz" "$eng12" &>> "$me"
echo -E "$var13" "$tabz" "$eng13" &>> "$me"
echo -E "$var14" "$tabz" "$eng14" &>> "$me"
echo -E "$var15" "$tabz" "$eng15" &>> "$me"
echo -E "$var16" "$tabz" "$eng16" &>> "$me"
echo -E "$var17" "$tabz" "$eng17" &>> "$me"
echo -E "$var18" "$tabz" "$eng18" &>> "$me"
echo -E "$var19" "$tabz" "$eng19" &>> "$me"
echo -E "$var20" "$tabz" "$eng20" &>> "$me"
echo -E "$var21" "$tabz" "$eng21" &>> "$me"
echo -E "$var22" "$tabz" "$eng22" &>> "$me"
echo -E "$var23" "$tabz" "$eng23" &>> "$me"
echo -E "$var24" "$tabz" "$eng24" &>> "$me"
echo -E "$var25" "$tabz" "$eng25" &>> "$me"
echo -E "$var26" "$tabz" "$eng26" &>> "$me"
echo -E "$var27" "$tabz" "$eng27" &>> "$me"
####
####
#### wizard mini-spanish
####
####
echo "$var0"  &> "$ms"
echo "$var1"  "$tabz" "$spa1"  &>> "$ms"
echo "$var2"  "$tabz" "$spa2"  &>> "$ms"
echo "$var3"  "$tabz" "$spa3"  &>> "$ms"
echo "$var4"  "$tabz" "$spa4"  &>> "$ms"
echo "$var5"  "$tabz" "$spa5"  &>> "$ms"
echo "$var6"  "$tabz" "$spa6"  &>> "$ms"
echo "$var7"  "$tabz" "$spa7"  &>> "$ms"
echo "$var8"  "$tabz" "$spa8"  &>> "$ms"
echo "$var9"  "$tabz" "$spa9"  &>> "$ms"
echo "$var10" "$tabz" "$spa10" &>> "$ms"
echo "$var11" "$tabz" "$spa11" &>> "$ms"
echo "$var12" "$tabz" "$spa12" &>> "$ms"
echo "$var13" "$tabz" "$spa13" &>> "$ms"
echo "$var14" "$tabz" "$spa14" &>> "$ms"
echo "$var15" "$tabz" "$spa15" &>> "$ms"
echo "$var16" "$tabz" "$spa16" &>> "$ms"
echo "$var17" "$tabz" "$spa17" &>> "$ms"
echo "$var18" "$tabz" "$spa18" &>> "$ms"
echo "$var19" "$tabz" "$spa19" &>> "$ms"
echo "$var20" "$tabz" "$spa20" &>> "$ms"
echo "$var21" "$tabz" "$spa21" &>> "$ms"
echo "$var22" "$tabz" "$spa22" &>> "$ms"
echo "$var23" "$tabz" "$spa23" &>> "$ms"
echo "$var24" "$tabz" "$spa24" &>> "$ms"
echo "$var25" "$tabz" "$spa25" &>> "$ms"
echo "$var26" "$tabz" "$spa26" &>> "$ms"
echo "$var27" "$tabz" "$spa27" &>> "$ms"
####
####
#### wizard full-english
####
####
echo -E "$var0"  &> "$fe"
echo -E "$var1"  "$tabz" "$eng1"  &>> "$fe"
echo -E "$var2"  "$tabz" "$eng2"  &>> "$fe"
echo -E "$var3"  "$tabz" "$eng3"  &>> "$fe"
echo -E "$var4"  "$tabz" "$eng4"  &>> "$fe"
echo -E "$var5"  "$tabz" "$eng5"  &>> "$fe"
echo -E "$var6"  "$tabz" "$eng6"  &>> "$fe"
echo -E "$var7"  "$tabz" "$eng7"  &>> "$fe"
echo -E "$var8"  "$tabz" "$eng8"  &>> "$fe"
echo -E "$var9"  "$tabz" "$eng9"  &>> "$fe"
echo -E "$var10" "$tabz" "$eng10" &>> "$fe"
echo -E "$var11" "$tabz" "$eng11" &>> "$fe"
echo -E "$var12" "$tabz" "$eng12" &>> "$fe"
echo -E "$var13" "$tabz" "$eng13" &>> "$fe"
echo -E "$var14" "$tabz" "$eng14" &>> "$fe"
echo -E "$var15" "$tabz" "$eng15" &>> "$fe"
echo -E "$var16" "$tabz" "$eng16" &>> "$fe"
echo -E "$var17" "$tabz" "$eng17" &>> "$fe"
echo -E "$var18" "$tabz" "$eng18" &>> "$fe"
echo -E "$var19" "$tabz" "$eng19" &>> "$fe"
echo -E "$var20" "$tabz" "$eng20" &>> "$fe"
echo -E "$var21" "$tabz" "$eng21" &>> "$fe"
echo -E "$var22" "$tabz" "$eng22" &>> "$fe"
echo -E "$var23" "$tabz" "$eng23" &>> "$fe"
echo -E "$var24" "$tabz" "$eng24" &>> "$fe"
echo -E "$var25" "$tabz" "$eng25" &>> "$fe"
echo -E "$var26" "$tabz" "$eng26" &>> "$fe"
echo -E "$var27" "$tabz" "$eng27" &>> "$fe"
##### english: advance variables
##### spanish: avanzadas variables
echo -E "$var30" "$tabz" "$eng30" &>> "$fe"
echo -E "$var31" "$tabz" "$eng31" &>> "$fe"
echo -E "$var32" "$tabz" "$eng32" &>> "$fe"
echo -E "$var33" "$tabz" "$eng33" &>> "$fe"
echo -E "$var34" "$tabz" "$eng34" &>> "$fe"
echo -E "$var35" "$tabz" "$eng35" &>> "$fe"
echo -E "$var36" "$tabz" "$eng36" &>> "$fe"
echo -E "$var37" "$tabz" "$eng37" &>> "$fe"
echo -E "$var38" "$tabz" "$eng38" &>> "$fe"
echo -E "$var39" "$tabz" "$eng39" &>> "$fe"
echo -E "$var40" "$tabz" "$eng40" &>> "$fe"
echo -E "$var41" "$tabz" "$eng41" &>> "$fe"
echo -E "$var42" "$tabz" "$eng42" &>> "$fe"
echo -E "$var43" "$tabz" "$eng43" &>> "$fe"
echo -E "$var44" "$tabz" "$eng44" &>> "$fe"
echo -E "$var45" "$tabz" "$eng45" &>> "$fe"
echo -E "$var46" "$tabz" "$eng46" &>> "$fe"
echo -E "$var47" "$tabz" "$eng47" &>> "$fe"
echo -E "$var48" "$tabz" "$eng48" &>> "$fe"
echo -E "$var49" "$tabz" "$eng49" &>> "$fe"
echo -E "$var50" "$tabz" "$eng50" &>> "$fe"
echo -E "$var51" "$tabz" "$eng51" &>> "$fe"
echo -E "$var52" "$tabz" "$eng52" &>> "$fe"
echo -E "$var53" "$tabz" "$eng53" &>> "$fe"
echo -E "$var54" "$tabz" "$eng54" &>> "$fe"
echo -E "$var55" "$tabz" "$eng55" &>> "$fe"
echo -E "$var56" "$tabz" "$eng56" &>> "$fe"
echo -E "$var57" "$tabz" "$eng57" &>> "$fe"
echo -E "$var58" "$tabz" "$eng58" &>> "$fe"
echo -E "$var59" "$tabz" "$eng59" &>> "$fe"
echo -E "$var60" "$tabz" "$eng60" &>> "$fe"
echo -E "$var61" "$tabz" "$eng61" &>> "$fe"
echo -E "$var62" "$tabz" "$eng62" &>> "$fe"
echo -E "$var63" "$tabz" "$eng63" &>> "$fe"
echo -E "$var64" "$tabz" "$eng64" &>> "$fe"
echo -E "$var65" "$tabz" "$eng65" &>> "$fe"
echo -E "$var66" "$tabz" "$eng66" &>> "$fe"
echo -E "$var67" "$tabz" "$eng67" &>> "$fe"
echo -E "$var68" "$tabz" "$eng68" &>> "$fe"
echo -E "$var69" "$tabz" "$eng69" &>> "$fe"
echo -E "$var70" "$tabz" "$eng70" &>> "$fe"
echo -E "$var71" "$tabz" "$eng71" &>> "$fe"
echo -E "$var72" "$tabz" "$eng72" &>> "$fe"
echo -E "$var73" "$tabz" "$eng73" &>> "$fe"
echo -E "$var74" "$tabz" "$eng74" &>> "$fe"
echo -E "$var75" "$tabz" "$eng75" &>> "$fe"
echo -E "$var76" "$tabz" "$eng76" &>> "$fe"
echo -E "$var77" "$tabz" "$eng77" &>> "$fe"
echo -E "$var78" "$tabz" "$eng78" &>> "$fe"
echo -E "$var79" "$tabz" "$eng79" &>> "$fe"
echo -E "$var80" "$tabz" "$eng80" &>> "$fe"
echo -E "$var81" "$tabz" "$eng81" &>> "$fe"
echo -E "$var82" "$tabz" "$eng82" &>> "$fe"
####
####
#### wizard full-spanish
####
####
echo -E "$var0"  &> "$fs"
echo -E "$var1"  "$tabz" "$spa1" &>> "$fs"
echo -E "$var2"  "$tabz" "$spa2" &>> "$fs"
echo -E "$var3"  "$tabz" "$spa3" &>> "$fs"
echo -E "$var4"  "$tabz" "$spa4" &>> "$fs"
echo -E "$var5"  "$tabz" "$spa5" &>> "$fs"
echo -E "$var6"  "$tabz" "$spa6" &>> "$fs"
echo -E "$var7"  "$tabz" "$spa7" &>> "$fs"
echo -E "$var8"  "$tabz" "$spa8" &>> "$fs"
echo -E "$var9"  "$tabz" "$spa9" &>> "$fs"
echo -E "$var10" "$tabz" "$spa10" &>> "$fs"
echo -E "$var11" "$tabz" "$spa11" &>> "$fs"
echo -E "$var12" "$tabz" "$spa12" &>> "$fs"
echo -E "$var13" "$tabz" "$spa13" &>> "$fs"
echo -E "$var14" "$tabz" "$spa14" &>> "$fs"
echo -E "$var15" "$tabz" "$spa15" &>> "$fs"
echo -E "$var16" "$tabz" "$spa16" &>> "$fs"
echo -E "$var17" "$tabz" "$spa17" &>> "$fs"
echo -E "$var18" "$tabz" "$spa18" &>> "$fs"
echo -E "$var19" "$tabz" "$spa19" &>> "$fs"
echo -E "$var20" "$tabz" "$spa20" &>> "$fs"
echo -E "$var21" "$tabz" "$spa21" &>> "$fs"
echo -E "$var22" "$tabz" "$spa22" &>> "$fs"
echo -E "$var23" "$tabz" "$spa23" &>> "$fs"
echo -E "$var24" "$tabz" "$spa24" &>> "$fs"
echo -E "$var25" "$tabz" "$spa25" &>> "$fs"
echo -E "$var26" "$tabz" "$spa26" &>> "$fs"
echo -E "$var27" "$tabz" "$spa27" &>> "$fs"
##### english: advance variables
##### spanish: avanzadas variables
echo -E "$var30" "$tabz" "$spa30" &>> "$fs"
echo -E "$var31" "$tabz" "$spa31" &>> "$fs"
echo -E "$var32" "$tabz" "$spa32" &>> "$fs"
echo -E "$var33" "$tabz" "$spa33" &>> "$fs"
echo -E "$var34" "$tabz" "$spa34" &>> "$fs"
echo -E "$var35" "$tabz" "$spa35" &>> "$fs"
echo -E "$var36" "$tabz" "$spa36" &>> "$fs"
echo -E "$var37" "$tabz" "$spa37" &>> "$fs"
echo -E "$var38" "$tabz" "$spa38" &>> "$fs"
echo -E "$var39" "$tabz" "$spa39" &>> "$fs"
echo -E "$var40" "$tabz" "$spa40" &>> "$fs"
echo -E "$var41" "$tabz" "$spa41" &>> "$fs"
echo -E "$var42" "$tabz" "$spa42" &>> "$fs"
echo -E "$var43" "$tabz" "$spa43" &>> "$fs"
echo -E "$var44" "$tabz" "$spa44" &>> "$fs"
echo -E "$var45" "$tabz" "$spa45" &>> "$fs"
echo -E "$var46" "$tabz" "$spa46" &>> "$fs"
echo -E "$var47" "$tabz" "$spa47" &>> "$fs"
echo -E "$var48" "$tabz" "$spa48" &>> "$fs"
echo -E "$var49" "$tabz" "$spa49" &>> "$fs"
echo -E "$var50" "$tabz" "$spa50" &>> "$fs"
echo -E "$var51" "$tabz" "$spa51" &>> "$fs"
echo -E "$var52" "$tabz" "$spa52" &>> "$fs"
echo -E "$var53" "$tabz" "$spa53" &>> "$fs"
echo -E "$var54" "$tabz" "$spa54" &>> "$fs"
echo -E "$var55" "$tabz" "$spa55" &>> "$fs"
echo -E "$var56" "$tabz" "$spa56" &>> "$fs"
echo -E "$var57" "$tabz" "$spa57" &>> "$fs"
echo -E "$var58" "$tabz" "$spa58" &>> "$fs"
echo -E "$var59" "$tabz" "$spa59" &>> "$fs"
echo -E "$var60" "$tabz" "$spa60" &>> "$fs"
echo -E "$var61" "$tabz" "$spa61" &>> "$fs"
echo -E "$var62" "$tabz" "$spa62" &>> "$fs"
echo -E "$var63" "$tabz" "$spa63" &>> "$fs"
echo -E "$var64" "$tabz" "$spa64" &>> "$fs"
echo -E "$var65" "$tabz" "$spa65" &>> "$fs"
echo -E "$var66" "$tabz" "$spa66" &>> "$fs"
echo -E "$var67" "$tabz" "$spa67" &>> "$fs"
echo -E "$var68" "$tabz" "$spa68" &>> "$fs"
echo -E "$var69" "$tabz" "$spa69" &>> "$fs"
echo -E "$var70" "$tabz" "$spa70" &>> "$fs"
echo -E "$var71" "$tabz" "$spa71" &>> "$fs"
echo -E "$var72" "$tabz" "$spa72" &>> "$fs"
echo -E "$var73" "$tabz" "$spa73" &>> "$fs"
echo -E "$var74" "$tabz" "$spa74" &>> "$fs"
echo -E "$var75" "$tabz" "$spa75" &>> "$fs"
echo -E "$var76" "$tabz" "$spa76" &>> "$fs"
echo -E "$var77" "$tabz" "$spa77" &>> "$fs"
echo -E "$var78" "$tabz" "$spa78" &>> "$fs"
echo -E "$var79" "$tabz" "$spa79" &>> "$fs"
echo -E "$var80" "$tabz" "$spa80" &>> "$fs"
echo -E "$var81" "$tabz" "$spa81" &>> "$fs"
echo -E "$var82" "$tabz" "$spa82" &>> "$fs"
####
####
echo "$title_md [ _ok_ ] [ Wizard and templates cfg regenerated ]"
exit ; fi
####
####
#### :rutina-final-regen-config:
##########  english:  sane variables: for working sane         ########## 
##########  spanish:  sana variables: para funcionamiento sano ##########
#### :rutina-inicial-sane:
####
####
case "$NULL" in "$allow_autosave")         ;;  *)  allow_autosave="no" ;;  esac
case "$NULL" in "$allow_dmz_ip4")          ;;  *)  allow_dmz_ip4="no" ;; esac
case "$NULL" in "$allow_dmz_ip6")          ;;  *)  allow_dmz_ip6="no" ;; esac
case "$NULL" in "$allow_forward_ip4")      ;;  *)  allow_forward_ip4="no" ;; esac
case "$NULL" in "$allow_forward_ip6")      ;;  *)  allow_forward_ip6="no" ;; esac
case "$NULL" in "$allow_gateway_ip4")      ;;  *)  allow_gateway_ip4="no" ;; esac
case "$NULL" in "$allow_gateway_ip6")      ;;  *)  allow_gateway_ip6="no" ;; esac
case "$NULL" in "$allow_input_all")        ;;  *)  allow_input_all="no";; esac
case "$NULL" in "$allow_input_bandwidth")  ;;  *)  allow_input_bandwidth="no";; esac
case "$NULL" in "$allow_input_maxconnect") ;;  *)  allow_input_maxconnect="no";; esac
case "$NULL" in "$allow_input_ping")       ;;  *)  allow_input_ping="no";; esac
case "$NULL" in "$allow_input_state")      ;;  *)  allow_input_state="no";; esac
case "$NULL" in "$allow_use_ipv4")         ;;  *)  allow_use_ipv4="no" ;; esac
case "$NULL" in "$allow_use_ipv6")         ;;  *)  allow_use_ipv6="no" ;; esac
case "$NULL" in "$allow_use_legacy")       ;;  *)  allow_use_legacy="no" ;; esac
case "$NULL" in "$allow_mac_blacklist")    ;;  *)  allow_mac_blacklist="no" ;; esac
case "$NULL" in "$allow_mac_whitelist")    ;;  *)  allow_mac_whitelist="no" ;; esac
case "$NULL" in "$allow_shield_maxtries")  ;;  *)  allow_shield_maxtries="no" ;; esac
case "$NULL" in "$allow_net_blacklist")    ;;  *)  allow_net_blacklist="no";; esac
case "$NULL" in "$allow_net_whitelist")    ;;  *)  allow_net_whitelist="no";; esac
case "$NULL" in "$allow_use_nft")          ;;  *)  allow_use_nft="no" ;; esac
case "$NULL" in "$allow_only_output")      ;;  *)  allow_only_output="no" ;; esac
case "$NULL" in "$allow_other_protocols")  ;;  *)  allow_other_protocols="no";; esac
case "$NULL" in "$allow_others_protocols") ;;  *)  allow_others_protocols="no" ;; esac
case "$NULL" in "$allow_output_all")       ;;  *)  allow_output_all="no";; esac
case "$NULL" in "$allow_output_bandwidth") ;;  *)  allow_output_bandwidth="no";; esac
case "$NULL" in "$allow_output_gid")       ;;  *)  allow_output_gid="no";; esac
case "$NULL" in "$allow_output_maxconnect");;  *)  allow_output_maxconnect="no";; esac
case "$NULL" in "$allow_output_ping")      ;;  *)  allow_output_ping="no";; esac
case "$NULL" in "$allow_output_state")     ;;  *)  allow_output_state="no";; esac
case "$NULL" in "$allow_output_uid")       ;;  *)  allow_output_uid="no";; esac
case "$NULL" in "$choosed_iptables")       ;;  *)  choosed_iptables="no";; esac
case "$NULL" in "$launch_rules_firewall")  ;;  *)  launch_rules_firewall="no" ;; esac
case "$NULL" in "$name_firewall")          ;;  *)  name_firewall="no" ;; esac
case "$NULL" in "$type_firewall")          ;;  *)  type_firewall="no" ;; esac
####
####
#### :rutina-final-sane:
##########    english: autosave: autosave of firewall to restore standard rules                 ##########
##########    english: autosave: autoguardado de firewall para recuperador de reglas estandar   ##########
#### :rutina-inicial-autosave:
####
####
#### english: iptables saved
#### spanish: iptables guardado
####
####
#### english: autosave with name autosave
#### spanish: autoguardado con nombre autosave
####
####
if [ "$first_option" == "autosave" ] && [ "$allow_autosave" == "$NULL" ]; then 
echo "$title_md [ autosave ] [ firewall saved ] [ autosave-fwiptables ]" ;
$cmd_binary save autosave-fwiptables &> /dev/null ; exit; fi
####
####
#### :rutina-final-autosave:
##########    english: ntp: update the date and time    ##########
##########    spanish: ntp: actualiza la fecha y hora   ##########
#### :rutina-inicial-ntp:
####
####
if   [ "$first_option" == "ntp" ]; then 
echo "$title_md [ $first_option ]  [ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]; then echo "$tab [ fail ] [ Install one ntp client ]" ; fi
echo "$tab Old date: $($command_date)"
echo "$tab [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $($command_date)"
exit; fi
####
####
#### :rutina-final-ntp:
##########    english: list-options: wellcome with semi help    ##########
##########    spanish: list-options: bienvenida con semi ayuda  ##########
#### :rutina-inicial-list-options:
####
####
if [ "$first_option" == "list-options" ] ; then 
echo "$title_md $cmd_file [optional-output] first_option [second_option]                  "
echo "$title_md"
echo "$title_md  [ optional-output ]                                                            "
echo "$text_md [ -t|-txt -c|-cli -g|-gui -l|-log -s|-silent ]                                       "
echo "$text_md [ -cli-dialog -cli-whiptail ] [ -gui-zenity -gui-yad ]                               "
echo "$text_md [ -cli-menu-dialog -cli-menu-whiptail ] [ -gui-roll-zenity ]                         "
echo "$text_md [ -gui-menu-zenity -gui-menu-yad -gui-shell-zenity -gui-shell-yad ]                  "
echo "$title_md"
echo "$title_md  [ firewall-control ]                                                           "
echo "$text_md stop continue reset actual show save load names-control                              "
echo "$title_md  [ firewall-conceptual ]                                                        "
echo "$text_md ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6                  "
echo "$text_md list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6                    "
echo "$text_md list-security4 list-security6 list-ebtables list-arptables                           "
echo "$title_md  [ firewall-numeral ]                                                           "
echo "$text_md lsn4 lsn6 listn4 listn6 statusn listn-alltables listn-filter4 listn-filter6          "
echo "$text_md listn-nat4 listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6              "
echo "$text_md listn-security4 listn-security6                                                      "
echo "$title_md  [ firewall-custom ] "
echo "$text_md custom clone-static eraserules off-line all-permisive wizard-mini wizard-full        "
echo "$text_md new-full-config nueva-completa-config new-mini-config nueva-mini-config       "
echo "$text_md regen-config examples-config show-config modify-config del-config names-config       "
echo "$title_md  [ firewall-static ]                                                           "
echo "$text_md client-basic client-web client-git client-ipp client-irc client-vnc client-mail      "
echo "$text_md client-news client-vpn client-torrent client-vpn client-ftp client-tor               "
echo "$text_md client-proxy game-widelands games-udp games-shooter game-wesnoth game-minetest       "
echo "$text_md game-freeciv lan-tor lan-vpn server-ssh server-irc server-samba server-vnc           "
echo "$text_md server-print server-lamp server-news server-ftp server-mail server-webserver         "
echo "$text_md server-teamspeak server-mumble server-sql server-asterisk server-domain server-proxy "
echo "$title_md  [ options-easy ]                                                              "
echo "$text_md preferences-read preferences-modify preferences-regen preferences-example ver        "
echo "$text_md list-options clasic-options info-options filelog autolog speed-ip4 speed-ip6         "
echo "$text_md ip4 ip6 speed-glx sockets nodes geoip webcert date free expert version notes         "
echo "$text_md radio compile ip-forward depends info code info examples commands variables          "
echo "$text_md intro clean-tmp download install uninstall pc-halt pc-shutdown pc-reboot             "
echo "$title_md            ||| Example info: fwiptables-cmd -gui-shell-yad |||                "
echo "$title_md            ||| Example info: fwiptables-cmd -gui-zenity info list |||         "
exit ; fi
####
####
#### :rutina-final-list-options:
##########    english: clasic-options: wellcome with semi help    ##########
##########    spanish: clasic-options: bienvenida con semi ayuda  ##########
#### :rutina-inicial-clasic-options:
####
####
if   [ "$first_option" == "clasic-options" ] ; then  
echo "$title_md $cmd_file [optional-output] first_option [second_option] "
echo "$title_md"
echo "$text_md    optional-paramtter "
echo "$text_md [ -t|-txt -c|-cli -g|-gui -l|-log -s|-silent ]"
echo "$text_md [ -cli-dialog -cli-whiptail ] [ -gui-zenity -gui-yad ]"
echo "$text_md [ -cli-menu-dialog -cli-menu-whiptail ] [ -gui-roll-zenity ]"
echo "$text_md [ -gui-menu-zenity -gui-menu-yad -gui-shell-zenity -gui-shell-yad ]"
echo "$title_md"
echo "$text_md    firewall-control |  stop continue reset actual show save load names-control"
echo "$text_md firewall-conceptual |  ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6"
echo "$text_md                        list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6"
echo "$text_md                        list-security4 list-security6 list-ebtables list-arptables"
echo "$text_md    firewall-numeral |  lsn4 lsn6 listn4 listn6 statusn listn-alltables listn-filter4"
echo "$text_md                        listn-filter6 listn-nat4 listn-nat6 listn-raw4 listn-raw6"
echo "$text_md                        listn-mangle4  listn-mangle6 listn-security4 listn-security6"
echo "$text_md     firewall-custom |  custom eraserules wizard-mini wizard-full off-line all-permisive"
echo "$text_md     		      clone-static new-full-config nueva-completa-config names-config "
echo "$text_md                        modify-config new-mini-config nueva-mini-config examples-config"
echo "$text_md                        show-config del-config "
echo "$text_md     firewall-static |  client-basic games-udp games-shooter game-wesnoth game-minetest"
echo "$text_md                        game-freeciv game-widelands client-web client-irc client-vnc"
echo "$text_md                        client-mail client-news client-torrent client-vpn client-ftp"
echo "$text_md                        client-tor client-ipp client-proxy client-git lan-tor lan-vpn"
echo "$text_md                        server-ssh server-samba server-vnc server-webserver server-print"
echo "$text_md                        server-lamp server-news server-ftp server-mail server-teamspeak"
echo "$text_md                        server-mumble server-sql server-asterisk server-domain "
echo "$text_md                        server-proxy server-irc          "
echo "$text_md        options-easy |  preferences-read preferences-modify preferences-regen preferences-example"
echo "$text_md                        list-options clasic-options info-options filelog autolog ip4 ip6 "
echo "$text_md                        sockets nodes geoip date free ver version notes depends commands "
echo "$text_md                        ip-forward speed-ip4 speed-ip6 speed-glx code radio expert ver"
echo "$text_md                        variables examples intro webcert clean-tmp radio info download   "
echo "$text_md                        compile license install uninstall pc-halt pc-shutdown pc-reboot  "
echo "$title_md                       ||| Example info: fwiptables-cmd -gui-shell-yad ls4 |||     "
echo "$title_md                       ||| Example info: fwiptables-cmd -gui-zenity info list |||  "
exit ; fi
####
####
#### :rutina-final-clasic-options:
##########     english: code: source from loop     ##########
##########     spanish: code: fuente de la rutina  ##########
#### :rutina-inicial-code:
####
####
if   [ "$first_option" == "code" ]; then 
echo "$title_md [ $first_option ]  [ Show source code for each option ] "
echo "$title_md [ info ] [ code ] [ show source code for options from $cmd_binary ]"
code_error="$title_md [ info ] [ Usage ] [ $cmd_binary code option_choosed ]"
if [ "$second_option" == "$NULL" ]; then echo "$code_error" ; echo
salida_code="$(cat $cmd_binary | $command_grep -i  rutina-inicial \
| $command_grep -i -v cat | $command_sed -s s/####\ :rutina-inicial-//g | \
sort | $command_sed -s s/://g )"
echo $salida_code
exit ; fi
value_first="$(cat -n $cmd_binary | $command_grep  :rutina-inicial-$2: | cut -d "#" -f 1 | head -1)"
value_second="$(cat -n $cmd_binary | $command_grep :rutina-final-$2:  | cut -d "#" -f 1 | head -1)"
value_count="$(("$value_second"-"$value_first+1"))"
if [ ! -n "$value_first" ];   then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_second" ];  then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_count" ];   then echo; echo "$code_error" ; exit ; fi
echo "$title_md [ code ] [ option: "$second_option" ] [ show $value_count lines ] \
[ from the "$value_first" line number to "$value_second" line number ]"
echo
cat $cmd_binary | head -n $value_second | tail -n $value_count
exit; fi
####
####
#### :rutina-final-code:
##########    english: names-config: list some config       ##########
##########    spanish: names-config: lista alguna config    ##########
#### :rutina-inicial-names-config:
####
####
if [ "$first_option" == "names-config" ]; then 
echo "$title_md [ $first_option ] [ List configs cfg ] "
echo "$title_md [ info ] [ list configs files in cfg format ]"
echo "$title_md [ info ] [ folder ] [ $directory_config ]"
echo "$title_md"
default_files_cfg="default-full-english.cfg|default-full-spanish.cfg\
|default-mini-english|default-mini-spanish|wizard-full|wizard-mini|nodefault-tmp"
echo "$title_md"
echo "$title_md [ System files ]"
$command_ls -1 $directory_config/ | $command_grep -E -i $default_files_cfg
echo "$title_md"
echo "$title_md [ User files ]"
$command_ls -1 $directory_config/ | $command_grep -E -iv $default_files_cfg
echo "$title_md"
echo "$title_md [ OK CFG FILES NAMES ] [ Use: $cmd_binary custom file-cfg ]"
exit; fi
####
####
#### :rutina-final-names-config:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]; then $nada
read -p '##### [ _ok_ ] ##### Press [enter] to continue now with the cli-menu ##### '
exit; fi
####
####
#### :rutina-final-text-pause:
##########    english: free: give one freedom to ram innecesary     ##########
##########    spanish: free: limpia la memoria ram                  ##########
#### :rutina-inicial-free:
####
####
if   [ "$first_option" == "free" ]; then 
echo "$title_md [ $first_option ]  [ freedom from innecesary ram ] "
case $command_tee in "$NULL") echo "$tab [ fail ] [ Install tee command ]"; exit ;; esac
echo "$title_md [ info ] Actual Memory"
free -hw 
echo 3 | $command_tee /proc/sys/vm/drop_caches &> /dev/null
sync
echo "$title_md [ info ] Now with New Memory ram freedom .. Actual memory now .."
free -hw
exit; fi
####
####
#### :rutina-final-free:
##########    english: firewall-control: options for fwiptables firewall      ##########
##########    spanish: firewall-control: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-control:
####
####
if   [ "$first_option" == "firewall-control" ]; then
echo "$text_md "
echo "$title_md | firewall-control | $cmd_file firewall-control |"
echo "$text_md"
echo "$text_md stop . remove the rules iptables, and save it to then if continue"
echo "$text_md continue. reset and load latest rules iptables loaded"
echo "$text_md load . reset rules iptables actually"
echo "$text_md actual . show the rules iptables from actually"	
echo "$text_md show . show the rules iptables from selected file"
echo "$text_md load . reset and load new rules iptables from selected file"
echo "$text_md save . save in the file selected the rules iptables actually"
echo "$text_md names-control . list filenames saved in the iptables rules"
echo "$text_md "
exit; fi
####
####
#### :rutina-final-firewall-control:
##########    english: firewall-conceptual: options for fwiptables firewall      ##########
##########    spanish: firewall-conceptual: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-conceptual:
####
####
if   [ "$first_option" == "firewall-conceptual" ]; then
echo "$text_md "
echo "$title_md | firewall-conceptual | $cmd_file firewall-conceptual |"
echo "$text_md"
echo "$text_md ls4 . list filter rules ipv4 "
echo "$text_md ls6 . list filter rules ipv6 "
echo "$text_md list4 . list filter rules ipv4 "
echo "$text_md list6 . list filter rules ipv6 "
echo "$text_md status . list filter rules ipv4 , rules ipv6"
echo "$text_md list-alltables . list all tables for rules ipv4, rules ipv6 "
echo "$text_md list-filter4 . list filter rules ipv4 "
echo "$text_md list-filter6 . list filter rules ipv6 "
echo "$text_md list-nat4 . list nat rules ipv4 "
echo "$text_md list-nat6 . list nat rules ipv6 "
echo "$text_md list-raw4 . list raw rules ipv4 "
echo "$text_md list-raw6 . list raw rules ipv6 "
echo "$text_md list-mangle4 . list mangle rules ipv4 "
echo "$text_md list-mangle6 . list mangle rules ipv6 "
echo "$text_md list-security4 . list security rules ipv4 "
echo "$text_md list-security6 . list security rules ipv6 "
echo "$text_md list-ebtables . list ebtables rules ipv4 "
echo "$text_md list-arptables . list arptables rules ipv6 "
echo "$text_md"
exit; fi
####
####
#### :rutina-final-firewall-conceptual:
##########    english: firewall-numeral: options for fwiptables firewall      ##########
##########    spanish: firewall-numeral: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-numeral:
####
####
if   [ "$first_option" == "firewall-numeral" ]; then
echo "$text_md "
echo "$title_md | firewall-numeral | $cmd_file firewall-numeral |"
echo "$text_md"
echo "$text_md lsn4 . list filter rules ipv4 with numbers"
echo "$text_md lsn6 . list filter rules ipv6 with numbers"
echo "$text_md listn4 . list filter rules ipv4 with numbers"
echo "$text_md listn6 . list filter rules ipv6 with numbers"
echo "$text_md statusn . list filter rules ipv4 , rules ipv6 with numbers"
echo "$text_md listn-alltables . list all tables for rules ipv4, rules ipv6 with numbers"
echo "$text_md listn-filter4 . list filter rules ipv4 with numbers"
echo "$text_md listn-filter6 . list filter rules ipv6 with numbers"
echo "$text_md listn-nat4 . list nat rules ipv4 with numbers"
echo "$text_md listn-nat6 . list nat rules ipv6 with numbers"
echo "$text_md listn-raw4 . list raw rules ipv4 with numbers"
echo "$text_md listn-raw6 . list raw rules ipv6 with numbers"
echo "$text_md listn-mangle4 . list mangle rules ipv4 with numbers"
echo "$text_md listn-mangle6 . list mangle rules ipv6 with numbers"
echo "$text_md listn-security4 . list security rules ipv4 with numbers"
echo "$text_md listn-security6 . list security rules ipv6 with numbers"
echo "$text_md listn-ebtables . list ebtables rules ipv4 with numbers"
echo "$text_md listn-arptables . list arptables rules ipv6 with numbers"
echo "$text_md"
exit; fi
####
####
#### :rutina-final-firewall-numeral:
##########    english: firewall-custom: options for fwiptables firewall      ##########
##########    spanish: firewall-custom: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-custom:
####
####
if   [ "$first_option" == "firewall-custom" ]; then
echo "$text_md "
echo "$title_md | firewall-custom | $cmd_file firewall-custom |"
echo "$text_md"
echo "$text_md eraserules . remove all firewall rules"
echo "$text_md custom . launch a one one-file saved custom"
echo "$text_md clone-static . clone a static firewall predesignated"
echo "$text_md wizard-mini . launch a one mini wizard to run iptables rules"
echo "$text_md wizard-full . launch a one full wizard to run iptables rules"
echo "$text_md off-line . launch a one firewall only for localhost"
echo "$text_md all-permisive . launch a one firewall with all permisive"
echo "$text_md new-full-config . create new full config in english"
echo "$text_md new-mini-config . create new mini config in english"
echo "$text_md nueva-completa-config . create new full config in spanish"
echo "$text_md nueva-mini-config . create new full config in spanish"
echo "$text_md regen-config . regen the templates"
echo "$text_md examples-config . show several examples"
echo "$text_md show-config . show config-file choosed"
echo "$text_md modify-config . modify config-file choosed"
echo "$text_md del-config . delete config-file choosed"
echo "$text_md names-config . show the names for all config-files"
echo "$text_md "
exit; fi
####
####
#### :rutina-final-firewall-custom:
##########    english: firewall-static: options for fwiptables firewall      ##########
##########    spanish: firewall-static: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-static:
####
####
if   [ "$first_option" == "firewall-static" ]; then
echo "$text_md "
echo "$title_md | firewall-static | $cmd_file firewall-static |"
echo "$text_md"
echo "$text_md client-basic . launch a one firewall basic client"
echo "$text_md client-web . launch a one firewall web client"
echo "$text_md client-git . launch a one firewall git client"
echo "$text_md client-ipp . launch a one firewall ipp client"
echo "$text_md client-vnc . launch a one firewall vnc client"
echo "$text_md client-mail . launch a one firewall mail client"
echo "$text_md client-news . launch a one firewall news client"
echo "$text_md client-vpn . launch a one firewall vpn client"
echo "$text_md client-proxy . launch a one firewall proxy client"
echo "$text_md games-udp . launch a one firewall udp client"
echo "$text_md games-shooter . launch a one firewall shooter client"
echo "$text_md games-wesnoth . launch a one firewall wesnoth client"
echo "$text_md games-minetest . launch a one firewall minetest client"
echo "$text_md games-freeciv . launch a one firewall freeciv client"
echo "$text_md lan-tor . launch a one firewall only tor client"
echo "$text_md lan-vpn . launch a one firewall only vpn client"
echo "$text_md server-ssh . launch a one firewall basic server"
echo "$text_md server-samba . launch a one firewall basic server"
echo "$text_md server-vnc . launch a one firewall basic server"
echo "$text_md server-webserver . launch a one firewall basic server"
echo "$text_md server-print . launch a one firewall basic server"
echo "$text_md server-lamp . launch a one firewall basic server"
echo "$text_md server-news . launch a one firewall basic server"
echo "$text_md server-ftp . launch a one firewall basic server"
echo "$text_md server-mail . launch a one firewall basic server"
echo "$text_md server-teamspeak . launch a one firewall basic server"
echo "$text_md server-mumble . launch a one firewall basic server"
echo "$text_md server-ssh . launch a one firewall basic server"
echo "$text_md server-sql . launch a one firewall basic server"
echo "$text_md server-asterisk . launch a one firewall basic server"
echo "$text_md server-domain . launch a one firewall basic server"
echo "$text_md server-proxy . launch a one firewall basic server"
exit; fi
####
####
#### :rutina-final-firewall-static:
##########    english: options-easy: options for fwiptables firewall      ##########
##########    spanish: options-easy: opciones para fwiptables firewall    ##########
#### :rutina-inicial-options-easy:
####
####
if   [ "$first_option" == "options-easy" ]; then
echo "$text_md "
echo "$title_md | options-easy | $cmd_file option-easy |"
echo "$text_md"
echo "$text_md preferences-read . show the preferences for fwiptables"
echo "$text_md preferences-modify . modify the preferences for fwiptables"
echo "$text_md preferences-regen . recover the initials preferences for fwiptables"
echo "$text_md preferences-example . show the examples for fwiptables preference"
echo "$text_md list-options . list options "
echo "$text_md clasic-options . list options "
echo "$text_md info-options . list details for the options"
echo "$text_md info . details from one first option from one pattern"
echo "$text_md filelog . show the result for the commands save with -l|-log"
echo "$text_md autolog . list the commands launched"
echo "$text_md ip4 . show details from connection ipv4"
echo "$text_md ip6 . show details from connection ipv6"
echo "$text_md speed-ip4 . calculate bandwith ipv4"
echo "$text_md speed-ip6 . calculate bandwith ipv6"
echo "$text_md speed-glx . calculate speed for graphics"
echo "$text_md sockets . show the sockets listening"
echo "$text_md nodes . show computers connected to lan"
echo "$text_md geoip . show location for ip o for host"
echo "$text_md webcert . get the ssl certificate to one web"
echo "$text_md date . update the time and date from internet"
echo "$text_md free . freedom innecesary ram"
echo "$text_md ver. show version"
echo "$text_md version . show version and several details"
echo "$text_md notes . several notes for internet"
echo "$text_md radio . listen radio from internet"
echo "$text_md compile . show howto comopile bash script"
echo "$text_md ip-forward . list or active or desactive forward variables"
echo "$text_md depends . principal dependences"
echo "$text_md license . license"
echo "$text_md code . show source code from one option"
echo "$text_md examples . show examples"
echo "$text_md commands . possible commands"
echo "$text_md variables . possible variables"
echo "$text_md intro . intro"
echo "$text_md clean-tmp . clean temporals"
echo "$text_md download . show where you can download fwiptables"
echo "$text_md install . install fwiptables"
echo "$text_md uninstall . uninstall fwiptables"
echo "$text_md pc-halt . halt computer"
echo "$text_md pc-shutdown . shutdown computer"
echo "$text_md pc-reboot . reboot computer"
echo "$text_md "
exit; fi
####
####
#### :rutina-final-options-easy:
##########    english: info-options: options for fwiptables firewall      ##########
##########    spanish: info-options: opciones para fwiptables firewall    ##########
#### :rutina-inicial-info-options:
####
####
if   [ "$first_option" == "info-options" ]; then 
echo "$title_md [ $first_option ]  [ info options for firewall iptables ] "
echo "$text_md"
echo "$title_md           Firewall fwiptables-cmd info-options ... $cmd_version"
echo "$text_md"
$cmd_binary optional-output
$cmd_binary firewall-control
$cmd_binary firewall-conceptual
$cmd_binary firewall-numeral
$cmd_binary firewall-custom
$cmd_binary firewall-static
$cmd_binary options-easy
echo "$text_md"
exit; fi
####
####
#### :rutina-final-info-options:
##########    english: parametters: options for fwiptables firewall      ##########
##########    spanish: parametters: opciones para fwiptables firewall    ##########
#### :rutina-inicial-parametters:
####
####
if   [ "$first_option" == "optional-output" ]; then
echo "$text_md "
echo "$title_md | optional-output | $cmd_file optional-ouptut |"
echo "$text_md"
echo "$text_md -t . output in terminal text "
echo "$text_md -c . output in terminal cli "
echo "$text_md -g . output in graphicall gui "
echo "$text_md -l . output in file log stablished"
echo "$text_md -s . output in silent text "
echo "$text_md -txt . output in terminal text "
echo "$text_md -cli . output in terminal cli "
echo "$text_md -gui . output in graphicall gui "
echo "$text_md -log . output in file log stablished"
echo "$text_md -silent . output in silent text "
echo "$text_md -cli-dialog . output in terminal cli with dialog"
echo "$text_md -cli-whiptail . output in terminal cli with whiptail"
echo "$text_md -gui-zenity . output in graphicall gui with zenity "
echo "$text_md -gui-yad . output in graphicall gui with yad"
echo "$text_md -cli-menu-dialog . output in terminal menu with dialog"
echo "$text_md -cli-menu-whiptail . output in terminal menu with whiptail"
echo "$text_md -gui-menu-zenity . output in grapicall menu with zenity "
echo "$text_md -gui-menu-yad . output in grapicall menu with yad "
echo "$text_md -gui-shell-zenity . output in grapicall shell with zenity "
echo "$text_md -gui-shell-yad . output in grapicall shell with yad "
echo "$text_md -gui-roll-zenity . output in grapicall roll with zenity "
echo "$text_md"
exit; fi
####
####
#### :rutina-final-parametters:
##########    english: variables: list variables     ##########
##########    spanish: variables: lista variables    ##########
#### :rutina-inicial-variables:
####
####
if   [ "$first_option" == "variables" ]; then 
echo "$title_md [ $first_option ]  [ list variables firewall fwiptables] "
echo "$text_md"
echo "$title_md           Firewall fwiptables-cmd variables ... $cmd_version"
echo "$text_md "
echo "$text_md list_rules_conceptual       # void or no . rules with names or numbers"
echo "$text_md"
echo "$text_md config_ip4_localhost        # void or no . with ipv4 support or no"
echo "$text_md"
echo "$text_md config_ip6_localhost        # void or no . with ipv6 support or no"
echo "$text_md"
echo "$text_md client_port_tcp             # example: ports1,ports2,range-begin:range-end"
echo "$text_md"
echo "$text_md client_port_udp             # example: ports1,ports2,range-begin:range-end"
echo "$text_md"
echo "$text_md server_port_tcp             # example: ports1,ports2,range-begin:range-end"
echo "$text_md"
echo "$text_md server_port_udp             # example: ports1,ports2,range-begin:range-end"
echo "$text_md"
echo "$text_md logserver_prefix_input      # prefix to save logs in input port"
echo "$text_md"
echo "$text_md logserver_prefix_output     # prefix to save logs in output port"
echo "$text_md"
echo "$text_md logserver_port_tcp          # void or no . allow log tcp or no "
echo "$text_md"
echo "$text_md logserver_port_udp          # void or no . allow log udp or no"
echo "$text_md"
echo "$text_md time_server_waiting         # numbers in seconds to some easy utils"
echo "$text_md"
echo "$text_md allow_dmz_ip4               # void or no . allow dmz is forward to ip4"
echo "$text_md"
echo "$text_md allow_dmz_ip6               # void or no . allow dmz is forward to ip6"
echo "$text_md"
echo "$text_md allow_forward_ip4           # void or no . void to allow gateway ip4 or no"
echo "$text_md"
echo "$text_md allow_forward_ip6           # void or no . void to allow forward ip6 or no"
echo "$text_md"
echo "$text_md allow_gateway_ip4           # void or no . void to allow gateway ip4 or no"
echo "$text_md"
echo "$text_md allow_gateway_ip6           # void or no . void to allow gateway ip6 or no"
echo "$text_md"
echo "$text_md allow_input_all             # void or no . void to allow input all"
echo "$text_md"
echo "$text_md allow_input_bandwidth       # void or no . void to allow input bandwidth simultaneus"
echo "$text_md"
echo "$text_md allow_input_maxconnect      # void or no . void to allow input maxconnect simultaneus"
echo "$text_md"
echo "$text_md allow_input_ping            # void or no . void to allow input ping"
echo "$text_md"
echo "$text_md allow_input_state           # void or no . void to allow input state config with other variable"
echo "$text_md"
echo "$text_md allow_shield_maxtries       # void or no . void to allow shield maxtries or no"
echo "$text_md"
echo "$text_md allow_mac_blacklist         # void or no . void to allow mac blacklist or no"
echo "$text_md"
echo "$text_md echo allow_mac_whitelist    # void or no . void to allow mac whitelist or no"
echo "$text_md"
echo "$text_md allow_net_blacklist         # void or no . void to allow net blacklist or no"
echo "$text_md"
echo "$text_md allow_net_whitelist         # void or no . void to allow net whitelist or no"
echo "$text_md"
echo "$text_md allow_others_protocols      # void or no . void to allow other protocols or no"
echo "$text_md"
echo "$text_md allow_output_all            # void or no . void to allow output all or no"
echo "$text_md"
echo "$text_md allow_output_bandwidth      # void or no . void to allow output bandwidth or no"
echo "$text_md"
echo "$text_md allow_output_maxconnect     # void or no . void to allow output maxconnect or no"
echo "$text_md"
echo "$text_md allow_output_ping           # void or no . void to allow output ping or no"
echo "$text_md"
echo "$text_md allow_output_state          # void or no . void to allow output state defined later or no"
echo "$text_md"
echo "$text_md allow_output_uid            # void or no . void to allow output uid or no"
echo "$text_md"
echo "$text_md allow_output_gid            # void or no . void to allow output gid or no"
echo "$text_md"
echo "$text_md config_dmz_ip4              # Destination NAT"
echo "$text_md"
echo "$text_md config_dmz_ip6              # Destination NAT"
echo "$text_md"
echo "$text_md config_input_bandwidth      # max kbits/sec for all input . Example 12512"
echo "$text_md"
echo "$text_md config_input_maxconnect     # max number conection for input at the same time . Example 72"
echo "$text_md"
echo "$text_md config_output_bandwidth     # max kbits/sec for all ouptput . Example 12512"
echo "$text_md"
echo "$text_md config_output_maxconnect    # max number conection for input at the same time . Example 72"
echo "$text_md"
echo "$text_md config_input_state          # modify with some of new,related,established,untracked,invalid"
echo "$text_md"
echo "$text_md config_output_state         # modify with some of new,related,established,untracked,invalid"
echo "$text_md"
echo "$text_md config_shield_maxtries      # max tries to login for each hour . Example 20"
echo "$text_md"
echo "$text_md config_mac_blacklist        # mac blacklist"
echo "$text_md"
echo "$text_md config_mac_whitelist        # mac whitelist"
echo "$text_md"
echo "$text_md config_net_blacklist        # ip/host blacklist"
echo "$text_md"
echo "$text_md config_net_whitelist        # ip/host blacklist"
echo "$text_md"
echo "$text_md config_others_protocols     # allow other protocols . Example icmp,igmp"
echo "$text_md"
echo "$text_md config_output_uid           # output gid . Example user"
echo "$text_md"
echo "$text_md config_output_gid           # output gid . Example users"
echo "$text_md"
echo "$text_md net_ipv4_client             # only client ipv4 for ip or host or range . Example 192.168.0.1/8,10.0.0.1/16,127.0.0.1"
echo "$text_md"
echo "$text_md net_ipv4_server             # only server ipv4 for ip or host or range . Example 192.168.0.1/8"
echo "$text_md"
echo "$text_md net_ipv6_client             # only client ipv6 for ip or host or range"
echo "$text_md"
echo "$text_md net_ipv6_server             # only server ipv6 for ip or host or range"
echo "$text_md"
echo "$text_md"
exit; fi
####
####
#### :rutina-final-variables:
##########    english: commands: list commands     ##########
##########    spanish: commands: lista commands    ##########
#### :rutina-inicial-commands:
####
####
if   [ "$first_option" == "commands" ]; then 
echo "$title_md [ $first_option ]  [ list commands possible depends ] "
echo "##########     commands possible depends  ##########"
echo "$text_md"
echo "$text_md arp              # optional"
echo "$text_md"
echo "$text_md arp_scan         # necesary in option nodes"
echo "$text_md"
echo "$text_md arptables        # optional in firewall"
echo "$text_md"
echo "$text_md bash             # necesary"
echo "$text_md"
echo "$text_md curl             # optional in options ip4 and ip6"
echo "$text_md"
echo "$text_md cut              # necesary in some options"
echo "$text_md"
echo "$text_md date             # necesary in option date"
echo "$text_md"
echo "$text_md dialog           # posible necesary in option cli-menu and option cli"
echo "$text_md"
echo "$text_md ebtables         # optional in firewall"
echo "$text_md"
echo "$text_md egrep            # necesary"
echo "$text_md"
echo "$text_md editor           # posible in option cli-menu and option cli"
echo "$text_md"
echo "$text_md elinks           # posible in optional text browser and readme"
echo "$text_md"
echo "$text_md find             # necesary in option ip4 and option ip6"
echo "$text_md"
echo "$text_md geoiplookup      # necesary in option geoip"
echo "$text_md"
echo "$text_md glxgears         # necesary in option speed_glx"
echo "$text_md"
echo "$text_md grep             # necesary"
echo "$text_md"
echo "$text_md halt             # necesary in option pc-halt"
echo "$text_md"
echo "$text_md ip               # optional in options nodes,ip4,ip6"
echo "$text_md"
echo "$text_md ip6tables_legacy # necesary to run fwiptables"
echo "$text_md"
echo "$text_md ip6tables_nft    # necesary to run fwiptables"
echo "$text_md"
echo "$text_md iperf            # necesary in option speed_ip4 and speed_ip6"
echo "$text_md"
echo "$text_md iptables_legacy  # necesary to run fwiptables"
echo "$text_md"
echo "$text_md iptables_nft     # necesary to run fwiptables"
echo "$text_md"
echo "$text_md links            # posible in option text browser"
echo "$text_md"
echo "$text_md links2           # posible in option text browser"
echo "$text_md"
echo "$text_md ls               # necesary"
echo "$text_md"
echo "$text_md lynx             # posible in option text browser"
echo "$text_md"
echo "$text_md md5sum           # optional in option version"
echo "$text_md"
echo "$text_md nano             # posible in option cli-menu and option cli"
echo "$text_md"
echo "$text_md openssl          # necesary in option webcert"
echo "$text_md"
echo "$text_md pico             # posible in option cli-menu and option cli"
echo "$text_md"
echo "$text_md rdate            # posible in option date"
echo "$text_md"
echo "$text_md reboot           # necesary in option pc-reboot"
echo "$text_md"
echo "$text_md sed              # necesary"
echo "$text_md"
echo "$text_md shutdown         # necesary in option pc-shutdown"
echo "$text_md"
echo "$text_md sleep            # necesary"
echo "$text_md"
echo "$text_md sntp             # posible in option date"
echo "$text_md"
echo "$text_md ss               # necesary in very easy utils"
echo "$text_md"
echo "$text_md sysctl           # necesary"
echo "$text_md"
echo "$text_md tee              # necesary in option free"
echo "$text_md"
echo "$text_md timeout          # necesary in very easy utils"
echo "$text_md"
echo "$text_md vi               # posible in option cli-menu,cli"
echo "$text_md"
echo "$text_md vim              # posible in option cli-menu,cli"
echo "$text_md"
echo "$text_md whiptail         # posible necesary in option cli-menu,cli"
echo "$text_md"
echo "$text_md yad              # posible necesary in option gui,gui-menu,gui-roll"
echo "$text_md"
echo "$text_md zenity           # posible necesary in option gui,gui-menu,gui-roll"
echo "$text_md"
echo "##########     commands possible depends  ##########"
exit; fi
####
####
#### :rutina-final-commands:
##########     english: examples-config: Show config files examples            ##########
##########     spanish: examples-config: Muestra ejemplos de configuraciones   ##########
#### :rutina-inicial-examples-config:
####
####
if [ "$first_option" == "examples-config" ]; then 
echo "$title_md [ $first_option ] [ Show examples ] "
echo 
echo "[ examples ] [ examples for some services in client mode ]"
echo
####
####
#### config: web example ####
####
####
echo
echo "# config web example #" 
echo "client_port_tcp=http,https ;"
echo "client_port_udp=domain,domain-s,ntp,bootpc,http ;"
####
####
#### config:  games example  ####
####
####
echo
echo "# config games example #"
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https,1025:65499; "
echo "client_port_tcp=http,https"
####
####
#### config: wesnoth game example ####
####
####
echo
echo "# config web example #" 
echo "client_port_tcp=http,https,14995:15000 ;"
echo "client_port_udp=domain,domain-s,ntp,bootpc,http ;"
####
####
#### config:  torrent-example1 ####
####
####
echo
echo "# config torrent example #"
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https,1025:65499; "
echo "client_port_tcp=http,https"
####
####
#### config: samba-example1 ####
####
####
echo
echo "# config samba example #"
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https,137:139 ; "
echo "client_port_tcp=http,https,ipp,microsoft-ds"
echo "allow_output_ping= ; allow_input_ping= ; "
####
####
#### config: server gateway masquerade ##
####
####
echo
echo "# config vpn example #"
echo "allow_gateway_ip4= ; "
####
####
#### config: vpn-sample1 ##
####
####
echo
echo "# config vpn example #"
echo "allow_forward_ip4= ; "
echo "allow_net_whitelist= ; "
echo "config_net_whitelist=wesnoth.org,sourceforge.net"
####
####
#### config: email-example1 ####
####
####
echo
echo "# config email example #"
echo "client_port_tcp=http,https,rsync,ssh,pop3,pop3s,poppassd,smtp,imap2,imaps"
####
####
#### config: ssh-example1 ####
####
####
echo
echo "# config ssh example #"
echo "client_port_tcp=http,https,printer,ipp,ssh,rsync,git"
####
####
#### config: vnc-example1 ####
####
####
echo
echo "# config vnc example #"
echo "client_port_tcp=http,https,ssh,5900:5910"
####
####
#### config: ftp-example1 ####
####
####
echo
echo "# config ftp example #"
echo "client_port_tcp=http,https,ftp,ftp-data,ftps,ftps-data,gsiftp,zope-ftp"
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https,tftp"
####
####
#### config: printer-example1 ####
####
####
echo
echo "# config printer example #"
echo "client_port_tcp=http,https,ipp,printer"
####
####
#### config: irc-example1 ####
####
####
echo
echo "# config irc example #"
echo "client_port_tcp=http,https,ircd,ircs-u"
####
####
#### config: sql-example1 ####
####
####
echo
echo "# config sql example #"
echo "client_port_tcp=http,https,mysql,postgresql,mysql-proxy,ms-sql-s"
####
####
echo
exit ; fi
####
####
#### :rutina-final-examples-config:
##########    english: eraserules: Erase rules option   ##########
##########    spanish: eraserules: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules:
####
####
if [ "$first_option" == "eraserules" ]; then  
echo "$title_md [ $first_option ] [ erase all iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_iptables_legacy   -t filter  -P INPUT    $rule_table_policy
$command_iptables_nft      -t filter  -P INPUT    $rule_table_policy
$command_ip6tables_legacy  -t filter  -P INPUT    $rule_table_policy
$command_ip6tables_nft     -t filter  -P INPUT    $rule_table_policy
$command_iptables_legacy   -t filter  -P FORWARD  $rule_table_policy
$command_iptables_nft      -t filter  -P FORWARD  $rule_table_policy
$command_ip6tables_legacy  -t filter  -P FORWARD  $rule_table_policy
$command_ip6tables_nft     -t filter  -P FORWARD  $rule_table_policy
$command_iptables_legacy   -t filter  -P OUTPUT   $rule_table_policy
$command_iptables_nft      -t filter  -P OUTPUT   $rule_table_policy
$command_ip6tables_legacy  -t filter  -P OUTPUT   $rule_table_policy
$command_ip6tables_nft     -t filter  -P OUTPUT   $rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$command_arptables -F  &> /dev/null
$command_ebtables -t filter -F &> /dev/null
$command_ebtables -t nat -F &> /dev/null
$command_iptables_nft -t filter -F &> /dev/null
$command_ip6tables_nft -t filter  -F &> /dev/null
$command_iptables_legacy -t filter -F &> /dev/null
$command_ip6tables_legacy -t filter -F &> /dev/null
$command_iptables_nft -t nat -F &> /dev/null
$command_ip6tables_nft -t nat  -F &> /dev/null
$command_iptables_legacy -t nat -F &> /dev/null
$command_ip6tables_legacy -t nat -F &> /dev/null
$command_iptables_nft -t mangle -F &> /dev/null
$command_ip6tables_nft -t mangle  -F &> /dev/null
$command_iptables_legacy -t mangle -F &> /dev/null
$command_ip6tables_legacy -t mangle -F &> /dev/null
$command_iptables_nft -t raw -F &> /dev/null
$command_ip6tables_nft -t raw  -F &> /dev/null
$command_iptables_legacy -t raw -F &> /dev/null
$command_ip6tables_legacy -t raw -F &> /dev/null
$command_iptables_nft -t security -F &> /dev/null
$command_ip6tables_nft -t security -F &> /dev/null
$command_iptables_legacy -t security -F &> /dev/null
$command_ip6tables_legacy -t security -F &> /dev/null
####
####
$command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptables_nft -t filter -P INPUT ACCEPT &> /dev/null
$command_iptables_nft -t filter -P FORWARD ACCEPT &> /dev/null
$command_iptables_nft -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t filter -P INPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_nft -t filter -P OUTPUT ACCEPT &> /dev/null
$command_iptables_legacy -t filter -P INPUT ACCEPT &> /dev/null
$command_iptables_legacy -t filter -P FORWARD ACCEPT &> /dev/null
$command_iptables_legacy -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t filter -P INPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_legacy -t filter -P OUTPUT ACCEPT &> /dev/null
$command_iptables_nft -t nat -P INPUT ACCEPT &> /dev/null
$command_iptables_nft -t nat -P OUTPUT ACCEPT &> /dev/null
$command_iptables_nft -t nat -P PREROUTING ACCEPT &> /dev/null
$command_iptables_nft -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tables_nft -t nat -P INPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_nft -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptables_legacy -t nat -P INPUT ACCEPT &> /dev/null
$command_iptables_legacy -t nat -P OUTPUT ACCEPT &> /dev/null
$command_iptables_legacy -t nat -P PREROUTING ACCEPT &> /dev/null
$command_iptables_legacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tables_legacy -t nat -P INPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_legacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptables_nft -t mangle -P INPUT ACCEPT &> /dev/null
$command_iptables_nft -t mangle -P FORWARD ACCEPT &> /dev/null
$command_iptables_nft -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_iptables_nft -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_iptables_nft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tables_nft -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_nft -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_nft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_iptables_legacy -t mangle -P INPUT ACCEPT &> /dev/null
$command_iptables_legacy -t mangle -P FORWARD ACCEPT &> /dev/null
$command_iptables_legacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_iptables_legacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_iptables_legacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tables_legacy -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_legacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_legacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_iptables_nft -t raw -P OUTPUT ACCEPT &> /dev/null
$command_iptables_nft -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_nft -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t raw -P PREROUTING ACCEPT &> /dev/null
$command_iptables_legacy -t raw -P OUTPUT ACCEPT &> /dev/null
$command_iptables_legacy -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip6tables_legacy -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t raw -P PREROUTING ACCEPT &> /dev/null
$command_iptables_nft -t security -P INPUT ACCEPT &> /dev/null
$command_iptables_nft -t security -P FORWARD ACCEPT &> /dev/null
$command_iptables_nft -t security -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t security -P INPUT ACCEPT &> /dev/null
$command_ip6tables_nft -t security -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_nft -t security -P OUTPUT ACCEPT &> /dev/null
$command_iptables_legacy -t security -P INPUT ACCEPT &> /dev/null
$command_iptables_legacy -t security -P FORWARD ACCEPT &> /dev/null
$command_iptables_legacy -t security -P OUTPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t security -P INPUT ACCEPT &> /dev/null
$command_ip6tables_legacy -t security -P FORWARD ACCEPT &> /dev/null
$command_ip6tables_legacy -t security -P OUTPUT ACCEPT &> /dev/null
####
####
echo "$title_md [ info ] [ Deleting the iptables rules firewall ]" 
echo "$title_md [ _ok_ ] [ Firewall is erased ] [ Deleted rules ]"
exit; fi
####
####
#### :rutina-final-eraserules:
##########     english: list-alltables: list all rules         ##########
##########     spanish: list-alltables: list todas las reglas  ##########
#### :rutina-inicial-list-alltables:
####
####
if [ "$first_option" == "list-alltables" ]; then
echo "$title_md [ $first_option ] [ List all rules ] "
echo 
echo; echo; echo "### LIST ARPTABLES ###"
$cmd_binary list-arptables
echo; echo; echo "### LIST EBTABLES ###"
$cmd_binary list-ebtables
echo; echo; echo "### LIST FILTER IP4 TABLE ###"
$cmd_binary list-filter4
echo; echo; echo "### LIST FILTER IP6 TABLE ###"
$cmd_binary list-filter6
echo; echo; echo "### LIST NAT IP4 TABLE ###"
$cmd_binary list-nat4
echo; echo; echo "### LIST NAT IP6 TABLE ###"
$cmd_binary list-nat6
echo; echo; echo "### LIST SECURITY IP4 TABLE ###"
$cmd_binary list-security4
echo; echo; echo "### LIST SECURITY IP6 TABLE ###"
$cmd_binary list-security6
echo; echo; echo "### LIST RAW IP4 TABLE ###"
$cmd_binary list-raw4
echo; echo; echo "### LIST RAW IP6 TABLE ###"
$cmd_binary list-raw6
echo; echo; echo "### LIST MANGLE IP4 TABLE ###"
$cmd_binary list-mangle4
echo; echo; echo "### LIST MANGLE IP6 TABLE ###"
$cmd_binary list-mangle6
echo 
exit; fi
####
####
#### :rutina-final-list-alltables:
##########     english: listn-alltables: list all rules         ##########
##########     spanish: listn-alltables: list todas las reglas  ##########
#### :rutina-inicial-listn-alltables:
####
####
if [ "$first_option" == "listn-alltables" ]; then 
echo "$title_md [ $first_option ] [ List all rules ] "
echo 
echo; echo; echo "### LIST EBTABLES ###"
$cmd_binary list-ebtables
echo; echo; echo "### LIST ARPTABLES ###"
$cmd_binary listn-arptables
echo; echo; echo "### LIST FILTER IP4 TABLE ###"
$cmd_binary listn-filter4
echo; echo; echo "### LIST FILTER IP6 TABLE ###"
$cmd_binary listn-filter6
echo; echo; echo "### LIST NAT IP4 TABLE ###"
$cmd_binary listn-nat4
echo; echo; echo "### LIST NAT IP6 TABLE ###"
$cmd_binary listn-nat6
echo; echo; echo "### LIST SECURITY IP4 TABLE ###"
$cmd_binary listn-security4
echo; echo; echo "### LIST SECURITY IP6 TABLE ###"
$cmd_binary listn-security6
echo; echo; echo "### LIST RAW IP4 TABLE ###"
$cmd_binary listn-raw4
echo; echo; echo "### LIST RAW IP6 TABLE ###"
$cmd_binary listn-raw6
echo; echo; echo "### LIST MANGLE IP4 TABLE ###"
$cmd_binary listn-mangle4
echo; echo; echo "### LIST MANGLE IP6 TABLE ###"
$cmd_binary listn-mangle6
echo 
exit; fi
####
####
#### :rutina-final-listn-alltables:
##########    english: list4-ip: The list option   ##########
##########    spanish: list4-ip: La opcion lista   ##########
#### :rutina-inicial-list4:
####
####
if [ "$first_option" == "list4-ip" ]; then 
echo "$title_md [ list4 ] [ List filter ipv4 ] [ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptables_legacy" -t filter -L INPUT 1 && \
"$command_iptables_legacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptables_nft" -t filter -L INPUT 1 && \
"$command_iptables_nft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ] [ listing rules .. ]"
echo
$command_iptables_legacy -t filter -v -L $list_rules_conceptual
;;
esac
echo "$tab"
case $nftcuatro in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_iptables_nft -t filter -v -L $list_rules_conceptual
;;
esac
exit; fi
####
####
#### :rutina-final-list4:
##########    english: list6-ip: list ipv6 rules filter           ##########
##########    spanish: list6-ip: lista reglas de filtros de ipv6  ##########
#### :rutina-inicial-list6:
####
####
if [ "$first_option" == "list6-ip" ]; then  
echo "$title_md [ list6 ] [ List filter ipv6 ] [ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$command_ip6tables_legacy" -t filter -L INPUT 1 && \
"$command_ip6tables_legacy" -t filter -L OUTPUT 1 )
nftseis=$("$command_ip6tables_nft" -t filter -L INPUT 1 && \
"$command_ip6tables_nft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tables_legacy -v -L $list_rules_conceptual
;;
esac
echo $tab
case $nftseis in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tables_nft -v -L $list_rules_conceptual
;;
esac
####
####
exit; fi
####
####
#### :rutina-final-list6:
##########    english: listn4-ip: The list option   ##########
##########    spanish: listn4-ip: La opcion lista   ##########
#### :rutina-inicial-listn4-ip:
####
####
if [ "$first_option" == "listn4-ip" ]; then  
echo "$title_md [ list4 ] [ List filter ipv4 ] [ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptables_legacy" -t filter -L INPUT 1 && \
"$command_iptables_legacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptables_nft" -t filter -L INPUT 1 && \
"$command_iptables_nft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ] [ listing rules .. ]"
echo
$command_iptables_legacy -t filter -v -L -n
;;
esac
echo "$tab"
case $nftcuatro in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_iptables_nft -t filter -v -L -n
;;
esac
exit; fi
####
####
#### :rutina-final-listn4-ip:
##########    english: listn6-ip: list ipv6 rules filter           ##########
##########    spanish: listn6-ip: lista reglas de filtros de ipv6  ##########
#### :rutina-inicial-listn6-ip:
####
####
if [ "$first_option" == "listn6-ip" ]; then  
echo "$title_md [ list6 ] [ List filter ipv6 ] [ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$command_ip6tables_legacy" -t filter -L INPUT 1 && \
"$command_ip6tables_legacy" -t filter -L OUTPUT 1 )
nftseis=$("$command_ip6tables_nft" -t filter -L INPUT 1 && \
"$command_ip6tables_nft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tables_legacy -v -L -n
;;
esac
echo $tab
case $nftseis in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tables_nft -v -L -n
;;
esac
####
####
exit; fi
####
####
#### :rutina-final-listn6-ip:
##########    english: status: The list option ipv4 and ipv6    ##########
##########    spanish: status: La opcion lista ipv4 y ipv6      ##########
#### :rutina-inicial-status:
####
####
if [ "$first_option" == "status" ]; then
####
####
$cmd_binary list4
####
####
$cmd_binary list6
####
####
exit; fi
####
####
#### :rutina-final-satus:
##########    english: statusn: The list option ipv4 and ipv6    ##########
##########    spanish: statusn: La opcion lista ipv4 y ipv6      ##########
#### :rutina-inicial-statusn:
####
####
if [ "$first_option" == "statusn" ]; then
####
####
$cmd_binary listn4
####
####
$cmd_binary listn6
####
####
exit; fi
####
####
#### :rutina-final-satusn:
##########    english: listnum: The list option   ##########
##########    spanish: listnum: La opcion lista   ##########
#### :rutina-inicial-listnum:
####
####
if [ "$first_option" == "listnum" ]; then 
echo "$title_md [ list ] [ List numerical filter ipv4 ] [ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptables_legacy" -t filter -L INPUT 1 && \
"$command_iptables_legacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptables_nft" -t filter -L INPUT 1 && \
"$command_iptables_nft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ] [ listing rules .. ]"
echo
$command_iptables_legacy -t filter -v -L -n
;;
esac
echo "$tab"
case $nftcuatro in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" 
echo
$command_iptables_nft -t filter -v -L -n
;;
esac
exit; fi
####
####
#### :rutina-final-listnum:
##########    english: listnum6: The list option   ##########
##########    spanish: listnum6: La opcion lista   ##########
#### :rutina-inicial-listnum-filter6:
####
####
if [ "$first_option" == "listnum6" ]; then 
echo "$title_md [ list ] [ List numerical filter ipv6 ] [ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_ip6tables_legacy" -t filter -L INPUT 1 && \
"$command_ip6tables_legacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_ip6tables_nft" -t filter -L INPUT 1 && \
"$command_ip6tables_nft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip6"
echo
case $legacycuatro in
"$NULL") echo "$title_md [ info ] [ Without rules xtables ] [ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t filter -v -L -n
;;
esac
echo "$tab"
case $nftcuatro in
"$NULL") echo "$title_md [ info ] [ Without rules nftables ] [ iptables-nft ] [ $fromrules ] [ listing rules .. ]" ;;
*)
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]" 
echo
$command_iptables_nft -t filter -v -L -n
;;
esac
exit; fi
####
####
#### :rutina-final-listnum6:
##########    english: list-filter4: The list option   ##########
##########    spanish: list-filter4: La opcion lista   ##########
#### :rutina-inicial-list-filter4:
####
####
if [ "$first_option" == "list-filter4" ]; then 
echo "$title_md [ $first_option ] [ List filter ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t filter -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]" 
echo
$command_iptables_nft -t filter -v -L $list_rules_conceptual
####
####
exit; fi
####
####
#### :rutina-final-list-filter4:
##########    english: list-forward: List filter forward rules       ##########
##########    spanish: list-forward: lista reglas de iptables filter forward  ##########
#### :rutina-inicial-list-forward:
####
####
if [ "$first_option" == "list-forward" ]; then 
echo "$title_md [ $first_option ] [ List filter forward ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t filter -v -L FORWARD $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t filter -v -L FORWARD $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-forward:
##########    english: list-filter6: list ipv6 rules filter           ##########
##########    spanish: list-filter6: lista reglas de filtros de ipv6  ##########
#### :rutina-inicial-list-filter6:
####
####
if [ "$first_option" == "list-filter6" ]; then 
echo "$title_md [ $first_option ] [ List filter ipv6 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tables_legacy -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]" 
echo
$command_ip6tables_nft -v -L $list_rules_conceptual
####
####
exit; fi
####
####
#### :rutina-final-list-filter6:
##########    english: list-forward6: List filter forward rules ipv6        ##########
##########    spanish: list-forward6: lista reglas de iptables filter forward ipv6   ##########
#### :rutina-inicial-list-forward6:
####
####
if [ "$first_option" == "list-forward6" ]; then 
echo "$title_md [ $first_option ] [ List filter forward ipv6 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t filter -v -L FORWARD $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t filter -v -L FORWARD $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-forward6:
##########    english: list-nat4: list NAT rules of ipv4       ##########
##########    spanish: list-nat4: lista reglas de NAT de ipv4  ##########
#### :rutina-inicial-list-nat-4:
####
####
 if [ "$first_option" == "list-nat4" ]; then 
echo "$title_md [ $first_option ] [ List nat ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip4"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t nat -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t nat -v -L $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-nat-4:
##########    english: list-nat6: list NAT rules of ipv6       ##########
##########    spanish: list-nat6: lista reglas de NAT de ipv6  ##########
#### :rutina-inicial-list-nat6:
####
####
if [ "$first_option" == "list-nat6" ]; then 
echo "$title_md [ $first_option ] [ List nat ipv6] [ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip6"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t nat -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t nat -v -L $list_rules_conceptual 
#### echo 
exit; fi
####
####
#### :rutina-final-list-nat6:
##########    english: listnum-filter4: list option numerical filter ipv4   ##########
##########    spanish: listnum-filter4: lista numeral filter ipv4           ##########
#### :rutina-inicial-listnum-filter4:
####
####
if [ "$first_option" == "listnum-filter4" ]; then 
echo "$title_md [ $first_option ] [ List filter ipv4 in numerical ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md [ info ] [ With rules netfilter ] [ iptables-nft ] [ $fromrules ]"  
echo
$command_iptables_legacy -v -L -n 
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -v -L -n
exit; fi
####
####
#### :rutina-final-listnum-filter4:
##########    english: list-forwardnum: List filter forward rules in numerical     ##########
##########    spanish: list-forwardnum: lista reglas de iptables filter forward in numeros  ##########
#### :rutina-inicial-list-forwardnum:
####
####
if [ "$first_option" == "list-forwardnum" ]; then 
echo "$title_md [ $first_option ] [ List filter forward ipv4 in numerical ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t filter -v -L FORWARD -n
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t filter -v -L FORWARD -n
exit; fi
####
####
#### :rutina-final-list-forwardnum:
##########    english: listnum-filter6: list option numerical filter ipv6   ##########
##########    spanish: listnum-filter6: lista numeral filter ipv6           ##########
#### :rutina-inicial-listnum-filter6:
####
####
if [ "$first_option" == "listnum-filter6" ]; then 
echo "$title_md [ $first_option ] [ List filter ipv6 in numerical ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tables_legacy -v -L -n
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tables_nft -v -L -n
exit; fi
####
####
#### :rutina-final-listnum-filter6:
##########    english: list-forwardnum6: List filter forward rules in numerical ipv6      ##########
##########    spanish: list-forwardnum6: lista reglas de iptables filter forward in numeros ipv6   ##########
#### :rutina-inicial-list-forwardnum6:
####
####
if [ "$first_option" == "list-forwardnum6" ]; then 
echo "$title_md [ $first_option ] [ List filter forward ipv6 in numerical ] [ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$title_md [ info ] [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t filter -v -L FORWARD -n
echo
echo "$title_md [ info ] [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t filter -v -L FORWARD -n
exit; fi
####
####
#### :rutina-final-list-forwardnum6:
##########    english: list-mangle4: list mangle rules from ipv4      ##########
##########    spanish: list-mangle4: lista reglas de mangle de ipv4   ##########
#### :rutina-inicial-list-mangle4:
####
####
if [ "$first_option" == "list-mangle4" ]; then 
echo "$title_md [ $first_option ] [ List mangle ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip4"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t mangle -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t mangle -v -L $list_rules_conceptual
echo 
exit; fi
####
####
#### :rutina-final-list-mangle4:
##########    english: list-mangle6: list mangle rules from ipv6     ##########
##########    spanish: list-mangle6: lista reglas de mangle de ipv6  ##########
#### :rutina-inicial-list-mangle6:
####
####
if [ "$first_option" == "list-mangle6" ]; then 
echo "$title_md [ $first_option ] [ List mangle ipv6 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip6"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t mangle -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t mangle -v -L $list_rules_conceptual
#### echo 
exit; fi
####
####
#### :rutina-final-list-mangle6:
##########    english: list-raw4: list raw rules from ipv4  ##########
##########    spanish: list-raw4: lista reglas raw de ipv4  ##########
#### :rutina-inicial-list-raw4:
####
####
if [ "$first_option" == "list-raw4" ]; then 
echo "$title_md [ $first_option ] [ List raw ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip4"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t raw -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t raw -v -L $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-raw4:
##########    english: list-raw6: list raw rules from ipv6  ##########
##########    spanish: list-raw6: lista reglas raw de ipv6  ##########
#### :rutina-inicial-list-raw6:
####
####
if [ "$first_option" == "list-raw6" ]; then 
echo "$title_md [ $first_option ] [ List raw ipv6 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip6"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t raw -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t raw -v -L $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-raw6:
##########    english: list-security4: list security rules from ipv4     ##########
##########    spanish: list-security4: lista reglas de security de ipv4  ##########
#### :rutina-inicial-list-security4:
####
####
if [ "$first_option" == "list-security4" ]; then 
echo "$title_md [ $first_option ] [ List security ipv4 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip4"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptables_legacy -t security -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptables_nft -t security -v -L $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-security4:
##########    english: list-security6: list security rules from ipv6     ##########
##########    spanish: list-security6: lista reglas de security de ipv6  ##########
#### :rutina-inicial-list-security6:
####
####
if [ "$first_option" == "list-security6" ]; then 
echo "$title_md [ $first_option ] [ List security ipv6 ] [ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip6"
echo
echo "$title_md [ info ] [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tables_legacy -t security -v -L $list_rules_conceptual
echo
echo "$title_md [ info ] [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tables_nft -t security -v -L $list_rules_conceptual
exit; fi
####
####
#### :rutina-final-list-security6:
##########    english: list-ebtables: list ebtables rules with mac adress       ##########
##########    spanish: list-ebtables: lista reglas de ebtables with mac adress  ##########
#### :rutina-inicial-list-ebtables:
####
####
if [ "$first_option" == "list-ebtables" ]; then 
echo "$title_md [ $first_option ] [ List ebtables ] "
fromrules="ebtables"
echo
echo "$title_md [ info ] [ ebtables: filter ethernet ] [ $fromrules ]"
echo
$command_ebtables -L -t filter
echo
echo "$title_md [ info ] [ ebtables: nat ethernet ] [ $fromrules ]"
echo
$command_ebtables -L -t nat
exit; fi
####
####
#### :rutina-final-list-ebtables:
##########    english: list-arptables: list rules arptables with arp        ##########
##########    spanish: list-arptables: lista reglas de arptables with arp   ##########
#### :rutina-inicial-list-arptables:
####
####
if [ "$first_option" == "list-arptables" ]; then 
echo "$title_md [ $first_option ] [ List arptables ipv4 ] "
fromrules="arptables"
echo
echo "$title_md [ info ] [ arptables: filter arptables ] [ $fromrules ]"
echo
$command_arptables -L
exit; fi
####
####
#### :rutina-final-list-arptables:
##########    english: list-arptables: list rules arptables with arp        ##########
##########    spanish: list-arptables: lista reglas de arptables with arp   ##########
#### :rutina-inicial-list-arptables:
####
####
if [ "$first_option" == "listn-arptables" ]; then 
echo "$title_md [ $first_option ] [ List arptables ipv4 ] "
fromrules="arptables"
echo
echo "$title_md [ info ] [ arptables: filter arptables ] [ $fromrules ]"
echo
$command_arptables -L -n
exit; fi
####
####
#### :rutina-final-list-arptables:
##########    english: clone-static: clone config file static static        ##########
##########    spanish: clone-static: clona archivo de configuracion prediseniado   ##########
#### :rutina-inicial-clone-static:
####
####
if [ "$first_option" == "clone-static" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$tab [ info ] [ usage: ] [ $cmd_binary clone-static firewall-static ]"
exit; fi
####
####
if [ "$first_option" == "clone-static" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
$cmd_binary code $second_option | $command_grep -E "_port_|_shield_" &> $directory_config/$archivo
if [ -s "$directory_config/$archivo" ] ; then 
cat $directory_config/$archivo ; echo " [ _ok_ ] config created $archivo"
else rm $directory_config/$archivo ; echo " [ fail ] config no done $archivo" ; fi
exit; fi
####
####
#### :rutina-final-clone-static:
##########    english: new-full-config: new-full-config option to create new configs   ##########
##########    spanish: new-full-config: new-full-config para cear nuevas config        ##########
#### :rutina-inicial-new-full-config:
####
####
if [ "$first_option" == "new-full-config" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$tab [ info ] [ usage: ] [ $cmd_binary new-full-config config-new ]"
exit; fi
####
####
if [ "$first_option" == "new-full-config" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$defaultfullcfg_eng" "$directory_config/$archivo"
$favorite_text_editor $directory_config/$archivo
echo " [ _ok_ ] created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-new-full-config:
##########    english: nueva-completa-config: create new configs                             ##########
##########    spanish: nueva-completa-config: nueva-completa-config para cear nuevas config  ##########
#### :rutina-inicial-nueva-completa-config:
####
####
if [ "$first_option" == "nueva-completa-config" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$tab [ info ] [ usage: ] [ $cmd_binary nueva-completa-config config-nueva ]"
exit; fi
####
####
if [ "$first_option" == "nueva-completa-config" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$defaultfullcfg_spa" "$directory_config/$archivo"
$favorite_text_editor $directory_config/$archivo
echo " [ _ok_ ] created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-nueva-completa-config:
##########    english: new-mini-config: create new configs   ##########
##########    spanish: new--mini config: cea nuevas config   ##########
#### :rutina-inicial-new-mini-config:
####
####
if [ "$first_option" == "new-mini-config" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$tab [ info ] [ usage: ] [ $cmd_binary new-mini-config config-new ]"
exit; fi
####
####
if [ "$first_option" == "new-mini-config" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$defaultminicfg_eng" "$directory_config/$archivo"
$favorite_text_editor $directory_config/$archivo
echo " [ _ok_ ] created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-new-mini-config:
##########    english: nueva-mini-config: create new configs   ##########
##########    spanish: nueva-mini-config: crea nuevas config   ##########
#### :rutina-inicial-nueva-mini-config:
####
####
if [ "$first_option" == "nueva-mini-config" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$tab [ info ] [ usage: ] [ $cmd_binary nueva-mini-config config-nueva ]"
exit; fi
####
####
if [ "$first_option" == "nueva-mini-config" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$defaultminicfg_spa" "$directory_config/$archivo"
$favorite_text_editor $directory_config/$archivo
echo " [ _ok_ ] created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-nueva-mini-config:
##########    english: modify-config: modify a one config.cfg        ##########
##########    spanish: modify-config: modify una configuracion.cfg   ##########
#### :rutina-inicial-modify-config:
####
####
if [ "$first_option" == "modify-config" ]; then 
####
###
if [ ! -f "$directory_config/$second_option" ] ; then $nada
$cmd_binary names-config
echo "$tab [ info ] [ usage: ] [ $cmd_binary modify-config config-existent ]" ; exit; fi
####
####
if [ -f "$directory_config/$second_option" ] ; then $nada
cp "$directory_config/$second_option" "$directory_temporal/$second_option" &> /dev/null
$favorite_text_editor "$directory_config/$second_option"
echo "$title_md [ _ok_ ] [ Custom file $second_option ]"
clear; fi
####
####
clear ; exit ; fi
####
####
#### :rutina-final-modify-config:
##########    english: show-config: show a one config          ##########
##########    spanish: show-config: muestra una configuracion  ##########
#### :rutina-inicial-show-config:
####
####
if [ "$first_option" == "show-config" ] ; then 
####
####
if [ ! -f "$directory_config"/"$second_option" ] ; then 
echo "$title_md [ info ] [ Usage: $cmd_binary show-config config-cfg ]" ; exit; fi
####
####
if [ -f "$directory_config"/"$second_option" ] ; then 
cat $directory_config/$second_option ;
echo  ; exit ; fi
####
####
exit; fi
####
####
#### :rutina-final-show-config:
##########    english: del-config: delete a old config               ##########
##########    spanish: del-config: elimina una vieja configuracion   ##########
#### :rutina-inicial-del-config:
####
####
if [ "$first_option" == "del-config" ]; then 
####
####
if [ ! -f $directory_config/$second_option ] ; then
echo "$title_md [ info ] [ usage: ] [ $cmd_binary del-config config-old ]" ; exit ; fi
####
####
if [ -f $directory_config/$second_option ] ; then
rm $directory_config/$second_option
echo "$directory_config/$second_option Deleted"
echo  ; exit ; fi
####
####
exit ; fi
####
####
#### :rutina-final-del-config:
##########    english: names-control: file list whith rules in iptables format          ##########
##########    spanish: names-control: lista de archivos con reglas en formato iptables  ##########
#### :rutina-inicial-names-control:
####
####
if [ "$first_option" == "names-control" ]; then 
echo "$title_md [ $first_option ] [ List names from firewall saved ] "
echo "$title_md [ info ] [ list configs files in standard format ]"
echo "$title_md [ info ] [ folder ] [ $directory_fwrecover ]"
echo 
echo "$title_md [ info ] [ Listing firewall names ]"
$command_ls -1 $directory_fwrecover | $command_sed s/\-legacy\-ipv6//g | $command_sed s/\-nft\-ipv6//g | \
$command_sed s/\-legacy\-ipv4//g | $command_sed s/\-nft\-ipv4//g | \
$command_sed s/\-arptables//g | $command_sed s/\-ebtables//g | sort -u 
echo
echo "$title_md [ _ok_ ] [ Listed firewall names ]"
exit; fi
####
####
#### :rutina-final-names-control:
##########    english: reset: reset counter rules            ##########
##########    spanish: reset: resetea contadores de reglas   ##########
#### :rutina-inicial-reset:
####
####
if [ "$first_option" == "reset" ]; then 
echo "$title_md [ $first_option ] [ Reset the firewall ] "
echo "$title_md [ info ] [ Reseting the firewall ]"
$cmd_binary stop &> /dev/null
$cmd_binary continue &> /dev/null
echo "$title_md [ _ok_ ] [ firewall reseted ]"
exit; fi
####
####
#### :rutina-final-reset:
##########   english: intro: show intro      ##########
##########   spanish: intro: muestra intro   ##########
#### :rutina-inicial-intro:
####
####
if  [ "$first_option" == "intro" ]; then 
echo "$text_md"
echo "$title_md fwiptables. Firewall With iptables.    "
echo "$text_md"
echo "$text_md fwiptables is one simple in one-file FRONT-END                       "
echo "$text_md for iptables linux with COMMAND-LINE with CLI-MENU                   "
echo "$text_md with GUI-MENU with GUI-ROLL with GUI-SHELL.                          "
echo "$text_md And choose one firewall: eraserules, or wizard-mini,                 "
echo "$text_md or wizard-full, or custom, or one static                      "
echo "$text_md firewall to choose one. Gen new rules with templates                 "
echo "$text_md and with shield ssh and with comments rules.                         "
echo "$text_md"
echo "$text_md rules ipv4, rules ipv6, netfilter, neftables, xtables,               "
echo "$text_md tools ip, wizards for rules, save/load rules with files,             "
echo "$text_md shield to ssh or other servers choosed,                              "
echo "$text_md limit bandwidth, host whitelist, host blacklist,                     "
echo "$text_md and other more capacities of firewall.                               "
echo "$text_md"
echo "$title_md  fwiptables location.                                               "
echo "$text_md"
echo "$text_md  File location   :   $directory_installed/$cmd_config  "
echo "$text_md  Config directory:   $directory_data                   "
echo "$text_md"
echo "$title_md fwiptables install.                                   "
echo "$text_md"
echo "$text_md  Put bit of execution. TYPE:   chmod u+x $cmd_binary   "
echo "$text_md  Install this version. TYPE:   $cmd_binary install     " 
echo "$text_md"
echo "$title_md fwiptables uninstall.                                 "
echo "$text_md"
echo "$text_md  Uninstall fwiptables. TYPE:   $cmd_config uninstall   "
echo "$text_md"
$cmd_binary ver
$cmd_binary compile
$cmd_binary options
exit; fi
####
####
#### :rutina-final-intro:
##########    english: ip-forward: the ipforwading option en english   ##########
##########    spanish: ip-forward: la opcion de reenvios  en ingles    ##########
#### :rutina-inicial-ip-forward:
####
####
if   [ "$first_option" == "ip-forward" ]; then
####
####
if   [ "$second_option" == "$NULL" ]; then
echo "$title_md [ $first_option ] || ||"
echo "$title_md launch: fwiptables ip-forward [ list | on | off ]" ; exit ; fi
####
####
if   [ "$second_option" == "list" ]; then
echo "$title_md [ $first_option ]  [ Show ip forwading in kernel ] || ||"
echo "$title_md [ Actived 1 or deactived 0 ] [ ipforwading with sysctl ]"
$command_sysctl -a | $command_grep -i  forwarding ; exit ; fi
####
####
if   [ "$second_option" == "on" ]; then
echo "$title_md [ $first_option ]  [ Activating.. ip forwading in kernel ] || ||"
for a in $($command_sysctl -a | $command_grep -i  forwarding | cut -d " " -f 1)
do $command_sysctl -w $a=1 ; done ; exit ; fi
####
####
if   [ "$second_option" == "off" ]; then
echo "$header_ok [ $first_option ]  [ Deactivating.. ip forwading in kernel ] || ||"
for a in $($command_sysctl -a | $command_grep -i  forwarding | cut -d " " -f 1)
do $command_sysctl -w $a=0 ; done ; exit; fi
####
####
exit; fi
####
####
#### :rutina-final-ip-forward:
##########    english: clean-tmp: clean temporal files             ##########
##########    spanish: clean-tmp: limpia de archivos temporales    ##########
#### :rutina-inicial-clean-tmp:
####
####
if   [ "$first_option" == "clean-tmp" ] ; then 
echo "$title_md [ $first_option ] [ clean $cmd_binary temporal files ] "
echo "$title_md [ info ] [ cleaning $cmd_binary temporal files ]"
du -cm "$directory_cache"
rm -rf "$directory_cache" &> /dev/null
echo "[ _ok_ ] [ cleaned temporal files ]"
exit; fi
####
####
#### :rutina-final-clean-tmp:
##########   english: download:   where download fwiptables    ##########
##########   spanish: download:   donde descargar fwiptables   ##########
#### :rutina-inicial-download:
####
####
if [ "$first_option" == "download" ] ; then 
echo "$title_md [ $first_option ] [ $cmd_binary download ] [ download md ] "
echo
echo "$title_md the last version from fwiptables. Firewall With iptables"
echo
echo "$title_md [ Link ] [ Download web link from sourceforge.com ] "
echo "$web_download_sourceforge"
echo
echo "$title_md [ Link ] [ Download web link from github.com ] "
echo "$web_download_github"
echo 
echo "$title_md [ Link ] [ Download web link from git.devuan.org ] "
echo "$web_download_devuan"
echo 
exit; fi
####
####
#### :rutina-final-download:
##########   english: uninstall:      fwiptables uninstall      ##########
##########   spanish: desinstalador:  fwiptables desistalador   ##########
#### :rutina-inicial-uninstall:
####
####
if [ "$first_option" == "uninstall" ] ; then
echo "$title_md [ $first_option ] [ $cmd_binary uninstaller ] [ uninstall md ] "
echo "$title_md [ info ] [ $cmd_binary uninstalling ]"
rm /usr/bin/$cmd_config &> /dev/null
echo "$title_md [ info ] [ deleted binaries ]"
echo "$title_md [ _ok_ ] [ /usr/bin/$cmd_config uninstalled ]" ;
exit; fi
####
####
#### :rutina-final-uninstall:
##########       english: install:    fwiptables install          ##########
##########       spanish: instalador: fwiptables instalador       ##########
#### :rutina-inicial-install:
####
####
if [ "$first_option" == "install" ]; then 
echo "$title_md [ $first_option ] [ $cmd_config $cmd_version installer ] [ install md ] "
####
####
####  english: copy the file to temporal folder and install
####  spanish: copia el archivo a carpeta temporal y instala
#### 
#### 
echo "$title_md [ info ] [ $cmd_config installing.. ]"
cp "$cmd_binary" "$directory_temporal/fwiptables-tmp.sh" &> /dev/null
cp "$directory_temporal/fwiptables-tmp.sh" "/usr/bin/$cmd_config" &> /dev/null 
chmod 555 "/usr/bin/$cmd_config" &> /dev/null 
####
####
####  english: generate fwiptables default config and templates
####  spanish: genera fwiptables default configuracion y plantillas
####
####
/usr/bin/$cmd_config preferences-regen &> /dev/null
/usr/bin/$cmd_config regen-config &> /dev/null
#### if [ -f "/usr/bin/$cmd_config" ]; then /usr/bin/$cmd_config ver; fi
####
####
####   english: Show final status from installer
####   spanish: Muestra el estatus final desde el instalador
####
####
echo "$title_md [ info ] [ The  config   dir:     ] [ $directory_data ]"
echo "$title_md [ info ] [ The  cache    dir:     ] [ $directory_cache  ]"
echo "$title_md [ info ] [ The Command shell:     ] [ /usr/bin/$cmd_config ]"
echo "$title_md [ _ok_ ] [ Update preferences config file ]"
echo "$title_md [ _ok_ ] [ Now. Ready to run $cmd_config .]"
exit; fi
####
####
#### :rutina-final-install:
##########    english: geoip: host to resolve and locate       ##########
##########    spanish: geoip: host para resolver y localizar   ##########
#### :rutina-inicial-geoip:
####
####
if   [ "$first_option" == "geoip" ]; then 
echo "$title_md [ $first_option ]  [ resolve the location to one ip or host ] "
echo 
case $command_geoiplookup in "$NULL") echo "$tab [ fail ] [ Install geoiplookup command ]" ; exit  ;; esac
case "$second_option" in
"$NULL") echo "$cinco Selecting host geoip to fast.com for default" ; trazador="fast.com" ;;
*) trazador="$second_option" ;; esac
echo "$title_md [ _ok_ ] [ geoiplookup -i $trazador ]"
$command_geoiplookup -i $trazador
echo 
exit; fi
####
####
#### :rutina-final-geoip:
##########    english: nodes: listen at dump from conexiones arp    ##########
##########    spanish: nodes: escucha al volcado de conexiones arp  ##########
#### :rutina-inicial-nodes:
####
####
if   [ "$first_option" == "nodes" ]; then 
echo "$title_md [ $first_option ] [ Show the list arp-scan in the lan ] "
if [ "$command_arp_scan" == "$NULL" ]; then echo "$title_md [ fail ] [ install arp-scan command ]" ; exit ; fi
echo "$title_md [ info ] [ local net: ip lan .. ]"
$command_ip -4 route | $command_grep -i -v default
echo "$title_md [ info ] [ local scan: arp lan scan .. ]"
$command_timeout -s SIGINT -v $time_server_waiting $command_arp_scan -l -x
exit; fi
####
####
#### :rutina-final-nodes:
##########    english: license: license gpl v2   ##########
##########    spanish: license: license gpl v2   ##########
#### :rutina-inicial-license:
####
####
if [ "$first_option" == "license" ]; then 
echo "$title_md [ $first_option ]  [ Show license from git sourceforge for $cmd_binary ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for gpl v2 downloading from .. $mensage_license_gpl"
echo
echo ..................................................................
echo
curl -L $mensage_license_gpl --stderr /dev/null
exit;  fi
####
####
#### :rutina-final-license:
##########    english: pc-halt: power off computer   ##########
##########    spanish: pc-halt: apaga el ordenador   ##########
#### :rutina-inicial-pc-halt:
####
####
if   [ "$first_option" == "pc-halt" ]; then 
echo "$title_md [ $first_option ] [ power off computer ] "
echo "Halt to power off computer ... in 15 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 10 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 05 seconds"
$command_sleep 5
$command_halt
exit; fi
####
####
#### :rutina-final-pc-halt:
##########    english: pc-shutdown: power off computer   ##########
##########    spanish: pc-shutdown: apaga el ordenador   ##########
#### :rutina-inicial-pc-shutdown:
####
####
if   [ "$first_option" == "pc-shutdown" ]; then 
echo "$title_md [ $first_option ] [ power off computer ] "
echo "Halt to shutdown computer ... in 15 seconds"
$command_sleep 5
echo "Halt to shutdown computer ... in 10 seconds"
$command_sleep 5
echo "Halt to shutodwn computer ... in 05 seconds"
$command_sleep 5
$command_shutdown -h now
exit; fi
####
####
#### :rutina-final-pc-shutdown:
##########    english: pc-reboot: reboot computer         ##########
##########    spanish: pc-reboot: reinicia el ordenador   ##########
#### :rutina-inicial-pc-shutdown:
####
####
if   [ "$first_option" == "pc-reboot" ]; then 
echo "$title_md [ $first_option ] [ reboot computer ] "
echo "Halt to reboot computer ... in 15 seconds"
$command_sleep 5
echo "Halt to reboot computer ... in 10 seconds"
$command_sleep 5
echo "Halt to reboot computer ... in 05 seconds"
$command_sleep 5
$command_reboot
exit; fi
####
####
#### :rutina-final-pc-shutdown:
##########    english: expert-upgrade: upgrade fwiptables    ##########
##########    spanish: expert-upgrade: upgrade fwiptables    ##########
#### :rutina-inicial-expert-upgade:
####
####
if   [ "$first_option" == "expert-upgrade" ]; then 
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "$title_md Downloading fwiptables latest"
descarga="$directory_log/fwiptables-cmd"
$command_curl $web_download_sourceforge -s -L -o $descarga && chmod ugo+x $descarga && $descarga install
exit; fi
####
####
#### :rutina-final-expert-upgrade:
##########    english: compile: compile with obash      ##########
##########    spanish: compile: compila with obash      ##########
#### :rutina-inicial-compile:
####
####
if   [ "$first_option" == "compile" ]; then 
echo "$title_md [ $first_option ] [  optionally ] [ howto compile bash script with obash ] "
echo "$title_md   "
echo "$text_md This script in bash works. But if you desire is compiling... follow that steps,       "
echo "$text_md there are three steps to compile fwiptables script, it is possible with obash.        "
echo "$text_md when you has compiled, it does works only with your system hardware architecture.     "
echo "$title_md   "
echo "$text_md . 0 .  Necesary: fwiptables in source script bash.                                    "
echo "$text_md . 1 .     First: download obash from oficial web internet page.                       "
echo "$text_md . 2 .    Second: compile with obash command using command make.                       "
echo "$text_md . 3a . Or Third: run:# obash -c -o ./destination.bin ./source-bash.sh                 "
echo "$text_md . 3b . Or Third: run:# obash -c -o /usr/bin/fwiptables-bin /usr/bin/fwiptables-cmd    "
echo "$text_md    "
echo "$title_md Actually, the file type is:                                                          "
file -L $cmd_binary
echo "$title_md  "
echo "$title_md  "
exit; fi
####
####
#### :rutina-final-compile:
##########    english: expert-obash: compile with obash      ##########
##########    spanish: expert-obash: compila with obash      ##########
#### :rutina-inicial-expert-obash:
####
####
if   [ "$first_option" == "expert-obash" ]; then 
echo "$title_md [ $first_option ] [  optionally ] [ howto compile bash script with obash ] "
echo "$title_md Compile /usr/bin/fwiptables-cmd in /usr/bin/fwiptables-bin"
if [ "$command_obash" == "$NULL" ]; then echo "$title_md install obash to compile"; exit ; fi
$command_obash -c -o /usr/bin/fwiptables-bin /usr/bin/fwiptables-cmd
echo "$text_md"
file -L /usr/bin/fwiptables-cmd
echo "$title_md"
file -L /usr/bin/fwiptables-bin
exit; fi
####
####
#### :rutina-final-expert-obash:
##########    english: radio: url from one radio mp3      ##########
##########    spanish: radio: url de una radio en mp3     ##########
#### :rutina-inicial-radio:
####
####
if   [ "$first_option" == "radio" ] ; then 
echo "$header_ok [ $first_option ]  [ Listen radio online with a one link ]"
echo "$duo_md [ info ] [ Usually it do not working likes root, probe as user ]"
####
####
link_radio_rockfm="http://flucast-b02-06.flumotion.com/cope/rockfm.mp3" 
link_radio_kissfm="http://kissfm.kissfmradio.cires21.com/kissfm.mp3" 
link_radio_cope="https://flucast24-h-cloud.flumotion.com/cope/net1.mp3" 
link_radio_cadena100="http://cadena100-cope-rrcast.flumotion.com/cope/cadena100.mp3"
link_radio_dial="http://playerservices.streamtheworld.com/api/livestream-redirect/CADENADIAL.mp3"
link_radio_ondacero="https://livefastly-webs.ondacero.es/ondacero/audio/master.m3u8"
link_radio_rne="https://rtvelivestreamv3.akamaized.net/rtvesec/rne_r1_main.m3u8"
link_radio_clasica="https://rtvelivestreamv3.akamaized.net/rtvesec/rne_r2_main.m3u8"
link_radio_exterior="http://radioexterior.rtveradio.cires21.com/radioexterior/mp3/icecast.audio"
link_radio_marca="https://22333.live.streamtheworld.com/RADIOMARCA_NACIONAL.mp3"
####
####
case "$second_option" in
"$NULL") echo " [ info ] [ launch: $cmd_binary radio link-mp3 ]" ; exit ;;
"show") echo " [ info ] rockfm,cope,kissfm,cadena100,dial,ondacero,rne,clasica,exterior,marca" ; exit ;;
"rockfm") emisora="$link_radio_rockfm" ;;
"cope") emisora="$link_radio_cope" ;;
"kissfm") emisora="$link_radio_kissfm" ;;
"cadena100") emisora="$link_radio_cadena100" ;;
"dial") emisora="$link_radio_dial" ;;
"ondacero") emisora="$link_radio_ondacero" ;;
"rne") emisora="$link_radio_rne" ;;
"clasica") emisora="$link_radio_clasica" ;;
"exterior") emisora="$link_radio_exterior" ;;
"marca") emisora="$link_radio_marca" ;;
*) emisora="$2" ;;
esac
####
####
echo "$duo_md [  ok  ] [ $favorite_text_music ] [ $emisora ]"
echo 
echo
if [ "$($command_logname)" != "$NULL" ] ; then
$(sudo -u $($command_logname) $favorite_text_music $emisora) ; exit
else $favorite_text_music $emisora ; exit ; fi
exit; fi
####
####
#### :rutina-final-radio:
##########    english: -info --info -i: info of first option            ##########
##########    spanish: -info --info -i: info of primera opcion          ##########
#### :rutina-inicial-info:
####
####
if   [ "$first_option" == "info" ]; then 
echo "$title_md [ $first_option ]  [ info $second_option ]"
echo "$title_md Launch:  $cmd_file [optional-output] info [pattern-to-search]"
$cmd_binary info-options | grep -i "$second_option"
exit; fi
####
####
#### :rutina-final-info:
##########    english: speed-glx: show frammes por seconds with mesa graphicall            ##########
##########    spanish: speed-glx: muestra los fotogramas por segundo con graphicos mesa    ##########
#### :rutina-inicial-speed-glx:
####
####
if   [ "$first_option" == "speed-glx" ]; then 
echo "$title_md [ $first_option ]  [ test gl mesa3D speed ] [ for default max $time_server_waiting seconds ] "
case $command_glxgears in "$NULL") echo "$tab [ fail ] [ Install mesa utils ]"; exit ;; esac
vblank_mode=0 $command_timeout -s SIGINT -v $time_server_waiting $command_glxgears
echo 
exit; fi
####
####
#### :rutina-final-speed-glx:
##########    english: ntpdate-client: update the date and time    ##########
##########    spanish: ntpdate-client: actualiza la fecha y hora   ##########
#### :rutina-inicial-ntpdate-client:
####
####
if   [ "$first_option" == "ntpdate-client" ]; then 
echo "$title_md [ $first_option ]  [ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]; then echo "$tab [ fail ] [ Install one ntp client ]" ; fi
echo "$tab Old date: $($command_date)"
echo "$tab [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $($command_date)"
exit; fi
####
####
#### :rutina-final-ntpdate-client:
##########    english: wizard-mini: wizard-mini      ##########
##########    spanish: wizard-mini: mini-asistente   ##########
#### :rutina-inicial-wizard-mini:
####
####
if [ "$first_option" == "wizard-mini" ]; then echo 
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-mini" ; name_firewall="wizard-mini"
cp "$defaultminicfg_eng" "$directory_temporal/$cmd_config-$archivo"
$favorite_text_editor "$directory_temporal/$cmd_config-$archivo"
clear
$favorite_text_dialog --clear --title "Run this wizard" --yesno "Run this wizard" 0 0 && clear \
&& cp "$directory_temporal/$cmd_config-$archivo" "$directory_config/$archivo" && $cmd_binary custom $archivo || clear
####
####
exit; fi
####
####
#### :rutina-final-wizard-mini:
##########    english: wizard-full: wizard-full     ##########
##########    spanish: wizard-full: asistente       ##########
#### :rutina-inicial-wizard-full:
####
####
if [ "$first_option" == "wizard-full" ]; then $nada
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-full" ; name_firewall="wizard-full"
cp "$defaultfullcfg_eng" "$directory_temporal/$cmd_config-$archivo"
$favorite_text_editor "$directory_temporal/$cmd_config-$archivo"
clear
$favorite_text_dialog --clear --title "Run this wizard" --yesno "Run this wizard" 0 0 && clear \
&& cp "$directory_temporal/$cmd_config-$archivo" "$directory_config/$archivo" && $cmd_binary custom $archivo || clear 
####
####
exit; fi
####
####
#### :rutina-final-wizard-full:
##########    english: load: load the rules in iptables format      ##########
##########    spanish: load: carga las reglas en formato iptables   ##########
#### :rutina-inicial-load:
####
####
if [ "$first_option" == "load" ]; then 
####
####
#### English: Void in second option
####
####
if [ "second_option" == "$NULL" ]; then
$cmd_binary names ; echo "$tab [ info ] [ usage: $cmd_binary load fw-to-load ] [ See: $cmd_binary names ]" ; exit ; fi
####
####
#### English if do exist second option in load
####
####
if [ -f $directory_fwrecover/$second_option-nft-ipv4 ] || [ -f $directory_fwrecover/$second_option-legacy-ipv4 ] ; then 
echo $give_load
####
####
#### English: show message
####
####
echo "$title_md [ info ] [ Loading rules ]"
####
####
#### English: Remove all rules
####
####
$cmd_binary eraserules &> /dev/null
####
####
#### English: Load all rules 
####
####
if [ -f "$directory_fwrecover/$second_option-ebtables" ]; then
cat $directory_fwrecover/$second_option-ebtables | $command_ebtables-restore &> /dev/null; fi
####
####
if [ -f "$directory_fwrecover/$second_option-arptables" ]; then
cat $directory_fwrecover/$second_option-arptables | $command_arptables-restore &> /dev/null; fi
####
#### 
cat $directory_fwrecover/$second_option-nft-ipv4 |  $command_iptables_nft-restore       
cat $directory_fwrecover/$second_option-legacy-ipv4 | $command_iptables_legacy-restore  
cat $directory_fwrecover/$second_option-nft-ipv6 | $command_ip6tables_nft-restore       
cat $directory_fwrecover/$second_option-legacy-ipv6 | $command_ip6tables_legacy-restore 
echo "$title_md [ _ok_ ] [ firewall loaded ] [ $directory_fwrecover/$second_option ]"
####
####
#### english: if no found #### spanish: si no encuentra
####
####
else
$cmd_binary names
echo "$tab [ info ] [ usage: $cmd_binary load fw-to-load ] [ See: $cmd_binary names ]"
fi 
####
####
#### echo 
exit; fi
####
####
#### :rutina-final-load:
##########    english: save: save the rules in iptables format      ##########
##########    spanish: save: guarda las reglas en formato iptables  ##########
#### :rutina-inicial-save:
####
####
if [ "$first_option" == "save" ]; then 
echo "$title_md [ $first_option ]  [ save one firewall with one name ] "
case "$second_option" in
"$NULL") echo "$tab [ info ] [ Usage: $cmd_binary save fw-to-save ]" ; exit ;;
*) archivofin="$second_option" ;; 
esac
####
####
echo "$title_md [ info ] [ saving firewall ] [ $archivofin ]"
if [ "$command_arptables" == "$NULL"  ]; then $nada ; else
$command_arptables-save &> $directory_fwrecover/$archivofin-arptables; fi
if [ "$command_ebtables"  == "$NULL"  ]; then $nada ; else
$command_ebtables-save &> $directory_fwrecover/$archivofin-ebtables; fi
####
####
if [ "$command_iptables_nft"  == "$NULL"  ]; then $nada ; else
$command_iptables_nft-save      &> $directory_fwrecover/$archivofin-nft-ipv4 ; fi
if [ "$command_ip6tables_nft"  == "$NULL"  ]; then $nada ; else
$command_ip6tables_nft-save      &> $directory_fwrecover/$archivofin-nft-ipv6 ; fi
if [ "$command_iptables_legacy"  == "$NULL"  ]; then $nada ; else
$command_iptables_legacy-save    &> $directory_fwrecover/$archivofin-legacy-ipv4 ; fi
if [ "$command_ip6tables_legacy"  == "$NULL"  ]; then $nada ; else
$command_ip6tables_legacy-save   &> $directory_fwrecover/$archivofin-legacy-ipv6 ; fi
####
####
echo "$title_md [ _ok_ ] [ firewall saved ] [ $archivofin ]"
if [ "$command_arptables" == "$NULL"  ]; then $nada ; else
$command_ls -l $directory_fwrecover/$archivofin-arptables; fi
if [ "$command_ebtables"  == "$NULL"  ]; then $nada ; else
$command_ls -l $directory_fwrecover/$archivofin-ebtables; fi
####
####
$command_ls -l $directory_fwrecover/$archivofin-nft-ipv4
$command_ls -l $directory_fwrecover/$archivofin-nft-ipv6
$command_ls -l $directory_fwrecover/$archivofin-legacy-ipv4
$command_ls -l $directory_fwrecover/$archivofin-legacy-ipv6
echo "$title_md [ _ok_ ] [ firewall listed ] [ $archivofin ]"
exit; fi
####
####
#### :rutina-final-save:
##########    english: show: show the rules from one firewall in iptables format    ##########
##########    spanish: show: muestra las reglas de un firewall en formato iptables  ##########
#### :rutina-inicial-show:
####
####
if [ "$first_option" == "show" ]; then 
echo "$title_md [ $first_option ]  [ show one firewall saved ] "
echo 
case "$second_option" in
"$NULL") $cmd_binary names; echo "$tab [ info ] [ Use: $cmd_binary show file-to-show ]" ; exit ;;
*) archivofin=$($command_sed 's/\///g' <<< "$second_option") ;;
esac
$command_ls -l $directory_fwrecover/$archivofin-arptables
$command_ls -l $directory_fwrecover/$archivofin-ebtables
$command_ls -l $directory_fwrecover/$archivofin-nft-ipv4
$command_ls -l $directory_fwrecover/$archivofin-nft-ipv6
$command_ls -l $directory_fwrecover/$archivofin-legacy-ipv4
$command_ls -l $directory_fwrecover/$archivofin-legacy-ipv6
echo "$title_md [ _ok_ ] [ FIREWALL LISTED ] [ $archivofin ]"
echo "$cincuenta $archivofin-arptables"
cat $directory_fwrecover/$archivofin-arptables
echo "$cincuenta $archivofin-ebtables"
cat $directory_fwrecover/$archivofin-ebtables
echo "$cincuenta $archivofin-nft-ipv4"
cat $directory_fwrecover/$archivofin-nft-ipv4
echo "$cincuenta $archivofin-legacy-ipv4"
cat $directory_fwrecover/$archivofin-legacy-ipv4
echo "$cincuenta $archivofin-nft-ipv6"
cat $directory_fwrecover/$archivofin-nft-ipv6
echo "$cincuenta archivofin-legacy-ipv6"
cat $directory_fwrecover/$archivofin-legacy-ipv6
echo "$title_md [ _ok_ ] [ firewall readed ] [ $archivofin ]"
echo 
exit; fi
####
####
#### :rutina-final-show:
##########    english: actual: show actual firewall          ##########
##########    spanish: actual: muestra las reglas actuales   ##########
#### :rutina-inicial-actual:
####
####
if [ "$first_option" == "actual" ]; then 
echo "$title_md [ $first_option ]  [ show the last firewall saved ] "
echo 
$command_arptables-save          &> $directory_fwrecover/$cmd_config-actual-arptables
$command_ebtables-save           &> $directory_fwrecover/$cmd_config-actual-ebtables   
$command_iptables_nft-save       &> $directory_fwrecover/$cmd_config-actual-nft-ipv4   
$command_iptables_legacy-save    &> $directory_fwrecover/$cmd_config-actual-legacy-ipv4
$command_ip6tables_nft-save      &> $directory_fwrecover/$cmd_config-actual-nft-ipv6   
$command_ip6tables_legacy-save   &> $directory_fwrecover/$cmd_config-actual-legacy-ipv6
echo "$cincuenta arptables $cinco"
cat $directory_fwrecover/$cmd_config-actual-arptables
echo "$cincuenta ebtables $cinco"
cat $directory_fwrecover/$cmd_config-actual-ebtables
echo "$cincuenta nft with ipv4 $cinco"
cat $directory_fwrecover/$cmd_config-actual-nft-ipv4
echo "$cincuenta legacy with ipv4 $cinco"
cat $directory_fwrecover/$cmd_config-actual-legacy-ipv4
echo "$cincuenta nft with ipv6 $cinco"
cat $directory_fwrecover/$cmd_config-actual-nft-ipv6
echo "$cincuenta legacy with ipv6 $cinco"
cat $directory_fwrecover/$cmd_config-actual-legacy-ipv6
echo
echo "  [ _ok_ ] [ readed firewall actual ]"
exit; fi
####
####
#### :rutina-final-actual:
##########    english: stop: stop firewall      ##########
##########    spanish: stop: para el firewall   ##########
#### :rutina-inicial-stop:
####
####
if [ "$first_option" == "stop" ]; then 
echo "$title_md [ $first_option ]  [ Stop the firewall ] "
####
####
#### english: save actual fw #### spanish: guarda actual fw
####
####
$command_arptables-save &> $directory_fwrecover/$cmd_config-stoped-arptables
$command_ebtables-save &> $directory_fwrecover/$cmd_config-stoped-ebtables             
$command_iptables_nft-save &> $directory_fwrecover/$cmd_config-stoped-nft-ipv4         
$command_iptables_legacy-save &> $directory_fwrecover/$cmd_config-stoped-legacy-ipv4   
$command_ip6tables_nft-save &> $directory_fwrecover/$cmd_config-stoped-nft-ipv6        
$command_ip6tables_legacy-save &> $directory_fwrecover/$cmd_config-stoped-legacy-ipv6  
####
####
#### english: erase the rules #### spanish: borra las reglas
####
####
$cmd_binary eraserules &> /dev/null
echo "$title_md [ info ] [ stopping firewall ]"
echo "$title_md [ _ok_ ] [ firewall stopped  ]"
exit; fi
####
####
#### :rutina-final-stop:
##########    english: continue: continue the firewall      ##########
##########    spanish: continue: continua el cortafuegos    ##########
#### :rutina-inicial-continue:
####
####
if [ "$first_option" == "continue" ]; then 
echo "$title_md [ $first_option ]  [ Continue the stoped firewall ] "
####
####
#### english: restore last fw #### spanish: restaura el ultimo fw
####
####
cat $directory_fwrecover/$cmd_config-stoped-arptables | $command_arptables-restore
cat $directory_fwrecover/$cmd_config-stoped-ebtables | $command_ebtables-restore
cat $directory_fwrecover/$cmd_config-stoped-nft-ipv4 | $command_iptables_nft-restore  
cat $directory_fwrecover/$cmd_config-stoped-legacy-ipv4 | $command_iptables_legacy-restore  
cat $directory_fwrecover/$cmd_config-stoped-nft-ipv6 | $command_ip6tables_nft-restore  
cat $directory_fwrecover/$cmd_config-stoped-legacy-ipv6 | $command_ip6tables_legacy-restore  
echo "$title_md [ info ] [ continue firewall  ]"
echo "$title_md [ _ok_ ] [ firewall continued ]"
exit; fi
####
####
#### :rutina-final-continue:
##########    english: speed-ip4: speed from internet        ##########
##########    spanish: speed-ip4: velocidad desde internet   ##########
#### :rutina-inicial-speed-ip4:
####
####
if   [ "$first_option" == "speed-ip4" ]; then 
echo "$title_md [ $first_option ]  [ test speed ipv4 with internet ] "
case "$command_iperf"  in  $NULL) echo "$title_md [ fail ] [ Install Iperf command ]"; exit ;; esac
####
####
echo "$title_md"
echo "$title_md [ info ] Stop firewall & Run speed ip4 & Continue firewall"
echo "$title_md"
$cmd_binary stop
echo "$title_md"
echo "$title_md [ Doing bandwidth in ipv4 to $serverip_iperf_ipv4 ]"
$command_iperf -c $serverip_iperf_ipv4 -t 4 -P 1 -p $serverport_iperf_ipv4 |tail -3
echo "$title_md"
$cmd_binary continue
exit; fi
####
####
#### :rutina-final-speed-ip4:
##########    english: speed-ip6: speed from internet        ##########
##########    spanish: speed-ip6: velocidad desde internet   ##########
#### :rutina-inicial-speed-ip6:
####
####
if   [ "$first_option" == "speed-ip6" ]; then 
echo "$title_md [ $first_option ]  [ test speed ipv6 with internet ] "
case "$command_iperf"  in  $NULL) echo "$title_md [ fail ] [ install iperf command ]"; exit ;; esac
####
####
echo "$title_md"
echo "$title_md [ info ] Stop firewall & Run speed ip4 & Continue firewall"
echo "$title_md"
$cmd_binary stop
echo "$title_md"
echo "$title_md [ Doing bandwidth in ipv6 to $serverip_iperf_ipv6 ]"
$command_iperf -c $serverip_iperf_ipv6 -V -t 4 -P 1 -p $serverport_iperf_ipv6 | tail -3
echo "$title_md"
$cmd_binary continue
exit; fi
####
####
#### :rutina-final-speed-ip6:
##########    english: sockets: The sockets option  ##########
##########    spanish: sockets: La opcion sockets   ##########
#### :rutina-inicial-sockets:
####
####
if   [ "$first_option" == "sockets" ]; then 
echo "$title_md [ $first_option ] [ Show sockets with ss ] "
if [ "$command_ss" == "$NULL" ]; then echo "$tab [ fail ] [ Install ss command ]"; exit; fi
echo "$title_md [ info ] [ The listen sockets ]"
$command_ss -l  | $command_grep "\:\*"  ;
exit; fi
####
####
#### :rutina-final-sockets:
##########    english: webcert: get the certificate from one web       ##########
##########    spanish: webcert: obtiene el certificado de una web      ##########
#### :rutina-inicial-webcert:
####
####
if   [ "$first_option" == "webcert" ] ; then 
echo "$title_md [ $first_option ]  [ get one web certifcate from one server with port 443] || ||"
case "$command_openssl"  in  $NULL) echo "$tab [ fail ] [ install openssl ]"; exit ;; esac
####
####
if [ "$second_option" == "$NULL" ]; then
echo "[ get one web certifcate ] [ Example: $cmd_binary webcert www.fast.com ]"; exit; fi
echo
$command_timeout -s SIGINT -v $time_server_waiting $command_openssl s_client -connect $second_option:443
exit; fi
####
####
#### :rutina-final-webcert:
##########    english: -gui: Manage gui con three options  ##########
##########    spanish: -gui: Maneja gui con tres opciones  ##########
####
####
#### english: with third option
#### spanish: con tercera opcion
####
####
if [ "$first_option" == "gui" ] && [ "$third_option" != "$NULL" ] ; then $nada
echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]" ; exit ;; esac
case $second_option in
#### 
#### 
"new-mini-config")
cp "$defaultminicfg_eng" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="NEW MINI CONFIG" 1> "$directory_config/$third_option" ;
if [ -s "$directory_config/$third_option" ]; then $nada ;
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="OK new config file: $third_option AND launch: $cmd_binary custom $third_option" ; exit
else rm "$directory_config/$third_option" ; 
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="Canceled new file: $third_option" ; exit; fi
;;
#### 
#### 
"new-full-config")
cp "$defaultfullcfg_eng" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="NEW FULL CONFIG" 1> "$directory_config/$third_option" ;
if [ -s "$directory_config/$third_option" ]; then $nada ;
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="OK new config file: $third_option AND launch: $cmd_binary custom $third_option" ; exit
else rm "$directory_config/$third_option" ; 
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="Canceled new file: $third_option" ; exit; fi
;;
#### 
#### 
"nueva-mini-config")
cp "$defaultminicfg_spa" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="NUEVA MINI CONFIG" 1> "$directory_config/$third_option" ;
if [ -s "$directory_config/$third_option" ]; then $nada ;
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="OK new config file: $third_option AND launch: $cmd_binary custom $third_option" ; exit
else rm "$directory_config/$third_option" ; 
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="Canceled new file: $third_option" ; exit; fi
;;
#### 
#### 
"nueva-completa-config")
cp "$defaultfullcfg_spa" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="NUEVA COMPLETA CONFIG" 1> "$directory_config/$third_option" ;
if [ -s "$directory_config/$third_option" ]; then $nada ;
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="OK new config file: $third_option AND launch: $cmd_binary custom $third_option" ; exit
else rm "$directory_config/$third_option" ; 
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="Canceled new file: $third_option" ; exit; fi
;;
#### 
#### 
"modify-config")
if [ -f "$directory_config/$third_option" ] ; then $nada
else $favorite_graphicall_dialog  --forms $graphic_window_dimension --text="file not found: $third_option" ; exit ; fi 
cp "$directory_config/$third_option" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="MODIFY CONFIG" 1> "$directory_config/$third_option"
if [ -s "$directory_config/$third_option" ]; then $nada ; 
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="OK. file: $third_option"
else cp "$directory_temporal/$cmd_config-$third_option" "$directory_config/$third_option"
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="Canceled. file: $third_option"; fi
;;
####
####
*)$cmd_binary "$second_option" "$third_option" "$quad_option" &> "$temporal_guifinal"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --title="Gui Output || $cmd_binary ||" \
--filename="$temporal_guifinal" --auto-scroll ;;
#### 
#### 
esac
#### 
#### 
exit; fi
####
####
##########    english: -gui: with second option    ##########
##########    spanish: -gui: con segunda opcion    ##########
####
####
if [ "$first_option" == "gui" ] && [ "$second_option" != "$NULL" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]" ; exit ;; esac
####
case $second_option in
#### 
#### 
"wizard-mini")
archivo="wizard-mini"
cp "$defaultminicfg_eng" "$directory_temporal/$cmd_config-$archivo"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$archivo" \
--editable --title="WIZARD MINI" 1> "$directory_config/$archivo"
if [  -s "$directory_config/$archivo" ]; then $nada ; 
$cmd_binary -gui custom $archivo ; $cmd_binary -gui list4;
else rm "$directory_config/$archivo" ;
$favorite_graphicall_dialog --info $graphic_window_dimension --text "Ok. $archivo canceled"; fi
;;
#### 
#### 
"wizard-full")
archivo="wizard-full"
cp "$defaultfullcfg_eng" "$directory_temporal/$cmd_config-$archivo"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$archivo" \
--editable --title="WIZARD FULL" 1> "$directory_config/$archivo"
if [  -s "$directory_config/$archivo" ]; then $nada ; 
$cmd_binary -gui custom $archivo ; $cmd_binary -gui list4;
else rm "$directory_config/$archivo" ;
$favorite_graphicall_dialog  --info $graphic_window_dimension --text "OK. $archivo canceled"; fi
;;
#### 
#### 
"modify-config")
if [ -f "$directory_config/$third_option" ] ; then $nada
else $favorite_graphicall_dialog  --forms $graphic_window_dimension --text="file not found: $third_option" ; exit ; fi 
cp "$directory_config/$third_option" "$directory_temporal/$cmd_config-$third_option"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$directory_temporal/$cmd_config-$third_option" \
--editable --title="MODIFY CONFIG $third_option" 1> "$directory_config/$third_option"
if [ -s "$directory_config/$third_option" ]; then $nada ; 
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="OK. file: $third_option"
else cp "$directory_temporal/$cmd_binary-$third_option" "$directory_config/$third_option"
$favorite_graphicall_dialog --forms $graphic_window_dimension --text="Canceled. file: $third_option"; fi
;;
#### 
####
"preferences-modify")
archivo="default"
cp "$default_preferences" "$default_preferences.old"
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --filename="$default_preferences.old" \
--editable --title="MODIFY PREFERENCES" 1> "$default_preferences"
if [ ! -s "$default_preferences" ]; then cp "$default_preferences.old" "$default_preferences" ;
$favorite_graphicall_dialog  --info $graphic_window_dimension --text "OK. $archivo canceled"; fi
;;
####
####
*)$cmd_binary $second_option $third_option &> $temporal_guifinal
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --title="Gui Output || $cmd_binary ||" \
--filename="$temporal_guifinal" --auto-scroll ;;
#### 
#### 
esac
#### 
#### 
exit; fi
####
####
##########    english: -gui: without more options    ##########
##########    spanish: -gui: sin mas opcion          ##########
####
####
if [ "$first_option" == "gui" ] && [ "$second_option" == "$NULL" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]" ; exit ;; esac
$favorite_graphicall_dialog  --forms $graphic_window_dimension --title="Gui Output || $cmd_binary || " --text="$($cmd_binary empty_first_option)"
exit; fi
####
####
##########    english: config-eng: several options to config in english        ##########
##########    spanish: config-eng: varias opciones para configurar en ingles   ##########
#### :rutina-inicial-config-eng:
####
####
if [ "$first_option" == "config-eng" ]; then 
echo "$title_md [ $first_option ] [ show variables cfg from english configuration ] "
cat  $defaultfullcfg_eng
exit; fi
####
####
#### :rutina-final-config-eng:
##########    english: config-spa: several options to config in spanish         ##########
##########    spanish: config-spa: varias opciones para configurar en spanish   ##########
#### :rutina-inicial-config-spa:
####
####
if [ "$first_option" == "config-spa" ]; then 
echo "$title_md [ $first_option ] [ show variables cfg from spanish configuration ] "
cat $defaultfullcfg_spa
exit; fi
####
####
#### :rutina-final-config-spa:
##########    english: gui-shell-zenity: graphic enviroment            ##########
##########    spanish: gui-shell-zenity: entorno de comandos grafico   ##########
#### :rutina-inicial-gui-shell-zenity:
####
####
if   [ "$first_option" == "gui-shell-zenity" ] ; then echo $head_waiting_gui ; echo $give_cover
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_binary gui-shell-zenity"
untexto="$cmd_binary gui-shell-zenity"
favorite_graphicall_dialog="$command_zenity"
####
####
#### cd $directory_config
####
####
menugtk=$($favorite_graphicall_dialog  --forms $graphic_window_dimension --title="Gui Shell || $cmd_binary || $cmd_version ||" \
--text="$($cmd_binary list-options)" --add-entry="$cmd_binary " )
case $? in
1)
####
####
#### zenity --info $graphic_window_dimension --text="$cmd_binary good bye";
####
####
$favorite_graphicall_dialog  --progress $graphic_window_dimension --timeout=$time_close_graphicall --text="$mensage_with_timeout" \
--auto-close --auto-kill ; exit;;
esac
####
####
#### english: manage some configs    ####
#### spanish: maneja algunas configs ####
####
####
case $menugtk in
####
####
#### english: new-full-config and nueva-completa-config whithout parameters ####
#### spanish: new-full-config and nueva-completa-config sin parametros      ####
####
####
"new-full-config")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-full-config config.cfg ]"
;;
"new-mini-config")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-mini-config config.cfg ]"
;;
"nueva-completa-config")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-completa-config config.cfg ]"
;;
"new-mini-config")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-mini-config config.cfg ]"
;;
"modify-config")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary modify-config config.cfg ]"
;;
####
####
#### english: new-full-config and nueva-completa-config whithout parameters and with one space  ####
#### spanish: new-full-config and nueva-completa-config sin parametros y con un espacio         ####
####
####
"new-full-config ")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-full-config config.cfg ]"
;;
"new-mini-config ")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-mini-config config.cfg ]"
;;
"nueva-completa-config ")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-completa-config config.cfg ]"
;;
"new-mini-config ")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-mini-config config.cfg ]"
;;
"modify-config ")
$favorite_graphicall_dialog  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary modify-config config.cfg ]"
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity new-full-config $unarchivo
;;
nueva-completa-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity nueva-completa-config $unarchivo
;;
new-mini-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity new-mini-config $unarchivo
;;
nueva-mini-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity nueva-mini-config $unarchivo
;;
modify-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity modify-config $unarchivo
;;
show-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity show-config $unarchivo
;;
wizard-full*) $cmd_binary -gui-zenity wizard-full ;;
wizard-mini*) $cmd_binary -gui-zniety wizard-mini ;;
preferences-modify*) 
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-zenity preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
"$NULL")
$favorite_graphicall_dialog  --info $graphic_window_dimension --text="$cmd_binary good bye";
$favorite_graphicall_dialog  --progress $graphic_window_dimension --timeout=1 --text="Closing gui menu" --auto-close --auto-kill ; exit ;;
*) fecha_temporal=$(date | $command_sed s/\ //g) ; $cmd_binary $menugtk &> /tmp/fwiptables-$fecha_temporal
$favorite_graphicall_dialog  --text-info $graphic_window_dimension --title="[ $cmd_binary gui-shell ] [ $menugtk ]" --filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal
;;
esac
$cmd_binary gui-shell-zenity
exit ; fi
####
####
#### :rutina-final-gui-shell-zenity:
##########    english: gui-shell-yad: graphic enviroment            ##########
##########    spanish: gui-shell-yad: entorno de comandos grafico   ##########
#### :rutina-inicial-gui-shell-yad:
####
####
if   [ "$first_option" == "gui-shell-yad" ] ; then echo $head_waiting_gui ; echo $give_cover
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_binary gui-shell-yad"
untexto="$cmd_binary gui-shell-yad"
favorite_graphicall_dialog="$command_yad"
####
####
#### cd $directory_config
####
####
menugtk=$($command_yad --entry $graphic_window_dimension --entry-label="$($cmd_binary list-options)" \
--entry-text="first_option [ second_option ] " )
case $? in
1)
####
####
#### zenity --info $graphic_window_dimension --text="$cmd_binary good bye";
####
####
$command_yad  --progress $graphic_window_dimension --timeout=$time_close_graphicall --text="$mensage_with_timeout" \
--auto-close --auto-kill ; exit;;
esac
####
####
#### english: manage some configs    ####
#### spanish: maneja algunas configs ####
####
####
case $menugtk in
####
####
#### english: new-full-config and nueva-completa-config whithout parameters ####
#### spanish: new-full-config and nueva-completa-config sin parametros      ####
####
####
"new-full-config")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-full-config config.cfg ]"
;;
"new-mini-config")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-mini-config config.cfg ]"
;;
"nueva-completa-config")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-completa-config config.cfg ]"
;;
"new-mini-config")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-mini-config config.cfg ]"
;;
"modify-config")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary modify-config config.cfg ]"
;;
####
####
#### english: new-full-config and nueva-completa-config whithout parameters and with one space  ####
#### spanish: new-full-config and nueva-completa-config sin parametros y con un espacio         ####
####
####
"new-full-config ")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-full-config config.cfg ]"
;;
"new-mini-config ")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary new-mini-config config.cfg ]"
;;
"nueva-completa-config ")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-completa-config config.cfg ]"
;;
"new-mini-config ")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary nueva-mini-config config.cfg ]"
;;
"modify-config ")
$command_yad  --forms $graphic_window_dimension --text="$tab [ info ] [ Use: $cmd_binary modify-config config.cfg ]"
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad new-full-config $unarchivo
;;
nueva-completa-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad nueva-completa-config $unarchivo
;;
new-mini-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad new-mini-config $unarchivo
;;
nueva-mini-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad nueva-mini-config $unarchivo
;;
modify-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad modify-config $unarchivo
;;
show-config*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad show-config $unarchivo 
;;
wizard-full*) $cmd_binary -gui-yad wizard-full ;;
wizard-mini*) $cmd_binary -gui-yad wizard-mini ;;
preferences-modify*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | cut -d " " -f 2)
$cmd_binary -gui-yad preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
"$NULL") exit ;;
*) fecha_temporal=$(date | $command_sed s/\ //g) ; $cmd_binary $menugtk &> /tmp/fwiptables-$fecha_temporal
$command_yad  --text-info $graphic_window_dimension --title="[ $cmd_binary gui-shell ] [ $menugtk ]" --filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal
;;
esac
$cmd_binary gui-shell-yad
exit ; fi
####
####
#### :rutina-final-gui-shell-yad:
##########    english: cli-menu: Manage list rules with one text menu          ##########
##########    spanish: cli-menu: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu:
####
####
if   [ "$first_option" == "cli-menu" ]; then $nada
case "$favorite_text_dialog" in "$NULL") echo "$title_md [ fail ] [ Install or dialog or whiptail to work ]" ; exit ;; esac
menuprincipal="$($favorite_text_dialog --clear --notags --title "Cli Menu With $cmd_version" --menu "Select" 0 0 0 \
0000 "$quad $tab [$cmd_binary cli-menu] $tab $cinco" \
0100 "$quad [  --- Full Options --- ] $cinco" \
0200 "$quad [ Firewall Control ] $cinco" \
0201  "$tab stop" \
0202  "$tab continue" \
0203  "$tab reset" \
0204  "$tab names"  \
0205  "$tab show" \
0206  "$tab save" \
0207  "$tab load" \
0208  "$tab actual" \
0300 "$quad [ Firewall List With Conceptual ] $cinco" \
0301  "$tab list4" \
0302  "$tab list6"  \
0303  "$tab list-filter4" \
0304  "$tab list-filter6" \
0305  "$tab list-forward" \
0306  "$tab list-forward6" \
0307  "$tab list-nat4" \
0308  "$tab list-nat6" \
0309  "$tab list-alltables" \
0314  "$tab list-raw4" \
0315  "$tab list-raw6" \
0316  "$tab list-mangle4" \
0317  "$tab list-mangle6" \
0318  "$tab list-security4" \
0319  "$tab list-security6" \
0320  "$tab list-ebtables" \
0321  "$tab list-arptables" \
0400 "$quad [ Firewall List With Numeral ] $cinco" \
0401  "$tab listn4" \
0402  "$tab listn6" \
0403  "$tab listn-filter4" \
0404  "$tab listn-filter6" \
0405  "$tab listn-forward" \
0406  "$tab listn-forward6" \
0407  "$tab listn-nat4" \
0408  "$tab listn-nat6" \
0409  "$tab listn-alltables" \
0414  "$tab listn-raw4" \
0415  "$tab listn-raw6" \
0416  "$tab listn-mangle4" \
0417  "$tab listn-mangle6" \
0418  "$tab listn-security4" \
0419  "$tab listn-security6" \
0420  "$tab listn-ebtables" \
0421  "$tab listn-arptables" \
0500 "$quad [ Firewall Static ] $cinco" \
0507  "$tab client-basic" \
0508  "$tab client-web" \
0509  "$tab client-git" \
0510  "$tab games-shooter" \
0511  "$tab game-wesnoth" \
0512  "$tab game-minetest" \
0513  "$tab game-freeciv" \
0514  "$tab game-widelands" \
0515  "$tab client-web" \
0516  "$tab client-vnc" \
0517  "$tab client-tor" \
0518  "$tab client-vpn" \
0519  "$tab client-torrent" \
0520  "$tab lan-tor" \
0521  "$tab lan-vpn" \
0522  "$tab shield-ssh" \
0523  "$tab server-ssh" \
0524  "$tab server-web" \
0525  "$tab server-vnc" \
0526  "$tab server-print" \
0527  "$tab server-samba" \
0528  "$tab server-lamp" \
0529  "$tab server-mail" \
0530  "$tab server-ftp" \
0531  "$tab server-news" \
0532  "$tab server-teamspeak" \
0533  "$tab server-mumble" \
0534  "$tab server-sql" \
0535  "$tab server-asterisk" \
0600 "$quad [ Firewall Custom ] $cinco" \
0601  "$tab eraserules" \
0602  "$tab wizard-mini" \
0603  "$tab wizard-full" \
0604  "$tab off-line" \
0605  "$tab all-permisive" \
0606  "$tab custom" \
0607  "$tab clone-static" \
0611  "$tab new-full-config" \
0612  "$tab nueva-completa-config" \
0613  "$tab new-mini-config" \
0614  "$tab nueva-mini-config" \
0615  "$tab show-config" \
0616  "$tab modify-config" \
0617  "$tab del-config" \
0618  "$tab names-config" \
0619  "$tab regen-config" \
0620  "$tab examples-config" \
0700 "$quad [ Options Easy ] $cinco" \
0701  "$tab preferences-read" \
0702  "$tab preferences-modify" \
0703  "$tab preferences-regen" \
0704  "$tab filelog" \
0705  "$tab autolog" \
0706  "$tab ip4" \
0707  "$tab ip6" \
0708  "$tab speed-ip4" \
0709  "$tab speed-ip6" \
0710  "$tab sockets" \
0711  "$tab notes" \
0712  "$tab license" \
0713  "$tab version" \
0714  "$tab examples" \
0715  "$tab depends" \
0716  "$tab info" \
0717  "$tab ver" \
0718  "$tab list-options" \
0719  "$tab clasic-options" \
0720  "$tab info-options" \
0721  "$tab nodes" \
0722  "$tab date" \
0723  "$tab free" \
0724  "$tab expert" \
0725  "$tab commands" \
0726  "$tab variables" \
0727  "$tab intro" \
0728  "$tab download" \
0729  "$tab install" \
3>&1 1>&2 2>&3 )"
################################################################################
#### 
#### 
#### english: dialog choosed #### spanish: dialogo elegido
#### 
#### 
case "$menuprincipal" in
##########
##########
0000) clear ; $cmd_binary cli readme  ;;
0100) clear ; $cmd_binary cli options ;;
0200) clear ; $cmd_binary cli firewall-control ;;
0300) clear ; $cmd_binary cli firewall-conceptual ;;
0400) clear ; $cmd_binary cli firewall-numeral ;;
0500) clear ; $cmd_binary cli firewall-static ;;
0600) clear ; $cmd_binary cli firewall-custom ;;
0700) clear ; $cmd_binary cli default-state ;;
################################################################################
0201) clear ; $cmd_binary cli stop ;;
0202) clear ; $cmd_binary cli continue ;;
0203) clear ; $cmd_binary cli reset ;;
0204) clear ; $cmd_binary cli names ;;
0205) clear ; $cmd_binary names ; echo "$cincuenta"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g) ; $cmd_binary show $nombrecillo ;; 
0206)archivo="$($favorite_text_dialog --stdout --title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ;  echo "$cincuenta saved $archivo" ; $cmd_binary save $archivo ;;
0207) clear ; $cmd_binary names ; echo "$cincuenta"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g) ; $cmd_binary load $nombrecillo ;;
0208) clear ; $cmd_binary cli actual ;;
################################################################################
0301) clear ; $cmd_binary cli list4 ;;
0302) clear ; $cmd_binary cli list6 ;;
0303) clear ; $cmd_binary cli list-filter4 ;;
0304) clear ; $cmd_binary cli list-filter6 ;;
0305) clear ; $cmd_binary cli list-forward ;;
0306) clear ; $cmd_binary cli list-forward6 ;;
0307) clear ; $cmd_binary cli list-nat4 ;;
0308) clear ; $cmd_binary cli list-nat6 ;;
0309) clear ; $cmd_binary cli list-alltables ;;
0314) clear ; $cmd_binary cli list-raw4 ;;
0315) clear ; $cmd_binary cli list-raw6 ;;
0316) clear ; $cmd_binary cli list-mangle4 ;; 
0317) clear ; $cmd_binary cli list-mangle6 ;;
0318) clear ; $cmd_binary cli list-security4 ;;
0319) clear ; $cmd_binary cli list-security6 ;;
0320) clear ; $cmd_binary cli list-ebtables ;;
0321) clear ; $cmd_binary cli list-arptables ;;
################################################################################
0401) clear ; $cmd_binary cli listn4 ;;
0402) clear ; $cmd_binary cli listn6 ;;
0403) clear ; $cmd_binary cli listn-filter4 ;;
0404) clear ; $cmd_binary cli listn-filter6 ;;
0405) clear ; $cmd_binary cli listn-forward ;;
0406) clear ; $cmd_binary cli listn-forward6 ;;
0407) clear ; $cmd_binary cli listn-nat4 ;;
0408) clear ; $cmd_binary cli listn-nat6 ;;
0409) clear ; $cmd_binary cli listn-alltables ;;
0414) clear ; $cmd_binary cli listn-raw4 ;;
0415) clear ; $cmd_binary cli listn-raw6 ;;
0416) clear ; $cmd_binary cli listn-mangle4 ;; 
0417) clear ; $cmd_binary cli listn-mangle6 ;;
0418) clear ; $cmd_binary cli listn-security4 ;;
0419) clear ; $cmd_binary cli listn-security6 ;;
0420) clear ; $cmd_binary cli list-ebtables ;;
0421) clear ; $cmd_binary cli list-arptables ;;
################################################################################
0507) clear ; $cmd_binary cli client-basic ; $cmd_binary cli list4    ;;
0508) clear ; $cmd_binary cli client-web ; $cmd_binary cli list4    ;;
0509) clear ; $cmd_binary cli client-git ; $cmd_binary cli list4    ;;
0510) clear ; $cmd_binary cli games-shooter ; $cmd_binary cli list4   ;; 
0511) clear ; $cmd_binary cli game-wesnoth ; $cmd_binary cli list4    ;;
0512) clear ; $cmd_binary cli game-minetest ; $cmd_binary cli list4   ;;
0513) clear ; $cmd_binary cli game-freeciv ; $cmd_binary cli list4    ;;
0514) clear ; $cmd_binary cli game-widelands ; $cmd_binary cli list4  ;;
0515) clear ; $cmd_binary cli client-web ; $cmd_binary cli list4      ;;
0516) clear ; $cmd_binary cli client-vnc ; $cmd_binary cli list4      ;;
0517) clear ; $cmd_binary cli client-tor ; $cmd_binary cli list4      ;;
0518) clear ; $cmd_binary cli client-vpn ; $cmd_binary cli list4      ;;
0519) clear ; $cmd_binary cli client-torrent ; $cmd_binary cli list4  ;;
0520) clear ; $cmd_binary cli lan-tor ; $cmd_binary cli list4         ;;
0521) clear ; $cmd_binary cli lan-vpn ; $cmd_binary cli list4         ;; 
0522) clear ; $cmd_binary cli shield-ssh ; $cmd_binary cli list4      ;; 
0523) clear ; $cmd_binary cli server-ssh ; $cmd_binary cli list4      ;;
0524) clear ; $cmd_binary cli server-web ; $cmd_binary cli list4      ;;
0525) clear ; $cmd_binary cli server-vnc ; $cmd_binary cli list4      ;;
0526) clear ; $cmd_binary cli server-print ; $cmd_binary cli list4    ;;
0527) clear ; $cmd_binary cli server-samba ; $cmd_binary cli list4    ;;
0528) clear ; $cmd_binary cli server-lamp ; $cmd_binary cli list4     ;;
0529) clear ; $cmd_binary cli server-mail ; $cmd_binary cli list4     ;;
0530) clear ; $cmd_binary cli server-ftp ; $cmd_binary cli list4      ;;
0531) clear ; $cmd_binary cli server-news ; $cmd_binary cli list4     ;;
0532) clear ; $cmd_binary cli server-teamspeak ; $cmd_binary cli list4  ;;
0533) clear ; $cmd_binary cli server-mumble ; $cmd_binary cli list4   ;;
0534) clear ; $cmd_binary cli server-sql ; $cmd_binary cli list4      ;;
0535) clear ; $cmd_binary cli server-asterisk ; $cmd_binary cli list4 ;;
################################################################################
0601) clear ; $cmd_binary cli eraserules ; $cmd_binary cli list4   ;;
0602) clear ; $cmd_binary cli wizard-mini ; $cmd_binary cli list4  ;;
0603) clear ; $cmd_binary cli wizard-full ; $cmd_binary cli list4  ;;
0604) clear ; $cmd_binary cli off-line ; $cmd_binary cli list4  ;;
0605) clear ; $cmd_binary cli all-permisive ; $cmd_binary cli list4   ;;
0606) 
archivo="$($favorite_text_dialog  --title "custom" --stdout --inputbox "$($command_ls $directory_config)" 0 0)"
archivo="$(echo $archivo | $command_sed s/\\///g)" ;  clear ; $cmd_binary custom $archivo ;;

0607) 
archivo="$($favorite_text_dialog  --title "custom" --stdout --inputbox "$($command_ls $directory_config)" 0 0)"
archivo="$(echo $archivo | $command_sed s/\\///g)" ;  clear ; $cmd_binary clone-static $archivo ;;
0611) archivo="$($favorite_text_dialog  --stdout --title "new-full-config example: file.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary new-full-config $archivo ;;
0612) archivo="$($favorite_text_dialog  --stdout --title "nueva-completa-config example: archivo.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary nueva-completa-config $archivo ;;
0613) archivo="$($favorite_text_dialog  --stdout --title "new-mini-config example: file.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary new-mini-config $archivo ;;
0614) archivo="$($favorite_text_dialog  --stdout --title "nueva-mini-config example: archivo.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary nueva-mini-config $archivo ;;
0615) archivo="$($favorite_text_dialog  --stdout --title "show-config example: file.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary show-config $archivo ; echo "$tab [ info ] [ Use: Launch: $cmd_binary custom $archivo ]";;
0616) archivo="$($favorite_text_dialog  --stdout --title "modify-config example: file.cfg" \
--inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary modify-config $archivo ;;
0617) archivo="$($favorite_text_dialog  --stdout --title "del-config" --inputbox "$($command_ls $directory_config)" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ; $cmd_binary del-config $archivo ; echo "deleted $archivo" ;;
0618) clear ; $cmd_binary cli names-config ;;
0619) clear ; $cmd_binary cli regen-config ;;
0620) clear ; $cmd_binary cli examples-config ;;
################################################################################
0701) clear ; $cmd_binary cli preferences-read ;;
0702) clear ; $cmd_binary cli preferences-modify ;;
0703) clear ; $cmd_binary cli preferences-regen ;;
0704) clear ; $cmd_binary cli filelog ;;
0705) clear ; $cmd_binary cli autolog ;;
0706) clear ; $cmd_binary cli ip4 ;;
0707) clear ; $cmd_binary cli ip6 ;;
0708) clear ; $cmd_binary cli speed-ip4 ;;
0709) clear ; $cmd_binary cli speed-ip6 ;;
0710) clear ; $cmd_binary cli sockets ;;
0711) clear ; $cmd_binary cli notes ;;
0712) clear ; $cmd_binary cli license ;;
0713) clear ; $cmd_binary cli version ;;
0714) clear ; $cmd_binary cli examples ;;
0715) clear ; $cmd_binary cli depends ;;
0716) clear ; $cmd_binary cli info ;;
0717) clear ; $cmd_binary cli ver ;;
0718) clear ; $cmd_binary cli list-options ;;
0719) clear ; $cmd_binary cli clasic-options ;;
0720) clear ; $cmd_binary cli info-options ;;
0721) clear ; $cmd_binary cli nodes ;;
0722) clear ; $cmd_binary cli date ;;
0723) clear ; $cmd_binary cli free ;;
0724) clear ; $cmd_binary cli expert ;;
0725) clear ; $cmd_binary cli commands ;;
0726) clear ; $cmd_binary cli variables ;;
0727) clear ; $cmd_binary cli intro ;;
0728) clear ; $cmd_binary cli download;;
0729) clear ; $cmd_binary cli install;;
################################################################################
*) clear ; $favorite_text_dialog  --msgbox "fwiptables good bye" 0 0 ; clear ; exit ;;
esac 
$cmd_binary text-pause
clear ; 
$cmd_binary cli-menu
exit; fi
####
####
#### :rutina-final-cli-menu:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]; then $nada
read -p '##### [ _ok_ ] ##### Press [enter] to continue now with the cli-menu ##### '
exit; fi
####
####
#### :rutina-final-text-pause:
###############################################################################################################
###############################################################################################################
##########    english: gui-roll-zenity: gui roll general: gui with roll  ##########
##########    spanish: gui-roll-zenity: gui roll general: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity:
####
####
if   [ "$first_option" == "gui-roll-zenity" ] ; then echo $head_waiting_gui ; echo $give_cover
gui_menu="01-Firewall-Control|02-Firewall-List-With-Conceptual|02-Firewall-List-With-Numeral|03-Firewall-Custom|04-firewall-static|05-options-easy"
selection_menu="$($command_zenity --text="gui-roll" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
"01-Firewall-Control")$cmd_binary gui-roll-zenity-firewall-control ; exit ;;
"02-Firewall-List-With-Conceptual")$cmd_binary gui-roll-zenity-firewall-conceptual ; exit ;;
"02-Firewall-List-With-Numeral")$cmd_binary gui-roll-zenity-firewall-numeral ; exit ;;
"03-Firewall-Custom")$cmd_binary gui-roll-zenity-firewall-custom ; exit ;;
"04-firewall-static")$cmd_binary gui-roll-zenity-firewall-static ; exit ;;
"05-options-easy")$cmd_binary gui-roll-zenity-options-easy ; exit ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity:
##########    english: gui-roll-zenity-firewall-control: gui roll firewall-control: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-control: gui roll firewall-control: gui con roll   ##########
#### :rutina-inicial-gui-zenity-roll-firewall-control:
####
####
if   [ "$first_option" == "gui-roll-zenity-firewall-control" ] ; then echo $head_waiting_gui
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|stop|continue|reset|names|show|save|load|actual"
selection_menu="$($command_zenity --text="gui-roll-firewall-control" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
####
case "$selection_final" in
1)$command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
"gui-principal-menu")$cmd_binary gui-roll-zenity ;;
"gui-help-menu")$cmd_binary -gui-zenity help firewall-control ;;
"gui-info-menu")$cmd_binary -gui-zenity info firewall-control ;;
"stop")$cmd_binary -gui-zenity stop ; $cmd_binary -gui-zenity list4;;
"continue")$cmd_binary -gui-zenity continue ; $cmd_binary -gui-zenity list4;;
"reset")$cmd_binary -gui-zenity reset ; $cmd_binary -gui-zenity list4;;
"names")$cmd_binary -gui-zenity names ;;
"show")archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension --title="[Save Firewall]" --entry-text="cfg to show" )" ; 
$cmd_binary -gui-zenity show $archivo ;;
"save")archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension --title="[Save Firewall]" --entry-text="cfg to save")" ; 
$cmd_binary -gui-zenity save $archivo ;;
"load")archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension --title="[Load Firewall]" --entry-text="cfg to load")" ;
$cmd_binary -gui-zenity load $archivo ; $cmd_binary -gui-zenity list4;;
"actual")$cmd_binary -gui-zenity actual ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-control:
##########    english: gui-roll-zenity-firewall-conceptual: gui roll firewall-conceptual: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-conceptual: gui roll firewall-conceptual: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-conceptual:
####
####
if   [ "$first_option" == "gui-roll-zenity-firewall-conceptual" ] ; then echo $head_waiting_gui
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|list-raw4|list-raw6|list-security4|list-security6|list-ebtables|list-arptables"
selection_menu="$($command_zenity --text="gui-roll-firewall-conceptual" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1)$command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
"gui-principal-menu")$cmd_binary gui-roll-zenity ;;
"gui-help-menu")$cmd_binary -gui-zenity help firewall-conceptual ;;
"gui-info-menu")$cmd_binary -gui-zenity info firewall-conceptual ;;
"ls4")$cmd_binary -gui-zenity ls4 ;;
"ls6")$cmd_binary -gui-zenity ls6 ;;
"list-alltables")$cmd_binary -gui-zenity list-alltables ;;
"list-filter4")$cmd_binary -gui-zenity list-filter4 ;;
"list-filter6")$cmd_binary -gui-zenity list-filter6 ;;
"list-nat4")$cmd_binary -gui-zenity list-nat4 ;;
"list-nat6")$cmd_binary -gui-zenity list-nat6 ;;
"list-mangle4")$cmd_binary -gui-zenity list-mangle4 ;;
"list-mangle6")$cmd_binary -gui-zenity list-mangle6 ;;
"list-raw4")$cmd_binary -gui-zenity list-raw4 ;;
"list-raw6")$cmd_binary -gui-zenity list-raw6 ;;
"list-security4")$cmd_binary -gui-zenity list-security4 ;;
"list-security6")$cmd_binary -gui-zenity list-security6 ;;
"list-ebtables")$cmd_binary -gui-zenity list-ebtables ;;
"list-arptables")$cmd_binary -gui-zenity list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-conceptual:
##########    english: gui-roll-zenity-firewall-numeral: gui roll firewall-numeral: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-numeral: gui roll firewall-numeral: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-numeral:
####
####
if   [ "$first_option" == "gui-roll-zenity-firewall-numeral" ] ; then echo $head_waiting_gui
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|lsn4|lsn6|listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|listn-raw4|listn-raw6|listn-security4|listn-security6|list-ebtables|list-arptables"
selection_menu="$($command_zenity --text="gui-roll-firewall-numeral" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1)$command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
"gui-principal-menu")$cmd_binary gui-roll-zenity ;;
"gui-help-menu")$cmd_binary -gui-zenity help firewall-numeral ;;
"gui-info-menu")$cmd_binary -gui-zenity info firewall-numeral ;;
"lsn4")$cmd_binary -gui-zenity lsn4 ;;
"lsn6")$cmd_binary -gui-zenity lsn6 ;;
"listn-alltables")$cmd_binary -gui-zenity listn-alltables ;;
"listn-filter4")$cmd_binary -gui-zenity listn-filter4 ;;
"listn-filter6")$cmd_binary -gui-zenity listn-filter6 ;;
"listn-nat4")$cmd_binary -gui-zenity listn-nat4 ;;
"listn-nat6")$cmd_binary -gui-zenity listn-nat6 ;;
"listn-mangle4")$cmd_binary -gui-zenity listn-mangle4 ;;
"listn-mangle6")$cmd_binary -gui-zenity listn-mangle6 ;;
"listn-raw4")$cmd_binary -gui-zenity listn-raw4 ;;
"listn-raw6")$cmd_binary -gui-zenity listn-raw6 ;;
"listn-security4")$cmd_binary -gui-zenity listn-security4 ;;
"listn-security6")$cmd_binary -gui-zenity listn-security6 ;;
"list-ebtables")$cmd_binary -gui-zenity list-ebtables ;;
"list-arptables")$cmd_binary -gui-zenity list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-numeral:
##########    english: gui-roll-zenity-firewall-custom: gui roll firewall-custom: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-custom: gui roll firewall-custom: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-custom:
####
####
if   [ "$first_option" == "gui-roll-zenity-firewall-custom" ] ; then echo $head_waiting_gui
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|\
custom|clone-static|eraserules|wizard-mini|wizard-full|off-line|all-permisive|\
new-full-config|nueva-completa-config|new-mini-config|nueva-mini-config|\
names-config|show-config|modify-config|del-config|regen-config|examples-config"
selection_menu="$($command_zenity --text="gui-roll-firewall-custom" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
#### 
case "$selection_final" in
1)$command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
"gui-principal-menu")$cmd_binary gui-roll-zenity ;;
"gui-help-menu")$cmd_binary -gui-zenity help firewall-custom ;;
"gui-info-menu")$cmd_binary -gui-zenity info firewall-custom ;;
"custom")archivo="$($command_zenity  --entry $graphic_window_dimension \
--title="[Launch Custom]" --entry-text="cfg to launch")" ; 
$cmd_binary -gui-zenity custom $archivo ; $cmd_binary gui list4;;
"clone-static")archivo="$($command_zenity  --entry $graphic_window_dimension \
--title="[Clone firewall static]" --entry-text="firewall static to clone")" ; 
$cmd_binary -gui-zenity clone-static $archivo ; $cmd_binary gui list4;;
"eraserules")$cmd_binary -gui-zenity eraserules ; $cmd_binary gui list4;;
"wizard-full")$cmd_binary -gui-zenity wizard-full ; $cmd_binary gui list4;;
"wizard-mini")$cmd_binary -gui-zenity wizard-mini ; $cmd_binary gui list4;;
"off-line")$cmd_binary -gui-zenity off-line ; $cmd_binary gui list4;;
"all-permisive")$cmd_binary -gui-zenity all-permisive ; $cmd_binary gui list4;;
"new-full-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[new-full-config]" --entry-text="Input file name to new full configuration")" ;
$cmd_binary -gui-zenity new-full-config $archivo ;;
"nueva-completa-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[nueva-completa-config]" --entry-text="Introduce el nombre del nuevo archivo cfg")" ;
$cmd_binary -gui-zenity nueva-completa-config $archivo ;;
"new-mini-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[new-mini-config]" --entry-text="Input file name to new mini configuration")" ;
$cmd_binary -gui-zenity new-mini-config $archivo ;;
"nueva-mini-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[nueva-mini-config]" --entry-text=="Introduce el nombre del nuevo archivo cfg")" ;
$cmd_binary -gui-zenity nueva-mini-config $archivo ;;
"names-config")
$cmd_binary -gui-zenity names-config ;;
"show-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[show-config]" --entry-text="cfg to show")" ;
$cmd_binary -gui-zenity show-config $archivo ;;
"modify-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[modify-config]" --entry-text="cfg to modify")" ;
$cmd_binary -gui-zenity modify-config $archivo ;;
"del-config")
archivo="$($command_zenity  $graphic_window_dimension --entry --title="[del-config]" --entry-text="cfg to delete")" ;
$cmd_binary -gui-zenity del-config $archivo ;;
"regen-config")$cmd_binary -gui-zenity regen-config ;;
"examples-config")$cmd_binary gui examples-config ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-custom:
##########    english: gui-roll-firewall-static: gui roll firewall-static: gui with roll  ##########
##########    spanish: gui-roll-firewall-static: gui roll firewall-static: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-static:
####
####
if   [ "$first_option" == "gui-roll-zenity-firewall-static" ] ; then echo $head_waiting_gui
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|\
client-basic|client-web|client-mail|client-news|client-ftp|client-git|client-vnc|\
client-torrent|client-vpn|client-tor|lan-tor|lan-vpn|shield-ssh|\
games-shooter|game-wesnoth|game-minetest|game-freeciv|game-widelands|server-proxy|\
server-web|server-vnc|server-samba|server-ssh|server-print|server-lamp|server-domain|\
server-news|server-mail|server-ftp|server-teamspeak|server-mumble|server-sql|server-asterisk"
selection_menu="$($command_zenity --text="gui-roll-firewall-custom" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
#### 
case "$selection_final" in
1) $command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
"gui-principal-menu")$cmd_binary gui-roll-zenity ;;
"gui-help-menu")$cmd_binary -gui-zenity help firewall-static ;;
"gui-info-menu")$cmd_binary -gui-zenity info firewall-static ;;
"client-web")$cmd_binary -gui-zenity client-web ; $cmd_binary gui list4;;
"client-ipp")$cmd_binary -gui-zenity client-ipp   ; $cmd_binary gui list4;;
"client-irc")$cmd_binary -gui-zenity client-irc   ; $cmd_binary gui list4;;
"client-mail")$cmd_binary -gui-zenity client-mail ; $cmd_binary gui list4;;
"client-news")$cmd_binary -gui-zenity client-news ; $cmd_binary gui list4;;
"client-ftp")$cmd_binary -gui-zenity client-ftp   ; $cmd_binary gui list4;;
"client-git")$cmd_binary -gui-zenity client-git ; $cmd_binary gui list4;;
"client-vnc")$cmd_binary -gui-zenity client-vnc ; $cmd_binary gui list4;;
"client-torrent")$cmd_binary -gui-zenity client-torrent ; $cmd_binary gui list4;;
"client-vpn")$cmd_binary -gui-zenity client-vpn ; $cmd_binary gui list4;;
"client-tor")$cmd_binary -gui-zenity client-tor ; $cmd_binary gui list4;;
"games-shooter")$cmd_binary -gui-zenity games-shooter ; $cmd_binary gui list4;;
"game-wesnoth")$cmd_binary -gui-zenity game-wesnoth ; $cmd_binary gui list4;;
"game-minetest")$cmd_binary -gui-zenity game-minetest ; $cmd_binary gui list4;;
"game-freeciv")$cmd_binary -gui-zenity game-freeciv ; $cmd_binary gui list4;;
"game-widelands")$cmd_binary -gui-zenity game-widelands ; $cmd_binary gui list4;;
"lan-tor")$cmd_binary -gui-zenity lan-tor ; $cmd_binary gui list4;;
"lan-vpn")$cmd_binary -gui-zenity lan-vpn ; $cmd_binary gui list4;;
"shield-ssh")$cmd_binary -gui-zenity shield-ssh ; $cmd_binary gui list4;;
"server-ssh")$cmd_binary -gui-zenity server-ssh ; $cmd_binary gui list4;;
"server-web")$cmd_binary -gui-zenity server-web ; $cmd_binary gui list4;;
"server-proxy")$cmd_binary -gui-zenity server-proxy ; $cmd_binary gui list4;;
"server-vnc")$cmd_binary -gui-zenity server-vnc ; $cmd_binary gui list4;;
"server-samba")$cmd_binary -gui-zenity server-samba ; $cmd_binary gui list4;;
"server-news")$cmd_binary -gui-zenity server-news ; $cmd_binary gui list4;;
"server-mail")$cmd_binary -gui-zenity server-mail ; $cmd_binary gui list4;;
"server-ftp")$cmd_binary -gui-zenity server-ftp ; $cmd_binary gui list4;;
"server-print")$cmd_binary -gui-zenity server-print ; $cmd_binary gui list4;;
"server-lamp")$cmd_binary -gui-zenity server-lamp ; $cmd_binary gui list4;;
"server-teamspeak")$cmd_binary -gui-zenity server-teamspeak ; $cmd_binary gui list4;;
"server-mumble")$cmd_binary -gui-zenity server-mumble ; $cmd_binary gui list4;;
"server-sql")$cmd_binary -gui-zenity server-sql ; $cmd_binary gui list4;;
"server-asterisk")$cmd_binary -gui-zenity server-asterisk ; $cmd_binary gui list4;;
"server-domain")$cmd_binary -gui-zenity server-domain ; $cmd_binary gui list4;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-static:
##########    english: gui-roll-zenity-options-easy: gui roll options-easy: gui with roll  ##########
##########    spanish: gui-roll-zenity-options-easy: gui roll options-easy: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-options-easy:
####
####
if   [ "$first_option" == "gui-roll-zenity-options-easy" ] ; then echo $head_waiting_gui
####
selection=""
####
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|compile|download|\
list-options|clasic-options|info-options|expert|\
filelog|autolog|ip4|ip6|notes|speed-ip4|speed-ip6|sockets|nodes|geoip|date|free|ver|version|\
depends|commands|variables|license|examples|intro|clean-tmp"
####
####
selection="$($command_zenity --text="gui-roll-options-easy" --title="Gui-roll With $cmd_binary $cmd_version" --forms --add-combo="$first_option" --combo-values="$gui_menu")"
####
####
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1)$command_zenity  --info $graphic_window_dimension --text="$cmd_binary good bye"; exit ;;
gui-principal-menu)$cmd_binary gui-roll-zenity ;;
gui-help-menu)$cmd_binary -gui-zenity help status-state ;;
gui-info-menu)$cmd_binary -gui-zenity info status-state ;;
preferences-read)$cmd_binary -gui-zenity preferences-read ;;
preferences-modify)$cmd_binary -gui-zenity preferences-modify ;;
preferences-regen)$cmd_binary -gui-zenity preferences-regen ;;
preferences-example)$cmd_binary -gui-zenity preferences-example ;;
list-options)$cmd_binary -gui-zenity list-options ;;
clasic-options)$cmd_binary -gui-zenity clasic-options ;;
info-options)$cmd_binary -gui-zenity info-options ;;
expert)$cmd_binary -gui-zenity expert ;;
compile)$cmd_binary -gui-zenity compile ;;
download)$cmd_binary -gui-zenity download ;;
filelog) $cmd_binary -gui-zenity filelog ;; 
autolog) $cmd_binary -gui-zenity autolog ;;
ip4)$cmd_binary -gui-zenity ip4 ;;
ip6)$cmd_binary -gui-zenity ip6 ;;
notes)$cmd_binary -gui-zenity notes ;;
speed-ip4)$cmd_binary -gui-zenity speed-ip4 ;;
speed-ip6)$cmd_binary -gui-zenity speed-ip6 ;;
sockets)$cmd_binary -gui-zenity sockets ;;
nodes) $cmd_binary -gui-zenity nodes ;;
geoip) $cmd_binary -gui-zenity geoip ;;
date) $cmd_binary -gui-zenity date ;;
free) $cmd_binary -gui-zenity free ;;
ver) $cmd_binary -gui-zenity ver ;;
version)$cmd_binary -gui-zenity version ;;
depends)$cmd_binary -gui-zenity depends ;;
license) $cmd_binary -gui-zenity depends ;;
examples)$cmd_binary -gui-zenity examples ;;
intro) $cmd_binary -gui-zenity intro ;;
clean-tmp) $cmd_binary -gui-zenity clean-tmp ;;
variables) $cmd_binary -gui-zenity variables ;;
commands) $cmd_binary -gui-zenity variables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-options-easy:
##########    english: gui-menu: gui menu general: gui con menu  ##########
##########    spanish: gui-menu: gui menu general: gui con menu  ##########
#### :rutina-inicial-gui-menu:
####
####
if [ "$first_option" == "gui-menu" ] ; then echo $head_waiting_gui ; echo $give_cover
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="|01-Firewall-Control|02-Firewall-List-With-Conceptual|02-Firewall-List-With-Numeral|03-Firewall-Custom|04-firewall-static|05-options-easy|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu)"
#### 
####
case "$selection_final" in
1) exit ;;
01-Firewall-Control*)$cmd_binary gui-menu-firewall-control ; exit ;;
02-Firewall-List-With-Conceptual*)$cmd_binary gui-menu-firewall-conceptual ; exit ;;
02-Firewall-List-With-Numeral*)$cmd_binary gui-menu-firewall-numeral ; exit ;;
03-Firewall-Custom*)$cmd_binary gui-menu-firewall-custom ; exit ;;
04-firewall-static*)$cmd_binary gui-menu-firewall-static ; exit ;;
05-options-easy*)$cmd_binary gui-menu-options-easy ; exit ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu:
##########    english: gui-menu-firewall-control: gui with menu   ##########
##########    spanish: gui-menu-firewall-control: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-control:
####
####
if   [ "$first_option" == "gui-menu-firewall-control" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|stop|continue|reset|names|show|save|load|actual"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu*)$cmd_binary gui-menu ;;
gui-help-menu*)$cmd_binary -gui help firewall-control ;;
gui-info-menu*)$cmd_binary -gui info firewall-control ;;
stop*)$cmd_binary -gui stop ; $cmd_binary -gui list4;;
continue*)$cmd_binary -gui continue ; $cmd_binary -gui list4;;
reset*)$cmd_binary -gui reset ; $cmd_binary -gui list4;;
names*)$cmd_binary -gui names ;;
show*)archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension \
--title="[Save Firewall]" --entry-text="cfg to show")" ; 
$cmd_binary -gui show $archivo ;;
save*)archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension \
--title="[Save Firewall]" --entry-text="cfg to save")" ; 
$cmd_binary -gui save $archivo ;;
load*)archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension \
--title="[Load Firewall]" --entry-text="cfg to load")" ;
$cmd_binary -gui load $archivo ; $cmd_binary -gui list4;;
actual*)$cmd_binary -gui actual ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-control:
##########    english: gui-menu-firewall-conceptual: gui with menu   ##########
##########    spanish: gui-menu-firewall-conceptual: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-conceptual:
####
####
if   [ "$first_option" == "gui-menu-firewall-conceptual" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|list-raw4|list-raw6|list-security4|list-security6|list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu*)$cmd_binary gui-menu ;;
gui-help-menu*)$cmd_binary -gui help firewall-conceptual ;;
gui-info-menu*)$cmd_binary -gui info firewall-conceptual ;;
ls4*)$cmd_binary -gui ls4 ;;
ls6*)$cmd_binary -gui ls6 ;;
list-alltables*)$cmd_binary -gui list-alltables ;;
list-filter4*)$cmd_binary -gui list-filter4 ;;
list-filter6*)$cmd_binary -gui list-filter6 ;;
list-nat4*)$cmd_binary -gui list-nat4 ;;
list-nat6*)$cmd_binary -gui list-nat6 ;;
list-mangle4*)$cmd_binary -gui list-mangle4 ;;
list-mangle6*)$cmd_binary -gui list-mangle6 ;;
list-raw4*)$cmd_binary -gui list-raw4 ;;
list-raw6*)$cmd_binary -gui list-raw6 ;;
list-security4*)$cmd_binary -gui list-security4 ;;
list-security6*)$cmd_binary -gui list-security6 ;;
list-ebtables*)$cmd_binary -gui list-ebtables ;;
list-arptables*)$cmd_binary -gui list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-conceptual:
##########    english: gui-menu-firewall-numeral: gui with menu   ##########
##########    spanish: gui-menu-firewall-numeral: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-numeral:
####
####
if   [ "$first_option" == "gui-menu-firewall-numeral" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|lsn4|lsn6|listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|listn-raw4|listn-raw6|listn-security4|listn-security6|list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu*)$cmd_binary gui-menu ;;
gui-help-menu*)$cmd_binary -gui help firewall-numeral ;;
gui-info-menu*)$cmd_binary -gui info firewall-numeral ;;
lsn4*)$cmd_binary -gui lsn4 ;;
lsn6*)$cmd_binary -gui lsn6 ;;
listn-alltables*)$cmd_binary -gui listn-alltables ;;
listn-filter4*)$cmd_binary -gui listn-filter4 ;;
listn-filter6*)$cmd_binary -gui listn-filter6 ;;
listn-nat4*)$cmd_binary -gui listn-nat4 ;;
listn-nat6*)$cmd_binary -gui listn-nat6 ;;
listn-mangle4*)$cmd_binary -gui listn-mangle4 ;;
listn-mangle6*)$cmd_binary -gui listn-mangle6 ;;
listn-raw4*)$cmd_binary -gui listn-raw4 ;;
listn-raw6*)$cmd_binary -gui listn-raw6 ;;
listn-security4*)$cmd_binary -gui listn-security4 ;;
listn-security6*)$cmd_binary -gui listn-security6 ;;
list-ebtables*)$cmd_binary -gui list-ebtables ;;
list-arptables*)$cmd_binary -gui list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-numeral:
##########    english: gui-menu-firewall-custom: gui with menu   ##########
##########    spanish: gui-menu-firewall-custom: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-custom:
####
####
if   [ "$first_option" == "gui-menu-firewall-custom" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|\
custom|clone-static|eraserules|wizard-mini|wizard-full|custom-cfg|off-line|all-permisive|\
new-full-config|nueva-completa-config|new-mini-config|nueva-mini-config|\
names-config|show-config|modify-config|del-config|regen-config|examples-config"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu) $cmd_binary gui-menu ;;
gui-help-menu*) $cmd_binary -gui help firewall-custom ;;
gui-info-menu*) $cmd_binary -gui info firewall-custom ;;
eraserules*)$cmd_binary -gui eraserules ; $cmd_binary gui list4;;
wizard-full*)$cmd_binary -gui wizard-full ; $cmd_binary gui list4;;
wizard-mini*)$cmd_binary -gui wizard-mini ; $cmd_binary gui list4;;
off-line*)$cmd_binary -gui off-line ; $cmd_binary gui list4;;
all-permisive*)$cmd_binary -gui all-permisive ; $cmd_binary gui list4;;
custom*)archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension \
--title="[Launch Custom]" --entry-text="cfg to launch")" ; 
$cmd_binary -gui custom $archivo ; $cmd_binary gui list4;;
clone-static*)archivo="$($favorite_graphicall_dialog  --entry $graphic_window_dimension \
--title="[Clone static]" --entry-text="static firewall to clone config")" ; 
$cmd_binary -gui clone-static $archivo ; $cmd_binary gui list4;;
new-full-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[new-full-config]" \
--entry-text="Input file name to new full configuration")" ; $cmd_binary -gui new-full-config $archivo ;;
nueva-completa-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[nueva-completa-config]" \
--entry-text="Introduce el nombre del nuevo archivo cfg")" ; $cmd_binary -gui nueva-completa-config $archivo ;;
new-mini-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry /
--title="[new-mini-config]" --entry-text="Input file name to new mini configuration")" ; $cmd_binary -gui new-mini-config $archivo ;;
nueva-mini-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[nueva-mini-config]" \
--entry-text="Introduce el nombre del nuevo archivo cfg")" ; $cmd_binary -gui nueva-mini-config $archivo ;;
names-config*) $cmd_binary -gui names-config ;;
show-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[show-config]" \
--entry-text="cfg to show")" ; $cmd_binary -gui show-config $archivo ;;
modify-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[modify-config]" \
--entry-text="cfg to modify")" ; $cmd_binary -gui modify-config $archivo ;;
del-config*) archivo="$($favorite_graphicall_dialog  $graphic_window_dimension --entry --title="[del-config]" \
--entry-text="cfg to delete" )"; $cmd_binary -gui del-config $archivo ;;
regen-config*)$cmd_binary -gui regen-config ;;
examples-config*)$cmd_binary gui examples-config ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-custom:
##########   english: gui-menu-firewall-static: gui with menu    ##########
##########   spanish: gui-menu-firewall-static: gui con menu     ##########
#### :rutina-inicial-gui-menu-firewall-static:
####
####  
if   [ "$first_option" == "gui-menu-firewall-static" ] ; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|\
client-basic|client-web|client-ipp|client-irc|client-mail|client-news|client-ftp|\
client-git|client-vnc|client-torrent|client-vpn|client-tor|lan-tor|lan-vpn|shield-ssh|\
games-shooter|game-wesnoth|game-minetest|game-freeciv|game-widelands|\
server-web|server-vnc|server-samba|server-ssh|server-print|server-lamp|server-domain|\
server-news|server-mail|server-ftp|server-teamspeak|server-mumble|server-sql|server-asterisk"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu*)$cmd_binary gui-menu ;;
gui-help-menu*)$cmd_binary -gui help firewall-static ;;
gui-info-menu*)$cmd_binary -gui info firewall-static ;;
client-basic*)$cmd_binary -gui client-basic ; $cmd_binary gui list4;;
client-web*)$cmd_binary -gui client-web ; $cmd_binary gui list4;;
client-ipp*)$cmd_binary -gui client-ipp   ; $cmd_binary gui list4;;
client-irc*)$cmd_binary -gui client-irc   ; $cmd_binary gui list4;;
client-mail*)$cmd_binary -gui client-mail ; $cmd_binary gui list4;;
client-news*)$cmd_binary -gui client-news ; $cmd_binary gui list4;;
client-ftp*)$cmd_binary -gui client-ftp   ; $cmd_binary gui list4;;
client-git*)$cmd_binary -gui client-git ; $cmd_binary gui list4;;
client-vnc*)$cmd_binary -gui client-vnc ; $cmd_binary gui list4;;
client-torrent*)$cmd_binary -gui client-torrent ; $cmd_binary gui list4;;
client-vpn*)$cmd_binary -gui client-vpn ; $cmd_binary gui list4;;
client-tor*)$cmd_binary -gui client-tor ; $cmd_binary gui list4;;
games-shooter*)$cmd_binary -gui games-shooter ; $cmd_binary gui list4;;
game-wesnoth*)$cmd_binary -gui game-wesnoth ; $cmd_binary gui list4;;
game-minetest*)$cmd_binary -gui game-minetest ; $cmd_binary gui list4;;
game-freeciv*)$cmd_binary -gui game-freeciv ; $cmd_binary gui list4;;
game-widelands*)$cmd_binary -gui game-widelands ; $cmd_binary gui list4;;
lan-tor*)$cmd_binary -gui lan-tor ; $cmd_binary gui list4;;
lan-vpn*)$cmd_binary -gui lan-vpn ; $cmd_binary gui list4;;
shield-ssh*)$cmd_binary -gui shield-ssh ; $cmd_binary gui list4;;
server-ssh*)$cmd_binary -gui server-ssh ; $cmd_binary gui list4;;
server-web*)$cmd_binary -gui server-web ; $cmd_binary gui list4;;
server-vnc*)$cmd_binary -gui server-vnc ; $cmd_binary gui list4;;
server-samba*)$cmd_binary -gui server-samba ; $cmd_binary gui list4;;
server-news*)$cmd_binary -gui server-news ; $cmd_binary gui list4;;
server-mail*)$cmd_binary -gui server-mail ; $cmd_binary gui list4;;
server-ftp*)$cmd_binary -gui server-ftp ; $cmd_binary gui list4;;
server-print*)$cmd_binary -gui server-print ; $cmd_binary gui list4;;
server-lamp*)$cmd_binary -gui server-lamp ; $cmd_binary gui list4;;
server-teamspeak*)$cmd_binary -gui server-teamspeak ; $cmd_binary gui list4;;
server-mumble*)$cmd_binary -gui server-mumble ; $cmd_binary gui list4;;
server-sql*)$cmd_binary -gui server-sql ; $cmd_binary gui list4;;
server-asterisk*)$cmd_binary -gui server-asterisk ; $cmd_binary gui list4;;
server-domain*)$cmd_binary -gui server-domain ; $cmd_binary gui list4;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-static:
##########    english: gui-menu-options-easy: gui with menu   ##########
##########    spanish: gui-menu-options-easy: gui con menu    ##########
#### :rutina-inicial-gui-menu-options-easy:
####
####
if   [ "$first_option" == "gui-menu-options-easy" ]; then echo $head_waiting_gui
case "$favorite_graphicall_dialog" in "$NULL") echo "$title_md [ fail ] [ Install zenity to work ]"; exit ;; esac
gui_menu="gui-principal-menu|gui-help-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|\
list-options|clasic-options|info-options|expert|compile|download|intro|\
ip4|ip6|speed-ip4|speed-ip6|sockets|license|notes|version|examples|depends|variables|commands"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($favorite_graphicall_dialog $graphic_window_dimension --column="$first_option" --text="$first_option" --title="Gui-menu With $cmd_binary $cmd_version" --list $selection_menu )"
#### 
####
case "$selection_final" in
1) exit ;;
gui-principal-menu*)$cmd_binary gui-menu ;;
gui-help-menu*)$cmd_binary -gui help status-state ;;
gui-info-menu*)$cmd_binary -gui info status-state ;;
preferences-read*)$cmd_binary -gui preferences-read ;;
preferences-modify*)$cmd_binary -gui preferences-modify ;;
preferences-regen*)$cmd_binary -gui preferences-regen ;;
preferences-example*)$cmd_binary -gui preferences-example ;;
list-options*)$cmd_binary -gui list-options ;;
clasic-options*)$cmd_binary -gui clasic-options ;;
info-options*)$cmd_binary -gui info-options ;;
expert*)$cmd_binary -gui expert ;;
intro*)$cmd_binary -gui intro ;;
compile*)$cmd_binary -gui compile ;;
download*)$cmd_binary -gui download ;;
ip4*)$cmd_binary -gui ip4 ;;
ip6*)$cmd_binary -gui ip6 ;;
speed-ip4*)$cmd_binary -gui speed-ip4 ;;
speed-ip6*)$cmd_binary -gui speed-ip6 ;;
sockets*)$cmd_binary -gui sockets ;;
version*)$cmd_binary -gui version ;;
examples*)$cmd_binary -gui examples ;;
depends*)$cmd_binary -gui depends ;;
notes*)$cmd_binary -gui notes ;;
license*)$cmd_binary -gui license ;;
variables*) $cmd_binary -gui variables ;;
commands*) $cmd_binary -gui commands ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-options-easy:
##########    english: ready system rules con its option               ##########
##########    spanish: preprara reglas del sistema con sus opciones    ##########
####
####
####   #### english: The first        firewall of system  custom
####   #### spanish: El primero       cortafuego del sistema custom
####
####
####
####
####   #### english: firewall of system custom:
####   #### spanish: cortafuego del sistema custom:
####
####
##########   english: custom firewall      ##########
##########   spanish: custom cortafuegos   ##########
#### :rutina-inicial-custom-rules:
####
####
if [ "$first_option" == "custom" ]; then 
echo "$title_md [ info ] [ loading firewall custom ] [ $directory_config/$second_option ]" ;
launch_rules_firewall="yes" ;
type_firewall="custom" ;
name_firewall="$second_option" ;
####
####
#### english: configure custom variables if there are
#### spanish: configura variables modificadas si estan ahi
####
####
if [ -f "$directory_config/$second_option" ]; then source $directory_config/$second_option ; fi
####
####
if [ ! -f "$directory_config/$second_option" ]; then  $cmd_binary names-config ; 
exit; fi
####
####
fi
####
####
#### :rutina-final-custom-rules:
##########    english: ready system rules con its option               ##########
##########    spanish: preprara reglas del sistema con sus opciones    ##########
####
####
####   #### english: The first        firewall of system  static
####   #### spanish: El primero       cortafuego del sistema predesignado
####
####
####
####
####   #### english: firewall of system static:
####   #### spanish: cortafuego del sistema static:
####
####
##########   english: system firewall           ##########
##########   spanish: cortafuegos del sistema   ##########
#### :rutina-inicial-off-line:
####
####
####   #### english: firewall of system off-line:
####   #### spanish: cortafuego del sistema off-line:
####
####
if [ "$first_option" == "off-line" ]; then
echo "$title_md [ info ] [ loading firewall off-line ]" ;
launch_rules_firewall="yes" ;
type_firewall="off-line";
name_firewall="$first_option";
fi
#### :rutina-final-off-line:
#### ##################################################
#### ##################################################
#### :rutina-inicial-all-permisive:
####
####
####   #### english: firewall of system all-permisive:
####   #### spanish: cortafuego del sistema all-permisive:
####
####
if [ "$first_option" == "all-permisive" ]; then
echo "$title_md [ info ] [ loading firewall all-permisive ]" ;
launch_rules_firewall="yes" ;
type_firewall="all-permisive" ;
name_firewall="$first_option";
fi
####
####
#### :rutina-final-all-permisive:
#### ##################################################
#### ##################################################
#### :rutina-inicial-shield-ssh:
####
####   #### english: firewall of system shield-ssh:
####   #### spanish: cortafuego del sistema shield-ssh:
####
####
if [ "$first_option" == "shield-ssh" ]; then
echo "$title_md [ info ] [ loading firewall shield-ssh ]" ;
launch_rules_firewall="yes" ;
type_firewall="shield-ssh"    ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp=""    
logserver_port_udp="no"    
#### english: ports client and ports server
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh" ;
fi
#### :rutina-final-shield-ssh:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-basic:
####
####
####   #### english: firewall of system client-basic:
####   #### spanish: cortafuego del sistema client-basic:
####
####
if [ "$first_option" == "client-basic" ]; then
echo "$title_md [ info ] [ loading firewall client-basic ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### you can connect normal web
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,bootpc,ntp" ;
server_port_tcp="" ;
server_port_udp="" ;
fi
#### :rutina-final-client-basic:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-web:
####
####
####   #### english: firewall of system client-web:
####   #### spanish: cortafuego del sistema client-web:
####
####
if [ "$first_option" == "client-web" ]; then
echo "$title_md [ info ] [ loading firewall client-web ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-web:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-git:
####
####
####   #### english: firewall of system client-git:
####   #### spanish: cortafuego del sistema client-git:
####
####
if [ "$first_option" == "client-git" ]; then
echo "$title_md [ info ] [ loading firewall client-git ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,git" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-git:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-ipp:
####
####
####   #### english: firewall of system client-ipp:
####   #### spanish: cortafuego del sistema client-ipp:
####
####
if [ "$first_option" == "client-ipp" ]; then
echo "$title_md [ info ] [ loading firewall client-ipp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ipp" ;
client_port_udp="domain,bootpc,ntp,https" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-ipp:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-irc:
####
####
####   #### english: firewall of system client-irc:
####   #### spanish: cortafuego del sistema client-irc:
####
####
if [ "$first_option" == "client-irc" ]; then
echo "$title_md [ info ] [ loading firewall client-irc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
fi
#### :rutina-final-shield-irc:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-vnc:
####
####
####   #### english: firewall of system client-vnc:
####   #### spanish: cortafuego del sistema client-vnc:
####
####
if [ "$first_option" == "client-vnc" ]; then
echo "$title_md [ info ] [ loading firewall client-vnc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web and vnc
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
fi
#### :rutina-final-shield-vnc:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-torrent:
####
####
####   #### english: firewall of system client-torrent:
####   #### spanish: cortafuego del sistema client-torrent:
####
####
if [ "$first_option" == "client-torrent" ]; then
echo "$title_md [ info ] [ loading firewall client-torrent ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect web normal and bittorrent too
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,9091,51413" ;
server_port_tcp="9091,51413" ;
fi
#### :rutina-final-client-torrent:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-vpn:
####
####
####   #### english: firewall of system client-vpn:
####   #### spanish: cortafuego del sistema client-vpn:
####
####
if [ "$first_option" == "client-vpn" ]; then
echo "$title_md [ info ] [ loading firewall client-vpn ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_port="" ;
#### you can connect web normal and web vpn
server_port_udp="" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,500,1194,1701,4500" ; 
client_port_tcp="http,https,http-alt,ssh,443,1701,1723" ; 
server_port_tcp="" ;
fi
#### :rutina-final-client-vpn:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-tor:
####
####
####   #### english: firewall of system client-tor:
####   #### spanish: cortafuego del sistema client-tor:
####
####
if [ "$first_option" == "client-tor" ]; then
echo "$title_md [ info ] [ loading firewall client-tor ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect web normal and web tor
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,9000:9170" ;
server_port_tcp="9000:9170" ;
fi
#### :rutina-final-client-tor:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-news:
####
####
####   #### english: firewall of system client-news:
####   #### spanish: cortafuego del sistema client-news:
####
####
if [ "$first_option" == "client-news" ]; then
echo "$title_md [ info ] [ loading firewall client-news ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 may be changed to use TLS via the STARTTLS command. 
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,119,433,563" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-news:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-mail:
####
####
####   #### english: firewall of system client-mail:
####   #### spanish: cortafuego del sistema client-mail:
####
####
if [ "$first_option" == "client-mail" ]; then
echo "$title_md [ info ] [ loading firewall client-mail ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 may be changed to use TLS via the STARTTLS command. 
#### client mail:
#### SMTP (sending mail)	Unencrypted	25* (or 26)
#### POP3 (receiving mail)	Encrypted - TLS	995
#### POP3 (receiving mail)	Encrypted - SSL	995
#### POP3 (receiving mail)	Unencrypted	110
#### IMAP2 143
#### IMAPS 993
#### negotiation submission     tls             465 and 587
#### nttps 563
#### nttp  119
####
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,25,119,563,25,995,110,465,587,143,993" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-mail:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-ftp:
####
####
####   #### english: firewall of system client-ftp:
####   #### spanish: cortafuego del sistema client-ftp:
####
####
if [ "$first_option" == "client-ftp" ]; then
echo "$title_md [ info ] [ loading firewall client-ftp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### client ftp:
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
fi
#### :rutina-final-shield-ftp:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-proxy:
####
####
####   #### english: firewall of system client-proxy:
####   #### spanish: cortafuego del sistema client-proxy:
####
####
if [ "$first_option" == "client-proxy" ]; then
echo "$title_md [ info ] [ loading firewall client-proxy ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,3128,ssh" ;
server_port_tcp="" ;
fi
#### :rutina-final-client-proxy:
#### ##################################################
#### ##################################################
#### :rutina-inicial-lan-vpn:
####
####
####   #### english: firewall of system lan-vpn:
####   #### spanish: cortafuego del sistema lan-vpn:
####
####
if [ "$first_option" == "lan-vpn" ]; then
echo "$title_md [ info ] [ loading firewall lan-vpn ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### vpn ports to connects ports vpn
#### with necesary ports to connect gatway and date, domain for your ip
server_port_udp="" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,500,1194,1701,4500" ; 
client_port_tcp="1701,1723" ; 
server_port_tcp="" ;
fi
#### :rutina-final-lan-vpn:
#### ##################################################
#### ##################################################
#### :rutina-inicial-lan-tor:
####
####
####   #### english: firewall of system lan-tor:
####   #### spanish: cortafuego del sistema lan-tor:
####
####
if [ "$first_option" == "lan-tor" ]; then
echo "$title_md [ info ] [ loading firewall lan-tor ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### lan tor, 9000:9170 for connect to tor
#### with necesary ports to connect gatway and date, domain for your ip
server_port_udp="" ;
client_port_udp="bootpc,domain,domain-s,ntp" ;
client_port_tcp="9000:9170" ;
server_port_tcp="9000:9170" ;
fi
#### :rutina-final-lan-tor:
#### ##################################################
#### ##################################################
#### :rutina-inicial-games-shooter:
####
####
####   #### english: firewall of system games-shooter:
####   #### spanish: cortafuego del sistema games-shooter:
####
####
if [ "$first_option" == "games-shooter" ]; then
echo "$title_md [ info ] [ loading firewall games-shooter ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
fi
#### :rutina-final-games-shooter:
#### ##################################################
#### ##################################################
#### :rutina-inicial-games-udp:
####
####
####   #### english: firewall of system games-udp:
####   #### spanish: cortafuego del sistema games-udp:
####
####
if [ "$first_option" == "games-udp" ]; then
echo "$title_md [ info ] [ loading firewall games-udp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
fi
#### :rutina-final-games-shooter:
#### ##################################################
#### ##################################################
#### :rutina-inicial-game-wesnoth:
####
####
####   #### english: firewall of system game-wesnoth:
####   #### spanish: cortafuego del sistema game-wesnoth:
####
####
if [ "$first_option" == "game-wesnoth" ]; then
echo "$title_md [ info ] [ loading firewall game-wesnoth ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### game wesnoth port 14999 and 15001 usually
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,14950:15050" ;
server_port_tcp="14950:15050" ;
fi
#### :rutina-final-game-wesnoth:
#### ##################################################
#### ##################################################
#### :rutina-inicial-game-minetest:
####
####
####   #### english: firewall of system game-minetest:
####   #### spanish: cortafuego del sistema game-minetest:
####
####
if [ "$first_option" == "game-minetest" ]; then
echo "$title_md [ info ] [ loading firewall game-minetest ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### game minetest and minecraft porst 25k and 35k /udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,25000:35000" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,25000:35000" ;
server_port_tcp="25000:35000" ;
fi
#### :rutina-final-game-minetest:
#### ##################################################
#### ##################################################
#### :rutina-inicial-game-freeciv:
####
####
####   #### english: firewall of system game-freeciv:
####   #### spanish: cortafuego del sistema game-freeciv:
####
####
if [ "$first_option" == "game-freeciv" ]; then
echo "$title_md [ info ] [ loading firewall game-freeciv ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### for default 5556 port tcp perhaps 5555 too
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5555:5556" ;
server_port_tcp="5555:5556" ;
fi
#### :rutina-final-game-freeciv:
#### ##################################################
#### ##################################################
#### :rutina-inicial-game-widelands:
####
####
####   #### english: firewall of system game-widelands:
####   #### spanish: cortafuego del sistema game-widelands:
####
####
if [ "$first_option" == "game-widelands" ]; then
echo "$title_md [ info ] [ loading firewall game-widelands ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="12" ;
config_shield_port="22" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### for default 7396 port tcp and 7396 udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,7396" ; 
server_port_udp="7396" ;
client_port_tcp="ssh,http,https,http-alt,7396" ;
server_port_tcp="7396" ;
fi
#### :rutina-final-game-widelands:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-web:
####
####
####   #### english: firewall of system server-web:
####   #### spanish: cortafuego del sistema server-web:
####
####
if [ "$first_option" == "server-web" ]; then
echo "$title_md [ info ] [ loading firewall server-web ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_port="22" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh,http,https,http-alt" ;
fi
#### :rutina-final-server-web:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-vnc:
####
####
####   #### english: firewall of system server-vnc:
####   #### spanish: cortafuego del sistema server-vnc:
####
####
if [ "$first_option" == "server-vnc" ]; then
echo "$title_md [ info ] [ loading firewall server-vnc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="30" ;
config_shield_port="22,5900:5910"
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web and vnc
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="ssh,5900:5910" ;
fi
#### :rutina-final-server-vnc:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-ftp:
####
####
####   #### english: firewall of system server-ftp:
####   #### spanish: cortafuego del sistema server-ftp:
####
####
if [ "$first_option" == "server-ftp" ]; then
echo "$title_md [ info ] [ loading firewall server-ftp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="20" ;
config_shield_port="ssh,ftp,ftp-data" ;
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="ssh,http,https,ftp,ftp-data,ftps,ftps-data" ;
fi
#### :rutina-final-server-ftp:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-proxy:
####
####
####   #### english: firewall of system server-proxy:
####   #### spanish: cortafuego del sistema server-proxy:
####
####
if [ "$first_option" == "server-proxy" ]; then
echo "$title_md [ info ] [ loading firewall server-proxy ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,3128,ssh" ;
server_port_tcp="ssh,http,https,http-alt,3128" ;
fi
#### :rutina-final-server-proxy:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-news:
####
####
####   #### english: firewall of system server-news:
####   #### spanish: cortafuego del sistema server-news:
####
####
if [ "$first_option" == "server-news" ]; then
echo "$title_md [ info ] [ loading firewall server-news ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_port="22" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 may be changed to use TLS via the STARTTLS command. 
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,119,433,563" ;
server_port_tcp="ssh,http,https,119,433,563" ;
fi
#### :rutina-final-server-news:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-mail:
####
####
####   #### english: firewall of system server-mail:
####   #### spanish: cortafuego del sistema server-mail:
####
####
if [ "$first_option" == "server-mail" ]; then
echo "$title_md [ info ] [ loading firewall server-mail ]" ;
####
####
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 may be changed to use TLS via the STARTTLS command. 
#### client mail:
#### SMTP (sending mail)	Unencrypted	25* (or 26)
#### POP3 (receiving mail)	Encrypted - TLS	995
#### POP3 (receiving mail)	Encrypted - SSL	995
#### POP3 (receiving mail)	Unencrypted	110
#### IMAP2 143
#### IMAPS 993
#### negotiation submission     tls             465 and 587
####
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
####
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh,25,119,433,563,25:26,995,110,465,587,143,993" ;
server_port_tcp="ssh,http,https,25,119,433,563,25:26,995,110,465,587,143,993" ;
fi
#### :rutina-final-server-mail:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-samba:
####
####
####   #### english: firewall of system server-samba:
####   #### spanish: cortafuego del sistema server-samba:
####
####
if [ "$first_option" == "server-samba" ]; then
echo "$title_md [ info ] [ loading firewall server-samba ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server samba and active directory
client_port_tcp="http,https,http-alt,ssh,ldap,636,microsoft-ds" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,ldap,636,137:139" ;
server_port_tcp="ssh,ldap,636,microsoft-ds" ; 
server_port_udp="ssh,ntp,domain,domain-s,ldap,636,137:139" ;
fi
#### :rutina-final-server-mail:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-print:
####
####
####   #### english: firewall of system server-print:
####   #### spanish: cortafuego del sistema server-print:
####
####
if [ "$first_option" == "server-print" ]; then
echo "$title_md [ info ] [ loading firewall server-print ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ; 
name_firewall="$first_option" ;
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server ipp and printer
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh,printer,ipp" ;
fi
#### :rutina-final-server-print:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-ssh:
####
####
####   #### english: firewall of system server-ssh:
####   #### spanish: cortafuego del sistema server-ssh:
####
####
if [ "$first_option" == "server-ssh" ]; then
echo "$title_md [ info ] [ loading firewall server-ssh ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server ssh 22/tcp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh" ;
fi
#### :rutina-final-server-ssh:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-lamp:
####
####
####   #### english: firewall of system server-lamp:
####   #### spanish: cortafuego del sistema server-lamp:
####
####
if [ "$first_option" == "server-lamp" ]; then
echo "$title_md [ info ] [ loading firewall server-lamp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
####  english: udp: 20 is ftp-data, 21 is ftp, 989 is ftps-data y 990 is ftps
####  english: tcp: 10000 is webmin, 3306 is mysql, 5432 is postgresql
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh,20,21,989,990" ;
server_port_tcp="ssh,http,https,10000,3306,5432" ;
fi
#### :rutina-final-server-lamp:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-asterisk:
####
####
####   #### english: firewall of system server-asterisk:
####   #### spanish: cortafuego del sistema server-asterisk:
####
####
if [ "$first_option" == "server-asterisk" ]; then
echo "$title_md [ info ] [ loading firewall server-asterisk ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
####    UDP:5060 SIP (sip.conf), newer Versions support TCP:5060
####    UDP:10000-20000 RTP (rtp.conf) for the media stream, a higher Portrange
####    UDP:5036 IAX2
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5060,10000:20000,5036" ;
server_port_udp="5060,10000:20000,5036" ;
client_port_tcp="http,https,http-alt,ssh,5060" ;
server_port_tcp="ssh,5060" ;
fi
#### :rutina-final-server-astrerisk:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-mumble:
####
####
####   #### english: firewall of system server-mumble:
####   #### spanish: cortafuego del sistema server-mumble:
####
####
if [ "$first_option" == "server-mumble" ]; then
echo "$title_md [ info ] [ loading firewall server-mumble ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### mumble port 64738 tcp and 64738 udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,64738" ;
server_port_udp="64738" ;
client_port_tcp="http,https,http-alt,ssh,64738" ;
server_port_tcp="ssh,64738" ;
fi
#### :rutina-final-server-mumble:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-teamspeak:
####
####
####   #### english: firewall of system server-teamspeak:
####   #### spanish: cortafuego del sistema server-teamspeak:
####
####
if [ "$first_option" == "server-teamspeak" ]; then
echo "$title_md [ info ] [ loading firewall server-teamspeak ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### Service	        Protocol	Local Port (Server)
#### Voice	        UDP	9987
#### Filetransfer	TCP	30033
#### ServerQuery (raw)	TCP	10011
#### ServerQuery (SSH)	TCP	10022
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,9987" ;
server_port_udp="9987" ;
client_port_tcp="http,https,http-alt,ssh,30033,10011,10022" ;
server_port_tcp="ssh,30033,10011,10022" ;
fi
#### :rutina-final-server-teamspeak:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-sql:
####
####
####   #### english: firewall of system server-sql:
####   #### spanish: cortafuego del sistema server-sql:
####
####
if [ "$first_option" == "server-sql" ]; then
echo "$title_md [ info ] [ loading firewall server-sql ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
####  POSTGRESQL 5432/tcp and 5432/udp
####  Technology	Default Port	Required
####  MySQL Client to Server - MySQL Protocol – 3306	3306/tcp	Optional - pick at least 1
####  MySQL Client to Server – New X Protocol – 33060	33060/tcp	Optional - pick at least 1
####  Connects via SSH Tunnel	22/tcp	Optional - pick at least 1
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5432" ;
server_port_udp="5432" ;
client_port_tcp="http,https,http-alt,ssh,5432,3306,3360" ;
server_port_tcp="ssh,5432,3306,3360" ;
fi
#### :rutina-final-server-sql:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-irc:
####
####
####   #### english: firewall of system server-irc:
####   #### spanish: cortafuego del sistema server-irc:
####
####
if [ "$first_option" == "server-irc" ]; then
echo "$title_md [ info ] [ loading firewall server-irc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="ssh,ircs-u,ircd" ;
fi
#### :rutina-final-server-irc:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-domain:
####
####
####   #### english: firewall of system server-domain:
####   #### spanish: cortafuego del sistema server-domain:
####
####
if [ "$first_option" == "server-domain" ]; then
echo "$title_md [ info ] [ loading firewall server-domain ]" ;
launch_rules_firewall="yes" ; 
type_firewall="static" ;
name_firewall="$first_option" ;
#### against brute force
allow_shield_maxtries="" ;
config_shield_maxtries="20" ;
config_shield_port="ssh" ;
#### english: log port servers
logserver_prefix_input="fwlog-input::"   
logserver_prefix_output="fwlog-output::"  
logserver_port_tcp="22"    
logserver_port_udp="no"    
#### server domain and domain-s
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https," ;
server_port_udp="domain,domain-s" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh" ;
fi
####
####
#### :rutina-final-server-domain:
###############################################################################################################
###############################################################################################################
####
####
###############################################################################################################
###############################################################################################################
####
####
############################       english: default: without other valid options
############################	   spanish: default: sin otra valida opcion
####
####
if [ "$launch_rules_firewall" != "yes" ]  ; then echo $give_cover
echo "### #[ fail ] [ first option: $first_option | without first option: $without_first_option ]"
$cmd_binary options ; exit ; fi
####
####
#### if [ "$without_first_option" != "$NULL" ] ; then 
#### $cmd_binary $without_first_option ; exit ; fi
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####           Knowed now sure that:         launch_rules_firewall="yes"                              ###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####          ready to launch rules ..    - static rules -
###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####                                                                                            ###############
####  english: Options for launch rules:     system firewall with designed previous             ###############
####  spanish: Opciones para lanzar reglas:  firewall del sistema con diseño previo             ###############
####                                                                                            ###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
####
####
########################################     english: ipv4 iptables all-permisive:
########################################     spanish: ipv4 iptables todo permisivo
#### :rutina-inicial-code-allpermisive:
####
####
#### legacy ip4
####
####
if [ "$type_firewall" == "all-permisive" ]; then $cmd_binary eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy  $command_iptables_legacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy  $command_iptables_legacy -A INPUT \
$input_state  -j ACCEPT \
-m comment --comment "state input" &> /dev/null
$allow_use_legacy  $command_iptables_legacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy  $command_iptables_legacy -A OUTPUT \
-j ACCEPT \
-m comment --comment "all output" &> /dev/null
$allow_use_legacy  $command_iptables_legacy -A FORWARD \
-j ACCEPT \
-m comment --comment "all forward" &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft $command_iptables_nft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptables_nft -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment "state input" &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-j ACCEPT \
-m comment --comment "all output" &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptables_nft -A FORWARD \
-j ACCEPT \
-m comment --comment "all forward" &> /dev/null
####
####
########################################     english: ipv6 iptables all-permisive:
########################################     spanish: ipv6 iptables todo permisivo
####
####
#### english: legacy ipv6 127.0.0.1 acept and the others legacy ipv6 accept too
#### spanish: legacy ipv6 127.0.0.1 acepta y los otros legacy ipv6 acepta tambien
####
####
$allow_use_legacy $command_ip6tables_legacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment "state input" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT \
-j ACCEPT \
-m comment --comment "all otuput" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A FORWARD \
-j ACCEPT \
-m comment --comment "all forward" &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_nft $allow_use_ipv6   $command_ip6tables_nft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tables_nft -A INPUT   \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment "state input" &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tables_nft -A OUTPUT  \
-j ACCEPT \
-m comment --comment "all output" &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tables_nft -A FORWARD \
-j ACCEPT \
-m comment --comment "all forward" &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
$allow_use_legacy $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
echo "$title_md [ _ok_ ] [ Launched: firewall ] [ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-allpermisive:
########################################     english: ipv4 iptables off-line:
########################################     spanish: ipv4 iptables desconectado
#### :rutina-inicial-code-off-line:
####
####
#### legacy ip4
####
####
if [ "$type_firewall" == "off-line" ];  then $cmd_binary eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: legacy ipv4 127.0.0.1 acepta
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT  \
-s $config_ip4_localhost -d $config_ip4_localhost   -j ACCEPT \
-m comment --comment "host localhost"  &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: nft ipv4 127.0.0.1 acepta
####
####
$allow_use_nft $command_iptables_nft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
########################################     english: ipv6 iptables off-line
########################################     spanish: ipv6 iptables desconectado
####
####
#### english: legacy ipv6 127.0.0.1 acept
#### spanish: legacy ipv6 127.0.0.1 acepta
####
####
$allow_use_legacy $command_ip6tables_legacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept
#### spanish: nft ipv6 127.0.0.1 acepta
####
####
$allow_use_nft $command_ip6tables_nft -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
########################################     english: close in off-line
########################################     spanish: cierra en off-line
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
$allow_use_nft $command_iptables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
$allow_use_legacy $command_ip6tables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -j $config_close_deny \
ç-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
$allow_use_nft $command_ip6tables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####  
echo "$title_md [ _ok_ ] [ Launched: firewall ] [ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-off-line:
########################################     english: ipv4 iptables shield-ssh:
########################################     spanish: ipv4 iptables shield-ssh:
#### :rutina-inicial-code-shield-ssh:
####
####
if [ "$type_firewall" == "shield-ssh" ];  then $cmd_binary eraserules &> /dev/null ;
####
####
#### loopback localhost legacy ip4
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh legacy ipv4
#### escudo ssh legacy ipv4 
####
####
$allow_shield_maxtries $allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports ssh -m state --state NEW -m recent --set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT \
-m recent --name shield-tries --update --seconds 3600 --hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server legacy ipv4
#### log servidor legacy ipv4
####
#### 
#### $allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null&> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null &> /dev/null
####
####
#### $allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules legacy ipv4
#### reglas de filtros legacy ipv4 
####
####
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp"&> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
#### loopback localhost nft ip4
####
####
$allow_use_nft $command_iptables_nft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh nft ipv4
#### escudo ssh nft ipv4 
####
####
$allow_shield_maxtries $allow_use_nft  $allow_use_ipv4  $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports ssh -m state --state NEW -m recent --set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_nft $allow_use_ipv4  $command_iptables_nft -A INPUT \
-m recent --name shield-tries --update --seconds 3600 --hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server nft ipv4
#### log servidor nft ipv4
####
####
#### $allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules nft ipv4
#### reglas de filtros nft ipv4 
####
####
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
########################################     english: ipv6 iptables 
########################################     spanish: ipv6 iptables 
####
####
#### loopback localhost legacy ip6
####
####
$allow_use_legacy  $command_ip6tables_legacy -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy  $command_ip6tables_legacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh legacy ipv6
#### escudo ssh legacy ipv6 
####
####
$allow_shield_maxtries $allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports ssh -m state --state NEW -m recent \
--set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-m recent --name shield-tries --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server legacy ipv6
#### log servidor legacy ipv6 
####
####
#### $allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules legacy ipv6
#### reglas de filtros legacy ipv6 
####
####
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
#### loopback localhost nft ip6
#### loopback localhost nft ipv6
####
####
$allow_use_nft $command_ip6tables_nft -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh nft ipv6
#### escudo ssh nft ipv6 
####
####
$allow_shield_maxtries $allow_use_nft  $allow_use_ipv6  $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_nft     $allow_use_ipv6  $command_ip6tables_nft -A INPUT \
-m recent --name shield-tries --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server nft ipv6
#### log servidor nft ipv6
####
####
#### $allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules nft ipv6
#### reglas de filtros nft ipv6 
####
####
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
########################################     english: close iptables 
########################################     spanish: cierra iptables 
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT -j $config_close_deny   \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -j $config_close_deny  \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft  $command_iptables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft  $command_iptables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule"  &> /dev/null
$allow_use_nft  $command_ip6tables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule"  &> /dev/null
$allow_use_nft  $command_ip6tables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
$allow_use_nft  $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
echo "$title_md [ _ok_ ] [ Launched: firewall ] [ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-shield-ssh:
########################################     english: ipv4 iptables legacy rules default static
########################################     spanish: ipv4 iptables legacy reglas predesignadas por defecto
#### :rutina-inicial-code-rulesdefault:
####
####
if [ "$type_firewall" == "static" ];  then $cmd_binary eraserules &> /dev/null ;
####
####
#### loopback localhost legacy ip4
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh legacy ipv4
#### escudo ssh legacy ipv4 
####
####
$allow_shield_maxtries $allow_use_legacy $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports "$config_shield_port" -m state --state NEW -m recent --set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_legacy $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-m recent --name shield-tries --update --seconds 3600 --hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server legacy ipv4
#### log servidor legacy ipv4
####
#### 
#### $allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null&> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null &> /dev/null
####
####
#### $allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules legacy ipv4 without separate rules
#### reglas de filtros legacy ipv4 sin separar reglas
####
####
if [ "$allow_separate_rules" == "no" ]; then
####
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp"&> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
fi
####
####
####
#### filter rules legacy ipv4 with separte rules
#### reglas de filtros legacy ipv4 con separar reglas
####
####
if [ "$allow_separate_rules" != "no" ]; then
####
for client_portudp in $(echo $client_port_udp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --sports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --dports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
done
for client_porttcp in $(echo $client_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --sports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --dports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
done
####
####
for server_porttcp in $(echo $server_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp"&> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
done
for server_portudp in $(echo $server_port_udp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4   $command_iptables_legacy -A INPUT \
-p udp -m multiport --dports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
done
####
fi
####
####
########################################     english: ipv4 iptables nft
########################################     spanish: ipv4 iptables nft
####
####
#### loopback localhost nft ip4
####
####
$allow_use_nft $command_iptables_nft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh nft ipv4
#### escudo ssh nft ipv4 
####
####
$allow_shield_maxtries $allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports "$config_shield_port" -m state --state NEW -m recent --set --name "shield-tries" \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-m recent --name "shield-tries" --update --seconds 3600 --hitcount "$config_shield_maxtries" -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
#### 
####
#### log server nft ipv4
#### log servidor nft ipv4
####
####
#### $allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules nft ipv4 with separate rules
#### reglas de filtros nft ipv4 with separate rules
####
####
if [ "$allow_separate_rules" == "no" ]; then
####
####
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
fi
####
####
#### filter rules nft ipv4 without separate rules
#### reglas de filtros nft ipv4 without separate rules
####
####
if [ "$allow_separate_rules" != "no" ]; then
####
####
for client_portudp in $(echo $client_port_udp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --sports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --dports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
done
####
for client_porttcp in $(echo $client_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --sports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --dports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
done
####
####
for server_portudp in $(echo $server_port_udp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p udp -m multiport --dports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p udp -m multiport --sports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
done
####
for server_porttcp in $(echo $server_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv4   $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
done
####
####
fi
####
####
########################################     english: ipv6 iptables legacy
########################################     spanish: ipv6 iptables legacy
####
####
#### loopback localhost legacy ip6
####
####
$allow_use_legacy $command_ip6tables_legacy -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh legacy ipv6
#### escudo ssh legacy ipv6 
####
####
$allow_shield_maxtries $allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports "$config_shield_port" -m state --state NEW -m recent \
--set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-m recent --name shield-tries --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server legacy ipv6
#### log servidor legacy ipv6 
####
####
#### $allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules legacy ipv6
#### reglas de filtros legacy ipv6 
####
####
if [ "$allow_separate_rules" == "no" ]; then
####
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --sports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --sports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --dports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
fi
####
####
if [ "$allow_separate_rules" != "no" ]; then
####
for server_portudp in $(echo $server_port_udp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --sports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --dports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
done
for server_porttcp in $(echo $server_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --sports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --dports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
done
####
####
for clientport_udp in $(echo $client_port_udp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p udp -m multiport --dports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --sports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
done
for client_porttcp in $(echo $client_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --sports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
done
####
fi
####
####
########################################     english: ipv6 iptables nft
########################################     spanish: ipv6 iptables nft
####
####
#### loopback localhost nft ip6
#### loopback localhost nft ipv6
####
####
$allow_use_nft $command_ip6tables_nft -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### shield ssh nft ipv6
#### escudo ssh nft ipv6 
####
####
$allow_shield_maxtries $allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports "$config_shield_port" -m state --state NEW -m recent \
--set --name shield-tries \
-m comment --comment "shield tries" &> /dev/null
$allow_shield_maxtries $allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-m recent --name shield-tries --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
####
#### log server nft ipv6
#### log servidor nft ipv6
####
####
#### $allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
#### -p udp -m multiport --dports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### $allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
#### -p udp -m multiport --sports $server_port_udp -j LOG \
#### -m comment --comment "logserver udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -j LOG \
-m comment --comment "logserver tcp" &> /dev/null
####
####
#### filter rules nft ipv6
#### reglas de filtros nft ipv6 
####
####
if [ "$allow_separate_rules" == "no" ]; then
####
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --sports $client_port_udp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $client_port_tcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --dports $server_port_udp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --dports $server_port_tcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
fi
####
####
if [ "$allow_separate_rules" != "no" ]; then
####
for server_portudp in $(echo $server_port_udp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --sports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --sports $client_portudp -j ACCEPT \
-m comment --comment "client udp" &> /dev/null
done
####
for server_porttcp in $(echo $server_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --sports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $client_porttcp -j ACCEPT \
-m comment --comment "client tcp" &> /dev/null
done
####
####
for server_portudp in $(echo $server_port_udp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p udp -m multiport --dports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --dports $server_portudp -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
done
####
for server_porttcp in $(echo $server_port_tcp | $command_sed 's/,/ /g');
do
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6      $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --dports $server_porttcp -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
done
####
fi
####
####
########################################     english: close iptables 
########################################     spanish: cierra iptables 
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "nexthop ip6" &> /dev/null
####
####
$allow_use_legacy $command_iptables_legacy -A INPUT -j $config_close_deny   \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -j $config_close_deny  \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule"  &> /dev/null
$allow_use_nft $command_ip6tables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule"  &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
$allow_use_nft $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
echo "$title_md [ _ok_ ] [ Launched: firewall ] [ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-rulesdefault:
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####          ready to launch rules CUSTOM  : - custom rules -
###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
####
####
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####                                                                                            ###############
####  english: Options for launch rules:     system firewall custom                             ###############
####  spanish: Opciones para lanzar reglas:  firewall del sistema custom                        ###############
####                                                                                            ###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
#### :rutina-inicial-code-wizard:
####
####
##############################       english: overwrite system varibles with the config cfg
##############################       spanish: sobreescribe las variables con la config cfg
####
####
if [ "$first_option" == "custom" ]; then if [ -f $directory_config/$second_option ]; 
then source $directory_config/$second_option &> /dev/null ; else echo "$tab [ fail ] [ Config file not found ]"; exit ; fi ; fi
####
####
##############################      english: selective state of intput/oputut          #####################
##############################      spanish: estado selectivo de entrada/salida        #####################
####
####
if [ "$allow_input_state" == "$NULL" ]  ; then config_input_state="-m state --state $config_input_state"   ;
else config_input_state="$NULL"  ; fi
if [ "$allow_output_state" == "$NULL" ] ; then config_output_state="-m state --state $config_output_state" ;
else config_output_state="$NULL" ; fi
####
####
##############################      english: output_uid or output_gid for input established status        #####################
##############################      spanish: usuario o grupo para establecidos de entrada de estado        #####################
####
####
config_uid_gid=no
if [ "$allow_output_uid" == "$NULL" ]; then config_uid_gid="" ; else $nada ; fi
if [ "$allow_output_gid" == "$NULL" ]; then config_uid_gid="" ; else $nada ; fi
####
####
###############################################################################################################
###############################################################################################################
####                                                                                            ###############
####          launching rules ..                                                                ###############
####                                                                                            ###############
###############################################################################################################
###############################################################################################################
####
####
############################       english: iptables rules ipv4  iptables-legacy
############################       spanish: reglas de iptables ipv4   iptables-legacy
####
####
#### english: erase all rules
#### spanish: borra todas las reglas
####
####
$cmd_binary eraserules &> /dev/null
####
####
#######################################        english: ebtables mac rules
#######################################        spanish: ebtables mac rules
####
####
if [ "$allow_mac_whitelist" == "$NULL" ] ; then
####
$command_ebtables -A INPUT  -s $config_mac_whitelist  -j ACCEPT \
-m comment --comment "mac whitelist" &> /dev/null
$command_ebtables -A OUTPUT -d $config_mac_whitelist  -j ACCEPT \
-m comment --comment "mac whitelist" &> /dev/null
####
fi
####
####
if [ "$allow_mac_blacklist" == "$NULL" ] ; then
####
$command_ebtables -A INPUT  -s $config_mac_blacklist  -j $config_close_deny \
-m comment --comment "mac blacklist"  &> /dev/null
$allow_mac_blacklist $command_ebtables -A OUTPUT -d $config_mac_blacklist  -j $config_close_deny \
-m comment --comment "mac blacklist" &> /dev/null
####
fi
####
####
#######################################        english: Accept  localhost rules
#######################################        spanish: aceptar reglas localhost
####
####
if [ "$config_ip4_localhost" != "$NULL" ]; then
####
$allow_use_legacy $command_iptables_legacy -A INPUT  -s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
$allow_use_nft $command_iptables_nft -A INPUT  -s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT -s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
fi
####
####
if [ "$config_ip6_localhost" != "$NULL" ]; then
####
$allow_use_legacy $command_ip6tables_legacy -A INPUT  -s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
$allow_use_nft $command_ip6tables_nft -A INPUT  -s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT -s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
fi
####
####
####################################### english: Drop rules for blacklist
####################################### spanish: reglas de denegar para lista negra
####
####
if [ "$allow_net_blacklist" == "$NULL" ]; then
####
for one_blacklist in $(echo $config_net_blacklist | $command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptables_legacy  -A INPUT  \
-s $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptables_legacy  -A OUTPUT \
-d $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptables_nft     -A INPUT  \
-s $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptables_nft     -A OUTPUT \
-d $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -A INPUT  \
-s $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -A OUTPUT \
-d $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tables_nft    -A INPUT  \
-s $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tables_nft    -A OUTPUT \
-d $one_blacklist -j $config_close_deny -m comment --comment "blacklist $one_blacklist" &> /dev/null
#### 
done
####
fi
#### 
####
####################################### english: Accept rules for vpn whitelist
####################################### spanish: reglas de aceptar para vpn whitelist
####
####
if [ "$allow_net_whitelist" == "$NULL" ]; then
####
for one_vpn in $(echo $config_net_whitelist | $command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptables_legacy  -A  INPUT  \
-s $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptables_legacy  -A  OUTPUT \
-d $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptables_nft     -A  INPUT  \
-s $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptables_nft     -A  OUTPUT \
-d $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -A  INPUT  \
-s $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -A  OUTPUT \
-d $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $command_ip6tables_nft    -A  INPUT  \
-s $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tables_nft    -A  OUTPUT \
-d $one_vpn -j ACCEPT -m comment --comment "whitelist $one_vpn" &> /dev/null
####
####
done
####
fi
####
####
####################################### english: rules for max tries for ssh
####################################### spanish: reglas for max ties for ssh
####
####
if [ "$allow_shield_maxtries" == "$NULL" ]; then
####
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft  $allow_use_ipv4  $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft  $allow_use_ipv6  $command_ip6tables_nft -A INPUT \
-p tcp -m multiport --dport $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptables_nft -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_legacy  $allow_use_ipv6  $command_ip6tables_legacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft     $allow_use_ipv6  $command_ip6tables_nft -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
####
fi
####
####
#######################################        english: limit bandwidth in kb/s
#######################################        spanish: limitar ancho de banda en kb/s
####
####
#### english: ipv4  bandwidth
#### spanish: ipv4  ancho de banda
####
####
if [ "$allow_input_bandwidth" == "$NULL" ] ; then
####
$allow_use_ipv4 $allow_use_legacy $allow_input_bandwidth $command_iptables_legacy     -A  INPUT \
-m hashlimit --hashlimit-above   "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinputlegacy  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_bandwidth $command_iptables_nft           -A INPUT \
-m hashlimit    --hashlimit-above "$config_input_bandwidth"kb/sec  \
--hashlimit-name maxinputnft  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
if [ "$allow_output_bandwidth" == "$NULL" ] ; then
####
####
$allow_use_ipv4 $allow_use_legacy $allow_output_bandwidth $command_iptables_legacy    -A OUTPUT \
-m hashlimit --hashlimit-above  "$config_output_bandwidth"kb/sec \
--hashlimit-mode dstip --hashlimit-name maxoutputlegacy -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null

####
####
$allow_use_ipv4 $allow_use_nft $allow_output_bandwidth $command_iptables_nft          -A OUTPUT \
-m hashlimit  --hashlimit-above "$config_output_bandwidth"kb/sec \
--hashlimit-mode dstip  --hashlimit-name maxoutputnft -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
fi
####
####
#############        english: ipv6 bandwidth
#############        spanish: ipv6 ancho de banda
####
####
if [ "$allow_input_bandwidth" == "$NULL" ] ; then
####
$allow_use_ipv6 $allow_use_legacy $allow_input_bandwidth $command_ip6tables_legacy -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_input_bandwidth $command_ip6tables_nft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
####
if [ "$allow_output_bandwidth" == "$NULL" ] ; then
####
$allow_use_ipv6 $allow_use_legacy $allow_output_bandwidth $command_ip6tables_legacy -A OUTPUT \
-m hashlimit --hashlimit-above  "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_output_bandwidth $command_ip6tables_nft -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
fi
####
####
#######################################        english: limit number of all connections
#######################################        spanish: limitar numero de conexiones totales
####
####
#### english: ipv4  bandwidth
#### spanish: ipv4  ancho de banda
####
####
if [ "$allow_input_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv4 $allow_use_legacy $allow_input_maxconnect  $command_iptables_legacy -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect   -j $config_close_deny  \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_maxconnect $command_iptables_nft   -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect       -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv4 $allow_use_legacy $allow_output_maxconnect $command_iptables_legacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_output_maxconnect $command_iptables_nft  -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect      -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
#### english: ipv6 bandwidth
#### spanish: ipv6 ancho de banda
####
####
if [ "$allow_input_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv6 $allow_use_legacy $allow_input_maxconnect  $command_ip6tables_legacy -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect  -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_input_maxconnect $command_ip6tables_nft   -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect       -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv6 $allow_use_legacy $allow_output_maxconnect $command_ip6tables_legacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_output_maxconnect $command_ip6tables_nft  -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect      -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####


####################################### english: rules to allow client ports with without separate rules
####################################### spanish: reglas para permitir puertos cliente without separate rules
####
####
if [ "$allow_separate_rules" == "no" ]; then 
####
####
####    CLIENT  UDP
####
#### ipv4 legacy udp
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
#### ipv6 legacy udp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_udp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_udp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
####    CLIENT  TCP
####
#### ipv4 legacy tcp
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
fi
####
####
####################################### english: rules to allow client ports with with separate rules
####################################### spanish: reglas para permitir puertos cliente with separate rules
####
####
if [ "$allow_separate_rules" == "$NULL" ]; then 
for one_udp in $(echo $client_port_udp | $command_sed 's/,/ /g') ;
do
####
####
####    CLIENT  UDP
####
#### ipv4 legacy udp
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4     $command_iptables_nft -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_iptables_nft -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
#### ipv6 legacy udp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_udp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_udp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client udp"  &> /dev/null
####
####
done; fi
####
####
if [ "$allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $client_port_tcp | $command_sed 's/,/ /g') ;
do
####
####
####    CLIENT TCP
####
#### ipv4 legacy tcp
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4     $command_iptables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp -s $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_iptables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp -d $net_ipv4_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp -s $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp -d $net_ipv6_client -j ACCEPT \
-m comment --comment "client tcp"  &> /dev/null
####
####
done ; fi
####
####
####################################### english: rules to log servers
####################################### spanish: reglas para logear servers
####
####
#### ipv4
####
####
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_iptables_nft    -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptables_nft    -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_iptables_nft    -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptables_nft    -A OUTPUT \
-p udp -m multiport --sports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
#### ipv6
####
####
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT   \
-p tcp  -m multiport --dports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A INPUT   \
-p udp  -m multiport --dports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT  \
-p tcp -m multiport --sports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tables_legacy -A OUTPUT  \
-p udp -m multiport --sports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv6   $command_ip6tables_nft    -A INPUT   \
-p tcp  -m multiport --dports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_nft     $allow_use_ipv6   $command_ip6tables_nft    -A INPUT   \
-p udp  -m multiport --dports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_input" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv6   $command_ip6tables_nft    -A OUTPUT  \
-p tcp -m multiport --sports $logserver_port_tcp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver tcp"  &> /dev/null
$allow_use_nft     $allow_use_ipv6   $command_ip6tables_nft    -A OUTPUT  \
-p udp -m multiport --sports $logserver_port_udp -j LOG --log-prefix "$logserver_prefix_output" \
-m comment --comment "logserver udp"  &> /dev/null
####
####
####################################### english: rules allow server ports with tcp
####################################### spanish: reglas para permitir puertos servidor tcp
####
####
#### 000000000000000000000000000 without separate rules 00000000000000000000000000
####
####
if [ "$allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
fi
####
####
####################################### english: rules allow server ports with udp
####################################### spanish: reglas para permitir puertos servidor udp
####
####
if [ "$allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
#### 
#### ipv4 nft
####
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p udp -m multiport --dports $server_port_udp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
fi
####
####
#### 000000000000000000000000000 without separate rules 00000000000000000000000000
####
####
####################################### english: rules allow server ports with tcp
####################################### spanish: reglas para permitir puertos servidor tcp
####
####
#### 000000000000000000000000000 with separate rules 00000000000000000000000000
####
####
if [ "$allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $server_port_tcp | $command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server tcp" &> /dev/null
####
####
done; fi
####
####
####################################### english: rules allow server ports with udp
####################################### spanish: reglas para permitir puertos servidor udp
####
####
if [ "$allow_separate_rules" == "$NULL" ]; then 
for one_udp in $(echo $server_port_udp | $command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptables_legacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A INPUT \
-p udp -m multiport --dports $one_udp -s $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptables_nft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $net_ipv4_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A INPUT  \
-p udp -m multiport --dports $one_udp -s $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $net_ipv6_server -j ACCEPT \
-m comment --comment "server udp" &> /dev/null
####
####
done; fi
####
####
#### 000000000000000000000000000 with separate rules 00000000000000000000000000
####
####
####################################### english: rules from input of legacy ipv4 for ping, uid, gid and protocols
####################################### spanish: reglas de entrada de legacy ipv4 para ping, uid, gid y protocolos
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_ping  $command_iptables_legacy -A INPUT  \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping $command_iptables_legacy -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp resquest" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $config_uid_gid $command_iptables_legacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "state uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols $command_iptables_legacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
####################################### english: rules from output of legacy ipv4 for ping, uid, gid and protocols
####################################### spanish: reglas de salida de legacy ipv4 para ping, uid, gid y protocolos
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_ping  $command_iptables_legacy   -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping  $command_iptables_legacy -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_uid $command_iptables_legacy   -A OUTPUT \
-m owner --uid-owner $config_output_uid -j ACCEPT \
-m comment --comment "state uid" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_gid $command_iptables_legacy   -A OUTPUT \
-m owner --gid-owner $config_output_gid -j ACCEPT \
-m comment --comment "state gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols      $command_iptables_legacy -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
####################################### english: ipv6 filter legacy rules input and output for ping, uid, gid and protocols
####################################### spanish: ipv6 filtros legacy reglas de entrada y salida para ping, uid, gid y protocolos
####
#### 
#### english: ipv6 filter legacy rules input 
#### spanish: ipv6 filtros de legacy reglas de entrada
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_ping      $command_ip6tables_legacy -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_input_ping    $command_ip6tables_legacy -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $config_uid_gid $command_ip6tables_legacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "state uid-gid" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv6 $allow_others_protocols      $command_ip6tables_legacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter legacy rules output
#### spanish: ipv6 filtros legacy reglas de salida
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_ping  $command_ip6tables_legacy   -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_input_ping  $command_ip6tables_legacy -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_uid $command_ip6tables_legacy   -A OUTPUT \
-m owner --uid-owner $config_output_uid -j ACCEPT \
-m comment --comment "state uid" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_gid $command_ip6tables_legacy   -A OUTPUT \
-m owner --gid-owner $config_output_gid -j ACCEPT \
-m comment --comment "state gid" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tables_legacy -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_legacy6  $allow_use_ipv6 $allow_others_protocols      $command_ip6tables_legacy -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
############################       english: iptables rules ipv4  iptables-nft for ping, uid, gid and protocols
############################       spanish: reglas de iptables ipv4 iptables-nft para ping, uid, gid y protocolos
####
####
#### english: ipv4 filter nft rules input
#### spanish: ipv4 filter nft reglas de entrada
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_ping     $command_iptables_nft -A INPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping   $command_iptables_nft -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $config_uid_gid $command_iptables_nft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "state uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols       $command_iptables_nft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv4 filter nft rules output
#### spanish: ipv4 filter nft reglas de salida
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_ping    $command_iptables_nft -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping  $command_iptables_nft -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_uid $command_iptables_nft   -A OUTPUT \
-m owner --uid-owner $config_output_uid -j ACCEPT \
-m comment --comment "status uid" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_gid $command_iptables_nft   -A OUTPUT \
-m owner --gid-owner $config_output_gid -j ACCEPT \
-m comment --comment "status gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols      $command_iptables_nft -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
########## english: ipv6 filter nft rules input and output for ping, uid, gid and protocols
########## spanish: ipv6 filtros nft relgas de entrada y salida para ping, uid, gid y protocolos
####
####
#### ipv6 filter nft rules input
#### ipv6 filtros nft reglas d entrada
####
####
$allow_use_nft $allow_use_ipv6 $allow_output_ping      $command_ip6tables_nft -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_input_ping    $command_ip6tables_nft -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "imcp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $config_uid_gid $command_ip6tables_nft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "status uid-gid" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv6 $allow_others_protocols      $command_ip6tables_nft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter nft rules output
#### spanish: ipv6 filtros nft reglas de salida
####
####
$allow_use_nft $allow_use_ipv6 $allow_output_ping      $command_ip6tables_nft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_input_ping    $command_ip6tables_nft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_output_uid     $command_ip6tables_nft -A OUTPUT \
-m owner --uid-owner $config_output_uid -j ACCEPT \
-m comment --comment "status uid" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_output_gid     $command_ip6tables_nft -A OUTPUT \
-m owner --gid-owner $config_output_gid -j ACCEPT \
-m comment --comment "status gid" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tables_nft -A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv6 $allow_others_protocols      $command_ip6tables_nft -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
########################################## english: nat for ipv4 and ipv6
########################################## spanish: nat para ipv4 y ipv6
####
####
#### english: nat DELETED
#### spanish: borrado nat
####
####
#### $command_iptables_nft -t nat -F
#### $command_iptables_legacy -t nat -F
#### $command_ip6tables_nft -t nat -F
#### $command_ip6tables_legacy -t nat -F
####
####
#### english: do masquerade nat ip4 and ip6 ALLOW GATEWAY
#### spanish: hace nat masquerade ip4 y ip6 PERMITIR GATEWAY
####
####
if [ "$allow_gateway_ip4" == "$NULL" ]; then 
####
####
$allow_use_nft    $allow_use_ipv4    $allow_gateway_ip4 $command_iptables_nft -t nat \
-A POSTROUTING -j MASQUERADE \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv4 $allow_gateway_ip4 $command_iptables_legacy -t nat \
-A POSTROUTING -j MASQUERADE \
-m comment --comment "ip gateway" &>/dev/null
####
####
$allow_use_nft $allow_use_ipv4    $allow_gateway_ip4 $command_iptables_nft -t nat \
-A PREROUTING -j ACCEPT \
-m comment --comment "ip gateway"  &>/dev/null
$allow_use_legacy $allow_use_ipv4     $allow_gateway_ip4 $command_iptables_legacy -t nat \
-A PREROUTING -j ACCEPT \
-m comment --comment "ip gateway" &>/dev/null
####
fi
####
####
if [ "$allow_gateway_ip6" == "$NULL" ]; then 
####
####
$allow_use_nft $allow_use_ipv6 $allow_gateway_ip6 $command_ip6tables_nft -t nat \
-A POSTROUTING -j MASQUERADE \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_gateway_ip6 $command_ip6tables_legacy -t nat \
-A POSTROUTING -j MASQUERADE \
-m comment --comment "ip gateway" &>/dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_gateway_ip6 $command_ip6tables_nft -t nat \
-A PREROUTING -j ACCEPT \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_gateway_ip6 $command_ip6tables_legacy -t nat \
-A PREROUTING -j ACCEPT \
-m comment --comment "ip gatway" &>/dev/null
####
fi
####
####
#### english: do DMZ nat ip4 and ip6 ALLOW GATEWAY SERVER IN LAN
#### spanish: hace nat DMZ ip4 y ip6 PERMITIR GATEWAY SERVER IN LAN
####
####
if [ "$config_dmz_ip4" == "$NULL" ]; then 
####
####
$allow_use_nft    $allow_use_ipv4    $allow_dmz_ip4 $command_iptables_nft -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
$allow_use_legacy $allow_use_ipv4    $allow_dmz_ip4 $command_iptables_legacy -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
####
fi
####
####
if [ "$config_dmz_ip6" == "$NULL" ]; then 
####
####
$allow_use_nft $allow_use_ipv6    $allow_dmz_ip6 $command_ip6tables_nft -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip6 \
-m comment --comment "ip dmz" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_dmz_ip6 $command_ip6tables_legacy -t nat \
-A PERROUTING -j DNAT --to-destination $config_dmz_ip6 \
-m comment --comment "ip dmz" &>/dev/null
####
fi
####
####
######################################## english: iptables ipv4 and ipv6 with forward rules ALLOW FORWARD
######################################## spanish: iptables ipv4 y ipv6 con reglas de reenvio PERMITIR FORWARD
####
####
#### english: deactive for default with forward or without forward
#### spanish: desactiva por defecto con reenvio o sin reenvio
####
####
$command_sysctl -w net.ipv4.conf.all.forwarding=0 &> /dev/null
$command_sysctl -w net.ipv6.conf.all.forwarding=0 &> /dev/null
####
####
####   Active when there is forward
$ipv4 $allow_forward $command_sysctl -w net.ipv4.conf.all.forwarding=1 &> /dev/null
$ipv6 $allow_forward $command_sysctl -w net.ipv6.conf.all.forwarding=1 &> /dev/null
####
####
####   ipv4 filter legacy rules forward
$allow_use_legacy $allow_forward_ip4 $command_iptables_legacy -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter legacy rules forward
$allow_use_legacy $allow_forward_ip6 $command_ip6tables_legacy -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv4 filter nft rules forward
$allow_use_nft $allow_forward_ip4 $command_iptables_nft -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter nft rules forward
$allow_use_nft $allow_forward_ip6 $command_ip6tables_nft -A FORWARD -j ACCEPT &> /dev/null
####
####
#######################################       iptables ipv4 and ipv6 closed with drop input, and drop forward, and drop output rules
#######################################       iptables ipv4 y ipv6 cierran la entrada, reemvio y salida con reglas de dropeo
####
####
if [ "$config_close_deny" != "$NULL" ]; then 
####
####
#### ipv4 drop rules iptables-legacy
$allow_use_legacy $command_iptables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_iptables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
#### ipv6 drop rules iptables-legacy
$allow_use_legacy $command_ip6tables_legacy -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_legacy $command_ip6tables_legacy -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
#### ipv4 drop rules iptables-nft
$allow_use_nft $command_iptables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_iptables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
#### ipv6 drop rules iptables-nft
$allow_use_nft $command_ip6tables_nft -A INPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A OUTPUT -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$allow_use_nft $command_ip6tables_nft -A FORWARD -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
fi
####
####
########################################       english: iptables ipv4 and ipv6 with variable input_all
########################################       english: iptables ipv4 y ipv6 con variable input_all
####
####
if [ "$allow_input_all" == "$NULL" ]; then 
####
####
#### english: nft INPUT deleted
#### spanish: nft INPUT borradas
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -F INPUT  &> /dev/null
####
####
#### english: legacy INPUT deleted
#### spanish: legacy INPUT borradas
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -F INPUT  &> /dev/null
####
####
#### english: nft INPUT 127.0.0.1 accept
#### spanish: nft INPUT ::1 acepta
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### english: legacy INPUT 127.0.0.1 accept
#### spanish: legacy INPUT ::1 acepta
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "close rule" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "close rule" &> /dev/null
####
####
#### english: legacy4 INPUT  limit bandwidth
#### spanish: legacy6 INPUT limita ancho de banda
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $allow_input_bandwidth iptables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $allow_input_bandwidth ip6tables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 INPUT limit bandwidth
#### spanish: nft6 INPUT limita ancho de banda
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $allow_input_bandwidth iptables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $allow_input_bandwidth ip6tables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec --hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $allow_input_maxconnect  $command_iptables_legacy -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect  -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $allow_input_maxconnect $command_iptables_nft   -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect       -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $allow_input_maxconnect  $command_ip6tables_legacy -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect  -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $allow_input_maxconnect $command_ip6tables_nft   -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect       -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: nft INPUT ACCEPT all or input_state
#### spanish: nft INPUT acepta todo o estado de entrada
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
####
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $allow_use_ipv4 $command_iptables_nft -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
fi
####
####
########################################       english: iptables ipv4 and ipv6 with variable output_all
########################################       english: iptables ipv4 y ipv6 con variable output_all
####
####
if [ "$allow_output_all" == "$NULL" ]; then 
####
####
####
#### english: nft OUTPUT deleted
#### spanish: nft OUTPUT borradas
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -F OUTPUT  &> /dev/null
####
####
#### english: legacy OUTPUT deleted
#### spanish: legacy OUTPUT borradas
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -F OUTPUT  &> /dev/null
####
####
#### english: nft OUTPUT 127.0.0.1 accept
#### spanish: nft OUTPUT ::1 acepta
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
####
#### english: legacy OUTPUT 127.0.0.1 accept
#### spanish: legacy OUTPUT ::1 acepta
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment "host localhost" &> /dev/null
####
fi
####
####
################################################    english: allow output bandwidth
################################################    spanish: acepta velocidad de conexiones de salida
####
####
if [ "$allow_output_bandwidth" == "$NULL" ]; then 
####
####
#### english: legacy4 OUTPUT limit bandwidth
#### spanish: legacy6 OUTPUT limita ancho de banda
####
#### 
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $allow_output_bandwidth iptables-legacy -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $allow_output_bandwidth ip6tables-legacy -A  OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 OUTPUT limit bandwidth
#### spanish: nft6 OUTPUT limita ancho de banda
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $allow_output_bandwidth iptables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $allow_output_bandwidth ip6tables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec --hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
fi
####
####
################################################    english: allow output maxconnect
################################################    spanish: acepta maximo de conexiones de salida
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then 
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $allow_output_maxconnect  $command_iptables_legacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $allow_output_maxconnect $command_iptables_nft   -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $allow_output_maxconnect  $command_ip6tables_legacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $allow_output_maxconnect $command_ip6tables_nft   -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
fi
####
####
################################################    english: allow output all
################################################    spanish: acepta toda salida
####
####
if [ "$allow_output_all" == "$NULL" ]; then 
####
####
#### english: nft OUTPUT ACCEPT all or input_state
#### spanish: nft OUTPUT acepta todo o estado de entrada
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy -t filter  -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft $command_iptables_nft -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft $command_ip6tables_nft -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy $command_iptables_legacy  -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy $command_ip6tables_legacy -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment "close rule" &> /dev/null
####
fi
####
####
########################################       english: show text when active custom rules
########################################       spanish: muestra texto cuando activas las custom reglas
####
####  
####
if [ -f "$directory_config/$second_option" ]; then $cmd_binary reset &> /dev/null ;
echo "$title_md [ _ok_ ] [ Launched: firewall ] [ Type: $type_firewall ] [ Name: $name_firewall ]"
exit ; else $nada ; fi
####
####
#### :rutina-final-code-wizard:
#######################
####     left script
#######################
####
####
#######################         english: End of script
#######################         spanish: Fin del script
####    
####
####    ### Git mini tutorial: with fwiptables.
####
####
####    # Download repository: tree methods with clone/pull/fetch https:// or ssh://
####
####    First time, download repository to folder user            :  git clone https://git.code.sf.net/p/f-iptables/code
####    Download updates from repository to folder user           :  git pull  https://f-iptables@git.code.sf.net/p/f-iptables/code
####    Recover repository from server repository to folder user  :  git fetch https://f-iptables@git.code.sf.net/p/f-iptables/code
####
####    # upload repository: update commit and push
####
####    Update files from local repository                        :  git commit -a 
####    Upload files to repository from local repository          :  git push ssh://f-iptables@git.code.sf.net/p/f-iptables/code
####
####
####    # Create repository local: with folder /var/git/repository.localhost
####
####    mkdir /var/git/repository.localhost
####    cd /var/git/repository.localhost
####    git init --bare
####    chmod user /var/git/repository.localhost -R
####    service ssh start or systemctl restart ssh
####
####
#######################
#######################
####
####
exit
