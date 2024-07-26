#!/bin/bash
#### #### #### #### for shell bash:
#### #### #### #### #!/bin/bash
####
#### #### #### #### for shell zsh:
#### #### #### #### #!/bin/zsh
#### #### #### #### emulate -L bash
####
#### File:        fwiptables
#### Description: Command Fran FireWall fwiptables Generator
#### Author:      Francisco Garcia <fwiptables@gmx.com>
#### Copyright:   (c) 2020-2024 Francisco Garcia <fwiptables@gmx.com>
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
####   English: This program has gpl license GPL v2, LGPL v2, BSD .
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
####     #### english: stablished the path  #### spanish: establece el path
####
####
#### source /etc/profile
PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
####
####
##########    english: are you root: uid 0 ?                ##########
##########    spanish: eres admnistrador: identificador 0 ? ##########
#### :rutina-inicial-admin:
####
####
if [ "$(id -u)" != "0" ] ; then echo ; echo
echo "### $text_fail [ fwiptables needs root to work ]"
echo "### $text_info [ Try with root user ]"
echo ; exit ; fi
####
####
#### :rutina-final-admin:
##########    english: #### use sudo to logname xhosts    ##########
#### :rutina-inicial-sudo:
####
####
command_sudo="$(command -v sudo)"
if [ "$command_sudo" == "$NULL" ] ; then echo ; echo
echo "### $text_fail [ fwiptables needs sudo to works in graphics xorg/wayland ]"
echo ; exit ; else command_sudo="$(command -v sudo) --login"; fi
####
####
#### :rutina-final-sudo:
##########    english: iptables support         ##########
##########    spanish: iptables soporte         ##########
#### :rutina-inicial-support-iptables:
####
####
command_iptableslegacy="$(command -v iptables-legacy)"
command_iptablesnft="$(command -v iptables-nft)"
####
####
if [ "$command_iptableslegacy" == "$NULL" ] && [ "$command_iptablesnft" == "$NULL" ];
then echo ; echo ; echo "### $text_fail [ fwiptables needs to work iptables legacy/nft ]"
echo ; fi
####
####
#### :rutina-final-support-iptables:
##########     english name, description and version    ##########
##########     spanish: nombre, descripcion y version   ##########
#### :rutina-inicial-enviroment:
####
####
#### configs for fwiptables
####
####
#### name files
cmd_realpath="$(realpath $0)"                              # fully routename
cmd_basename="$(basename $0)"                              # only  filename
#### number version
cmd_year="24"                                              # number year version
cmd_month="07"                                             # number mouth version
cmd_letter="l"                                             # number letter version
cmd_version="$cmd_year-$cmd_month$cmd_letter"              # final date like number version
#### name location
cmd_file="fwiptables"                                      # filename installed
cmd_directory="/usr/bin"                                   # directory installed
#### data program
cmd_developer="Francisco Garcia"                           # actual developer
cmd_contact="fwiptables@gmx.com"                           # actual contact
cmd_shortdescription="FireWall With iptables"              # description short
cmd_longdescription="One Mini Script in one-file wizard"   # description long
cmd_license="GPL v2, LGPL v2, BSD"                         # program license
#### web oficial
content_license_gpl=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-GPL.txt?format=raw"
content_license_lgpl=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-LGPL.txt?format=raw"
content_license_bsd=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-BSD.txt?format=raw"
web_homepage_sourceforge=\
"https://sourceforge.net/projects/f-iptables/" ;
web_homepage_github=\
"https://github.com/fwiptables/fwiptables" ;
web_hompage_devuan=\
"https://git.devuan.org/fwiptables/fwiptables" ;
web_download_sourceforge=\
"https://sourceforge.net/projects/f-iptables/files/latest/download" ;
web_download_github=\
"https://github.com/fwiptables/fwiptables/releases" ;
web_download_devuan=\
"https://git.devuan.org/fwiptables/fwiptables/releases" ;
git_listado_sourceforge=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/"
git_download_sourceforge=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/iversion.sh?format=raw" ;
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
zero_option="$cmd_realpath" ;
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
#### :rutina-final-order-options:
##########   english: profile y support X11       ##########
##########   spanish: profile y soporte de X11    ##########
#### :rutina-inicial-x11-or-wayland:
####
####
X11_OR_WAYLAND="$XDG_SESSION_TYPE"
####
####
####  Support wayland for root  WAYLAND_DISPLAY=":0"
#### english: add auth memory directory for root for graphicall use 
#### spanish: añade autorización memory directory para root para uso grafico
XDG_RUNTIME_DIR="/run/user/0"
####
####
####  Support x11 for root     xhost +root
#### english: add auth xhost for root for graphicall use 
#### spanish: añade autorización xhost para root para uso grafico
####
####
command_xhost="$(command -v xhost)" ; 
if [ "$(logname)" != "$NULL" ] && [ "$(id -u)" == 0 ]; then 
$command_sudo -u "$(logname)" $command_xhost +SI:localuser:root &> /dev/null
else $command_sudo -u 0 $command_xhost +SI:localuser:root &> /dev/null ; fi
####
####
#### use deprecated
## $command_sudo -u "$(logname)" $command_xhost +SI:localuser:root &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +root@127.0.0.1 &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +INET:root@127.0.0.1 &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +INET6:root@127.0.0.1 &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +DNET:root@127.0.0.1 &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +KRB:root@127.0.0.1 &> /dev/null
## $command_sudo -u "$(logname)" command_xhost +NIS:root@127.0.0.1 &> /dev/null
####
####
#### :rutina-final-x11-or-wayland:
##########   english: search programs: programs path           ##########
##########   spanish: busca los programas: ruta de programas   ##########
#### :rutina-inicial-command:
####
####
command_arp="$(command -v arp)"
command_arpscan="$(command -v arp-scan)"
command_arptables="$(command -v arptables)"
command_awk="$(command -v awk)"
command_bash="$(command -v bash)"
command_bc="$(command -v bc)"
command_convert="$(command -v convert)"
command_cpufreqinfo="$(command -v cpufreq-info)"
command_cpupower="$(command -v cpupower)"
command_curl="$(command -v curl)"
command_cut="$(command -v cut)"
command_date="$(command -v date)"
command_dd="$(command -v dd)"
command_dhclient="$(command -v dhclient)"
command_dhclientscript="$(command -v dhclient-script)"
command_dhcpcd="$(command -v dhcpcd)"
command_dialog="$(command -v dialog)"
command_dig="$(command -v dig)"
command_dpkg="$(command -v dpkg)"
command_ebtables="$(command -v ebtables)"
command_editor="$(command -v editor)"
command_egrep="$(command -v egrep)"
command_elinks="$(command -v elinks)"
command_file="$(command -v file)"
command_find="$(command -v find)"
command_fmt="$(command -v fmt)"
command_geoiplookup="$(command -v geoiplookup)"
command_glxgears="$(command -v glxgears)"
command_gpg="$(command -v gpg)"
command_grep="$(command -v grep)"
command_halt="$(command -v halt)"
command_host="$(command -v host)"
command_ifconfig="$(command -v ifconfig)"
command_init="$(command -v init)"
command_ip="$(command -v ip)"
command_ip6tableslegacy="$(command -v ip6tables-legacy)"
command_ip6tablesnft="$(command -v ip6tables-nft)"
command_iperf="$(command -v iperf)"
command_iperf3="$(command -v iperf3)"
command_iptableslegacy="$(command -v iptables-legacy)"
command_iptablesnft="$(command -v iptables-nft)"
command_iw="$(command -v iw)"
command_links="$(command -v links)"
command_links2="$(command -v links2)"
command_logname="$(command -v logname)"
command_lpinfo="$(command -v lpinfo)"
command_lpstat="$(command -v lpstat)"
command_ls="$(command -v ls)"
command_lsblk="$(command -v lsblk)"
command_lscpu="$(command -v lscpu)"
command_lsgpu="$(command -v lsgpu)"
command_lshw="$(command -v lshw)"
command_lsof="$(command -v lsof)"
command_lspci="$(command -v lspci)"
command_lsusb="$(command -v lsusb)"
command_lynx="$(command -v lynx)"
command_m2r="$(command -v m2r)"
command_md5sum="$(command -v md5sum)"
command_mdp="$(command -v mdp)"
command_mpg123="$(command -v mpg123)"
command_mpg123="$(command -v mpg123)"
command_mpg321="$(command -v mpg321)"
command_mpg321="$(command -v mpg321)"
command_nano="$(command -v nano)"
command_netstat="$(command -v netstat)"
command_netstatnat="$(command -v netstat-nat)"
command_nmap="$(command -v nmap)"
command_ntpdate="$(command -v ntpdate)"
command_obash="$(command -v obash)"
command_openssl="$(command -v openssl)"
command_pico="$(command -v pico)"
command_ping="$(command -v ping)"
command_poweroff="$(command -v poweroff)"
command_rdate="$(command -v rdate)"
command_readlink="$(command -v readlink)"
command_reboot="$(command -v reboot)"
command_resolveip="$(command -v resolveip)"
command_route="$(command -v route)"
command_sed="$(command -v sed)"
command_shutdown="$(command -v shutdown)"
command_sleep="$(command -v sleep)"
command_sntp="$(command -v sntp) -S"
command_ss="$(command -v ss)"
command_sysctl="$(command -v sysctl)"
command_systemctl="$(command -v systemctl)"
command_tar="$(command -v tar)"
command_tcpdump="$(command -v tcpdump)"
command_tee="$(command -v tee)"
command_timeout="$(command -v timeout)"
command_torify="$(command -v torify)"
command_tracepath="$(command -v tracepath)"
command_traceroute="$(command -v traceroute)"
command_tree="$(command -v tree)"
command_tree="$(command -v tree)"
command_txt2html="$(command -v txt2html)"
command_uname="$(command -v uname)"
command_uuid="$(command -v uuid)"
command_vi="$(command -v vi)"
command_vim="$(command -v vim)"
command_vlc="$(command -v vlc) -I dummy -d"
command_w3m="$(command -v w3m)"
command_wget="$(command -v wget)"
command_whiptail="$(command -v whiptail)"
command_wpapassphrase="$(command -v wpa_passphrase)"
command_wpasupplicant="$(command -v wpa_supplicant)"
command_xrandr="$(command -v xrandr)"
command_yad="$(command -v yad)"
command_zenity="$(command -v zenity)"
command_zgrep="$(command -v zgrep)"
####
####
#### :rutina-final-command:
##########  english: files:    files and folders from fwiptables          ##########
##########  spanish: archivos: archivos y carpetas desde fwiptables       ##########
#### :rutina-inicial-files:
####
####
#### english: permanent directory:   permanent directory and path directory config files
#### spanish: directorio permanente: directorios permanentes y ruta de directorios 
####
####
#### english: directory tree 
#### spanish: arbol de directorio
####
####
####
#### prepare directory data $HOME OR /root
####
if [ "$HOME" == "$NULL" ] ; then default_root_home="/root" 
else default_root_home="$HOME"; fi
####
#### set directory data cache
####
directory_cache_run="/run/$cmd_file"  ### ununsed
directory_cache_home="$default_root_home/.cache/$cmd_file"
if [ ! -d "$directory_cache_home" ]; 
then mkdir -p $directory_cache_home &> /dev/null ; fi
####
####
#### #### variables tree and .cache ####
####
#### raiz .cache 
directory_cache_necesary="$directory_cache_home"
#### tree .cache
default_directory_cache="$directory_cache_necesary"
####
#### #### variables tree .config ####
####
#### raiz .config
directory_data_necesary="$default_root_home/.config/$cmd_file"
#### tree .config
default_directory_template="$directory_data_necesary/fwiptables-template"
default_directory_control="$directory_data_necesary/fwiptables-control"
default_directory_custom="$directory_data_necesary/fwiptables-custom"
default_directory_preferences="$directory_data_necesary/fwiptables-preferences"
default_directory_autolog="$directory_data_necesary/fwiptables-autolog"
default_directory_log="$directory_data_necesary/fwiptables-log"
default_directory_pdf="$directory_data_necesary/fwiptables-pdf"
default_directory_wpa="$directory_data_necesary/fwiptables-wpa"
default_directory_benchmarkram="$directory_data_necesary/fwiptables-benchmarkram"
default_directory_benchmarkdisk="$directory_data_necesary/fwiptables-benchmarkdisk"
default_directory_radio="$directory_data_necesary/fwiptables-radio"
default_directory_proxy="$directory_data_necesary/fwiptables-proxy"
default_directory_adblock="$directory_data_necesary/fwiptables-adblock"
default_directory_obash="$directory_data_necesary/fwiptables-obash"
default_directory_debian="$directory_data_necesary/fwiptables-debian"
default_directory_readme="$directory_data_necesary/fwiptables-readme"
####
####
#### english: templates cfg
#### spanish: plantillas cfg
####
####
default_fullcfg_eng="$default_directory_template/default-full-english.cfg"
default_fullcfg_spa="$default_directory_template/default-full-spanish.cfg"
default_minicfg_eng="$default_directory_template/default-mini-english.cfg"
default_minicfg_spa="$default_directory_template/default-mini-spanish.cfg"
####
####
#### english: default config to shell
#### spanish: default config to shell
####
####
file_default_preferences="$default_directory_preferences/default-preferences-$cmd_version"
####
####
#### english: file log:     log files and path files config files
#### spanish: archivos log: archivos log y ruta de los archivos de configuracion
####
####
file_default_filelog="$default_directory_log/default_filelog-$cmd_version"
file_default_autolog="$default_directory_autolog/default_autolog-$cmd_version"
####
####
#### stablished which is the cache temporal.
####
#### directory_cache="$directory_cache_home"
####
#### stablished a new variable
####
#### default_directory_temporal="$directory_cache"
####
####
#### english: temporal files
#### spanish: archivos temporales
####
####
temporal_text="$default_directory_cache/$show_actual_date-text.txt"
temporal_textfinal="$default_directory_cache/$show_actual_date-text-final.txt"
temporal_gui="$default_directory_cache/$show_actual_date-textfinal.txt"
temporal_guifinal="$default_directory_cache/$show_actual_date-text-final.txt"
output_log="$default_directory_cache/$show_actual_date-textfinal.txt"
output_logfinal="$default_directory_cache/$show_actual_date-text-final.txt"
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
#### cache
if [ ! -d "$default_directory_cache" ]; then
$command_mkdir -p $default_directory_cache &> /dev/null ; fi
####
#### data
if [ ! -d "$default_directory_data_necesary" ]; then
$command_mkdir -p $default_directory_data_necesary &> /dev/null ; fi
####
####
if [ ! -d "$default_directory_control" ]; then 
$command_mkdir -p "$default_directory_control" &> /dev/null ; fi
if [ ! -d "$default_directory_template" ]; then
$command_mkdir -p "$default_directory_template" &> /dev/null ; fi
if [ ! -d "$default_directory_custom" ]; then
$command_mkdir -p "$default_directory_custom" &> /dev/null ; fi
if [ ! -d "$default_directory_preferences" ]; then
$command_mkdir -p "$default_directory_preferences" &> /dev/null ; fi
if [ ! -d "$default_directory_autolog" ]; then
$command_mkdir -p "$default_directory_autolog" &> /dev/null ; fi
if [ ! -d "$default_directory_log" ]; then
$command_mkdir -p "$default_directory_log" &> /dev/null ; fi
if [ ! -d "$default_directory_wpa" ]; then
$command_mkdir -p "$default_directory_wpa" &> /dev/null ; fi
if [ ! -d "$default_directory_pdf" ]; then
$command_mkdir -p "$default_directory_pdf" &> /dev/null ; fi
if [ ! -d "$default_directory_benchmarkram" ]; then
$command_mkdir -p "$default_directory_benchmarkram" &> /dev/null ; fi
if [ ! -d "$default_directory_benchmarkdisk" ]; then
$command_mkdir -p "$default_directory_benchmarkdisk" &> /dev/null ; fi
if [ ! -d "$default_directory_radio" ]; then
$command_mkdir -p "$default_directory_radio" &> /dev/null ; fi
if [ ! -d "$default_directory_proxy" ]; then
$command_mkdir -p "$default_directory_proxy" &> /dev/null ; fi
if [ ! -d "$default_directory_adblock" ]; then
$command_mkdir -p "$default_directory_adblock" &> /dev/null ; fi
if [ ! -d "$default_directory_obash" ]; then
$command_mkdir -p "$default_directory_obash" &> /dev/null ; fi
if [ ! -d "$default_directory_debian" ]; then
$command_mkdir -p "$default_directory_debian" &> /dev/null ; fi
if [ ! -d "$default_directory_readme" ]; then
$command_mkdir -p "$default_directory_readme" &> /dev/null ; fi
####
####
#### :rutina-final-dir-sane:
##########  english: system-variables: variables to declare     ##########
##########  spanish: system-variables: variables para declarar  ##########
#### :rutina-inicial-system-variables:
####
####
allow_expert_commands=""
without_first_option=""
launch_rules_firewall="no"
####
#### 
allow_use_legacy=""                       
allow_use_nft="no"                        
allow_use_ipv4=""                         
allow_use_ipv6=""                         
allow_separate_rules=""        
config_shield_port="22"        
config_shield_maxtries="10"  
allow_close_log="no"      
config_close_deny="DROP"
allow_system_ulog="no"   
allow_save_autolog=""          
allow_show_time="no"           
favorite_text_editor=""        
favorite_realpath_textdialog=""
favorite_realpath_graphicalldialog=""
favorite_text_browser=""
favorite_date_command=""
serverip_discover_ipv4="http://httpbin.org/ip"
serverip_discover_ipv6="http://httpbin.org/ip"
serverip_iperf_ipv4="ping.online.net"       
serverport_iperf_ipv4="5200"                
serverip_iperf_ipv6="ping6.online.net"      
serverport_iperf_ipv6="5200"
server_radio_online="https://www.tdtchannels.com/lists/radio.m3u8"
config_graphicall_width="750"
config_graphicall_height="550"
list_rules_conceptual=""   ;
config_ip4_localhost="127.0.0.1"    ;
config_ip6_localhost="::1"    ;
client_port_tcp="ssh,http,https"     ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     ;
server_port_tcp=""     ;
server_port_udp=""     ;
allow_shield_maxtries="no"    ;
config_shield_port="22" ;
config_shield_maxtries="12"     ;
logserver_port_tcp="no"     ;
logserver_port_udp="no"     ;
time_server_waiting="9s"    ;
allow_string_denied="no"     ;
allow_string_allowed="no"   ;
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
####
####
config_string_algoritmo="kpm"
config_string_denied=".fb.com,.facebook.com,xxx.html" ;
config_string_allowed="one-string-that-like-how-a-passord,sourceforge.net"  ;
config_gateway_ip4="0/0"    ;
config_gateway_ip6="::/0"    ;
config_dmz_ip4=""     ;
config_dmz_ip6=""     ;
config_input_bandwidth="12512"     ;
config_input_maxconnect="72"     ;
config_input_state="new,related,established"     ;
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
config_ipv4_netclient="0/0"     ;
config_ipv4_netserver="0/0"     ;
config_ipv6_netclient="::/0"     ;
config_ipv6_netserver="::/0"     ;
####
#### headers
####
title_md="### " ;
text_md="  " ;
text_ok="[ _ok_ ]"
text_info="[ info ]"
text_fail="[ fail ]"
head_waiting_all=" [ Wait several seconds.. ]  [ press control-c to cancel ] "
head_waiting_txt="$title_md $text_info [ txt ] $head_waiting_all "
head_waiting_narrow="$title_md $text_info [ narrow ] $head_waiting_all "
head_waiting_cli="$title_md $text_info [ cli ] $head_waiting_all "
head_waiting_gui="$title_md $text_info [ gui ] $head_waiting_all "
head_waiting_log="$title_md $text_info [ log ] $head_waiting_all "
head_waiting_pdf="$title_md $text_info [ pdf ] $head_waiting_all "
head_give_cover="$title_md [ $cmd_file $cmd_version ] [ $X11_OR_WAYLAND ] \
[ Options: $cmd_realpath options ]"
give_load="$title_md $text_ok [ Load firewall ] [ Firewall With iptables ]"
give_preferences="$title_md [ Configure ] [ $cmd_realpath preferences-modify ]"
nada="$(echo -n)" ; 
message_without_support="[ Without support for output cli for this option ]"
message_without_narrow="$title_md $text_fail [ narrow ] $message_without_support"
message_without_txt="$title_md $text_fail [ txt ] $message_without_support"
message_without_cli="$title_md $text_fail [ cli ] $message_without_support"
message_without_gui="$title_md $text_fail [ gui ] $message_without_support"
message_without_info="$title_md $text_fail [ log ] $message_without_support"
message_without_null="$title_md $text_fail [ null ] $message_without_support"
message_without_pdf="$title_md $text_fail [ pdf ] $message_without_support"
message_without_climenu="$title_md $text_fail [ install or dialog or wiptail]"
message_without_guimenu="$title_md $text_fail [ install or zenity or yad ]"
message_without_guiroll="$title_md $text_fail [ install zenity ]"
####
#### run date
####
show_actual_date="$($command_date +DAY_%Y-%m-%d_HOUR_%H-%M-%S)"
####
#### proxy file
####
file_conf_clientproxy="$default_directory_proxy/fwiptables-proxy"
####
#### radio music
####
name_radio_group="radio.m3u8"
file_radio_config="$default_directory_radio/fwiptables-config-$name_radio_group"
file_radio_cache="$default_directory_radio/fwiptables-cache-$name_radio_group"
####
#### web adblock
####
web_blacklist_fademind="https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
web_blacklist_mvps="http://winhelp2002.mvps.org/hosts.txt"
web_blacklist_adaway="https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt"
web_blacklist_stevenblack="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
####
#### file adblock
####
file_blacklist_fademind="$default_directory_adblock/hosts.blacklist_fademind"
file_blacklist_mvps="$default_directory_adblock/hosts.blacklist_mvps"
file_blacklist_adaway="$default_directory_adblock/hosts.blacklist_adaway"
file_blacklist_stevenblack="$default_directory_adblock/hosts.blacklist_stevenblack"
####
####
#### :rutina-final-system-variables:
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-update-variables:
####
####
if [ -f "$file_default_preferences" ]; then source $file_default_preferences ; fi
####
####
if [ "$first_option" = "$NULL" ] && [ "$without_first_option" = "$NULL" ];
then first_option="options"; fi 
if [ "$first_option" = "$NULL" ]; then first_option="$without_first_option" ; fi
####
####
#### :rutina-final-update-variables:
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-sane-variables-basics:
####
####
case "$NULL" in "$choosed_iptables")         ;;
*)  choosed_iptables="no"                    ;; esac
case "$NULL" in "$launch_rules_firewall")    ;;
*)  launch_rules_firewall="no"               ;; esac
case "$NULL" in "$name_firewall")            ;; 
*)  name_firewall="no"                       ;; esac
case "$NULL" in "$type_firewall")            ;;
*)  type_firewall="no"                       ;; esac
####
####
if [ "$allow_expert_commands" == "no" ]; then 
####
case "$first_option"
in exper*)
echo "$title_md See in preferences allow_expert_commands to active it option"
exit ;; esac
####
case "$second_option"
in exper*)
echo "$title_md See in preferences allow_expert_commands to active it option"
exit ;; esac
####
fi
####
####
if [ "$command_file" == "$NULL" ] || [ "$command_awk" == "$NULL" ]; then exit ;
else cmd_format="$($command_file $0 | $command_awk '{print $2 "_" $3}')" ; fi
####
####
#### :rutina-final-sane-variables-basics:
####
####
##########      english: search favorite iperf: favorite iperf command        ##########
##########      spanish: busca preferida fecha: favorita comando de iperf     ##########
#### :rutina-inicial-favorite-iperf-command:
####
####
if [ "$favorite_iperf_command" == "$NULL" ]; then
if [ "$command_iperf3"    != "$NULL" ]; then
favorite_iperf_command="$command_iperf3" ; fi
if [ "$command_iperf"   != "$NULL" ]; then
favorite_iperf_command="$command_iperf" ; fi
####
####
fi
####
####
#### :rutina-final-favorite-iperf-command:
##########      english: search favorite date: favorite date command        ##########
##########      spanish: busca preferida fecha: favorita comando de fecha   ##########
#### :rutina-inicial-favorite-date-command:
####
####
if [ "$favorite_date_command" == "$NULL" ]; then
if [ "$command_rdate"   != "$NULL" ]; then
favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then
favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then
favorite_date_command="$command_ntpdate"         ; fi
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
if [ "$command_vi"  != "$NULL" ]  ; then    
favorite_text_editor="$command_vi"      ; fi
if [ "$command_vim"  != "$NULL" ]  ; then   
favorite_text_editor="$command_vim"     ; fi
if [ "$command_nano"  != "$NULL" ] ; then   
favorite_text_editor="$command_nano"    ; fi
if [ "$command_pico" != "$NULL" ] ; then  
favorite_text_editor="$command_pico"    ; fi
if [ "$command_editor" != "$NULL" ] ; then  
favorite_text_editor="$command_editor"  ; fi
fi
####
####
#### :rutina-final-favorite-text-editor:
##########      english: search favorite text dialog: favorite text dialog     ##########
##########      spanish: busca preferido text dialogo: favorite text dialog    ##########
#### :rutina-inicial-favorite-text-dialog:
####
####
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
if [ "$command_dialog"  != "$NULL" ]  ; then  
favorite_realpath_textdialog="$command_dialog"
favorite_basename_textdialog="$(basename $command_dialog)"
fi
if [ "$command_whiptail" != "$NULL" ] ; then  
favorite_realpath_textdialog="$command_whiptail"
favorite_basename_textdialog="$(basename $command_whiptail)"
fi
fi
####
####
#### :rutina-final-favorite-text-dialog:
##########      english: search favorite dialog: favorite dialog     ##########
##########      spanish: busca preferido dialogo: favorite dialog   ##########
#### :rutina-inicial-favorite-graphicall-dialog:
####
####
if [ "$favorite_realpath_graphicalldialog" == "$NULL" ]; then
if [ "$command_zenity"  != "$NULL" ] ; then  
favorite_realpath_graphicalldialog="$command_zenity"
favorite_basename_graphicalldialog="$(basename $command_zenity)"
fi
if [ "$command_yad"     != "$NULL" ] ; then  
favorite_realpath_graphicalldialog="$command_yad"
favorite_basename_graphicalldialog="$(basename $command_yad)"
fi
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
if [ "$command_lynx"   != "$NULL" ] ; then  
favorite_text_browser="$command_lynx"    ; fi
if [ "$command_links"  != "$NULL" ] ; then  
favorite_text_browser="$command_links"   ; fi
if [ "$command_links2" != "$NULL" ] ; then  
favorite_text_browser="$command_links2"  ; fi
if [ "$command_elinks" != "$NULL" ] ; then  
favorite_text_browser="$command_elinks"  ; fi
if [ "$command_w3m" != "$NULL" ] ; then  
favorite_text_browser="$command_w3m"  ; fi
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
if [ "$command_dhcpcd"  != "$NULL" ]         ; then
favorite_dhcp_command="$command_dhcpcd"           ; fi
if [ "$command_dhclientscript" != "$NULL" ] ; then  
favorite_dhcp_command="$command_dhclientscript"  ; fi
if [ "$command_dhclient"   != "$NULL" ] ;      then  
favorite_dhcp_command="$command_dhclient"         ; fi
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
if [ "$command_rdate"   != "$NULL" ]; then  
favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then  
favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then  
favorite_date_command="$command_ntpdate"         ; fi
fi
####
####
#### :rutina-final-favorite-date-command:
##########      english: search favorite text music player             ##########
##########      spanish: busca preferida texto reproductor de musica   ##########
#### :rutina-inicial-favorite-text-music:
####
####
if [ "$favorite_text_music" == "$NULL" ]; then
if [ "$command_vlc" != "$NULL" ]; then  
favorite_text_music="$command_vlc"     ; fi
fi
####
####
#### :rutina-final-favorite-text-music:
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
#### english:  alias firewall-list with conceputal firewall-listconceptual:
####
####
#### english:  alias firewall-list with numeral firewall-listnumeral:
####
####
case "$first_option" in
list-*) list_rules_conceptual="" ;;
listn-filter4) list_rules_conceptual="no" ; first_option="list-filter4" ;;
listn-filter6) list_rules_conceptual="no" ; first_option="list-filter6" ;;
listn-nat4)  list_rules_conceptual="no" ; first_option="list-nat4" ;;
listn-nat6)  list_rules_conceptual="no" ; first_option="list-nat6" ;;
listn-raw4)  list_rules_conceptual="no" ; first_option="list-raw4" ;;
listn-raw6)  list_rules_conceptual="no" ; first_option="list-raw6" ;;
listn-security4)  list_rules_conceptual="no" ; first_option="list-security4" ;;
listn-security6)  list_rules_conceptual="no" ; first_option="list-security6" ;;
listn-mangle4)  list_rules_conceptual="no" ; first_option="list-mangle4" ;;
listn-mangle6)  list_rules_conceptual="no" ; first_option="list-mangle6" ;;
esac
####
####
case "$list_rules_conceptual" in
"$NULL") list_rules_conceptual="" ;;
*) list_rules_conceptual=" -n"  ;; esac
####
####
#### english:  alias alias simple for output gui, -txt or -cli or -gui and more
####
####
case "$first_option" in
"tui-menu") first_option="cli-menu" ;;
"-tui-menu") first_option="cli-menu" ;;
"--tui-menu") first_option="cli-menu" ;;
"-cli-menu") first_option="cli-menu" ;;
"--cli-menu") first_option="cli-menu" ;;
"-gui-menu") first_option="gui-menu" ;;
"--gui-menu") first_option="gui-menu" ;;
"gui-roll") first_option="gui-roll-zenity" ;;
"-gui-roll") first_option="gui-roll-zenity" ;;
"--gui-roll") first_option="gui-roll-zenity" ;;
"gui-rock") first_option="gui-roll-zenity" ;;
"-gui-rock") first_option="gui-roll-zenity" ;;
"--gui-rock") first_option="gui-roll-zenity" ;;
esac
####
####
case "$first_option" in
"--narrowtxt") first_option="narrowtxt" ;;
"-narrowtxt") first_option="narrowtxt" ;;
"--text") first_option="txt" ;;
"-text") first_option="txt" ;;
"--tui") first_option="cli" ;;
"-tui") first_option="cli" ;;
"--txt") first_option="txt" ;;
"-txt") first_option="txt" ;;
"--cli") first_option="cli" ;;
"-cli") first_option="cli" ;;
"--gui") first_option="gui" ;;
"-gui") first_option="gui" ;;
"silent") first_option="null" ;;
"-silent") first_option="null" ;;
"--silent") first_option="null" ;;
"-pdf") first_option="pdf" ;;
"--pdf") first_option="pdf" ;;
"n") first_option="narrowtxt" ;;
"t") first_option="txt" ;;
"c") first_option="cli" ;;
"g") first_option="gui" ;;
"l") first_option="logtxt" ;;
"s") first_option="null" ;;
"p") first_option="pdf" ;;
"-n") first_option="narrowtxt" ;;
"-t") first_option="txt" ;;
"-c") first_option="cli" ;;
"-g") first_option="gui" ;;
"-l") first_option="logtxt" ;;
"-s") first_option="null" ;;
"-p") first_option="pdf" ;;
esac
####
####
case "$first_option" in
"--cli-menu-dialog") first_option="cli-menu"
favorite_realpath_textdialog="$command_dialog" ;;
"-cli-menu-dialog") first_option="cli-menu"
favorite_realpath_textdialog="$command_dialog" ;;
"--cli-menu-whiptail") first_option="cli-menu"
favorite_realpath_textdialog="$command_whiptail" ;;
"-cli-menu-whiptail") first_option="cli-menu"
favorite_realpath_textdialog="$command_whiptail" ;;
"-gui-menu-zenity") first_option="gui-menu-zenity" ;;
"--gui-menu-zenity") first_option="gui-menu-zenity" ;;
"-gui-menu-yad") first_option="gui-menu-yad" ;;
"--gui-menu-yad") first_option="gui-menu-yad" ;;
"-gui-roll-zenity") first_option="gui-roll-zenity" ;;
"--gui-roll-zenity") first_option="gui-roll-zenity" ;;
"-gui-roll-yad") first_option="gui-roll-yad" ;;
"--gui-roll-yad") first_option="gui-roll-yad" ;;
"-gui-shell-zenity") first_option="gui-shell-zenity" ;;
"--gui-shell-zenity") first_option="gui-shell-zenity" ;;
"-gui-shell-yad") first_option="gui-shell-yad" ;;
"--gui-shell-yad") first_option="gui-shell-yad" ;;
"--cli-dialog") first_option="cli-dialog" ;;
"-cli-dialog") first_option="cli-dialog" ;;
"--cli-whiptail") first_option="cli-whiptail" ;;
"-cli-whiptail") first_option="cli-whiptail" ;;
"--gui-zenity") first_option="gui-zenity" ;;
"-gui-zenity") first_option="gui-zenity" ;;
"--gui-yad") first_option="gui-yad" ;;
"-gui-yad") first_option="gui-yad" ;;
esac
####
####
case "$first_option" in
"cli")
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ;
first_option="cli"
;;
"gui")
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui"
;;
"cli-menu")
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ;
first_option="cli-menu"
;;
"cli-dialog")
favorite_realpath_textdialog="$command_dialog" ; 
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ;
first_option="cli"
;;
"cli-whiptail")
favorite_realpath_textdialog="$command_whiptail" ;
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ; 
first_option="cli"
;;
"gui-menu")
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-menu" 
second_option="$favorite_basename_graphicalldialog"
;;
"gui-shell")
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-shell-$favorite_basename_graphicalldialog"
;;
"gui-zenity")
favorite_realpath_graphicalldialog="$command_zenity" ; 
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ; 
first_option="gui"
;;
"gui-yad")
favorite_realpath_graphicalldialog="$command_yad" ; 
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ; 
first_option="gui"
;;
"cli-menu-dialog")
favorite_realpath_textdialog="$command_dialog" ; 
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ; 
first_option="cli-menu" 
second_option="$favorite_basename_textdialog"
;;
"cli-menu-whiptail")
favorite_realpath_textdialog="$command_whiptail" ;
favorite_basename_textdialog="$(basename $favorite_realpath_textdialog)" ; 
first_option="cli-menu" 
second_option="$favorite_basename_textdialog"
;;
"gui-menu-zenity")
favorite_realpath_graphicalldialog="$command_zenity" ;
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-menu" 
second_option="$favorite_basename_graphicalldialog"
;;
"gui-menu-yad")
favorite_realpath_graphicalldialog="$command_yad" ; 
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-menu" 
second_option="$favorite_basename_graphicalldialog"
;;
####
esac
####
####
#### english: alias simple for options commons
####
####
case "$first_option" in
"output")         first_option="optional-output"  ;;
"control")        first_option="firewall-control" ;;
"listconceptual") first_option="firewall-listconceptual" ;;
"listnumeral")    first_option="firewall-listnumeral" ;;
"wallcustom")     first_option="firewall-wallcustom" ;;
"wallsystem")     first_option="firewall-wallsystem" ;;
"easy")           first_option="options-easy" ;;
"custom")         first_option="load-custom" ;;
"examples")       first_option="options-examples" ;;
"regen")          first_option="config-regen" ;;
"expert")         first_option="options-expert" ;;
"ver")            first_option="version" ;;
"client-squid")   first_option="client-proxy" ;;
"server-squid")   first_option="server-proxy" ;;
"all-names")      first_option="names" ;;
"options")        first_option="list-options" ;;
"mini-options")   first_option="list-options" ;;
"options-mini")   first_option="list-options" ;;
"sentlog")        first_option="filelog" ;;
"cfg")            first_option="names-custom" ;;
"all-custom")     first_option="names-custom" ;;
"cfg-custom")     first_option="load-custom" ;;
"custom-cfg")     first_option="load-custom" ;;
"list-fw")        first_option="names" ;;
"date")           first_option="ntpdate-client" ;;
"ram-free")       first_option="free" ;;
"free-ram")       first_option="free" ;;
"ram")            first_option="free" ;;
"list-allrules")  first_option="list-alltables" ;;
"expert-speed-ip4") first_option="speed-ip4" ;;
"expert-speed-ip6") first_option="speed-ip6" ;;
esac
####
####
#### :rutina-final-alias-simple:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-config:
####
####
case $first_option in 
"ls4") $cmd_realpath list4 &> $temporal_text-list4
cat $temporal_text-list4 | $command_grep -E -v Warning: ; exit ;;
"ls6") $cmd_realpath list6 &> $temporal_text-list6
cat $temporal_text-list6 | $command_grep -E -v Warning: ; exit ;;
"lsn4") $cmd_realpath listn4 &> $temporal_text-listn4
cat $temporal_text-listn4 | $command_grep -E -v Warning: ; exit ;;
"lsn6") $cmd_realpath listn6 &> $temporal_text-listn6
cat $temporal_text-listn6 | $command_grep -E -v Warning: ; exit ;;
esac ; 
####
####
#### english:  alias simple for regenerate configurations templates o esquive
####
####
case "$first_option" in
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom"|"expert-wpa-modify"|"expert-wpa-new")
$cmd_realpath config-regen &> /dev/null ;; esac
####
####
if [ "$first_option" == "txt" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "narrowtxt" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "cli" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "gui" ]; then 
case "$second_option" in
#### "$NULL"|"options") 
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath config-regen  &> /dev/null ;; esac ; fi
####
####
if [ "$first_option" == "logtxt" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath config-regen  &> /dev/null ; exit ;; esac ; fi
####
####
if [ "$first_option" == "pdf" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath config-regen  &> /dev/null ; exit ;; esac ; fi
####
####
if [ "$first_option" == "null" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"wizard-mini"|"wizard-full"|"new-mini-custom"|"new-full-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_realpath config-regen  &> /dev/null ; exit ;; esac; fi
####
####
#### :rutina-final-alias-config:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-campus:
####
####
#### output narrow:      General text without warnings version list narrow
####
####
if [ "$first_option" == "narrowtxt" ] ;then echo "$head_waiting_narrow"
####
####
case $second_option in 
ls*|list*) $cmd_realpath $second_option &> $temporal_text 
cat $temporal_text | $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_textfinal
cat $temporal_textfinal | $command_grep -E -v Warning: ; exit ;;
"$NULL") $cmd_realpath \
| $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_text
cat $temporal_text | $command_grep -E -v Warning: ; exit ;;
*) $cmd_realpath $second_option $third_option $quad_option \
| $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_text
cat $temporal_text | $command_grep -E -v Warning: ; exit ;;
#### *) echo "$title_md Narrow option works only to list rules" ;; 
esac ; exit ; fi
####
####
#### output txt:      General text without warnings version list normal
####
####
if [ "$first_option" == "txt" ]; then echo "$head_waiting_txt"
####
####
case $second_option in 
ls*|list*) $cmd_realpath $second_option $third_option &> $temporal_text
cat $temporal_text | $command_grep -E -v Warning: ; exit ;;
*) $cmd_realpath $second_option $third_option $quad_option ; exit ;; esac ; fi
####
####
#### output cli:
####
####
if [ "$first_option" == "cli" ] ; then echo "$head_waiting_cli"
####
####
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then 
echo "$text_md $text_info Please install or dialog or whiptail to work with cli"
exit; fi
####
#### --clear --notags
#### thebox="$($cmd_realpath txt $second_option $third_option)"
####
#### --clear --notags
case $second_option in 
ls*|list*) $favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_realpath txt $second_option)" 0 0 ; exit ;;
*) $favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_realpath $second_option $third_option)" 0 0 ; exit ;;
#### *) echo "$title_md cli works only with list options" ; exit ;;
esac ; fi
####
####
#### $cmd_realpath text-pause ; clear ; exit ; fi
####
####
#### output log
####
####
if [ "$first_option" == "logtxt" ]
then echo "$head_waiting_log"
echo "### ### $text_info [ $second_option $third_option $quad_option ] \
[ $show_actual_date ]" &> $output_log
$cmd_realpath $second_option $third_option $quad_option &> $output_log
cat $output_log | $command_grep -E -v Warning: \
&> $default_directory_log/log-$second_option-$show_actual_date.txt
echo "$title_md [ file ] $default_directory_log/log-$second_option-$show_actual_date.txt"
exit ; fi
####
####
#### output pdf
####
####
if [ "$first_option" == "pdf" ]
then case $command_convert in "NULL") 
echo "$title_md install imagemagick to print pdf to $default_directory_pdf" ; exit ;; esac
echo "$head_waiting_pdf"
#### allow print to PDF
sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-*/policy.xml &> /dev/null
#### send print to home output-fwiptables.pdf
$cmd_realpath "$second_option" "$third_option" \
| convert -page A3 text:- \
$default_directory_pdf/pdf-$second_option-$show_actual_date.pdf &> /dev/null
echo "$title_md [ file ] $default_directory_pdf/pdf-$second_option-$show_actual_date.pdf"
exit ; fi
####
####
#### output null
####
####
if [ "$first_option" == "null" ]
then $cmd_realpath "$second_option" "$third_option" &> /dev/null
exit ; fi
####
####
#### :rutina-final-alias-campus:
##########     english: autolog:         ##########
##########     spanish: autoguardado     ##########
#### :rutina-inicial-allow-autolog:
####
####
if [ "$allow_save_autolog" != "no" ]
then head_autolog="date: $show_actual_date \
path: $cmd_realpath ver: $cmd_version \
opt: $first_option $second_option $third_option"
echo $head_autolog >> $file_default_autolog ; fi
####
####
#### :rutina-final-allow-autolog:
##########     english: timespam          ##########
##########     spanish: mostrar fecha     ##########
#### :rutina-inicial-allow-timespam:
####
####
if [ "$allow_show_time" != "no" ]
then config_show_timespam="$title_md Date: $show_actual_date"
echo $config_show_timespam ; fi
####
####
#### :rutina-final-allow-timespam:
##########   english: filelog: Read log fwiptables-filelog  ##########
##########   spanish: filelog: Lee log  fwiptables-filelog  ##########
#### :rutina-inicial-filelog:
####
####
if [ "$first_option" == "filelog" ] ; then
echo "$title_md [ $first_option ]  [ show $file_default_filelog ] "
if [ ! -f $file_default_filelog ]; then touch $file_default_filelog ; fi
echo
cat  "$file_default_filelog"
echo 
echo "### ### [ this file is: ] [ $file_default_filelog ]"
exit; fi
####
####
#### :rutina-final-filelog:
##########    english: autolog: Read log fwiptables-autolog   ##########
##########    spanish: autolog: Lee log  fwiptables-autolog   ##########
#### :rutina-inicial-config-autolog:
####
####
if [ "$first_option" == "autolog" ] ; then
echo "$title_md [ $first_option ] [ show $file_default_autolog ] "
echo "$title_md $text_info [ last 50 lines from file showed ] [ $file_default_autolog ]"
if [ ! -f $file_default_autolog ]; then touch $file_default_autolog ; fi
echo
cat  "$file_default_autolog" | tail -50
echo
echo "$title_md $text_info [ last 50 lines from file showed ] [ $file_default_autolog ]"
exit; fi
####
####
#### :rutina-final-config-autolog:
##########    english: expert-cpufreq-info: info cpu frequence                 ##########
##########    spanish: expert-cpufreq-info: informacion de frecuencia de cpu   ##########
#### :rutina-inicial-expert-cpufreq-info:
####
####
if [ "$first_option" == "expert-cpufreq-info" ] ; then
echo "$title_md [ $first_option ] [ show cpu frequence info ]"
if [ "$command_cpufreqinfo" == "$NULL" ]; then
echo "$title_md please install cpufreq-info"; fi
$command_cpufreqinfo
exit; fi
####
####
#### :rutina-final-expert-cpufreq-info:
##########    english: expert-cpupower-info: info cpu frequence                 ##########
##########    spanish: expert-cpupower-info: informacion de frecuencia de cpu   ##########
#### :rutina-inicial-expert-cpupower-info:
####
####
if [ "$first_option" == "expert-cpupower-info" ] ; then
echo "$title_md [ $first_option ] [ show cpu frequence info ]"
if [ "$command_cpupower" == "$NULL" ]; then
echo "$title_md please install cpupower"; fi
$command_cpupower -c all frequency-info
exit; fi
####
####
#### :rutina-final-expert-cpupower-info:
##########    english: expert-configs-save: configurations backups in actual folder    ##########
##########    spanish: expert-configs-save: copia de configuraciones en carpeta actual ##########
#### :rutina-inicial-expert-configs-save:
####
####
if [ "$first_option" == "expert-configs-save" ] ; then
echo "$title_md [ $first_option ] [ save backups confiurations to choosed filename ]"
if [ "$command_tar" == "$NULL" ]; then
echo "$title_md Please install tar command"; exit ; fi
if [ "$2" == "$NULL" ]; then
echo "$title_md Please choose the backup file to save"; exit; fi
####
####
tar vcf $2.tar -C $directory_data_necesary . || echo "$text_fail bad"
echo ; echo ; echo "$text_ok in-file-saved: $2.tar from-folder-saved: $directory_data_necesary"
####
####
exit; fi
####
####
#### :rutina-final-expert-configs-save:
##########    english: expert-configs-load: configurations backups in actual folder    ##########
##########    spanish: expert-configs-load: copia de configuraciones en carpeta actual ##########
#### :rutina-inicial-expert-configs-load:
####
####
if [ "$first_option" == "expert-configs-load" ] ; then
echo "$title_md [ $first_option ] [ load backups confiurations from choosed filename ]"
if [ "$command_tar" == "$NULL" ]; then
echo "$title_md Please install tar command"; exit ; fi
if [ "$2" == "$NULL" ]; then
echo "$title_md Please choose the backup file to load"; exit; fi
####
####
tar vxf $2 -C $directory_data_necesary . || echo "$text_fail bad"
echo ; echo ; echo "$text_ok from-file-loaded: $2 in-folder-loaded: $directory_data_necesary"
####
####
exit; fi
####
####
#### :rutina-final-expert-configs-load:
##########    english: expert-wpa-scan: search essid wireless   ##########
##########    spanish: expert-wpa-scan: buscar essid wireless   ##########
#### :rutina-inicial-expert-wpa-scan:
####
####
if   [ "$first_option" == "expert-wpa-scan" ]; then
echo "$title_md [ $first_option ]  [ Show SSID from net wifi ] "
if   [ "$command_iw" == "$NULL" ]; then 
echo "$title_md $text_info [ Please, Install iw to work ]" ; exit ; fi
for a in $(cat /proc/net/dev | $command_grep -i  : | cut -d ":" -f 1)
do $command_ifconfig $a up
$command_iw $a scan | $command_grep -E -i "on $a|ssid" ; done 
exit; fi
####
####
#### :rutina-final-expert-wpa-scan:
##########    english: expert-wpa-new: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-new: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-new:
####
####
if [ "$first_option" == "expert-wpa-new" ]
then first_option="expert-txtwpa-new"; fi
####
####
if [ "$first_option" == "expert-txtwpa-new" ]; then
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$second_option" == "$NULL" ]; then 
echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
####
####
$cmd_realpath expert-wpa-regen
cp $default_directory_wpa/defaultwpa $default_directory_wpa/wpaconfig_$second_option
editor $default_directory_wpa/wpaconfig_$second_option
exit; fi
####
####
if [ "$first_option" == "expert-guiwpa-new" ]; then
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$second_option" == "$NULL" ]; then 
echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
####
####
$cmd_realpath expert-wpa-regen
cp $default_directory_wpa/defaultwpa $default_directory_wpa/wpaconfig_$second_option
editor $default_directory_wpa/wpaconfig_$second_option
exit; fi
####
####
#### :rutina-final-expert-wpa-new:
##########    english: expert-wpa-modify: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-modify: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-modify:
####
####
if [ "$first_option" == "expert-wpa-modify" ]
then first_option="expert-txtwpa-modify"; fi
####
####
if [ "$first_option" == "expert-txtwpa-modify" ]; then
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$second_option" == "$NULL" ]; then 
echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
####
####
editor $default_directory_wpa/wpaconfig_$second_option
exit; fi
####
####
if [ "$first_option" == "expert-guiwpa-modify" ]; then
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; exit; fi
if [ "$second_option" == "$NULL" ]; then 
echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
####
####
editor $default_directory_wpa/wpaconfig_$second_option
exit; fi
####
####
#### :rutina-final-expert-wpa-modify:
##########    english: expert-wpa-list: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-list: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-list:
####
####
if [ "$first_option" == "expert-wpa-list" ]
then ls -1 "$default_directory_wpa" | cut -d "_" -f 2-
exit ; fi
####
####
#### :rutina-final-expert-wpa-list:
##########    english: expert-wpa-show: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-show: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-show:
####
####
if [ "$first_option" == "expert-wpa-show" ]; then
####
####
if [ "$second_option" == "$NULL" ]
then $cmd_realpath expert-wpa-list
echo "$title_md $text_info use: $first_option nameconfig" ; exit ; fi
if [ -f "$default_directory_wpa/wpaconfig_$second_option" ]; then
echo "$title_md $title_md $title_md $title_md wpa config_:"
cat "$default_directory_wpa/wpaconfig_$second_option"
echo "$title_md $title_md $title_md $title_md wpa connect_:"
cat "$default_directory_wpa/wpaconnect_$second_option"
else echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
exit; fi
####
####
#### :rutina-final-expert-wpa-show:
##########    english: expert-wpa-connect: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-connect: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-connect:
####
####
if [ "$first_option" == "expert-wpa-connect" ]; then
####
####
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"
exit; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"
exit; fi
if [ "$second_option" == "$NULL" ]
then echo "$title_md $text_fail use: $first_option nameconfig"
exit ; fi
####
####
if [ -f "$default_directory_wpa/wpaconfig_$second_option" ]
then source $default_directory_wpa/wpaconfig_$second_option
####
####
$command_wpapassphrase $wifi_wpa_ssid $wifi_wpa_password \
&> $default_directory_wpa/wpaconnect_$second_option
$command_wpasupplicant -D $wifi_wpa_driver -i $wifi_wpa_device -c \
"$default_directory_wpa/wpaconnect_$second_option" &
$command_ifconfig $wifi_wpa_device:1 $wifi_wpa_ip
if [ "$(command -v $wifi_wpa_dhcp)" == "$NULL" ]
then echo "$title_md $text_fail $wifi_wpa_dhcp not found"; exit; fi
else echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
exit; fi
####
####
#### :rutina-final-expert-wpa-connect:
##########    english: expert-wpa-regen: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-regen: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-regen:
if [ "$first_option" == "expert-wpa-regen" ]; then
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; fi
####
####
$cmd_realpath expert-wpa-example &> $default_directory_wpa/defaultwpa
exit; fi
####
####
#### :rutina-final-expert-wpa-regen:
##########    english: expert-wpa-example: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-example: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpa-example:
####
####
if [ "$first_option" == "expert-wpa-example" ]; then
echo "$title_md data necesary to get wifi access"
echo "wifi_wpa_driver=nl80211"
echo "$title_md wifi driver:     nl80211 or wext"
echo "wifi_wpa_device=wlan0"
echo "$title_md wifi device:     type wifi device"
echo "wifi_wpa_ssid=none"
echo "$title_md wifi net:        type name for wireless net"
echo "wifi_wpa_password=none"
echo "$title_md wifi password:   type password to wireless"
echo "wifi_wpa_dhcp="
echo "$title_md wifi ip dinamic: if program for dhcp"
echo "wifi_wpa_ip="
echo "$title_md wifi ip static:  if choose one static ip for this net"
exit; fi
####
####
#### :rutina-final-expert-wpa-example:
##########    english: preferences-modify: modify preferences   ##########
##########    spanish: preferences-modify: modify preferences   ##########
#### :rutina-inicial-preferences-modify:
####
####
if [ "$first_option" == "preferences-modify" ]; then 
echo "$title_md [ $first_option ] [ modify the default fwiptables ] "
$favorite_text_editor $file_default_preferences
echo "$title_md $text_info [ file $file_default_preferences ]"
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
echo "$title_md $text_info [ edit file $default_dialogrc to change variables ]"
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
cat $file_default_preferences
echo "$title_md $text_info [ file $file_default_preferences ]"
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
echo "$title_md [ $first_option ] [ $cmd_realpath preferences-regen ] \
[ preferences-regen md ] "
$cmd_realpath preferences-example | $command_grep -E '=|###' &> $file_default_preferences
echo "$title_md $text_ok [ Regenerated ] [ $cmd_realpath values for default ]"
echo "$title_md $text_ok [ Regenerated ] [ $file_default_preferences ]"
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
echo "$title_md"
echo "$title_md"
echo "$title_md $title_md default option for default"
echo "without_first_option=options                    ## read below"
echo "$title_md type: void or one valid option required to works"
echo "$title_md example1:list-options example2:list4 example3:ip4"
echo "$title_md example4:speed-ip4 example5:sockets example6:gui-roll"
echo "$title_md example7:gui-menu-yad example8:gui-shell-yad"
echo "$title_md" 
echo "$title_md $title_md Allow expert commands for default" 
echo "allow_expert_commands=                          ## or void for yes or no"
echo "$title_md" 
echo "$title_md $title_md default firewall"
echo "allow_use_legacy=no                             ## or void for yes or no"
echo "allow_use_nft=                                  ## or void for yes or no"
echo "allow_use_ipv4=                                 ## or void for yes or no"
echo "allow_use_ipv6=                                 ## or void for yes or no"
echo "$title_md"
echo "allow_separate_rules=                           ## or void for yes or no"
echo "allow_close_log=                                ## or void for yes or no"
echo "config_system_log=LOG                           ## or LOG or ULOG"
echo "config_close_deny=DROP                          ## or DROP or REJECT"
echo "$title_md"
echo "$title_md $title_md default string"
echo "config_string_algoritmo=kmp                     ## or kmp or bm"
echo "$title_md"
echo "$title_md $title_md default autolog"
echo "allow_save_autolog=                             ## or void for yes or no"
echo "allow_show_time=no                              ## or void for yes or no"
echo "$title_md"  
echo "$title_md $title_md default programs"
echo "favorite_iperf_command=                         ## or void for automatic or specify command"
echo "favorite_text_editor=                           ## or void for automatic or specify command"
echo "favorite_text_music=                            ## or void for automatic or specify command"
echo "favorite_text_browser=                          ## or void for automatic or specify command"
echo "favorite_date_command=                          ## or void for automatic or specify command"
echo "$title_md"
echo "$title_md $title_md default text-cli and graphicall-gui"
echo "favorite_realpath_textdialog=                   ## or void for automatic or specify command"
echo "favorite_realpath_graphicalldialog=             ## or void for automatic or specify command"
echo "$title_md"
echo "$title_md $title_md default discover ip and speed ip"
echo "serverip_discover_ipv4=https://ifconfig.co/ip   ## default http://ifconfig.co/ip"
echo "serverip_discover_ipv6=https://ifconfig.co/ip   ## default http://ifconfig.co/ip"
echo "serverip_iperf_ipv4=ping.online.net             ## default ping.online.net"
echo "serverport_iperf_ipv4=5200                      ## default 5200"
echo "serverip_iperf_ipv6=ping6.online.net            ## default ping6.online.net"
echo "serverport_iperf_ipv6=5200                      ## default 5200"
echo "server_radio_online=https://www.tdtchannels.com/lists/radio.m3u8" 
echo "$title_md"
echo "$title_md $title_md default graphicall dimension"
echo "config_graphicall_width=800                     ## default width 800"
echo "config_graphicall_height=600                    ## default height 600"
echo "$title_md"
echo "$title_md $title_md This file has been generated from preferences-example"
exit
fi
####
####
#### :rutina-final-preferences-example:
##########    english: ip4 : get net info               ##########
##########    spanish: ip4 : da informacion de la red   ##########
#### :rutina-inicial-ip4:
####
####
if [ "$first_option" == "ip4" ]; then
echo "$title_md [ $first_option ]  [ show info about net ip4 ] [ ip4 md ]"
echo
echo "$title_md $text_info ### [ Network Route ] [ Route ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip -4 route ; fi
echo
echo "$title_md $text_info ### [ Configured ip ] [ inet ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip address ls | $command_egrep ": |inet " ; fi
echo
echo "$title_md $text_info ### [ Domain resolve ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"
cat /etc/resolv.conf | $command_grep -E "nameserver|search" | \
$command_awk '{print "     " $1 " " $2}' ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ]
then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
echo
echo "$title_md $text_info ### [ Private ip ] [ Address ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$title_md $text_info [ install ip command ]"
else  $command_ip -4 address | $command_grep -i  inet | \
$command_grep -iv 127.0.0.1 | $command_sed 's/inet//g' | \
$command_cut -d "/" -f 1 ; fi
echo
echo "$title_md $text_info ### [ Public ip ] [ Address ipv4 ] ###"
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md $text_info [ install curl command ]" ;
else public_ip4="$($command_curl -k -s -4 $serverip_discover_ipv4 -w '\n'| head -1)"
if [ "$public_ip4" == "<!DOCTYPE html>" ]
then echo "fail: public ip hidden for dns server" ;
else echo "$text_md   $public_ip4"; fi; fi
echo
echo "$title_md $text_info ### [ Input Ports] [ Network Listen ] ###"
$cmd_realpath sockets | $command_grep -iv ^#
####
####
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
echo "$title_md [ $first_option ]  [ show info about net ip6 ] [ ip6 md ]"
echo
echo "$title_md $text_info ### [ Network Route ] [ Route ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip -4 route ; fi
echo
echo "$title_md $text_info ### [ Configured ip ] [ inet ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip address ls | $command_egrep ": |inet6 " ; fi
echo
echo "$title_md $text_info ### [ Domain resolve ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"
cat /etc/resolv.conf | $command_grep -E "nameserver|search" | \
$command_awk '{print "     " $1 " " $2}' ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ]
then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
echo
echo "$title_md $text_info ### [ Private ip ] [ Address ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$title_md $text_info [ install ip command ]"
else  $command_ip -6 address | $command_grep -i  inet | \
$command_grep -iv ::0 | $command_sed 's/inet//g' | \
$command_cut -d "/" -f 1 ; fi
echo
echo "$title_md $text_info ### [ Public ip ] [ Address ipv6 ] ###"
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md $text_info [ install curl command ]" ;
else public_ip6="$($command_curl -k -s -6 $serverip_discover_ipv6 -w '\n'| head -1)"
if [ "$public_ip6" == "<!DOCTYPE html>" ]
then echo "fail: public ip hidden for dns server" ;
else echo "$text_md   $public_ip6"; fi; fi
echo
echo "$title_md $text_info ### [ Input Ports] [ Network Listen ] ###"
$cmd_realpath sockets | $command_grep -iv ^#
####
####
exit; fi
####
####
####
####
#### :rutina-final-ip6:
##########    english: expert-conf-clientproxy: get net info               ##########
##########    spanish: expert-conf-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-conf-clientproxy
####
####
if [ "$first_option" == "expert-conf-clientproxy" ]; then 
if [ "$second_option" == "$NULL" ] ; then second_option="without-proxy" ; fi
####
####
echo "$title_md File generated by fwiptables \
expert-conf-clientproxy user:pass@ip:port" \
&> $default_directory_proxy/fwiptables-proxy-$second_option
echo "$title_md This filename is $default_directory_proxy/fwiptables-proxy-$second_option" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x all_proxy=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x ftp_proxy=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x http_proxy=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x https_proxy=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x ALL_PROXY=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x FTP_PROXY=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x HTTP_PROXY=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo "declare -x HTTPS_PROXY=$2" \
&>> $default_directory_proxy/fwiptables-proxy-$second_option
echo
###
###
if [ -f "$default_directory_proxy/fwiptables-proxy-$second_option" ]
then cat "$default_directory_proxy/fwiptables-proxy-$second_option" ; fi
###
###
exit ; fi
####
####
#### :rutina-final-expert-conf-clientproxy
##########    english: expert-show-clientproxy: get net info               ##########
##########    spanish: expert-show-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-show-clientproxy
####
####
if [ "$first_option" == "expert-show-clientproxy" ]; then echo
echo "$title_md $text_info ### [ Proxy tunnel ] [ Address proxy ] ###"
echo "$title_md [ Necesary:  ] WHITHOUT script shell and WHITHOUT exit command ]"
echo "$title_md [ Editable:  ] declare -x HTTPS_PROXY=https://127.0.0.1:8080"
echo "$title_md [ configure: ] $cmd_basename expert-conf-clientproxy user:pass@ip:port"
####
####
listado_proxy="$(export | grep -i \_PROXY | wc -l)"
if [ "$listado_proxy" -eq "0" ]; then
echo "$title_md [ Actually: ] Without proxy in export variables"
else export | grep -i "_PROXY" ; fi
echo
####
####
if [ ! -f "$default_directory_proxy/$second_option" ] ; then
echo "$title_md Show file with: expert-show-clientproxy [second_option]" ;
echo "$title_md Choose above one to second-option"; 
ls $default_directory_proxy/ ; exit ; fi
####
####
if [ -f "$default_directory_proxy/$second_option" ] ; then
echo ; cat "$default_directory_proxy/$second_option" ; exit ; fi
####
####
exit ; fi
####
####
#### :rutina-final-expert-show-clientproxy
##########    english: expert-active-clientproxy: get net info               ##########
##########    spanish: expert-active-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactive-clientproxy
####
####
if [ "$first_option" == "expert-active-clientproxy" ]; then echo
####
####
echo "$title_md there is before "
declare -x | grep -i \_PROXY
####
####
if [ -f "$default_directory_proxy/$second_option" ]     ; 
then source $default_directory_proxy/$second_option     ;
else echo "$title_md Choose above one to second-option" ;
ls $default_directory_proxy/                            ;
fi
####
####
echo "$title_md there is after "
declare -x | grep -i \_PROXY
####
####
exit ; fi
####
####
#### :rutina-final-expert-active-clientproxy
##########    english: expert-deactive-clientproxy: get net info               ##########
##########    spanish: expert-deactive-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactive-clientproxy
####
####
if [ "$first_option" == "expert-deactive-clientproxy" ]; then echo
####
####
echo "$title_md there is before "
declare -x | grep -i \_PROXY
####
####
export -n all_proxy
export -n ftp_proxy
export -n http_proxy
export -n https_proxy
export -n ALL_PROXY
export -n FTP_PROXY
export -n HTTP_PROXY
export -n HTTPS_PROXY
####
####
echo "$title_md there is after "
declare -x | grep -i \_PROXY
####
####
exit ; fi
####
####
#### :rutina-final-expert-deactive-clientproxy
##########    english: expert-show-resolve : get net info               ##########
##########    spanish: expert-show-resolve : da informacion de la red   ##########
#### :rutina-inicial-expert-show-resolve
####
####
if [ "$first_option" == "expert-show-resolve" ]; then echo
echo "$title_md $text_info ### [ Domain resolve ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"
cat /etc/resolv.conf | $command_grep -E "nameserver|search"      ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ]
then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
exit; fi
####
####
#### :rutina-final-expert-show-resolve
##########    english: expert-trace-tcp4: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-tcp4: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-tcp4:
####
####
if   [ "$first_option" == "expert-trace-tcp4" ]; then
echo "$title_md [ $first_option ]  [ trace ip or host with tcp ipv4 ]"
case $command_tracepath in "$NULL")
echo "$title_md $text_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_basename $first_option host"; exit; fi
$cmd_basename save before-trace-tcp4 
$cmd_basename eraserules4
echo "$duo_md $text_ok [ tracepath -4 $2 ] "
$command_tracepath -4 $2
$cmd_basename load before-trace-tcp4
exit; fi
####
####
#### :rutina-final-expert-trace-tcp4:
##########    english: expert-trace-tcp6: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-tcp6: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-tcp6:
####
####
if   [ "$first_option" == "expert-trace-tcp6" ]; then
echo "$title_md [ $first_option ]  [ trace ip or host with tcp ipv6 ]"
case $command_tracepath in "$NULL")
echo "$title_md $text_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_basename $first_option host"; exit; fi
$cmd_basename save before-trace-ip6 
$cmd_basename eraserules6
echo "$duo_md $text_ok [ tracepath -6 $2 ] "
$command_tracepath -6 $2
$cmd_basename load before-trace-ip6
exit; fi
####
####
#### :rutina-final-expert-trace-tcp6:
##########    english: expert-trace-icmp4: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-icmp4: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-icmp4:
####
####
if   [ "$first_option" == "expert-trace-icmp4" ]; then
echo "$title_md [ $first_option ]  [ trace ip or host with icmp ipv4 ]"
case $command_traceroute in "$NULL")
echo "$title_md $text_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_basename $first_option host"; exit ; fi
$cmd_basename save before-trace-icmp4 
$cmd_basename eraserules4
echo "$duo_md $text_ok [ traceroute -4 $2 ] "
$command_traceroute -4 $2
$cmd_basename load before-trace-icmp4
exit; fi
####
####
#### :rutina-final-expert-trace-icmp4:
##########    english: expert-trace-icmp6: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-icmp6: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-icmp6:
####
####
if   [ "$first_option" == "expert-trace-icmp6" ]; then
echo "$title_md [ $first_option ]  [ trace ip or host with icmp ipv6 ]"
case $command_traceroute in "$NULL")
echo "$title_md $text_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_basename $first_option host"; exit ; fi
$cmd_basename save before-trace-icmp6 
$cmd_basename eraserules6
echo "$duo_md $text_ok [ traceroute -6 $2 ] "
$command_traceroute -6 $2
$cmd_basename load before-trace-icmp6
exit; fi
####
####
#### :rutina-final-expert-trace-icmp6:
##########    english: radio stopped      ##########
##########    spanish: radio parada       ##########
#### :rutina-inicial-expert-radio-stop:
####
####
if   [ "$first_option" == "expert-radio-stop" ]; then
echo "$title_md [ $first_option ]  [ radio stopped ] [ expert-radio-stop md]"
killall -9 "$(echo $favorite_text_music| cut -d " " -f 1)" &> /dev/null
exit; fi
####
####
#### :rutina-final-expert-radio-stop:
##########    english: radio link       ##########
##########    spanish: radio enlace     ##########
#### :rutina-inicial-expert-radio-link:
####
####
if   [ "$first_option" == "expert-radio-link" ]; then
echo "$title_md [ $first_option ]  [ radio link user:logname ] [ expert-radio-link md]"
####
####
if [ "$second_option" == "$NULL" ]; then
echo "$title_md Please input one string to listen one radio"; exit; fi
####
####
if [ "$favorite_text_music" == "$NULL" ]; then
echo "$title_md please install vlc"; exit; fi
####
####
radio_user="$(id 1000 | cut -d ")" -f 1 - | cut -c 10-)"
sudo -u $radio_user $favorite_text_music $2 &> /dev/null &&
echo "$title_md $text_ok Radio | With user: $radio_user | With link: $2"
####
####
exit; fi
####
####
#### :rutina-final-expert-radio-link:
##########    english: radio online       ##########
##########    spanish: radio en linea     ##########
#### :rutina-inicial-expert-radio-spanish:
####
####
if   [ "$first_option" == "expert-radio-spanish" ]; then
echo "$title_md [ $first_option ]  [ spanish radio user:logname from one text-string ]\
 [ expert-radio-spanish md]"
####
####
if [ "$second_option" == "$NULL" ];
then echo "$title_md Please input one string to listen one radio"; exit; fi
####
####
if [ "$favorite_text_music" == "$NULL" ];
then "$title_md please install $favorite_text_music"; exit; fi
####
####
rm $radio_config $file_radio_cache &> /dev/null
echo "$title_md Downloading radio config .."
$command_curl -L $server_radio_online &> $file_radio_config
grep -i $second_option $file_radio_config &> $file_radio_cache
chmod ugo+rx $radio_config $file_radio_cache &> /dev/null
####
####
$cmd_realpath expert-radio-stop &> /dev/null
####
####
radio_user="$(id 1000 | cut -d ")" -f 1 - | cut -c 10-)"
echo sudo -u $radio_user $favorite_text_music $file_radio_cache && 
echo "$title_md $text_ok Radio | With user: $radio_user | With string: $2"
exit; fi
####
####
#### :rutina-final-expert-radio-spanish:
##########    english: utils: posible util depends       ##########
##########    spanish: utils: posible util dependencias  ##########
#### :rutina-inicial-utils:
####
####
if [ "$first_option" == "utils" ]; then
echo "$title_md [ $first_option ] [ List for posible utils programs ] [ utils md ] "
echo
if [ "$command_fmt" == "$NULL" ]; then
$cmd_realpath code command | $command_grep -E "^command_" | \
$command_cut -d "=" -f 1 | $command_cut -d "_" -f 2
else
$cmd_realpath code command | $command_grep -E "^command_" | \
$command_cut -d "=" -f 1 | $command_cut -d "_" -f 2 | $command_fmt
fi ; exit ; fi
####
####
#### :rutina-final-utils:
##########    english: depends: depends            ##########
##########    spanish: depends: dependencias  ##########
#### :rutina-inicial-depends:
####
####
if [ "$first_option" == "depends" ]; then
echo "$title_md [ $first_option ] [ List for depends programs ] [ depends md ] "
echo
echo "$title_md [ Configuration files ]"
echo "$text_md Directory data:          $directory_data_necesary"
echo "$text_md Directory temp:          $default_directory_cache"
echo "$text_md File Preferences:        $file_default_preferences"
echo
echo "$title_md [ Log files ]"
echo "$text_md File autolog:            $file_default_autolog"
echo "$text_md File filelog:            $file_default_filelog"
echo
echo "$title_md [ Automatic interfaces  ]"
echo "$text_md Interface txt:           $command_bash"
echo "$text_md Interface cli:           $favorite_realpath_textdialog"
echo "$text_md Interface gui:           $favorite_realpath_graphicalldialog"
echo 
echo "$title_md [ Automatic iptables ]"
echo "$text_md iptables legacy:         $command_iptableslegacy"
echo "$text_md iptables nft:            $command_iptablesnft"
echo "$text_md ip6tables legacy:        $command_ip6tableslegacy"
echo "$text_md ip6tables nft:           $command_ip6tablesnft"
echo "$text_md arptables:               $command_arptables"
echo "$text_md ebtables:                $command_ebtables"
echo
echo "$title_md [ Automatic favorites ]"
echo "$text_md Automatic text editor:   $favorite_text_editor"
echo "$text_md Automatic text browser:  $favorite_text_browser"
echo "$text_md Automatic text date:     $favorite_date_command"
echo 
exit; fi
####
####
#### :rutina-final-depends:
##########    english: examples: some example    ##########
##########    spanish: examples: algun ejemplo   ##########
#### :rutina-inicial-options-examples:
#### :rutina-inicial-examples:
####
####
if [ "$first_option" == "options-examples" ]; then
echo "$title_md [ $first_option ] [ List examples ] [ examples md ]"
echo "$title_md [ Several examples without optional otuput ]"
echo "$text_md"
echo "$title_md       | without optional output | Example Description   "  
echo "$text_md  "  
echo "$text_md | depends                  | $cmd_file depends             "  
echo "$text_md | List firewall saved      | $cmd_file names               "  
echo "$text_md | List configs saved       | $cmd_file names-custom        "  
echo "$text_md | Get info speed ipv4      | $cmd_file speed-ip4           "  
echo "$text_md | Show listen sockets      | $cmd_file sockets             "  
echo "$text_md | List last options        | $cmd_file autolog             "   
echo "$text_md | modify default variables | $cmd_file preferences-modify  "  
echo "$text_md"
echo "$title_md       | with optional output | Example Description   "  
echo "$text_md"
echo "$text_md | Example with info        | $cmd_file txt info             "  
echo "$text_md | Example with expert      | $cmd_file txt expert           "  
echo "$text_md | Example with code ip4    | $cmd_file cli code ip4         "  
echo "$text_md | Example with list rules  | $cmd_file cli lsn4             "  
echo "$text_md | Example with nodes       | $cmd_file gui nodes            "  
echo "$text_md | Example with web browser | $cmd_file gui web kernel.org   "  
echo "$text_md  "
echo "$text_md | Launch client web firewall in silent   | $cmd_file silent client-web   "  
echo "$text_md | List iptables rules with output txt    | $cmd_file txt ls4             "  
echo "$text_md | List firewall with output cli whiptail | $cmd_file cli-wiptail names   "  
echo "$text_md | List sockets ip with output gui yad    | $cmd_file gui-yad sockets     "  
echo "$text_md | All options in text menu               | $cmd_file cli-menu-dialog     "  
echo "$text_md | All options in window menu             | $cmd_file gui-menu-yad        "  
echo "$text_md | All options in window roll             | $cmd_file gui-roll-zenity     "  
echo "$text_md | All options in window shell            | $cmd_file gui-shell-yad       "  
exit; fi
####
####
#### :rutina-final-examples:
#### :rutina-inicial-options-examples:
##########    english: version: system script, the version option              ##########
##########    spanish: version: script de sistema, la opcion mostrar version   ##########
#### :rutina-inicial-version:
####
####
if [ "$first_option" == "version" ]; then 
echo "$title_md [ $first_option ] [ Show version ] [ version md ]            "
echo "$text_md     Basename program: $cmd_basename               "
echo "$text_md     Realpath program: $cmd_realpath               "
echo "$text_md      Version program: $cmd_version                "
echo "$text_md    Short description: $cmd_shortdescription       "
echo "$text_md     Long description: $cmd_longdescription        "
echo "$text_md     Developer Actual: $cmd_developer              "
echo "$text_md    Developer Contact: $cmd_contact                "
echo "$text_md      License program: $cmd_license                "
echo "$text_md       Data Directory: $directory_data_necesary    "
echo "$text_md      Cache Directory: $directory_cache_necesary   "
echo "$text_md          File Format: $cmd_format   "
#### echo "$text_md     File Preferences:    "
#### echo "$text_md   $file_default_preferences             "  
#### echo "$text_md   Fileformat program:    "
#### echo "$text_md   $($command_file $cmd_realpath)        "
exit ; fi
####
####
#### :rutina-final-version:
##########    english: weather: show the weather with wttr.in     ##########
##########    spanish: el tiempo: muestra el tiempo con wttr.in   ##########
#### :rutina-inicial-expert-show-weather:
####
####
if   [ "$first_option" == "expert-show-weather" ]; then 
case $command_curl in "$NULL") echo "$title_md $text_fail [ Install a curl ]"; exit ;; esac
$command_curl -s wttr.in/?3n?T
exit; fi
####
####
#### :rutina-final-expert-show-weather:
##########    english: treeconf: tree configs in fwiptables     ##########
##########    spanish: treeconf: arbol de conf en fwiptables    ##########
#### :rutina-inicial-treeconf:
####
####
if   [ "$first_option" == "treeconf" ]; then 
if   [ "$command_tree" == "$NULL" ] ; then 
echo "$title_md $text_fail please install tree command" ; exit ; fi
####
####
$command_tree $directory_data_necesary
exit; fi
####
####
#### :rutina-final-treeconf:
##########    english: treecache: tree configs in fwiptables     ##########
##########    spanish: treecache: arbol de conf en fwiptables    ##########
#### :rutina-inicial-treecache:
####
####
if   [ "$first_option" == "treecache" ]; then 
if   [ "$command_tree" == "$NULL" ] ; then 
echo "$title_md $text_fail please install tree command" ; exit ; fi
####
####
$command_tree $directory_cache_necesary
exit; fi
####
####
#### :rutina-final-treecache:
##########    english: cleancache: clean cache        ##########
##########    spanish: cleancache: limpia la cache    ##########
#### :rutina-inicial-cleancache:
####
####
if   [ "$first_option" == "cleancache" ]; then 
echo "$title_md [ cleaning ] clean cache: deleting cache $cmd_basename"
rm -R $directory_cache_necesary/* 
exit; fi
####
####
#### :rutina-final-cleancache:
##########    english: notes: notes to configure iptables      ##########
##########    spanish: notes: notas para configurar iptables   ##########
#### :rutina-inicial-notes:
####
####
if [ "$first_option" == "notes" ]; then 
echo "$title_md [ $first_option ] [ List notes about ] [ notes md ]"
echo "$text_md"
echo "$title_md General Notes"
echo "$text_md [ legacy or nft ] whith one of them is sufficent "   
echo "$text_md [ allow shield maxtries ] limit against attack per bruteforce "   
echo "$text_md [ net blacklist ] excepcionals hosts has conection dropped in firewall"   
echo "$text_md [ net whitelist ] excepcionals hosts has conection allowed in firewall"   
echo "$text_md [ input-established ] the computer is only client "   
echo "$text_md [ allow output uid/gid ] User and/or group excepcional with conection allowed"   
echo "$text_md"
echo "$title_md Two iptables netfilter"   
echo "$text_md iptables-legacy   is    support for xtables"    
echo "$text_md iptables-nft      is    support for nftables"    
echo "$text_md"
echo "$title_md Necesary ports to connect with ipv4 and ipv6 in UDP protocol"   
echo "$text_md ntp    : Port necesary to update the time and date"   
echo "$text_md bootpc : Port necesary to dhcp and get ip"   
echo "$text_md domain : This port is necesary to domain resolver"   
echo "$text_md https  : This port is necesary for udp named web html5"   
echo "$text_md"
echo "$title_md Necesary protocols for ipv6"   
echo "$text_md ipv6-icmp  : Necesary protocol in ipv6"   
echo "$text_md ipv4 ports : ipv6 works too with old ipv4 ports"
echo "$text_md"   
exit; fi
####
####
#### :rutina-final-notes:
##########   english: config-regen: config-regen template wizard files       ##########
##########   spanish: config-regen: config-regenera template wizard archivos ##########
#### :rutina-inicial-config-regen:
####
####
if [ "$first_option" == "config-regen" ]; then 
$cmd_realpath template-mini-es &> $default_minicfg_spa
$cmd_realpath template-mini-en &> $default_minicfg_eng
$cmd_realpath template-full-es &> $default_fullcfg_spa
$cmd_realpath template-full-en &> $default_fullcfg_eng
exit; fi
####
####
#### :rutina-final-config-regen:
##########  english:  template-mini-es: for working sane         ########## 
##########  spanish:  template-mini-es: para funcionamiento sano ##########
#### :rutina-inicial-template-mini-es:
####
####
if [ "$first_option" == "template-mini-es" ]; then
echo "$title_md $cmd_shortdescription from $cmd_realpath version $cmd_version $title_md "
echo "$title_md BEGIN NECESARY $title_md "
echo "$title_md INICIO .......... Opciones Necesarias .......... .......... $title_md "
echo "$title_md NETFILTER $title_md "
echo "$title_md el iptables firewall netfilter, elige uno o dos "
echo "allow_use_legacy=no "
echo "$title_md lanza xtables, vacio para si, o escribe no "
echo "allow_use_nft= "
echo "$title_md lanza nftables, vacio para si, o escribe no "
echo "$title_md PROTOCOL IP $title_md "
echo "$title_md procolo ip, modificar con vacio o no "
echo "allow_use_ipv4= "
echo "$title_md varcio para ejecutar el firewall con ipv4 o no para no "
echo "allow_use_ipv6= "
echo "$title_md varcio para ejecutar el firewall con ipv6 o no para no "
echo "$title_md CLIENT PORTS $title_md "
echo "$title_md puertos Cliente, añadir con ',' y poner rangos con : "
echo "client_port_tcp=http,https,http-alt,ssh "
echo "$title_md puertos tcp para ser cliente "
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$title_md puertos udp para ser cliente "
echo "$title_md SERVER PORTS $title_md "
echo "$title_md Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "server_port_tcp=ssh "
echo "$title_md puertos tcp para servidor "
echo "server_port_udp= "
echo "$title_md puertos udp para servidor "
echo "$title_md LOG TO SERVER PORTS $title_md "
echo "$title_md usar ULOG or LOG "
echo "config_system_log=LOG"
echo "$title_md logear para puertos de Servidor, añadir con ',' y poner rangos con : "
echo "logserver_port_tcp= "
echo "$title_md puertos tcp para logear servidor "
echo "logserver_port_udp= "
echo "$title_md puertos udp para logear servidor "
echo "$title_md ALLOW MAXTRIES SHIELD $title_md )"
echo "$title_md Pone un escudo para los peuertos de nueva conexion, con maximo ip cada hora "
echo "allow_shield_maxtries=no "
echo "$title_md vacio para permitir un escudo con los intentos maximos de logins por ip cada hora o no "
echo "config_shield_maxtries=12 "
echo "$title_md escudo con los maximos intentos de logeo a nuestro servidor por ip a cada hora "
echo "config_shield_port=22 "
echo "$title_md escudo cambiando puerto de intentos ssh o varios puertos separados por comas"
echo "$title_md GENERAL RULES $title_md "
echo "$title_md Regla general en tabla "
echo "allow_separate_rules= "
echo "$title_md Vacio para separar reglas por cada puerto o no "
echo "allow_close_log=no"
echo "$title_md Vacio para guardar logs antes de cerrar o no"
echo "config_close_deny=DROP "
echo "$title_md Elige cerrar denegacion con o DROP or REJECT "
echo "$title_md END NECESARY $title_md "
echo "$title_md FINAL .......... Opciones Necesarias .......... .......... $title_md "
exit ; fi
####
####
#### :rutina-final-template-mini-es:
##########  english:  template-full-es: for working sane         ########## 
##########  spanish:  template-full-es: para funcionamiento sano ##########
#### :rutina-inicial-template-full-es:
####
####
if [ "$first_option" == "template-full-es" ]; then
####
####
#### english: basic options in configurations file cfg
#### spanish: basicas opciones in configuracion de archivo cfg
####
####
echo "$title_md $cmd_shortdescription from $cmd_realpath version $cmd_version $title_md "
echo "$title_md BEGIN NECESARY $title_md "
echo "$title_md INICIO .......... Opciones Necesarias .......... .......... $title_md "
echo "$title_md NETFILTER $title_md "
echo "$title_md el iptables firewall netfilter, elige uno o dos "
echo "allow_use_legacy=no "
echo "$title_md lanza xtables, vacio para si, o escribe no "
echo "allow_use_nft= "
echo "$title_md lanza nftables, vacio para si, o escribe no "
echo "$title_md PROTOCOL IP $title_md "
echo "$title_md procolo ip, modificar con vacio o no "
echo "allow_use_ipv4= "
echo "$title_md varcio para ejecutar el firewall con ipv4 o no para no "
echo "allow_use_ipv6= "
echo "$title_md varcio para ejecutar el firewall con ipv6 o no para no "
echo "$title_md CLIENT PORTS $title_md "
echo "$title_md puertos Cliente, añadir con ',' y poner rangos con : "
echo "client_port_tcp=http,https,http-alt,ssh "
echo "$title_md puertos tcp para ser cliente "
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$title_md puertos udp para ser cliente "
echo "$title_md SERVER PORTS $title_md "
echo "$title_md Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "server_port_tcp=ssh "
echo "$title_md puertos tcp para servidor "
echo "server_port_udp= "
echo "$title_md puertos udp para servidor "
echo "$title_md LOG TO SERVER PORTS $title_md "
echo "$title_md usar ULOG or LOG "
echo "config_system_log=LOG"
echo "$title_md logear para puertos de Servidor, añadir con ',' y poner rangos con : "
echo "logserver_port_tcp= "
echo "$title_md puertos tcp para logear servidor "
echo "logserver_port_udp= "
echo "$title_md puertos udp para logear servidor "
echo "$title_md ALLOW MAXTRIES SHIELD $title_md )"
echo "$title_md Pone un escudo para los peuertos de nueva conexion, con maximo ip cada hora "
echo "allow_shield_maxtries=no "
echo "$title_md vacio para permitir un escudo con los intentos maximos de logins por ip cada hora o no "
echo "config_shield_maxtries=12 "
echo "$title_md escudo con los maximos intentos de logeo a nuestro servidor por ip a cada hora "
echo "config_shield_port=22 "
echo "$title_md escudo cambiando puerto de intentos ssh o varios puertos separados por comas"
echo "$title_md GENERAL RULES $title_md "
echo "$title_md Regla general en tabla "
echo "allow_separate_rules= "
echo "$title_md Vacio para separar reglas por cada puerto o no "
echo "allow_close_log=no"
echo "$title_md Vacio para guardar logs antes de cerrar o no"
echo "config_close_deny=DROP "
echo "$title_md Elige cerrar denegacion con o DROP or REJECT "
echo "$title_md END NECESARY $title_md "
echo "$title_md FINAL .......... Opciones Necesarias .......... .......... $title_md "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$title_md BEGIN OPTIONAL $title_md "
echo "$title_md INICIO .......... Opciones opcionales .......... .......... $title_md "
echo "$title_md choose void or no $title_md "
echo "$title_md Permitir Otras Opciones, modificar con vacio o no "
echo "allow_string_denied=no "
echo "$title_md vacio para denegar cadena de cabecera, o no para no "
echo "allow_string_allowed=no "
echo "$title_md vacio para permitir cadena, o no para no "
echo "allow_mac_whitelist=no "
echo "$title_md vacio para permitir DIRECCION-MAC excepcionales o no "
echo "allow_mac_blacklist=no "
echo "$title_md vacio para denegar DIRECCION-MAC excepcionales o no "
echo "allow_net_whitelist=no "
echo "$title_md vacio para permitir HOST/IP excepcionales o no"
echo "allow_net_blacklist=no "
echo "$title_md vacio para denegar HOST/IP excepcionales o no "
echo "allow_input_bandwidth=no "
echo "$title_md vacio para limitar ancho de banda de entrada para todas las fuentes en kbits/sec o no "
echo "allow_output_bandwidth=no "
echo "$title_md vacio limitar ancho de banda de salida en kbits/sec por cada destino o no "
echo "allow_input_maxconnect=no "
echo "$title_md vacio para limitar numero de conexiones simultaneas de entrada o no "
echo "allow_output_maxconnect=no "
echo "$title_md vacio para limitar numero de conexiones simultaneas de salida o no "
echo "allow_input_ping=no "
echo "$title_md vacio para permitir RECIVIR PING o no "
echo "allow_output_ping=no "
echo "$title_md vacio para permitir ENVIAR PING o no "
echo "allow_forward_ip4=no "
echo "$title_md vacio para reenvios ip4, o no para no "
echo "allow_forward_ip6=no "
echo "$title_md vacio para permitir reenvio ip6, o no "
echo "allow_gateway_ip4=no "
echo "$title_md vacio para permitir gateway ip4  a otras redes, o no "
echo "allow_gateway_ip6=no "
echo "$title_md vacio para hacer gateway ip6 a otras redes o no "
echo "allow_dmz_ip4=no "
echo "$title_md vacio para permitir dmz ip4  a una host local, o no "
echo "allow_dmz_ip6=no "
echo "$title_md vacio para hacer dmz ip6 a una host local o no "
echo "allow_input_all=no "
echo "$title_md vacio, reglas para permitir toda entrada o no "
echo "allow_output_all=no "
echo "$title_md vacio, reglas para permitir toda salida o no "
echo "allow_input_state=no "
echo "$title_md Estado de entrada selectivo con vacio o no "
echo "allow_output_state=no "
echo "$title_md Estado de salida selectivo con vacio o no "
echo "allow_output_uid=no"
echo "$title_md vacio permite salida de paquetes de un USUARIO excepcional o no "
echo "allow_output_gid=no"
echo "$title_md vacio permite salida de paquetes de un GRUPO excepcional o no "
echo "allow_others_protocols=no "
echo "$title_md vacio para permitir otro PROTOCOLO-IP excepcional o no "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$title_md Begin Variables $title_md.......... .......... $title_md.......... "
echo "$title_md Rellena Variables "
echo "$title_md Options "
echo "$title_md Otras Opciones, añadir con , y poner rangos con : "
echo "config_string_denied=.fb.com,.facebook.com,xxx.html "
echo "$title_md bloquea conexion con cadena de cabecera, si hay varios, seperados por comas "
echo "config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net "
echo "$title_md permite conexion con cadena de cabecera, si hay varios, seperados por comas "
echo "config_mac_whitelist=d4:12:43:01:36:2e "
echo "$title_md permitir estos MAC-ADDRESS excepcionales "
echo "config_mac_blacklist=d4:12:43:01:36:2e "
echo "$title_md deniega estos MAC-ADDRESS excepcionales "
echo "config_net_whitelist=wesnoth.org,sf.net,deb.debian.org "
echo "$title_md permitir estos HOST/IP excepcionales "
echo "config_net_blacklist=facebook.com,www.facebook.com "
echo "$title_md deniega estos HOST/IP excepcionales "
echo "config_input_bandwidth=12512 "
echo "$title_md maximo entrada de ancho de banda en kbit/sec para todos "
echo "config_output_bandwidth=512 "
echo "$title_md maximo salida de ancho de banda en kbits/sec para cada ip "
echo "config_input_maxconnect=72 "
echo "$title_md maximo numero de conexiones simultaneas de entrada "
echo "config_output_maxconnect=72 "
echo "$title_md maximo numero de conexiones simultaneas de salida "
echo "config_gateway_ip4=0/0"
echo "$title_md servidor puerta de enlace para tu red. Ejemplo: 192.168.0.0/24"
echo "config_gateway_ip6=::/0"
echo "$title_md server gateway for lan example: ::1"
echo "config_dmz_ip4=192.168.1.7 "
echo "$title_md servidor ip lan para otras redes esternas, nat prerouting "
echo "config_dmz_ip6=d4:12:43:01:36:2e "
echo "$title_md servidor ip lan para otras redes esternas, nat prerouting "
echo "config_input_state=new,related,established "
echo "$title_md modificar con vacio o new,related,established,untracked,invalid "
echo "config_output_state=new,related,established "
echo "$title_md modificar con vacio o new,related,established,untracked,invalid "
echo "config_output_uid=root "
echo "$title_md permite salida de paquetes de este USUARIO excepcional "
echo "config_output_gid=root "
echo "$title_md permite salida de paquetes de este GRUPO excepcional "
echo "config_others_protocols=icmp,igmp "
echo "$title_md permitir otros protocolos desde /etc/protocols "
echo "$title_md NET CLIENT AND NET SERVER $title_md "
echo "$title_md Red para conectar como cliente o server "
echo "config_ipv4_netclient=0/0 "
echo "$title_md la red cual cliente ipv4, todos es 0/0 "
echo "config_ipv4_netserver=0/0 "
echo "$title_md la red cual servidor ipv4, todos es 0/0 "
echo "config_ipv6_netclient=::/0 "
echo "$title_md la red cual cliente ipv6, todos es ::/0 "
echo "config_ipv6_netserver=::/0 "
echo "$title_md la red cual servidor ipv6, todos es ::/0 "
echo "$title_md $title_md "
echo "$title_md FINAL .......... Opciones opcionales .......... .......... $title_md "
exit ; fi
####
####
#### :rutina-final-template-full-es:
##########  english:  template-mini-en: for working sane         ########## 
##########  spanish:  template-mini-en: para funcionamiento sano ##########
#### :rutina-inicial-template-mini-en:
####
####
if [ "$first_option" == "template-mini-en" ]; then
echo "$title_md $cmd_shortdescription from $cmd_realpath version $cmd_version $title_md "
echo "$title_md BEGIN NECESARY $title_md "
echo "$title_md  .......... BEGIN Necesary options .......... .......... $title_md "
echo "$title_md NETFILTER $title_md "
echo "$title_md the iptables firewall netfilter, choose one or two "
echo "allow_use_legacy=no "
echo "$title_md launch xtables, void to yes or type no "
echo "allow_use_nft= "
echo "$title_md launch nftables, void to yes or type no "
echo "$title_md PROTOCOL IP $title_md "
echo "$title_md ip protocol, modify with void or no "
echo "allow_use_ipv4= "
echo "$title_md void to config firewall with ipv4 or no to dont configure ipv4 "
echo "allow_use_ipv6= "
echo "$title_md void to config firewall with ipv6 or no to dont configure ipv6 "
echo "$title_md CLIENT PORTS $title_md "
echo "$title_md Client ports, add with ',' and join ranges with  : "
echo "client_port_tcp=http,https,http-alt,ssh "
echo "$title_md tcp ports for client "
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$title_md udp ports for client "
echo "$title_md SERVER PORTS $title_md "
echo "$title_md Server ports, add with ',' and join ranges with : "
echo "server_port_tcp=ssh "
echo "$title_md tcp ports for server "
echo "server_port_udp= "
echo "$title_md udp ports for server "
echo "$title_md LOG TO SERVER PORTS $title_md "
echo "$title_md or ULOG or LOG "
echo "config_system_log=LOG"
echo "$title_md Log to server ports, add with ',' and join ranges with : "
echo "logserver_port_tcp= "
echo "$title_md the tcp ports to log server "
echo "logserver_port_udp= "
echo "$title_md the udp ports to log server "
echo "$title_md ALLOW MAXTRIES SHIELD $title_md "
echo "$title_md Put one shield for ports to new connecting, with max ip to each hour "
echo "allow_shield_maxtries=no "
echo "$title_md void to allow one shield with max tries login in ssh for ip to each hour or no "
echo "config_shield_maxtries=12 "
echo "$title_md modify shield with number max of tries to log in us ssh server for ip at each hour "
echo "config_shield_port=22 "
echo "$title_md modify shield ssh chaging maxtries port ssh o several ports with comma separate "
echo "$title_md GENERAL RULES $title_md "
echo "$title_md General rules in table "
echo "allow_separate_rules= "
echo "$title_md Void to separate the rules for each port or no "
echo "allow_close_log=no"
echo "$title_md Void to log save before close rule or no"
echo "config_close_deny=DROP "
echo "$title_md choose close deny with or DROP or REJECT "
echo "$title_md END NECESARY $title_md "
echo "$title_md .......... END Necesary options .......... .......... $title_md "
exit ; fi
####
####
#### :rutina-final-template-mini-en:
##########  english:  template-full-en: for working sane         ########## 
##########  spanish:  template-full-en: para funcionamiento sano ##########
#### :rutina-inicial-template-full-en:
####
####
if [ "$first_option" == "template-full-en" ]; then
echo "$title_md $cmd_shortdescription from $cmd_realpath version $cmd_version $title_md "
echo "$title_md BEGIN NECESARY $title_md "
echo "$title_md  .......... BEGIN Necesary options .......... .......... $title_md "
echo "$title_md NETFILTER $title_md "
echo "$title_md the iptables firewall netfilter, choose one or two "
echo "allow_use_legacy=no "
echo "$title_md launch xtables, void to yes or type no "
echo "allow_use_nft= "
echo "$title_md launch nftables, void to yes or type no "
echo "$title_md PROTOCOL IP $title_md "
echo "$title_md ip protocol, modify with void or no "
echo "allow_use_ipv4= "
echo "$title_md void to config firewall with ipv4 or no to dont configure ipv4 "
echo "allow_use_ipv6= "
echo "$title_md void to config firewall with ipv6 or no to dont configure ipv6 "
echo "$title_md CLIENT PORTS $title_md "
echo "$title_md Client ports, add with ',' and join ranges with  : "
echo "client_port_tcp=http,https,http-alt,ssh "
echo "$title_md tcp ports for client "
echo "client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$title_md udp ports for client "
echo "$title_md SERVER PORTS $title_md "
echo "$title_md Server ports, add with ',' and join ranges with : "
echo "server_port_tcp=ssh "
echo "$title_md tcp ports for server "
echo "server_port_udp= "
echo "$title_md udp ports for server "
echo "$title_md LOG TO SERVER PORTS $title_md "
echo "$title_md or ULOG or LOG "
echo "config_system_log=LOG"
echo "$title_md Log to server ports, add with ',' and join ranges with : "
echo "logserver_port_tcp= "
echo "$title_md the tcp ports to log server "
echo "logserver_port_udp= "
echo "$title_md the udp ports to log server "
echo "$title_md ALLOW MAXTRIES SHIELD $title_md "
echo "$title_md Put one shield for ports to new connecting, with max ip to each hour "
echo "allow_shield_maxtries=no "
echo "$title_md void to allow one shield with max tries login in ssh for ip to each hour or no "
echo "config_shield_maxtries=12 "
echo "$title_md modify shield with number max of tries to log in us ssh server for ip at each hour "
echo "config_shield_port=22 "
echo "$title_md modify shield ssh chaging maxtries port ssh o several ports with comma separate "
echo "$title_md GENERAL RULES $title_md "
echo "$title_md General rules in table "
echo "allow_separate_rules= "
echo "$title_md Void to separate the rules for each port or no "
echo "allow_close_log=no"
echo "$title_md Void to log save before close rule or no"
echo "config_close_deny=DROP "
echo "$title_md choose close deny with or DROP or REJECT "
echo "$title_md END NECESARY $title_md "
echo "$title_md .......... END Necesary options .......... .......... $title_md "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$title_md BEGIN OPTIONAL $title_md "
echo "$title_md .......... BEGIN Optional options .......... .......... $title_md "
echo "$title_md choose void or no $title_md "
echo "$title_md Allow Other Options,  modify with void, or no "
echo "allow_string_denied=no "
echo "$title_md void to if drop string, or no to no "
echo "allow_string_allowed=no "
echo "$title_md void to if allow string, or no to no "
echo "allow_mac_whitelist=no "
echo "$title_md void to allow some exceptional MAC-ADDRESS or no "
echo "allow_mac_blacklist=no "
echo "$title_md void to drop some excepcional MAC-ADDRESS or no "
echo "allow_net_whitelist=no "
echo "$title_md void to allow some exceptional HOST/IP or no "
echo "allow_net_blacklist=no "
echo "$title_md void to drop some excepcional HOST/IP or no "
echo "allow_input_bandwidth=no "
echo "$title_md void to limit bandwidth input in kbits/sec for all sources or no "
echo "allow_output_bandwidth=no "
echo "$title_md void to limit bandwidth output in kbits/sec for each destination or no "
echo "allow_input_maxconnect=no "
echo "$title_md void to limit max number for input simultaneous connections or no "
echo "allow_output_maxconnect=no "
echo "$title_md void to limit max number for output simultaneous connections or no "
echo "allow_input_ping=no "
echo "$title_md void to allow RECIVE PING or no "
echo "allow_output_ping=no "
echo "$title_md void to allow SEND PING or no "
echo "allow_forward_ip4=no "
echo "$title_md void to yes to forward ip4, or no to no "
echo "allow_forward_ip6=no "
echo "$title_md void to allow ip forward ip6 or no "
echo "allow_gateway_ip4=no "
echo "$title_md void to allow gateway ip4 to others nets or no "
echo "allow_gateway_ip6=no "
echo "$title_md void to allow gateway ip6 to other nets or no "
echo "allow_dmz_ip4=no "
echo "$title_md void to allow dmz ip4 to one host local or no "
echo "allow_dmz_ip6=no "
echo "$title_md void to allow dmz ip6 to one host local or no "
echo "allow_input_all=no "
echo "$title_md void when the rules are to allow input to all or no "
echo "allow_output_all=no "
echo "$title_md void when the rules are to allow output to all or no "
echo "allow_input_state=no "
echo "$title_md Selective Input state with void or no "
echo "allow_output_state=no "
echo "$title_md Selective Output state with void or no "
echo "allow_output_uid=no "
echo "$title_md void to allow excepcional USER or no "
echo "allow_output_gid=no "
echo "$title_md void to allow excepcional GROUP or no "
echo "allow_others_protocols=no "
echo "$title_md void to allow other POTOCOL-IP excepcional or no"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$title_md Begin Variables $title_md.......... .......... $title_md.......... "
echo "$title_md Fill Variables "
echo "$title_md Options "
echo "$title_md Other Options, add with , and join ranges with : "
echo "config_string_denied=.fb.com,.facebook.com,xxx.html "
echo "$title_md drop connection with header string, if several, comma separate "
echo "config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net "
echo "$title_md allow connection with header string, if several, comma separate "
echo "config_input_bandwidth=12512 "
echo "$title_md max input bandwidth in kbits/sec for all "
echo "config_output_bandwidth=512 "
echo "$title_md max output bandwidh in kbits/sec for each ip "
echo "config_input_maxconnect=72 "
echo "$title_md max number for input simultaneous connections "
echo "config_output_maxconnect=72 "
echo "$title_md max number for output simultaneous connections "
echo "config_mac_whitelist=d4:12:43:01:36:2e "
echo "$title_md allow this excepcitonal MAC-ADRESS "
echo "config_mac_blacklist=d4:12:43:01:36:2e "
echo "$title_md drop this excepcional MAC-ADDRESS "
echo "config_net_whitelist=wesnoth.org,sf.net,deb.debian.org "
echo "$title_md allow this excepcitonal HOST/IP "
echo "config_net_blacklist=facebook.com,www.facebook.com "
echo "$title_md drop this excepcional HOST/IP )"
echo "config_gateway_ip4=0/0"
echo "$title_md server gateway for lan example: 192.168.0.0/24"
echo "config_gateway_ip6=::/0"
echo "$title_md server gateway for lan example: ::1"
echo "config_dmz_ip4=192.168.1.7 "
echo "$title_md ip server ip lan to other external nets, nat prerouting "
echo "config_dmz_ip6=d4:12:43:01:36:2e "
echo "$title_md ip server ip lan to other external nets, nat prerouting "
echo "config_input_state=new,related,established "
echo "$title_md void for all or new,related,established,untracked,invalid "
echo "config_output_state=new,related,established "
echo "$title_md void for all or new,related,established,untracked,invalid "
echo "config_output_uid=root "
echo "$title_md allow out packages excepcional from this USER excepcional "
echo "config_output_gid=root "
echo "$title_md allow out packages excepcional from this GROUP excepcional "
echo "config_others_protocols=icmp,igmp "
echo "$title_md allow others protocols from /etc/protocolos "
echo "$title_md NET CLIENT AND NET SERVER $title_md "
echo "$title_md Net to connect likes client or server "
echo "config_ipv4_netclient=0/0 "
echo "$title_md the net to client ipv4, all is 0/0 "
echo "config_ipv4_netserver=0/0 "
echo "$title_md the net to server ipv4, all is 0/0 "
echo "config_ipv6_netclient=::/0 "
echo "$title_md the net to client ipv6, all is ::/0 "
echo "config_ipv6_netserver=::/0 "
echo "$title_md the net to server ipv6, all is ::/0 "
echo "$title_md $title_md "
echo "$title_md .......... END Optional options .......... .......... $title_md"
exit ; fi
####
####
#### :rutina-final-template-full-en:
##########    english: autosave: autosave of firewall, standard rules   ##########
##########    english: autosave: autoguardado de firewall,   estandar   ##########
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
$cmd_realpath save autosave-fwiptables &> /dev/null ; exit; fi
####
####
#### :rutina-final-autosave:
##########    english: ntp: update the date and time    ##########
##########    spanish: ntp: actualiza la fecha y hora   ##########
#### :rutina-inicial-ntp:
####
####
if   [ "$first_option" == "ntp" ]; then 
echo "$title_md [ $first_option ] \
[ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]
then echo "$text_md $text_fail [ Install one ntp client ]" ; fi
echo "$text_md Old date: $show_actual_date"
echo "$text_md [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $show_actual_date"
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
echo "$text_md $cmd_basename [optional-output] first_option [second_option]  "
####
#### all option list
####
echo "$title_md    optional-output                                                      "
echo "$text_md [ t|txt n|narrowtxt l|logtxt c|cli g|gui p|pdf s|silent ]                    "
echo "$text_md [ cli-dialog cli-whiptail gui-zenity gui-yad ]                         "
echo "$text_md [ cli-menu-dialog cli-menu-whiptail gui-roll-zenity ]                  "
echo "$text_md [ gui-menu-zenity gui-menu-yad gui-shell-zenity gui-shell-yad ]        "
echo "$title_md    firewall-control                                                     "
echo "$text_md stop continue reset show save load names wizard-mini wizard-full       "
echo "$text_md actual eraserules eraserules4 eraserules6 without-connection                     "
echo "$text_md input-permisive input-established                                       "
echo "$title_md    firewall-listconceptual                                              "
echo "$text_md ls4 ls6 status list-filter4 list-filter6 list-nat4 list-nat6           "
echo "$text_md list-raw4 list-raw6 list-mangle4 list-mangle6 list-security4           "
echo "$text_md list-security6 list-ebtables list-arptables list-alltables             "
echo "$title_md    firewall-listnumeral                                                 "
echo "$text_md lsn4 lsn6 statusn listn-filter4 listn-filter6 listn-nat4               "
echo "$text_md listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6           "
echo "$text_md listn-security4 listn-security6 listn-alltables                        "
echo "$title_md    firewall-wallcustom                                                  "
echo "$text_md new-full-custom nueva-completa-custom new-mini-custom                  "
echo "$text_md nueva-mini-custom clone-wallsystem load-custom show-custom             "
echo "$text_md modify-custom del-custom names-custom                                  "
echo "$title_md    firewall-wallsystem                                                  "
echo "$text_md client-basic client-web client-ssh client-telnet client-ipp            "
echo "$text_md client-irc client-git client-vnc client-news client-vpn                "
echo "$text_md client-torrent client-vpn client-ftp client-proxy client-mail          "
echo "$text_md client-tor game-widelands games-udp games-shooter game-wesnoth         "
echo "$text_md game-minetest game-freeciv lan-tor lan-vpn shield-ssh server-ssh       "
echo "$text_md server-telnet server-irc server-vnc server-print server-webserver      "
echo "$text_md server-lamp server-news server-ftp server-mail server-teamspeak        "
echo "$text_md server-mumble server-gateway server-sql server-samba server-proxy      "
echo "$text_md server-asterisk client-uid-root client-gid-users client-gid-net        "
echo "$title_md    options-easy                                                         "
echo "$text_md preferences-read preferences-modify preferences-regen info web         "
echo "$text_md options ip4 ip6 speed-ip4 speed-ip6 intro filelog autolog date         "
echo "$text_md free sockets nodes ip-forward depends utils treeconf treecache         "
echo "$text_md cleancache notes variables uninstall install upgrade version           "
echo "$text_md examples code expert license-gpl license-lgpl license-bsd              "
echo " $text_md $text_md | Program: $cmd_basename , Version: $cmd_version    "
echo " $text_md $text_md | Description: $cmd_longdescription                 "
####
####  if expert commands
####
if [ "$allow_expert_commands" == "no" ]
then echo " $text_md $text_md | Expert: expert is dropped in preferences file    "  
else echo " $text_md $text_md | Expert: expert is allowed in preferences file   "    
fi
####
####
exit ; fi
####
####
#### :rutina-final-list-options:
##########     english: code: source from loop     ##########
##########     spanish: code: fuente de la rutina  ##########
#### :rutina-inicial-code:
####
####
if   [ "$first_option" == "code" ]; then 
echo "$title_md [ $first_option ]  [ Show source code for each option ] "
echo "$title_md $text_info [ code ] [ show source code for options from $cmd_realpath ]"
code_error="$title_md $text_info [ Usage ] [ $cmd_realpath code option_choosed ]"
if [ "$second_option" == "$NULL" ]; then echo "$code_error"
salida_code="$(cat $cmd_realpath | $command_grep -i  rutina-inicial \
| $command_grep -i -v cat | $command_sed -s s/####\ :rutina-inicial-//g | \
sort | $command_sed -s s/://g )"
echo $salida_code
exit ; fi
value_first="$(cat -n $cmd_realpath | $command_grep  :rutina-inicial-$2: | \
$command_cut -d "#" -f 1 | head -1)"
value_second="$(cat -n $cmd_realpath | $command_grep :rutina-final-$2:  | \
$command_cut -d "#" -f 1 | head -1)"
value_count="$(("$value_second"-"$value_first+1"))"
if [ ! -n "$value_first" ];   then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_second" ];  then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_count" ];   then echo; echo "$code_error" ; exit ; fi
echo "$title_md [ code ] [ option: "$second_option" ] [ show $value_count lines ] \
[ from the "$value_first" line number to "$value_second" line number ]"
cat $cmd_realpath | head -n $value_second | tail -n $value_count
exit; fi
####
####
#### :rutina-final-code:
##########    english: names-custom: list some config       ##########
##########    spanish: names-custom: lista alguna config    ##########
#### :rutina-inicial-names-custom:
####
####
if [ "$first_option" == "names-custom" ]; then 
echo "$title_md [ $first_option ] [ List configs cfg ] "
echo "$title_md $text_info [ list configs files in cfg format ]"
echo "$title_md $text_info [ folder ] [ $default_directory_custom ]"
echo "$title_md"
$command_ls -1 $default_directory_custom
echo "$title_md"
echo "$title_md [ OK CFG FILES NAMES ] [ Use: $cmd_realpath load-custom file ]"
exit; fi
####
####
#### :rutina-final-names-custom:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]; then $nada
read -p '##### $text_ok ##### Press [enter] to continue now with the cli-menu ##### '
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
case $command_tee in "$NULL")
echo "$text_md $text_fail [ Install tee command ]"; exit ;; esac
####
####
echo "$title_md $text_info Actual Memory"
free -hw 
####
####
echo "$title_md $text_info Now with New Memory ram freedom .. Actual memory now .."
echo 3 | $command_tee /proc/sys/vm/drop_caches &> /dev/null
free -hw
####
####
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
echo "$title_md | firewall-control | $cmd_basename firewall-control |"
echo "$text_md"
echo "$text_md | stop . remove the rules iptables, and save it to then if continue  "  
echo "$text_md | continue. reset and load latest rules iptables loaded  "  
echo "$text_md | load . reset rules iptables actually  "  
echo "$text_md | actual . show the rules iptables from actually  "  	
echo "$text_md | show . show the rules iptables from selected file  "  
echo "$text_md | load . reset and load new rules iptables from selected file  "  
echo "$text_md | save . save in the file selected the rules iptables actually  "  
echo "$text_md | all-names . list filenames saved in the iptables rules  "  
echo "$text_md | eraserules . remove all firewall rules: ipv4,ipv6,ebtables,arptables  "  
echo "$text_md | eraserules4 . remove ipv4 firewall rules  "  
echo "$text_md | eraserules6 . remove ipv6 firewall rules  "  
echo "$text_md | wizard-mini . launch a one mini wizard to run iptables rules  "  
echo "$text_md | wizard-full . launch a one full wizard to run iptables rules  "  
echo "$text_md | without-connection . launch a one firewall only for localhost  "  
echo "$text_md | input-permisive . launch a one firewall with all permisive  "  
echo "$text_md | input-established . launch a one firewall with status in input related,stablished  "  
echo "$text_md "
exit; fi
####
####
#### :rutina-final-firewall-control:
##########    english: firewall-listconceptual: options for fwiptables firewall      ##########
##########    spanish: firewall-listconceptual: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-listconceptual:
####
####
if   [ "$first_option" == "firewall-listconceptual" ]; then
echo "$text_md "
echo "$title_md | firewall-listconceptual | $cmd_basename firewall-listconceptual |"
echo "$text_md"
echo "$text_md | ls4 . list filter rules ipv4  "  
echo "$text_md | ls6 . list filter rules ipv6  "  
echo "$text_md | list4 . list filter rules ipv4  "  
echo "$text_md | list6 . list filter rules ipv6  "  
echo "$text_md | status . list filter rules ipv4 , rules ipv6  "  
echo "$text_md | list-alltables . list all tables for rules ipv4, rules ipv6  "  
echo "$text_md | list-filter4 . list filter rules ipv4  "  
echo "$text_md | list-filter6 . list filter rules ipv6  "  
echo "$text_md | list-nat4 . list nat rules ipv4  "  
echo "$text_md | list-nat6 . list nat rules ipv6  "  
echo "$text_md | list-raw4 . list raw rules ipv4  "  
echo "$text_md | list-raw6 . list raw rules ipv6  "  
echo "$text_md | list-mangle4 . list mangle rules ipv4  "  
echo "$text_md | list-mangle6 . list mangle rules ipv6  "  
echo "$text_md | list-security4 . list security rules ipv4  "  
echo "$text_md | list-security6 . list security rules ipv6  "  
echo "$text_md | list-ebtables . list ebtables rules ipv4   "  
echo "$text_md | list-arptables . list arptables rules ipv6  "  
echo "$text_md"
exit; fi
####
####
#### :rutina-final-firewall-listconceptual:
##########    english: firewall-listnumeral: options for fwiptables firewall      ##########
##########    spanish: firewall-listnumeral: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-listnumeral:
####
####
if   [ "$first_option" == "firewall-listnumeral" ]; then
echo "$text_md "
echo "$title_md | firewall-listnumeral | $cmd_basename firewall-listnumeral |"
echo "$text_md"
echo "$text_md | lsn4 . list filter rules ipv4 with numbers  "  
echo "$text_md | lsn6 . list filter rules ipv6 with numbers  "  
echo "$text_md | listn4 . list filter rules ipv4 with numbers  "  
echo "$text_md | listn6 . list filter rules ipv6 with numbers  "  
echo "$text_md | statusn . list filter rules ipv4 , rules ipv6 with numbers  "  
echo "$text_md | listn-alltables . list all tables for rules ipv4, rules ipv6 with numbers  "  
echo "$text_md | listn-filter4 . list filter rules ipv4 with numbers  "  
echo "$text_md | listn-filter6 . list filter rules ipv6 with numbers  "  
echo "$text_md | listn-nat4 . list nat rules ipv4 with numbers  "  
echo "$text_md | listn-nat6 . list nat rules ipv6 with numbers  "  
echo "$text_md | listn-raw4 . list raw rules ipv4 with numbers  "  
echo "$text_md | listn-raw6 . list raw rules ipv6 with numbers  "  
echo "$text_md | listn-mangle4 . list mangle rules ipv4 with numbers  "  
echo "$text_md | listn-mangle6 . list mangle rules ipv6 with numbers  "  
echo "$text_md | listn-security4 . list security rules ipv4 with numbers  "  
echo "$text_md | listn-security6 . list security rules ipv6 with numbers  "  
echo "$text_md | listn-ebtables . list ebtables rules ipv4 with numbers  "  
echo "$text_md | listn-arptables . list arptables rules ipv6 with numbers  "  
echo "$text_md"
exit; fi
####
####
#### :rutina-final-firewall-listnumeral:
##########    english: firewall-wallcustom: options for fwiptables firewall      ##########
##########    spanish: firewall-wallcustom: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-wallcustom:
####
####
if   [ "$first_option" == "firewall-wallcustom" ]; then
echo "$text_md "
echo "$title_md | firewall-wallcustom | $cmd_basename firewall-wallcustom |"
echo "$text_md"
echo "$text_md | new-full-custom . create new full config in english  "  
echo "$text_md | new-mini-custom . create new mini config in english  "  
echo "$text_md | nueva-completa-custom . create new full config in spanish  "  
echo "$text_md | nueva-mini-custom . create new full config in spanish  "   
echo "$text_md | clone-wallsystem . clone a static firewall predesignated  "  
echo "$text_md | show-custom . show config-file choosed  "   
echo "$text_md | modify-custom . modify config-file choosed  "  
echo "$text_md | load-custom . launch a one one-file saved custom  "  
echo "$text_md | del-custom . delete config-file choosed  "  
echo "$text_md | names-custom . show the names for all config-files  "  
echo "$text_md "
exit; fi
####
####
#### :rutina-final-firewall-wallcustom:
##########    english: firewall-wallsystem: options for fwiptables firewall      ##########
##########    spanish: firewall-wallsystem: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-wallsystem:
####
####
if   [ "$first_option" == "firewall-wallsystem" ]; then
echo "$text_md "
echo "$title_md | firewall-wallsystem | $cmd_basename firewall-wallsystem |"
echo "$text_md"
echo "$text_md | client-basic . launch a one firewall basic client  "  
echo "$text_md | client-web . launch a one firewall web client  "  
echo "$text_md | client-ssh . launch a one firewall ssh client  "  
echo "$text_md | client-telnet . launch a one firewall telnet client  "  
echo "$text_md | client-git . launch a one firewall git client   "  
echo "$text_md | client-ipp . launch a one firewall ipp client  "  
echo "$text_md | client-vnc . launch a one firewall vnc client  "  
echo "$text_md | client-mail . launch a one firewall mail client  "  
echo "$text_md | client-news . launch a one firewall news client  "  
echo "$text_md | client-vpn . launch a one firewall vpn client  "  
echo "$text_md | client-proxy . launch a one firewall proxy client  "  
echo "$text_md | games-udp . launch a one firewall udp client  "  
echo "$text_md | games-shooter . launch a one firewall shooter client  "  
echo "$text_md | games-wesnoth . launch a one firewall wesnoth client  "  
echo "$text_md | games-minetest . launch a one firewall minetest client  "  
echo "$text_md | games-freeciv . launch a one firewall freeciv client  "  
echo "$text_md | lan-tor . launch a one firewall only tor client  "  
echo "$text_md | lan-vpn . launch a one firewall only vpn client  "  
echo "$text_md | shield-ssh . launch a one firewall basic server with shield ssh "  
echo "$text_md | server-ssh . launch a one firewall basic server  "  
echo "$text_md | server-telnet . launch a one firewall basic server  "  
echo "$text_md | server-samba . launch a one firewall basic server  "  
echo "$text_md | server-vnc . launch a one firewall basic server  "  
echo "$text_md | server-webserver . launch a one firewall basic server  "  
echo "$text_md | server-print . launch a one firewall basic server  "  
echo "$text_md | server-lamp . launch a one firewall basic server  "  
echo "$text_md | server-news . launch a one firewall basic server  "  
echo "$text_md | server-ftp . launch a one firewall basic server  "  
echo "$text_md | server-mail . launch a one firewall basic server  "  
echo "$text_md | server-teamspeak . launch a one firewall basic server  "  
echo "$text_md | server-mumble . launch a one firewall basic server  "  
echo "$text_md | server-sql . launch a one firewall basic server  "  
echo "$text_md | server-asterisk . launch a one firewall basic server  "  
echo "$text_md | server-domain . launch a one firewall basic server  "  
echo "$text_md | server-proxy . launch a one firewall basic server  "  
echo "$text_md | server-gateway . launch a one firewall nat gateway and web/ssh server  "  
echo "$text_md | client-uid-root . launch a one firewall for only allow at user root  "    
echo "$text_md | client-gid-users . launch a one firewall for only allow at group users  "
echo "$text_md | client-gid-net . launch a one firewall for only allow at group net  "      
exit; fi
####
####
#### :rutina-final-firewall-wallsystem:
##########    english: options-easy: options for fwiptables firewall      ##########
##########    spanish: options-easy: opciones para fwiptables firewall    ##########
#### :rutina-inicial-options-easy:
#### :rutina-inicial-easy:
####
####
if   [ "$first_option" == "options-easy" ]; then
echo "$text_md "
echo "$title_md | options-easy | $cmd_basename options-easy |"
echo "$text_md"
echo "$text_md | preferences-read . show the preferences for fwiptables  "  
echo "$text_md | preferences-modify . modify the preferences for fwiptables  "  
echo "$text_md | preferences-regen . recover the initials preferences for fwiptables  "  
echo "$text_md | preferences-example . show the examples for fwiptables preference  "  
echo "$text_md | list-options . list options  "  
echo "$text_md | info-options . list details for the options  "  
echo "$text_md | info . details from one first option from one pattern  "  
echo "$text_md | filelog . show the result for the commands save with -l|-log  "  
echo "$text_md | autolog . list the commands launched  "  
echo "$text_md | ip4 . show details from connection ipv4  "  
echo "$text_md | ip6 . show details from connection ipv6  "  
echo "$text_md | speed-ip4 . calculate bandwith ipv4  "  
echo "$text_md | speed-ip6 . calculate bandwith ipv6  "  
echo "$text_md | sockets . show the sockets listening  "  
echo "$text_md | nodes . show computers connected to lan  "  
echo "$text_md | web . browse web page  "  
echo "$text_md | date . update the time and date from internet  "  
echo "$text_md | free . freedom innecesary ram  "  
echo "$text_md | version . show version and path  "  
echo "$text_md | notes . several notes for internet   "  
echo "$text_md | ip-forward . list or active or desactive forward variables  "  
echo "$text_md | depends . principal dependences  "  
echo "$text_md | license . license  "  
echo "$text_md | treeconf . tree from configuration  "  
echo "$text_md | treecache . tree from cache  "  
echo "$text_md | cleancache . clean cache program   "  
echo "$text_md | code . show source code from one option  "  
echo "$text_md | variables . possible variables  "  
echo "$text_md | intro . intro  "  
echo "$text_md | install . install fwiptables  "  
echo "$text_md | uninstall . uninstall fwiptables  "  
echo "$text_md | license-gpl . license gpl  "  
echo "$text_md | license-lgpl . license lgpl  "  
echo "$text_md | license-bsd . license bsd  "  
echo "$text_md "
exit; fi
####
####
#### :rutina-final-easy:
#### :rutina-final-options-easy:
##########    english: options-expert: options for fwiptables firewall      ##########
##########    spanish: options-expert: opciones para fwiptables firewall    ##########
#### :rutina-inicial-options-expert:
#### :rutina-inicial-expert:
####
####
if   [ "$first_option" == "options-expert" ]; then
echo "$text_md "
echo "$title_md | options-expert | $cmd_basename expert |"
echo "$text_md    Each expert only works Without optional output"
echo "$text_md"
echo "$text_md | expert-browser-web . browse one link web  "  
echo "$text_md | expert-sockets-ss . show sockets with ss  "  
echo "$text_md | expert-sockets-netstat . show sockets with netstat  "  
echo "$text_md | expert-sockets-lsof . show sockets with lsof  "  
echo "$text_md | expert-show-resolve . show file resolve domain with resolv.conf  "  
echo "$text_md | expert-show-weather . show weather with wttr.in  "  
echo "$text_md | expert-show-geoip . show location for ip o for host with geoip  "  
echo "$text_md | expert-show-webcert . show web certificate ssl from one web with ssl-cert  "  
echo "$text_md | expert-show-newversion . Show version fwiptables stable/unstable with curl  "  
echo "$text_md | expert-show-clientproxy . show proxy variables in the system stablished  "  
echo "$text_md | expert-conf-clientproxy . File /etc/proxy.fwiptables for proxy launched with source  "  
echo "$text_md | expert-speed-ip4 . benchmark internet speed ipv4 with 4seconds  "  
echo "$text_md | expert-speed-ip6 . benchmark internet speed ipv6 with 4seconds  "  
echo "$text_md | expert-speed-disk . benchmark disk speed with 100Mb  "   
echo "$text_md | expert-speed-ram . benchmark ram speed with 100Mb  "  
echo "$text_md | expert-speed-cpu . benchmark cpu speed with bc command aprox 5seconds  "   
echo "$text_md | expert-speed-glx . benchmark glx speed with mesa3D  " 
echo "$text_md | expert-add-whitelist4 . add white list for ip4"
echo "$text_md | expert-add-whitelist6 . add white list for ip6"
echo "$text_md | expert-upgrade-stable . Upgrade from web sourceforge fwiptables with curl  "  
echo "$text_md | expert-upgrade-unstable . Upgrade from git sourceforge fwiptables with curl  "  
echo "$text_md | expert-upgrade-adblock . Download blacklist to folder configuration program with curl  " 
echo "$text_md | expert-gen-deb . generate actual version file in deb  "   
echo "$text_md | expert-gen-readme . generate actual version file in original with readme  "  
echo "$text_md | expert-gen-compile . Compile fwiptables from bash with program obash  "   
echo "$text_md | expert-nmap-tcp . doing scan tcp at host or range  "  
echo "$text_md | expert-nmap-udp . doing scan udp at host or range  "  
echo "$text_md | expert-nmap-fin . doing scan fin at host or range  "   
echo "$text_md | expert-nmap-syn . doing scan syn at host or range  "   
echo "$text_md | expert-nmap-ping . doing scan ping at host or range  "  
echo "$text_md | expert-trace-tcp4 . trace route tcp to host ip4  "  
echo "$text_md | expert-trace-tcp6 . trace route tcp to host ip6  "  
echo "$text_md | expert-trace-icmp4 . trace route icmp to host ip4  "  
echo "$text_md | expert-trace-icmp6 . trace route icmp to host ip6  "  
echo "$text_md | expert-wpa-scan . the list wifi on air  "  
echo "$text_md | expert-wpa-list . the list nameconfig over saved wifi  "  
echo "$text_md | expert-wpa-new . new nameconfig to create wifi config  "  
echo "$text_md | expert-wpa-modify . one nameconfig to modify wifi config  "  
echo "$text_md | expert-wpa-connect . one nameconfig to connect wifi config  "  
echo "$text_md | expert-pc-halt . halt computer with halt  "  
echo "$text_md | expert-pc-shutdown . shutdown computer with shutdown  "  
echo "$text_md | expert-pc-reboot . reboot computer with reboot  "  
echo "$text_md | expert-cpufreq-info . show cpu frecuence info  "  
echo "$text_md | expert-cpupower-info . show cpu frecuence info  "  
echo "$text_md | expert-radio-link . listen radio from one link  "  
echo "$text_md | expert-radio-spanish . listen online radio from one text-string from spain  "  
echo "$text_md | expert-project-web . site  downloaded web fwiptables  "  
echo "$text_md | expert-configs-save . save configs like backup from fwiptables in tar file  "  
echo "$text_md | expert-configs-load . load configs like backup from fwiptables in tar file  "  
echo "$text_md "
exit; fi
####
####
#### :rutina-final-expert:
#### :rutina-final-options-expert:
##########    english: info-options: options for fwiptables firewall      ##########
##########    spanish: info-options: opciones para fwiptables firewall    ##########
#### :rutina-inicial-info-options:
#### :rutina-inicial-info:
####
####
if   [ "$first_option" == "info-options" ]; then 
echo "$title_md [ $first_option ]  [ info options ] [ info-options md]"
echo "$text_md"
$cmd_realpath optional-output
$cmd_realpath firewall-control
$cmd_realpath firewall-listconceptual
$cmd_realpath firewall-listnumeral
$cmd_realpath firewall-wallcustom
$cmd_realpath firewall-wallsystem
$cmd_realpath options-easy
$cmd_realpath expert
exit; fi
####
####
#### :rutina-final-info:
#### :rutina-final-info-options:
##########    english: optional-output: options for fwiptables firewall      ##########
##########    spanish: optional-output: opciones para fwiptables firewall    ##########
#### :rutina-inicial-optional-output:
#### :rutina-inicial-parametters:
####
####
if   [ "$first_option" == "optional-output" ]; then
echo "$text_md "
echo "$title_md | optional-output | $cmd_basename optional-ouptut |"
echo "$text_md"
echo "$text_md | t . output in terminal text  "  
echo "$text_md | n . output in terminal text narrowtxt (compresed spaces)  "  
echo "$text_md | c . output in terminal cli  "  
echo "$text_md | g . output in graphicall gui  "  
echo "$text_md | l . output in file text log  "  
echo "$text_md | p . output in file image pdf  "  
echo "$text_md | s . output in silent or null  "  
echo "$text_md | txt . output in terminal text  "  
echo "$text_md | narrowtxt . output in terminal text narrowtxt (compresed spaces)  "  
echo "$text_md | cli . output in terminal cli  "  
echo "$text_md | gui . output in graphicall gui  "  
echo "$text_md | logtxt . output in file text logtxt  "  
echo "$text_md | pdf . output in file image pdf  "  
echo "$text_md | silent . output in silent text  "  
echo "$text_md | cli-dialog . output in terminal cli with dialog  "  
echo "$text_md | cli-whiptail . output in terminal cli with whiptail  "  
echo "$text_md | gui-zenity . output in graphicall gui with zenity  "  
echo "$text_md | gui-yad . output in graphicall gui with yad  "  
echo "$text_md | cli-menu-dialog . output in terminal menu with dialog  "  
echo "$text_md | cli-menu-whiptail . output in terminal menu with whiptail  "  
echo "$text_md | gui-menu-zenity . output in grapicall menu with zenity  "  
echo "$text_md | gui-menu-yad . output in grapicall menu with yad  "  
echo "$text_md | gui-shell-zenity . output in grapicall shell with zenity  "  
echo "$text_md | gui-shell-yad . output in grapicall shell with yad  "  
echo "$text_md | gui-roll-zenity . output in grapicall roll with zenity  "  
echo "$text_md"
exit; fi
####
####
#### :rutina-final-parametters:
#### :rutina-final-optional-output:
##########    english: variables: list variables     ##########
##########    spanish: variables: lista variables    ##########
#### :rutina-inicial-variables:
####
####
if   [ "$first_option" == "variables" ]; then 
echo "$title_md [ $first_option ]  [ list variables firewall fwiptables] [ variables md ]"
echo "$text_md"
echo "$title_md           Firewall fwiptables variables ... $cmd_version"
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
echo "$text_md allow_shield_maxtries       # void or no . void to allow shield maxtries"
echo "$text_md"
echo "$text_md config_shield_maxtries      # max tries to login for each hour then drop ip"
echo "$text_md"
echo "$text_md config_shield_port          # ports to shield, if several comma separate"
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
echo "$text_md allow_string_denied         # or no, or void to config string in header to deny"
echo "$text_md"
echo "$text_md allow_string_allowed        # or no, or void to config string in header to allow"
echo "$text_md"
echo "$text_md allow_dmz_ip4               # void or no . allow dmz is forward to ip4"
echo "$text_md"
echo "$text_md allow_dmz_ip6               # void or no . allow dmz is forward to ip6"
echo "$text_md"
echo "$text_md allow_forward_ip4           # void or no . void to allow gateway ip4"
echo "$text_md"
echo "$text_md allow_forward_ip6           # void or no . void to allow forward ip6"
echo "$text_md"
echo "$text_md allow_gateway_ip4           # void or no . void to allow gateway ip4"
echo "$text_md"
echo "$text_md allow_gateway_ip6           # void or no . void to allow gateway ip6"
echo "$text_md"
echo "$text_md allow_input_all             # void or no . void to allow input all"
echo "$text_md"
echo "$text_md allow_input_bandwidth       # void or no . void to allow input bandwidth simultaneus"
echo "$text_md"
echo "$text_md allow_input_maxconnect      # void or no . void to allow input maxconnect simultaneus"
echo "$text_md"
echo "$text_md allow_input_ping            # void or no . void to allow input ping"
echo "$text_md"
echo "$text_md allow_input_state           # void or no . void to allow input state config"
echo "$text_md"
echo "$text_md allow_mac_blacklist         # void or no . void to allow mac blacklist"
echo "$text_md"
echo "$text_md echo allow_mac_whitelist    # void or no . void to allow mac whitelist"
echo "$text_md"
echo "$text_md allow_net_blacklist         # void or no . void to allow net blacklist"
echo "$text_md"
echo "$text_md allow_net_whitelist         # void or no . void to allow net whitelist"
echo "$text_md"
echo "$text_md allow_others_protocols      # void or no . void to allow other protocols"
echo "$text_md"
echo "$text_md allow_output_all            # void or no . void to allow output all"
echo "$text_md"
echo "$text_md allow_output_bandwidth      # void or no . void to allow output bandwidth"
echo "$text_md"
echo "$text_md allow_output_maxconnect     # void or no . void to allow output maxconnect"
echo "$text_md"
echo "$text_md allow_output_ping           # void or no . void to allow output ping"
echo "$text_md"
echo "$text_md allow_output_state          # void or no . void to allow config output state"
echo "$text_md"
echo "$text_md allow_output_uid            # void or no . void to allow output uid or no"
echo "$text_md"
echo "$text_md allow_output_gid            # void or no . void to allow output gid or no"
echo "$text_md"
echo "$text_md config_string_denied        # config string in header to deny"
echo "$text_md"
echo "$text_md config_string_allowed       # config string in header to allow, like a one password"
echo "$text_md"
echo "$text_md config_dmz_ip4              # Destination NAT"
echo "$text_md"
echo "$text_md config_dmz_ip6              # Destination NAT"
echo "$text_md"
echo "$text_md config_input_bandwidth      # max kbits/sec for all input . Example 12512"
echo "$text_md"
echo "$text_md config_input_maxconnect     # max number conection for input at the same time"
echo "$text_md"
echo "$text_md config_output_bandwidth     # max kbits/sec for all ouptput . Example 12512"
echo "$text_md"
echo "$text_md config_output_maxconnect    # max number conection for input at the same time"
echo "$text_md"
echo "$text_md config_input_state          # modify with: new,related,established,untracked,invalid"
echo "$text_md"
echo "$text_md config_output_state         # modify with: new,related,established,untracked,invalid"
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
echo "$text_md config_ipv4_netclient             # only client ipv4 for ip/host/range, several with comma"
echo "$text_md"
echo "$text_md config_ipv4_netserver             # only server ipv4 for ip/host/range, several with comma"
echo "$text_md"
echo "$text_md config_ipv6_netclient             # only client ipv6 for ip/host/range, several with comma"
echo "$text_md"
echo "$text_md config_ipv6_netserver             # only server ipv6 for ip/host/range, several with comma"
echo "$text_md"
echo "$text_md"
echo "$title_md    # Others descriptions:"
echo "$title_md"
echo "$title_md English description with: $cmd_basename config-eng"
echo "$title_md Spanish description with: $cmd_basename config-spa"
echo "$title_md"
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
echo "$title_md [ $first_option ]  [ list commands possible depends ] [ depends md ]"
echo "##########     commands possible depends  ##########"
echo "$text_md"
echo "$text_md awk              # for sockets"
echo "$text_md"
echo "$text_md arp              # optional"
echo "$text_md"
echo "$text_md arpscan         # necesary in option nodes"
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
##########    english: eraserules: Erase rules option   ##########
##########    spanish: eraserules: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules:
####
####
if [ "$first_option" == "eraserules" ]; then  
echo "$title_md [ $first_option ] [ Deleted all iptables ipv4/ipv6 rules ]"
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_iptableslegacy   -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_iptablesnft      -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip6tableslegacy  -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip6tablesnft     -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_iptableslegacy   -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_iptablesnft      -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip6tableslegacy  -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip6tablesnft     -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_iptableslegacy   -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
$command_iptablesnft      -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
$command_ip6tableslegacy  -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
$command_ip6tablesnft     -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
#### remove ebtables
rule_table_policy="ACCEPT"
$command_ebtables -t filter -P INPUT     $rule_table_policy  &> /dev/null
$command_ebtables -t filter -P FORWARD   $rule_table_policy &> /dev/null 
$command_ebtables -t filter -P OUTPUT    $rule_table_policy &> /dev/null
$command_ebtables -t nat -P PREROUTING   $rule_table_policy &> /dev/null
$command_ebtables -t nat -P OUTPUT       $rule_table_policy  &> /dev/null
$command_ebtables -t nat -P POSTROUTING  $rule_table_policy &> /dev/null
####
####
$command_ebtables -t filter -F &> /dev/null
$command_ebtables -t nat -F    &> /dev/null
####
#### remove arptables
$command_arptables -F  &> /dev/null
####
#### remove ip4
$cmd_realpath eraserules4 &> /dev/null
####
#### remove ip6
$cmd_realpath eraserules6 &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-eraserules:
##########    english: eraserules4: Erase rules option   ##########
##########    spanish: eraserules4: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules4:
####
####
if [ "$first_option" == "eraserules4" ]; then  
echo "$title_md [ $first_option ] [ Deleted ip4 iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_iptableslegacy   -t filter  -P INPUT    $rule_table_policy
$command_iptablesnft      -t filter  -P INPUT    $rule_table_policy
$command_iptableslegacy   -t filter  -P FORWARD  $rule_table_policy
$command_iptablesnft      -t filter  -P FORWARD  $rule_table_policy
$command_iptableslegacy   -t filter  -P OUTPUT   $rule_table_policy
$command_iptablesnft      -t filter  -P OUTPUT   $rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$command_ebtables -t filter -F &> /dev/null
$command_ebtables -t nat -F &> /dev/null
$command_iptablesnft -t filter -F &> /dev/null
$command_iptableslegacy -t filter -F &> /dev/null
$command_iptablesnft -t nat -F &> /dev/null
$command_iptableslegacy -t nat -F &> /dev/null
$command_iptablesnft -t mangle -F &> /dev/null
$command_iptableslegacy -t mangle -F &> /dev/null
$command_iptablesnft -t raw -F &> /dev/null
$command_iptableslegacy -t raw -F &> /dev/null
$command_iptablesnft -t security -F &> /dev/null
$command_iptableslegacy -t security -F &> /dev/null
####
####
$command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptablesnft -t filter -P INPUT ACCEPT &> /dev/null
$command_iptablesnft -t filter -P FORWARD ACCEPT &> /dev/null
$command_iptablesnft -t filter -P OUTPUT ACCEPT &> /dev/null
$command_iptableslegacy -t filter -P INPUT ACCEPT &> /dev/null
$command_iptableslegacy -t filter -P FORWARD ACCEPT &> /dev/null
$command_iptableslegacy -t filter -P OUTPUT ACCEPT &> /dev/null
$command_iptablesnft -t nat -P INPUT ACCEPT &> /dev/null
$command_iptablesnft -t nat -P OUTPUT ACCEPT &> /dev/null
$command_iptablesnft -t nat -P PREROUTING ACCEPT &> /dev/null
$command_iptablesnft -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptableslegacy -t nat -P INPUT ACCEPT &> /dev/null
$command_iptableslegacy -t nat -P OUTPUT ACCEPT &> /dev/null
$command_iptableslegacy -t nat -P PREROUTING ACCEPT &> /dev/null
$command_iptableslegacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_iptablesnft -t mangle -P INPUT ACCEPT &> /dev/null
$command_iptablesnft -t mangle -P FORWARD ACCEPT &> /dev/null
$command_iptablesnft -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_iptablesnft -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_iptablesnft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_iptableslegacy -t mangle -P INPUT ACCEPT &> /dev/null
$command_iptableslegacy -t mangle -P FORWARD ACCEPT &> /dev/null
$command_iptableslegacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_iptableslegacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_iptableslegacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_iptablesnft -t raw -P OUTPUT ACCEPT &> /dev/null
$command_iptablesnft -t raw -P PREROUTING ACCEPT &> /dev/null
$command_iptableslegacy -t raw -P OUTPUT ACCEPT &> /dev/null
$command_iptableslegacy -t raw -P PREROUTING ACCEPT &> /dev/null
$command_iptablesnft -t security -P INPUT ACCEPT &> /dev/null
$command_iptablesnft -t security -P FORWARD ACCEPT &> /dev/null
$command_iptablesnft -t security -P OUTPUT ACCEPT &> /dev/null
$command_iptableslegacy -t security -P INPUT ACCEPT &> /dev/null
$command_iptableslegacy -t security -P FORWARD ACCEPT &> /dev/null
$command_iptableslegacy -t security -P OUTPUT ACCEPT &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-eraserules4:
##########    english: eraserules6: Erase rules option   ##########
##########    spanish: eraserules6: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules6:
####
####
if [ "$first_option" == "eraserules6" ]; then  
echo "$title_md [ $first_option ] [ Deleted ip6 iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_ip6tableslegacy   -t filter  -P INPUT    $rule_table_policy
$command_ip6tablesnft      -t filter  -P INPUT    $rule_table_policy
$command_ip6tableslegacy   -t filter  -P FORWARD  $rule_table_policy
$command_ip6tablesnft      -t filter  -P FORWARD  $rule_table_policy
$command_ip6tableslegacy   -t filter  -P OUTPUT   $rule_table_policy
$command_ip6tablesnft      -t filter  -P OUTPUT   $rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$command_ip6tablesnft -t filter -F &> /dev/null
$command_ip6tableslegacy -t filter -F &> /dev/null
$command_ip6tablesnft -t nat -F &> /dev/null
$command_ip6tableslegacy -t nat -F &> /dev/null
$command_ip6tablesnft -t mangle -F &> /dev/null
$command_ip6tableslegacy -t mangle -F &> /dev/null
$command_ip6tablesnft -t raw -F &> /dev/null
$command_ip6tableslegacy -t raw -F &> /dev/null
$command_ip6tablesnft -t security -F &> /dev/null
$command_ip6tableslegacy -t security -F &> /dev/null
####
####
$command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t filter -P INPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip6tablesnft -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t filter -P INPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip6tableslegacy -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t nat -P INPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tableslegacy -t nat -P INPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip6tableslegacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip6tablesnft -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tableslegacy -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip6tableslegacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip6tableslegacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip6tableslegacy -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip6tablesnft -t security -P INPUT ACCEPT &> /dev/null
$command_ip6tablesnft -t security -P FORWARD ACCEPT &> /dev/null
$command_ip6tablesnft -t security -P OUTPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t security -P INPUT ACCEPT &> /dev/null
$command_ip6tableslegacy -t security -P FORWARD ACCEPT &> /dev/null
$command_ip6tableslegacy -t security -P OUTPUT ACCEPT &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-eraserules6:
##########     english: list-alltables: list all rules         ##########
##########     spanish: list-alltables: list todas las reglas  ##########
#### :rutina-inicial-list-alltables:
####
####
if [ "$first_option" == "list-alltables" ]; then
echo "$title_md [ $first_option ] [ List all rules ] "
echo; echo; echo "$title_md LIST ARPTABLES ###" ; echo
$cmd_realpath list-arptables 
echo; echo; echo "$title_md LIST EBTABLES ###" ; echo
$cmd_realpath list-ebtables
echo; echo; echo "$title_md LIST FILTER IP4 TABLE ###" ; echo
$cmd_realpath list-filter4
echo; echo; echo "$title_md LIST FILTER IP6 TABLE ###" ; echo
$cmd_realpath list-filter6
echo; echo; echo "$title_md LIST NAT IP4 TABLE ###" ; echo
$cmd_realpath list-nat4
echo; echo; echo "$title_md LIST NAT IP6 TABLE ###" ; echo
$cmd_realpath list-nat6
echo; echo; echo "$title_md LIST SECURITY IP4 TABLE ###" ; echo
$cmd_realpath list-security4
echo; echo; echo "$title_md LIST SECURITY IP6 TABLE ###" ; echo
$cmd_realpath list-security6
echo; echo; echo "$title_md LIST RAW IP4 TABLE ###" ; echo
$cmd_realpath list-raw4
echo; echo; echo "$title_md LIST RAW IP6 TABLE ###" ; echo
$cmd_realpath list-raw6
echo; echo; echo "$title_md LIST MANGLE IP4 TABLE ###" ; echo
$cmd_realpath list-mangle4
echo; echo; echo "$title_md LIST MANGLE IP6 TABLE ###" ; echo
$cmd_realpath list-mangle6
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
echo; echo; echo "$title_md LIST EBTABLES ###" ; echo
$cmd_realpath list-ebtables
echo; echo; echo "$title_md LIST ARPTABLES ###" ; echo
$cmd_realpath list-arptables
echo; echo; echo "$title_md LIST FILTER IP4 TABLE ###" ; echo
$cmd_realpath listn-filter4
echo; echo; echo "$title_md LIST FILTER IP6 TABLE ###" ; echo
$cmd_realpath listn-filter6
echo; echo; echo "$title_md LIST NAT IP4 TABLE ###" ; echo
$cmd_realpath listn-nat4
echo; echo; echo "$title_md LIST NAT IP6 TABLE ###" ; echo
$cmd_realpath listn-nat6
echo; echo; echo "$title_md LIST SECURITY IP4 TABLE ###" ; echo
$cmd_realpath listn-security4
echo; echo; echo "$title_md LIST SECURITY IP6 TABLE ###" ; echo
$cmd_realpath listn-security6
echo; echo; echo "$title_md LIST RAW IP4 TABLE ###" ; echo
$cmd_realpath listn-raw4
echo; echo; echo "$title_md LIST RAW IP6 TABLE ###" ; echo
$cmd_realpath listn-raw6
echo; echo; echo "$title_md LIST MANGLE IP4 TABLE ###" ; echo
$cmd_realpath listn-mangle4
echo; echo; echo "$title_md LIST MANGLE IP6 TABLE ###" ; echo
$cmd_realpath listn-mangle6
echo 
exit; fi
####
####
#### :rutina-final-listn-alltables:
##########    english: list4: The list option   ##########
##########    spanish: list4: La opcion lista   ##########
#### :rutina-inicial-list4:
#### :rutina-inicial-ls4:
####
####
if [ "$first_option" == "list4" ]; then 
echo "$title_md [ list4 ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptableslegacy" -t filter -L INPUT 1 && \
"$command_iptableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptablesnft" -t filter -L INPUT 1 && \
"$command_iptablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$command_iptableslegacy -t filter -v -L $list_rules_conceptual
;;
esac
echo "$text_md"
case $nftcuatro in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_iptablesnft -t filter -v -L $list_rules_conceptual
;;
esac
exit; fi
####
####
#### :rutina-final-ls4:
#### :rutina-final-list4:
##########    english: list6: list ipv6 rules filter           ##########
##########    spanish: list6: lista reglas de filtros de ipv6  ##########
#### :rutina-inicial-list6:
#### :rutina-inicial-ls6:
####
####
if [ "$first_option" == "list6" ]; then  
echo "$title_md [ list6 ] [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$command_ip6tableslegacy" -t filter -L OUTPUT 1 )
nftseis=$("$command_ip6tablesnft" -t filter -L INPUT 1 && \
"$command_ip6tablesnft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tableslegacy -v -L $list_rules_conceptual
;;
esac
echo $text_md
case $nftseis in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tablesnft -v -L $list_rules_conceptual
;;
esac
####
####
exit; fi
####
####
#### :rutina-final-ls6:
#### :rutina-final-list6:
##########    english: listn4: The list option   ##########
##########    spanish: listn4: La opcion lista   ##########
#### :rutina-inicial-listn4:
####
####
if [ "$first_option" == "listn4" ]; then  
echo "$title_md [ list4 ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptableslegacy" -t filter -L INPUT 1 && \
"$command_iptableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptablesnft" -t filter -L INPUT 1 && \
"$command_iptablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$command_iptableslegacy -t filter -v -L -n
;;
esac
echo "$text_md"
case $nftcuatro in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_iptablesnft -t filter -v -L -n
;;
esac
exit; fi
####
####
#### :rutina-final-listn4:
##########    english: listn6: list ipv6 rules filter           ##########
##########    spanish: listn6: lista reglas de filtros de ipv6  ##########
#### :rutina-inicial-listn6:
####
####
if [ "$first_option" == "listn6" ]; then  
echo "$title_md [ list6 ] [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$command_ip6tableslegacy" -t filter -L OUTPUT 1 )
nftseis=$("$command_ip6tablesnft" -t filter -L INPUT 1 && \
"$command_ip6tablesnft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tableslegacy -v -L -n
;;
esac
echo $text_md
case $nftseis in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_ip6tablesnft -v -L -n
;;
esac
####
####
exit; fi
####
####
#### :rutina-final-listn6:
##########    english: status: The list option ipv4 and ipv6    ##########
##########    spanish: status: La opcion lista ipv4 y ipv6      ##########
#### :rutina-inicial-status:
####
####
if [ "$first_option" == "status" ]; then
####
####
$cmd_realpath ls4
####
####
$cmd_realpath ls6
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
$cmd_realpath listn4
####
####
$cmd_realpath listn6
####
####
exit; fi
####
####
#### :rutina-final-statusn:
##########    english: listnum: The list option   ##########
##########    spanish: listnum: La opcion lista   ##########
#### :rutina-inicial-listnum:
####
####
if [ "$first_option" == "listnum" ]; then 
echo "$title_md [ list ] [ List numerical filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_iptableslegacy" -t filter -L INPUT 1 && \
"$command_iptableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_iptablesnft" -t filter -L INPUT 1 && \
"$command_iptablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip4"
echo
case $legacycuatro in
"$NULL")
echo "$title_md $text_info [ Without rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$command_iptableslegacy -t filter -v -L -n
;;
esac
echo "$text_md"
case $nftcuatro in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$command_iptablesnft -t filter -v -L -n
;;
esac
exit; fi
####
####
#### :rutina-final-listnum:
##########    english: listnum6: The list option   ##########
##########    spanish: listnum6: La opcion lista   ##########
#### :rutina-inicial-listnum6:
####
####
if [ "$first_option" == "listnum6" ]; then 
echo "$title_md [ list ] [ List numerical filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$command_ip6tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_ip6tablesnft" -t filter -L INPUT 1 && \
"$command_ip6tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip6"
echo
case $legacycuatro in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] \
[ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t filter -v -L -n
;;
esac
echo "$text_md"
case $nftcuatro in
"$NULL") echo "$title_md $text_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ listing rules .. ]" ;;
*)
echo "$title_md $text_ok [ With rules nftables ] \
[ iptables-nft ] [ $fromrules ]" 
echo
$command_iptablesnft -t filter -v -L -n
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
echo "$title_md [ $first_option ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md $text_ok [ With rules xtables ] \
[ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t filter -v -L $list_rules_conceptual
echo
echo "$title_md $text_ok [ With rules nftables ] \
[ iptables-nft ] [ $fromrules ]" 
echo
$command_iptablesnft -t filter -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List filter forward ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t filter -v -L FORWARD $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t filter -v -L FORWARD $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tableslegacy -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]" 
echo
$command_ip6tablesnft -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List filter forward ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t filter -v -L FORWARD $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t filter -v -L FORWARD $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List nat ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t nat -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t nat -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List nat ipv6] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip6"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t nat -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t nat -v -L $list_rules_conceptual 
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
echo "$title_md [ $first_option ] [ List filter ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md $text_info [ With rules netfilter ] [ iptables-nft ] [ $fromrules ]"  
echo
$command_iptableslegacy -v -L -n 
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -v -L -n
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
echo "$title_md [ $first_option ] [ List filter forward ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t filter -v -L FORWARD -n
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t filter -v -L FORWARD -n
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
echo "$title_md [ $first_option ] [ List filter ipv6 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tableslegacy -v -L -n
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$command_ip6tablesnft -v -L -n
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
echo "$title_md [ $first_option ] [ List filter forward ipv6 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t filter -v -L FORWARD -n
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t filter -v -L FORWARD -n
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
echo "$title_md [ $first_option ] [ List mangle ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t mangle -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t mangle -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List mangle ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip6"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t mangle -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t mangle -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List raw ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t raw -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t raw -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List raw ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip6"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t raw -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t raw -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List security ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_iptableslegacy -t security -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_iptablesnft -t security -v -L $list_rules_conceptual
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
echo "$title_md [ $first_option ] [ List security ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip6"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip6tableslegacy -t security -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip6tablesnft -t security -v -L $list_rules_conceptual
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
echo "$title_md $text_info [ ebtables: filter ethernet ] [ $fromrules ]"
echo
$command_ebtables -L -t filter
echo
echo "$title_md $text_info [ ebtables: nat ethernet ] [ $fromrules ]"
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
echo "$title_md $text_info [ arptables: filter arptables ] [ $fromrules ]"
echo
$command_arptables -L
exit; fi
####
####
#### :rutina-final-list-arptables:
##########    english: clone-wallsystem: clone config file static static               ##########
##########    spanish: clone-wallsystem: clona archivo de configuracion prediseniado   ##########
#### :rutina-inicial-clone-wallsystem:
####
####
if [ "$first_option" == "clone-wallsystem" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$text_md $text_info [ usage: ] [ $cmd_realpath clone-wallsystem firewall ]"
exit; fi
####
####
if [ "$first_option" == "clone-wallsystem" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
case $archivo in shield-*);;client-*);; game-*);; games-*);; server-*);;
*) echo "$title $text_fail choose a valid system firewall to clone" ; exit ;; esac
$cmd_realpath code $second_option | $command_grep -E "client_|server_|config_|allow_|net_" \
&> $default_directory_custom/$archivo
if [ -s "$default_directory_custom/$archivo" ] ; then 
cat $default_directory_custom/$archivo ;
echo "$title_md $text_ok Created custom : $archivo  "
echo "$title_md $text_info Modify  : fwiptables modify-custom $archivo  "
echo "$title_md $text_info Launch  : fwiptables load-custom $archivo  "
else rm $default_directory_custom/$archivo
echo "$title_md $text_info choose one valid wallsystem to clone to custom"
echo "$title_md $text_fail config no done $archivo" ; fi
exit; fi
####
####
#### :rutina-final-clone-wallsystem:
##########    english: new-full-custom: new-full-custom option to create new configs   ##########
##########    spanish: new-full-custom: new-full-custom para cear nuevas config        ##########
#### :rutina-inicial-new-full-custom:
####
####
if [ "$first_option" == "new-full-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$text_md $text_info [ usage: ] [ $cmd_realpath new-full-custom config-new ]"
exit; fi
####
####
if [ "$first_option" == "new-full-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_fullcfg_eng" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-new-full-custom:
##########    english: nueva-completa-custom: create new configs                             ##########
##########    spanish: nueva-completa-custom: nueva-completa-custom para cear nuevas config  ##########
#### :rutina-inicial-nueva-completa-custom:
####
####
if [ "$first_option" == "nueva-completa-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$text_md $text_info [ usage: ] [ $cmd_realpath nueva-completa-custom config-nueva ]"
exit; fi
####
####
if [ "$first_option" == "nueva-completa-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_fullcfg_spa" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-nueva-completa-custom:
##########    english: new-mini-custom: create new configs   ##########
##########    spanish: new--mini config: cea nuevas config   ##########
#### :rutina-inicial-new-mini-custom:
####
####
if [ "$first_option" == "new-mini-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$text_md $text_info [ usage: ] [ $cmd_realpath new-mini-custom config-new ]"
exit; fi
####
####
if [ "$first_option" == "new-mini-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_minicfg_eng" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-new-mini-custom:
##########    english: nueva-mini-custom: create new configs   ##########
##########    spanish: nueva-mini-custom: crea nuevas config   ##########
#### :rutina-inicial-nueva-mini-custom:
####
####
if [ "$first_option" == "nueva-mini-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
echo "$text_md $text_info [ usage: ] [ $cmd_realpath nueva-mini-custom config-nueva ]"
exit; fi
####
####
if [ "$first_option" == "nueva-mini-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_minicfg_spa" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-nueva-mini-custom:
##########    english: modify-custom: modify a one config.cfg        ##########
##########    spanish: modify-custom: modify una configuracion.cfg   ##########
#### :rutina-inicial-modify-custom:
####
####
if [ "$first_option" == "modify-custom" ]; then 
####
###
if [ ! -f "$default_directory_custom/$second_option" ] ; then $nada
$cmd_realpath names-custom
echo "$text_md $text_info [ usage: ] [ $cmd_realpath modify-custom config-existent ]"
exit; fi
####
####
if [ -f "$default_directory_custom/$second_option" ] ; then $nada
cp "$default_directory_custom/$second_option" "$default_directory_cache/$second_option" &> /dev/null
$favorite_text_editor "$default_directory_custom/$second_option"
echo "$title_md $text_ok [ load-custom file $second_option ]"
clear; fi
####
####
clear ; exit ; fi
####
####
#### :rutina-final-modify-custom:
##########    english: show-custom: show a one config          ##########
##########    spanish: show-custom: muestra una configuracion  ##########
#### :rutina-inicial-show-custom:
####
####
if [ "$first_option" == "show-custom" ] ; then 
####
####
if [ ! -f "$default_directory_custom"/"$second_option" ] ; then 
echo "$title_md $text_info [ Usage: $cmd_realpath show-custom config-cfg ]" ; exit; fi
####
####
if [ -f "$default_directory_custom"/"$second_option" ] ; then 
cat $default_directory_custom/$second_option ;
echo  ; exit ; fi
####
####
exit; fi
####
####
#### :rutina-final-show-custom:
##########    english: del-custom: delete a old config               ##########
##########    spanish: del-custom: elimina una vieja configuracion   ##########
#### :rutina-inicial-del-custom:
####
####
if [ "$first_option" == "del-custom" ]; then 
####
####
if [ ! -f $default_directory_custom/$second_option ] ; then
echo "$title_md $text_info [ usage: ] [ $cmd_realpath del-custom config-old ]"
exit ; fi
####
####
if [ -f $default_directory_custom/$second_option ] ; then
rm $default_directory_custom/$second_option
echo "$default_directory_custom/$second_option Deleted"
echo  ; exit ; fi
####
####
exit ; fi
####
####
#### :rutina-final-del-custom:
##########    english: names: file list whith rules in iptables format          ##########
##########    spanish: names: lista de archivos con reglas en formato iptables  ##########
#### :rutina-inicial-names:
####
####
if [ "$first_option" == "names" ]; then 
echo "$title_md [ $first_option ] [ List names from firewall saved ] "
echo "$title_md $text_info [ list configs files in standard format ]"
echo "$title_md $text_info [ folder ] [ $default_directory_control ]"
echo 
echo "$title_md $text_info [ Listing firewall names ]"
$command_ls -1 $default_directory_control | $command_sed s/\-legacy\-ipv6//g | \
$command_sed s/\-nft\-ipv6//g | \
$command_sed s/\-legacy\-ipv4//g | $command_sed s/\-nft\-ipv4//g | \
$command_sed s/\-arptables//g | $command_sed s/\-ebtables//g | sort -u 
echo
echo "$title_md $text_ok [ Listed firewall names ]"
exit; fi
####
####
#### :rutina-final-names:
##########    english: reset: reset counter rules            ##########
##########    spanish: reset: resetea contadores de reglas   ##########
#### :rutina-inicial-reset:
####
####
if [ "$first_option" == "reset" ]; then 
echo "$title_md $text_info [ Reseting the firewall ]"
$cmd_realpath stop &> /dev/null
$cmd_realpath continue &> /dev/null
echo "$title_md $text_ok [ firewall reseted ]"
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
echo "$title_md fwiptables. Firewall With iptables.   [ intro md ] "
echo "$text_md"
echo "$text_md The fwiptables is a one-file WIZARD,     "
echo "$text_md  for iptables, with COMMAND-LINE,          "
echo "$text_md  and CLI-MENU, and GUI-MENU,               "
echo "$text_md  and GUI-ROLL, and GUI-SHELL.              "
echo "$text_md"
echo "$text_md From one system firewall to choose one,   "
echo "$text_md  with eraserules, or template custom,       "
echo "$text_md  with new wizard-mini or wizard-full,       "  
echo "$text_md  with added comments rules in firewall.     "
echo "$text_md"
echo "$text_md With rules ipv4, rules ipv6, ebtables, arptables,  "
echo "$text_md  with netfilter neftables, netfilter xtables,        "
echo "$text_md  with tools ip, wizards for generate new rules,      "
echo "$text_md  with save/load rules with files standard iptables,  "
echo "$text_md  with shield to ssh or other servers choosed,        "         
echo "$text_md  with limit bandwidth, string word,                  "
echo "$text_md  with host whitelist, host blacklist,                "
echo "$text_md  with other more capabilities of firewall.           "
echo "$text_md"
echo "$text_md"
echo "$title_md  fwiptables location.                    "
echo "$text_md"
echo "$text_md  File    Location:   $cmd_directory/$cmd_file     "
echo "$text_md  Config Directory:   $directory_data_necesary     "
echo "$text_md  Cache  Directory:   $default_directory_cache     "
echo "$text_md"
echo "$title_md fwiptables install.                     "
echo "$text_md"
echo "$text_md  su root TYPE: su root                       "    
echo "$text_md  put bit TYPE: chmod 755 ./$cmd_basename     "
echo "$text_md  install TYPE: ./$cmd_basename install       " 
echo "$text_md"
echo "$title_md fwiptables uninstall.                   "
echo "$text_md"
echo "$text_md  uninstall TYPE: $cmd_file uninstall  "
echo "$text_md"
$cmd_realpath version
echo "$text_md"
$cmd_realpath notes
echo "$text_md"
$cmd_realpath compile
echo "$text_md"
$cmd_realpath examples
echo "$text_md"
echo "$title_md"
echo "$title_md"
echo "$title_md [ options ] [ List general options for fwiptables ] [ list-options md ]"
echo "$text_md"
$cmd_realpath options
echo "$text_md"
$cmd_realpath optional-output
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
echo "$title_md [ $first_option ]"
echo "$title_md launch: fwiptables ip-forward [ list | on | off ]" ; exit ; fi
####
####
if   [ "$second_option" == "list" ]; then
echo "$title_md [ $first_option ]  [ Show ip forwading in kernel ] "
echo "$title_md [ Actived 1 or deactived 0 ] [ ipforwading with sysctl ]"
$command_sysctl -a | $command_grep -i  forwarding ; exit ; fi
####
####
if   [ "$second_option" == "on" ]; then
echo "$title_md [ $first_option ]  [ Activating.. ip forwading in kernel ]"
for a in $($command_sysctl -a | $command_grep -i  forwarding | $command_cut -d " " -f 1)
do $command_sysctl -w $a=1 ; done ; exit ; fi
####
####
if   [ "$second_option" == "off" ]; then
echo "$header_ok [ $first_option ]  [ Deactivating.. ip forwading in kernel ]"
for a in $($command_sysctl -a | $command_grep -i  forwarding | $command_cut -d " " -f 1)
do $command_sysctl -w $a=0 ; done ; exit; fi
####
####
echo "$title_md launch: fwiptables ip-forward [ list | on | off ]" ; exit ; fi
####
####
#### :rutina-final-ip-forward:
##########   english: download:   where download fwiptables    ##########
##########   spanish: download:   donde descargar fwiptables   ##########
#### :rutina-inicial-download:
####
####
if [ "$first_option" == "download" ] ; then 
echo "$title_md [ $first_option ] [ $cmd_realpath download ] [ download md ] "
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
echo "$title_md $text_info [ uninstaller ] [ uninstall md ] "
rm $cmd_directory/$cmd_file &> /dev/null
echo "$title_md $text_ok [ deleted binary $cmd_directory/$cmd_file ]"
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
echo "$text_md $text_md       Installing:  $cmd_file"
echo "$text_md $text_md          Version:  $cmd_version"
echo "$text_md $text_md           format:  $cmd_format"
####
####
####  english: copy the file to temporal folder and install
####  spanish: copia el archivo a carpeta final
#### 
#### 
#### echo "$title_md $text_info [ $cmd_file installing.. ]"
cp $cmd_realpath $cmd_directory/$cmd_file
chmod 555 "$cmd_directory/$cmd_file" &> /dev/null 
####
####
####  english: generate fwiptables default config and templates
####  spanish: genera fwiptables default configuracion y plantillas
####
####
$cmd_directory/$cmd_file preferences-regen &> /dev/null
$cmd_directory/$cmd_file config-regen &> /dev/null
####
####
####   english: Show final status from installer
####   spanish: Muestra el estatus final desde el instalador
####
####
echo "$text_md $text_md The Command file:  $cmd_directory/$cmd_file"
echo "$text_md $text_md The  config  dir:  $directory_data_necesary"
echo "$text_md $text_md The   cache  dir:  $default_directory_cache"
exit; fi
####
####
#### :rutina-final-install:
##########    english: expert-gen-readme: generate installed respository   ##########
##########    spanish: expert-gen-readme: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-readme:
####
####
if   [ "$first_option" == "expert-gen-readme" ]; then 
echo "$title_md [ $first_option ]  [ generate actual file and readme ] "
#### create the file base in repository
cp $0 $default_directory_readme/fwiptables_version_$cmd_version
echo "$title_md $text_ok Created $default_directory_readme/fwiptables_version_$cmd_version"
#### create the README base in repository
$default_directory_readme/fwiptables_version_$cmd_version intro > $default_directory_readme/README
echo "$title_md $text_ok Created $default_directory_readme/README "
$default_directory_readme/fwiptables_version_$cmd_version  intro > $default_directory_readme/README.md
echo "$title_md $text_ok Created $default_directory_readme/README.md"
exit; fi
####
####
#### :rutina-final-expert-gen-readme:
##########    english: expert-gen-deb: generate installed respository   ##########
##########    spanish: expert-gen-deb: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-deb:
####
####
if   [ "$first_option" == "expert-gen-deb" ]; then
echo "$title_md [ $first_option ]  [ generate actual file debian ] "
#### recreate the directories
rm -R $default_directory_debian/deb/usr/bin &> /dev/null
rm -R $default_directory_debian/deb/DEBIAN &> /dev/null
mkdir -p $default_directory_debian/deb/usr/bin &> /dev/null
mkdir -p $default_directory_debian/deb/DEBIAN &> /dev/null
#### create the control file
echo "Package: fwiptables"      &>  $default_directory_debian/deb/DEBIAN/control
echo "Priority: optional"       &>> $default_directory_debian/deb/DEBIAN/control
echo "Section: misc"            &>> $default_directory_debian/deb/DEBIAN/control
echo "Maintainer: f-iptables"   &>> $default_directory_debian/deb/DEBIAN/control
echo "Architecture: all"        &>> $default_directory_debian/deb/DEBIAN/control
echo "Version: $cmd_version"    &>> $default_directory_debian/deb/DEBIAN/control
echo "Depends: "                &>> $default_directory_debian/deb/DEBIAN/control
echo "Description: $cmd_shortdescription ." &>> $default_directory_debian/deb/DEBIAN/control
echo " $cmd_longdescription ."  &>> $default_directory_debian/deb/DEBIAN/control
#### it are file modes
chown root:root $default_directory_debian/* -R  &> /dev/null
chmod 755 $default_directory_debian/* -R &> /dev/null
#### it does the debian package
$command_dpkg -b $default_directory_debian/deb/ $default_directory_debian/fwiptables_noarch_$cmd_version.deb && \
echo "$text_md $text_ok file write in $default_directory_debian/fwiptables_noarch_$cmd_version.deb "
#### delette the directories
rm -R $default_directory_debian/deb/usr/bin &> /dev/null
rm -R $default_directory_debian/deb/DEBIAN  &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-expert-gen-deb:
##########    english: expert-show-geoip: host to resolve and locate       ##########
##########    spanish: expert-show-geoip: host para resolver y localizar   ##########
#### :rutina-inicial-expert-show-geoip:
####
####
if   [ "$first_option" == "expert-show-geoip" ]; then 
echo "$title_md [ $first_option ]  [ resolve the location to one ip or host ] "
echo ; case $command_geoiplookup in "$NULL")
echo "$text_md $text_fail [ Install geoiplookup command ]" ; exit  ;; esac
case "$second_option" in "$NULL")
echo "$title_md Selecting host geoip to fast.com for default"
trazador="fast.com" ;; *) trazador="$second_option" ;; esac
echo "$title_md $text_ok [ geoiplookup -i $trazador ]"
$command_geoiplookup -i $trazador
echo 
exit; fi
####
####
#### :rutina-final-expert-show-geoip:
##########    english: nodes: listen at dump from conexiones arp    ##########
##########    spanish: nodes: escucha al volcado de conexiones arp  ##########
#### :rutina-inicial-nodes:
####
####
if   [ "$first_option" == "nodes" ]; then 
echo "$title_md [ $first_option ] [ Show the list arp-scan in the lan ] "
if [ "$command_arpscan" == "$NULL" ]; then
echo "$title_md $text_fail [ install arp-scan command ]" ; exit ; fi
echo "$title_md $text_info [ local net: ip lan .. ]"
$command_ip -4 route | $command_grep -i -v default
echo "$title_md $text_info [ local scan: arp lan scan .. ]"
$command_timeout -s SIGINT -v $time_server_waiting $command_arpscan -l -x
exit; fi
####
####
#### :rutina-final-nodes:
##########    english: license-gpl: license gpl v2   ##########
##########    spanish: license-gpl: license gpl v2   ##########
#### :rutina-inicial-license-gpl:
####
####
if [ "$first_option" == "license-gpl" ]; then 
echo "$title_md [ $first_option ] \
[ Show license from git sourceforge for $cmd_realpath ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for $first_option downloading"
echo
echo ..................................................................
echo
$command_curl -L $content_license_gpl --stderr /dev/null
exit;  fi
####
####
#### :rutina-final-license-gpl:
##########    english: license-lgpl: license gpl v2   ##########
##########    spanish: license-lgpl: license gpl v2   ##########
#### :rutina-inicial-license-lgpl:
####
####
if [ "$first_option" == "license-lgpl" ]; then 
echo "$title_md [ $first_option ] \
[ Show license from git sourceforge for $cmd_realpath ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for $first_option downloading"
echo
echo ..................................................................
echo
$command_curl -L $content_license_lgpl --stderr /dev/null
exit;  fi
####
####
#### :rutina-final-license-lgpl:
##########    english: license-bsd: license gpl v2   ##########
##########    spanish: license-bsd: license gpl v2   ##########
#### :rutina-inicial-license-bsd:
####
####
if [ "$first_option" == "license-bsd" ]; then 
echo "$title_md [ $first_option ] \
[ Show license from git sourceforge for $cmd_realpath ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for $first_option downloading"
echo
echo ..................................................................
echo
$command_curl -L $content_license_bsd --stderr /dev/null
exit;  fi
####
####
#### :rutina-final-license-bsd:
##########    english: expert-pc-halt: power off computer   ##########
##########    spanish: expert-pc-halt: apaga el ordenador   ##########
#### :rutina-inicial-expert-pc-halt:
####
####
if   [ "$first_option" == "expert-pc-halt" ]; then 
echo "$title_md [ $first_option ] [ power off computer ] [ control-c to cancel ]"
echo "Halt to power off computer ... in 15 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 10 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 05 seconds"
$command_sleep 5
####
####
if [ $command_poweroff != "$NULL" ]; then $command_poweroff & exit ; fi
if [ $command_init != "$NULL" ]; then $command_init 6 & exit ; fi
if [ $command_systemctl != "$NULL" ]; then $command_systemctl poweroff -i & exit ; fi
$command_halt & $command_init 0 & $command_systemctl halt -i
exit; fi
####
####
#### :rutina-final-expert-pc-halt:
##########    english: expert-pc-poweroff: power off computer   ##########
##########    spanish: expert-pc-poweroff: apaga el ordenador   ##########
#### :rutina-inicial-expert-pc-poweroff:
####
####
if   [ "$first_option" == "expert-pc-poweroff" ]; then 
echo "$title_md [ $first_option ] [ power off computer ] [ control-c to cancel ]"
echo "Halt to power off computer ... in 15 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 10 seconds"
$command_sleep 5
echo "Halt to power off computer ... in 05 seconds"
$command_sleep 5
####
####
if [ $command_poweroff != "$NULL" ]; then $command_poweroff & exit ; fi
if [ $command_init != "$NULL" ]; then $command_init 6 & exit ; fi
if [ $command_systemctl != "$NULL" ]; then $command_systemctl poweroff -i & exit ; fi
exit; fi
####
####
#### :rutina-final-expert-pc-poweroff:
##########    english: expert-pc-shutdown: power off computer   ##########
##########    spanish: expert-pc-shutdown: apaga el ordenador   ##########
#### :rutina-inicial-expert-pc-shutdown:
####
####
if   [ "$first_option" == "expert-pc-shutdown" ]; then 
echo "$title_md [ $first_option ] [ power off computer ] [ control-c to cancel ]"
echo "Halt to shutdown computer ... in 15 seconds"
$command_sleep 5
echo "Halt to shutdown computer ... in 10 seconds"
$command_sleep 5
echo "Halt to shutodwn computer ... in 05 seconds"
$command_sleep 5
####
####
if [ $command_shutdown != "$NULL" ]; then $command_shutdown -h now & exit ; fi
if [ $command_init != "$NULL" ]; then $command_init 0 & exit ; fi
if [ $command_systemctl != "$NULL" ]; then $command_systemctl poweroff -i & exit ; fi
exit; fi
####
####
#### :rutina-final-expert-pc-shutdown:
##########    english: expert-pc-reboot: reboot computer         ##########
##########    spanish: expert-pc-reboot: reinicia el ordenador   ##########
#### :rutina-inicial-expert-pc-reboot:
####
####
if   [ "$first_option" == "expert-pc-reboot" ]; then 
echo "$title_md [ $first_option ] [ reboot computer ] [ control-c to cancel ]"
echo "Halt to reboot computer ... in 15 seconds"
$command_sleep 5
echo "Halt to reboot computer ... in 10 seconds"
$command_sleep 5
echo "Halt to reboot computer ... in 05 seconds"
$command_sleep 5
####
####
if [ $command_reboot != "$NULL" ]; then $command_reboot &  exit ; fi
if [ $command_init != "$NULL" ]; then $command_init 6 &  exit ; fi
if [ $command_systemctl != "$NULL" ]; then $command_systemctl reboot -i &  exit ; fi
exit; fi
####
####
#### :rutina-final-expert-pc-reboot:
##########    english: expert-show-newversion: upgrade fwiptables    ##########
##########    spanish: expert-show-newversion: upgrade fwiptables    ##########
#### :rutina-inicial-expert-show-newversion:
####
####
if   [ "$first_option" == "expert-show-newversion" ]; then 
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to show stable latest version"; fi
####
#### actually
####
echo "$title_md Show the version for fwiptables actually installed:"
$cmd_realpath version | $command_grep -E -i "version"
####
#### latest stable
####
echo "$title_md Show the version for fwiptables stable latest:"
descarga="$default_directory_log/fwiptables"
$command_curl $web_download_sourceforge -s -L -o $descarga \
&& chmod ugo+x $descarga && $descarga version | \
$command_grep -E -i "version"
rm $descarga
####
#### latest unstable
####
echo "$title_md Show the version for fwiptables unstable latest:"
descarga="$default_directory_log/fwiptables"
$command_curl $git_download_sourceforge -s -L -o $descarga \
&& chmod ugo+x $descarga && $descarga version | \
$command_grep -E -i "version"
rm $descarga
####
####
exit; fi
####
####
#### :rutina-final-expert-show-newversion:
##########    english: expert-upgrade-stable: upgrade fwiptables    ##########
##########    spanish: expert-upgrade-stable: upgrade fwiptables    ##########
#### :rutina-inicial-expert-upgrade-stable:
####
####
if   [ "$first_option" == "expert-upgrade-stable" ] || [ "$first_option" == "upgrade" ]; then 
####
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download and to install stable latest version"; fi
####
####
echo "$title_md Downloading fwiptables stable latest"
descarga="$default_directory_cache/fwiptables-stable"
$command_curl $web_download_sourceforge -s -L -o $descarga || echo "Without internet" \
&& chmod ugo+x $descarga &> /dev/null && $descarga install && rm $descarga
exit; fi
####
####
#### :rutina-final-expert-upgrade-stable:
##########    english: expert-upgrade-unstable: upgrade fwiptables    ##########
##########    spanish: expert-upgrade-unstable: upgrade fwiptables    ##########
#### :rutina-inicial-expert-upgrade-unstable:
####
####
if   [ "$first_option" == "expert-upgrade-unstable" ]; then 
####
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download and to install unstable latest version"; fi
####
####
echo "$title_md Downloading fwiptables development latest"
descarga="$default_directory_cache/fwiptables-unstable"
$command_curl $git_download_sourceforge -s -L -o $descarga || echo "Without internet" \
&& chmod ugo+x $descarga &> /dev/null && $descarga install && rm $descarga
exit; fi
####
####
#### :rutina-final-expert-upgrade-unstable:
##########    english: compile: compile with obash      ##########
##########    spanish: compile: compila with obash      ##########
#### :rutina-inicial-compile:
####
####
if   [ "$first_option" == "compile" ]; then 
echo "$title_md [ $first_option ] [ Optionally compile from bash script ] [ compile md]  "
echo "$text_md BASH SCRIPT WORKS fully. But if your desire is compiling...    "   
echo "$text_md Necesary fwiptables in source script bash                "   
echo "$text_md Download and install obash from oficial web internet     "   
echo "$text_md Run: obash -s -c -o ./destination.bin ./source-bash.sh   "   
exit; fi
####
####
#### :rutina-final-compile:
##########    english: expert-gen-compile: compile with obash      ##########
##########    spanish: expert-gen-compile: compila with obash      ##########
#### :rutina-inicial-expert-gen-compile:
####
####
if   [ "$first_option" == "expert-gen-compile" ]; then 
echo "$title_md [ $first_option ] \
[  optionally ] [ howto compile bash script with obash ] "
echo "$title_md Compile $cmd_basename" ; echo
if [ "$command_obash" == "$NULL" ]
then echo "$title_md install obash to compile"; exit ; fi
if [ "$command_uuid" == "$NULL" ]
then echo "$title_md install uuid to compile"; exit ; fi
obash_file_date="$default_directory_obash/$cmd_basename-$cmd_version"
cp $cmd_realpath $obash_file_date.bash
$command_obash -r -c -o $obash_file_date.bin $obash_file_date.bash
echo ; echo "$title_md And now list:"
file -L $obash_file_date.bash
file -L $obash_file_date.bin
exit; fi
####
####
#### :rutina-final-expert-gen-compile:
##########    english: expert-upgrade-adblock: compile with obash      ##########
##########    spanish: expert-upgrade-adblock: compila with obash      ##########
#### :rutina-inicial-expert-upgrade-adblock:
####
####
if   [ "$first_option" == "expert-upgrade-adblock" ]; then 
echo "$title_md [ $first_option ]  [ get: blacklist files / adblock files / hosts deny files ]"
####
####
echo "$title_md [ Waiting a moment ] [ downloading blacklist to  directory: $default_directory_adblock ] "
echo "$title_md [ Step 1/4 ] [ downloading hosts fademind to $file_blacklist_fademind ]"
$command_curl $web_blacklist_fademind -s -L -o $file_blacklist_fademind
echo "$title_md [ Step 2/4 ] [ downloading hosts mvps to $file_blacklist_mvps ]"
$command_curl $web_blacklist_mvps -s -L -o $file_blacklist_mvps
echo "$title_md [ Step 3/4 ] [ downloading hosts adaway to $file_blacklist_adaway ]"
$command_curl $web_blacklist_adaway -s -L -o $file_blacklist_adaway
echo "$title_md [ Step 4/4 ] [ downloading hosts stevenblack to $file_blacklist_stevenblack ]"
$command_curl $web_blacklist_stevenblack -s -L -o $file_blacklist_stevenblack
####
####
exit; fi
####
####
#### :rutina-final-expert-upgrade-adblock:
##########    english: info: info of first option            ##########
##########    spanish: info: info of primera opcion          ##########
#### :rutina-inicial-info:
####
####
if   [ "$first_option" == "info" ]; then 
echo "$title_md [ $first_option ]  [ info $second_option ]"
echo "$title_md Launch:  $cmd_realpath [optional-output] info [pattern-to-search]"
$cmd_realpath info-options | $command_grep -i "$second_option"
exit; fi
####
####
#### :rutina-final-info:
##########    english: expert-speed-glx: show frammes with mesa graphicall            ##########
##########    spanish: expert-speed-glx: muestra los fotogramas con graphicos mesa    ##########
#### :rutina-inicial-expert-speed-glx:
####
####
if   [ "$first_option" == "expert-speed-glx" ]; then 
echo "$title_md [ $first_option ]  [ test gl mesa3D speed ] \
[ for default max $time_server_waiting seconds ] "
case $command_glxgears in "$NULL")
echo "$text_md $text_fail [ Install mesa utils ]"; exit ;; esac
vblank_mode=0 $command_timeout -s SIGINT -v $time_server_waiting $command_glxgears
echo 
exit; fi
####
####
#### :rutina-final-expert-speed-glx:
##########    english: expert-speed-disk: benchmark ram with 100Mb    ##########
##########    spanish: expert-speed-disk: benchmark ram con  100Mb    ##########
#### :rutina-inicial-expert-speed-disk:
####
####
if   [ "$first_option" == "expert-speed-disk" ]; then 
echo "$title_md [ $first_option ]  [ test disk speed benchamrk ] \
[ for default max $time_server_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $command_dd in "$NULL")
echo "$text_md $text_fail [ Install dd ]"; exit ;; esac
dd if=/dev/zero of=$default_directory_benchmarkdisk/speed.img \
status=progress bs=10M count=10
rm $default_directory_benchmarkdisk/speed.img &> /dev/null
exit; fi
####
####
#### :rutina-final-expert-speed-disk:
##########    english: expert-speed-ram: benchmark ram with 100Mb    ##########
##########    spanish: expert-speed-ram: benchmark ram con  100Mb    ##########
#### :rutina-inicial-expert-speed-ram:
####
####
if   [ "$first_option" == "expert-speed-ram" ]; then 
echo "$title_md [ $first_option ]  [ test ram speed benchamrk ] \
[ for default max $time_server_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $command_dd in "$NULL")
echo "$text_md $text_fail [ Install dd ]"; exit ;; esac
mount -t tmpfs tmpfs $default_directory_benchmarkram
dd if=/dev/zero of=$default_directory_benchmarkram/speed.img \
status=progress bs=10M count=10
rm $default_directory_benchmarkram/speed.img &> /dev/null
umount $default_directory_benchmarkram
exit; fi
####
####
#### :rutina-final-expert-speed-ram:
##########    english: expert-speed-cpu: benchmark cpu        ##########
##########    spanish: expert-speed-cpu: comparativa cpu      ##########
#### :rutina-inicial-expert-speed-cpu:
####
####
if   [ "$first_option" == "expert-speed-cpu" ]; then
echo "$header_ok [ $first_option ]  [ test cpu processor ] [ calcule pi with 2000 digits ]"
case $command_bc in "$NULL") echo "$tab $text_fail [ Install bc command ]"; exit ;; esac
echo "$duo_md $text_info [ Calculate pi with 2000 digits in only one cpu ]"
echo "$duo_md $text_info [ For example with 2ghz/cpu is 5 seconds aprox. ] "
time echo 'scale=2000; a(1)*4' | $command_bc -l | tail -0 
exit; fi
####
####
#### :rutina-final-expert-speed-cpu:
##########    english: ntpdate-client: update the date and time    ##########
##########    spanish: ntpdate-client: actualiza la fecha y hora   ##########
#### :rutina-inicial-ntpdate-client:
####
####
if   [ "$first_option" == "ntpdate-client" ]; then 
echo "$title_md [ $first_option ] \
[ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]; then
echo "$text_md $text_fail [ Install one ntp client ]" ; fi
echo "$text_md Old date: $show_actual_date"
echo "$text_md [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $show_actual_date"
exit; fi
####
####
#### :rutina-final-ntpdate-client:
##########    english: wizard: wizard-mini      ##########
##########    spanish: wizard: mini-asistente   ##########
#### :rutina-inicial-wizard:
####
####
if [ "$first_option" == "wizard" ]; then echo 
echo
echo
echo Please use wizard-full or use wizard-mini
echo
echo
####
####
exit; fi
####
####
#### :rutina-final-wizard:
##########    english: wizard-mini: wizard-mini      ##########
##########    spanish: wizard-mini: mini-asistente   ##########
#### :rutina-inicial-wizard-mini:
####
####
if [ "$first_option" == "wizard-mini" ]; then echo 
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-mini" ; name_firewall="wizard-mini"
$cmd_realpath config-regen
cp "$default_minicfg_eng" "$default_directory_cache/$cmd_file-$archivo"
$favorite_text_editor "$default_directory_cache/$cmd_file-$archivo"
clear
$favorite_realpath_textdialog --clear --title "Run this wizard" \
--yesno "Run this wizard" 0 0 && clear \
&& cp "$default_directory_cache/$cmd_file-$archivo" \
"$default_directory_custom/$archivo" && $cmd_realpath load-custom $archivo || clear
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
$cmd_realpath config-regen
cp "$default_fullcfg_eng" "$default_directory_cache/$cmd_file-$archivo"
$favorite_text_editor "$default_directory_cache/$cmd_file-$archivo"
clear
$favorite_realpath_textdialog --clear --title "Run this wizard" --yesno \
"Run this wizard" 0 0 && clear && \
cp "$default_directory_cache/$cmd_file-$archivo" "$default_directory_custom/$archivo" \
&& $cmd_realpath load-custom $archivo || clear 
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
if [ "second_option" == "$NULL" ]; then
$cmd_realpath names ; echo "$text_md $text_info \
[ usage: $cmd_realpath load fw-to-load ] \
[ See: $cmd_realpath names ]" ; exit ; fi
echo "$title_md $text_info [ loading firewall control $second_option ]"
####
####
if [ -f $default_directory_control/$second_option-nft-ipv4 ] && \
[ -f $default_directory_control/$second_option-legacy-ipv4 ] ; then 
$cmd_realpath eraserules &> /dev/null
if [ -f "$default_directory_control/$second_option-ebtables" ]; then
cat $default_directory_control/$second_option-ebtables | \
$command_ebtables-restore &> /dev/null; fi
if [ -f "$default_directory_control/$second_option-arptables" ]; then
cat $default_directory_control/$second_option-arptables | \
$command_arptables-restore &> /dev/null; fi
####
#### 
cat $default_directory_control/$second_option-nft-ipv4 |  $command_iptablesnft-restore       
cat $default_directory_control/$second_option-legacy-ipv4 | $command_iptableslegacy-restore  
cat $default_directory_control/$second_option-nft-ipv6 | $command_ip6tablesnft-restore       
cat $default_directory_control/$second_option-legacy-ipv6 | $command_ip6tableslegacy-restore 
#### echo "$title_md $text_ok [ firewall loaded ] [ name: $second_option ]"
echo "$title_md $text_ok [ Launched: firewall ] [ Type: control ] [ Name: $second_option ]"
####
####
else
$cmd_realpath names
echo "$text_md $text_info [ usage: $cmd_realpath load fw-to-load ] [ See: $cmd_realpath names ]"
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
case "$second_option" in
"$NULL") echo "$text_md $text_info [ Usage: $cmd_realpath save fw-to-save ]"
exit ;;
*) archivofin="$second_option" ;; 
esac
####
####
if [ "$command_arptables" == "$NULL"  ]; then $nada ; else
$command_arptables-save &> $default_directory_control/$archivofin-arptables; fi
if [ "$command_ebtables"  == "$NULL"  ]; then $nada ; else
$command_ebtables-save &> $default_directory_control/$archivofin-ebtables; fi
####
####
if [ "$command_iptablesnft"  == "$NULL"  ]; then $nada ; else
$command_iptablesnft-save      &> $default_directory_control/$archivofin-nft-ipv4 ; fi
if [ "$command_ip6tablesnft"  == "$NULL"  ]; then $nada ; else
$command_ip6tablesnft-save      &> $default_directory_control/$archivofin-nft-ipv6 ; fi
if [ "$command_iptableslegacy"  == "$NULL"  ]; then $nada ; else
$command_iptableslegacy-save    &> $default_directory_control/$archivofin-legacy-ipv4 ; fi
if [ "$command_ip6tableslegacy"  == "$NULL"  ]; then $nada ; else
$command_ip6tableslegacy-save   &> $default_directory_control/$archivofin-legacy-ipv6 ; fi
####
####
echo "$title_md $text_ok [ firewall saved ] [ name: $archivofin ]"
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
"$NULL") $cmd_realpath names
echo "$text_md $text_info [ Use: $cmd_realpath show file-to-show ]" ; exit ;;
*) archivofin=$($command_sed 's/\///g' <<< "$second_option") ;;
esac
####
####
if [ ! -f "$default_directory_control/$archivofin-nft-ipv4" ];
then  $cmd_realpath names ; exit ; fi
####
####
$command_ls -l $default_directory_control/$archivofin-arptables
$command_ls -l $default_directory_control/$archivofin-ebtables
$command_ls -l $default_directory_control/$archivofin-nft-ipv4
$command_ls -l $default_directory_control/$archivofin-nft-ipv6
$command_ls -l $default_directory_control/$archivofin-legacy-ipv4
$command_ls -l $default_directory_control/$archivofin-legacy-ipv6
echo "$title_md $text_ok [ FIREWALL LISTED ] [ $archivofin ]"
echo "$title_md $archivofin-arptables"
cat $default_directory_control/$archivofin-arptables
echo "$title_md $archivofin-ebtables"
cat $default_directory_control/$archivofin-ebtables
echo "$title_md $archivofin-nft-ipv4"
cat $default_directory_control/$archivofin-nft-ipv4
echo "$title_md $archivofin-legacy-ipv4"
cat $default_directory_control/$archivofin-legacy-ipv4
echo "$title_md $archivofin-nft-ipv6"
cat $default_directory_control/$archivofin-nft-ipv6
echo "$title_md archivofin-legacy-ipv6"
cat $default_directory_control/$archivofin-legacy-ipv6
echo "$title_md $text_ok [ firewall readed ] [ $archivofin ]"
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
$command_arptables-save          &> $default_directory_control/$cmd_file-actual-arptables
$command_ebtables-save           &> $default_directory_control/$cmd_file-actual-ebtables   
$command_iptablesnft-save       &> $default_directory_control/$cmd_file-actual-nft-ipv4   
$command_iptableslegacy-save    &> $default_directory_control/$cmd_file-actual-legacy-ipv4
$command_ip6tablesnft-save      &> $default_directory_control/$cmd_file-actual-nft-ipv6   
$command_ip6tableslegacy-save   &> $default_directory_control/$cmd_file-actual-legacy-ipv6
echo "$title_md arptables $title_md"
cat $default_directory_control/$cmd_file-actual-arptables
echo "$title_md ebtables $title_md"
cat $default_directory_control/$cmd_file-actual-ebtables
echo "$title_md nft with ipv4 $title_md"
cat $default_directory_control/$cmd_file-actual-nft-ipv4
echo "$title_md legacy with ipv4 $title_md"
cat $default_directory_control/$cmd_file-actual-legacy-ipv4
echo "$title_md nft with ipv6 $title_md"
cat $default_directory_control/$cmd_file-actual-nft-ipv6
echo "$title_md legacy with ipv6 $title_md"
cat $default_directory_control/$cmd_file-actual-legacy-ipv6
echo
echo "  $text_ok [ readed firewall actual ]"
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
$command_arptables-save &> $default_directory_control/$cmd_file-stoped-arptables
$command_ebtables-save &> $default_directory_control/$cmd_file-stoped-ebtables             
$command_iptablesnft-save &> $default_directory_control/$cmd_file-stoped-nft-ipv4         
$command_iptableslegacy-save &> $default_directory_control/$cmd_file-stoped-legacy-ipv4   
$command_ip6tablesnft-save &> $default_directory_control/$cmd_file-stoped-nft-ipv6        
$command_ip6tableslegacy-save &> $default_directory_control/$cmd_file-stoped-legacy-ipv6  
####
####
#### english: erase the rules #### spanish: borra las reglas
####
####
$cmd_realpath eraserules &> /dev/null
echo "$title_md $text_info [ stopping firewall ]"
echo "$title_md $text_ok [ firewall stopped  ]"
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
echo "$title_md [ $first_option ]  [ Continue the stopped firewall ] "
####
####
#### english: restore last fw #### spanish: restaura el ultimo fw
####
####
cat $default_directory_control/$cmd_file-stoped-arptables | $command_arptables-restore
cat $default_directory_control/$cmd_file-stoped-ebtables | $command_ebtables-restore
cat $default_directory_control/$cmd_file-stoped-nft-ipv4 | $command_iptablesnft-restore  
cat $default_directory_control/$cmd_file-stoped-legacy-ipv4 | $command_iptableslegacy-restore  
cat $default_directory_control/$cmd_file-stoped-nft-ipv6 | $command_ip6tablesnft-restore  
cat $default_directory_control/$cmd_file-stoped-legacy-ipv6 | $command_ip6tableslegacy-restore  
echo "$title_md $text_info [ continue firewall  ]"
echo "$title_md $text_ok [ firewall continued ]"
exit; fi
####
####
#### :rutina-final-continue:
##########    english: config-eng: several options to config in english        ##########
##########    spanish: config-eng: varias opciones para configurar en ingles   ##########
#### :rutina-inicial-config-eng:
####
####
if [ "$first_option" == "config-eng" ]; then 
echo "$title_md [ $first_option ] [ show variables cfg from english configuration ] "
cat  $default_fullcfg_eng
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
cat $default_fullcfg_spa
exit; fi
####
####
#### :rutina-final-config-spa:
##########    english: add-whitelist4: whitelist temporally ipv4    ##########
##########    spanish: add-whitelist4: lista blanca temporal ipv4   ##########
#### :rutina-inicial-add-wihtelist4
####
####
if [ "$first_option" == "add-whitelist4" ] || [ "$first_option" == "expert-add-whitelist4" ]  ; then
if [ "$2" == "$NULL" ]; then echo "$title_md $text_fail type host ip4 or net ip4 to be in whitelist"; exit ; fi
echo "$title_md [ Working ] ADD temporally ipv4 rules whitelist: ACCEPT to $2"
$command_iptablesnft    -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 1/4 || echo fail rule 1/4
$command_iptablesnft    -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 2/4 || echo fail rule 2/4
$command_iptableslegacy -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 3/4 || echo fail rule 3/4
$command_iptableslegacy -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 4/4 || echo fail rule 4/4
exit; fi
####
####
#### :rutina-final-add-wihtelist4
##########    english: add-whitelist6: whitelist temporally ipv6    ##########
##########    spanish: add-whitelist6: lista blanca temporal ipv6   ##########
#### :rutina-inicial-add-wihtelist6
####
####
if [ "$first_option" == "add-whitelist6" ] || [ "$first_option" == "expert-add-whitelist6" ]  ; then
if [ "$2" == "$NULL" ]; then echo "$title_md $text_fail type host ip6 or net ip6 to be in whitelist"; exit ; fi
echo "$title_md [ Working ] ADD temporally ipv6 rules whitelist: ACCEPT to $2"
$command_ip6tablesnft    -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 1/4 || echo fail rule 1/4
$command_ip6tablesnft    -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 2/4 || echo fail rule 2/4
$command_ip6tableslegacy -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 3/4 || echo fail rule 3/4
$command_ip6tableslegacy -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 4/4 || echo fail rule 4/4
exit; fi
####
####
#### :rutina-final-add-wihtelist6
##########    english: speed-ip4: speed from internet        ##########
##########    spanish: speed-ip4: velocidad desde internet   ##########
#### :rutina-inicial-speed-ip4:
####
####
if   [ "$first_option" == "speed-ip4" ]; then 
echo "$title_md [ $first_option ]  [ test speed ipv4 with iperf ] "
echo "$title_md $cmd_basename use or iperf or iperf3"
if [ "$favorite_iperf_command" == "$NULL" ];
then echo "$title_md $text_fail install iperf";
else echo "$title_md $text_ok [ choosed iperf ]"; fi
echo "$title_md"
# echo "$title_md [ Working ] Saving firewall before speed-ip4"
$cmd_realpath save before-speed-ip4
$cmd_realpath add-whitelist4 $serverip_iperf_ipv4
echo "$title_md"
echo "$title_md [ Calculing speed .. ]"
echo "$title_md [ Working ] Conecting in ipv4 to $serverip_iperf_ipv4 ]"
$favorite_iperf_command -4 -t 4 -c $serverip_iperf_ipv4 -p $serverport_iperf_ipv4
echo "$title_md"
echo "$title_md [ Working ] [ Restoring firewall ]"
$cmd_realpath load before-speed-ip4 
echo "$title_md [ Done ] $cmd_basename speed-ip4"
####
####
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
echo "$title_md [ $first_option ]  [ test speed ipv6 with iperf ] "
echo "$title_md $cmd_basename use or iperf or iperf3"
if [ "$favorite_iperf_command" == "$NULL" ];
then echo "$title_md $text_fail install iperf";
else echo "$title_md $text_ok [ choosed iperf ]"; fi
$cmd_realpath save before-speed-ip6 
$cmd_realpath add-whitelist6 $serverip_iperf_ipv6
echo "$title_md"
echo "$title_md [ Calculing speed .. ]"
echo "$title_md [ Working ] Conecting in ipv6 to $serverip_iperf_ipv4 ]"
$favorite_iperf_command -6 -t 4 -P 1 -c $serverip_iperf_ipv6 -p $serverport_iperf_ipv6 
echo "$title_md"
echo "$title_md [ Working ] [ Restoring firewall ]"
$cmd_realpath load before-speed-ip6 
echo "$title_md [ Done ] $cmd_basename speed-ip6"
####
####
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
echo "$title_md [ $first_option ] [ Show whith ss: LISTEN sockets ] "
if [ "$command_ss" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install ss command ]"; exit; fi
if [ "$command_awk" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install awk command ]"; exit; fi
$command_ss -l -460  | $command_grep "\:\*" | \
$command_awk '{print "     " $1 " " $2 " " $5}' ;
exit; fi
####
####
#### :rutina-final-sockets:
##########    english: web: browse the   web ##########
##########    spanish: web: navega en la web ##########
#### :rutina-inicial-web:
####
####
if   [ "$first_option" == "web" ]; then 
echo "$title_md [ $first_option ] [ Show one web with command text browser ]"
####
####
if [ "$favorite_text_browser" == "$NULL" ]; then 
echo "### install: or lynx, or links, or links2, or w3m"; exit ; fi
####
####
if [ "$2" == "$NULL" ]; then 
echo "### type a one link web"; exit ; fi
####
####
url_browse_web="$2"
echo "###"
echo "### With the  browser: $favorite_text_browser"
echo "### With the link web: $2"
echo "###"
####
####
$favorite_text_browser -dump $url_browse_web
####
####
exit; fi
####
####
#### :rutina-final-web:
##########    english: expert-project-web: browse the   web project      ##########
##########    spanish: expert-project-web: navega en la web del proyecto ##########
#### :rutina-inicial-expert-project-web:
####
####
if   [ "$first_option" == "expert-project-web" ]; then 
echo "$title_md [ $first_option ] [ version - date - size - downloaded last week ]"
####
####
$cmd_basename web "http://sourceforge.net/projects/f-iptables/files/" \
 | grep bash.sh | grep -i kb
####
####
exit; fi
####
####
#### :rutina-final-expert-project-web:
##########    english: browser-web: browse the   web ##########
##########    spanish: browser-web: navega en la web ##########
#### :rutina-inicial-expert-browser-web:
####
####
if   [ "$first_option" == "expert-browser-web" ]; then 
echo "$title_md [ $first_option ] [ Show one web with command text browser ]"
####
####
if [ "$favorite_text_browser" == "$NULL" ]; then 
echo "#### install: or lynx, or links, or links2, or w3m"; fi
####
####
if [ "$second_option" == "$NULL" ]; then 
echo "#### specify web choosed to browse the web, example kernel.org"; exit ; fi
####
####
url_browse_web="$2"
echo "#### browser: $favorite_text_browser"
echo "####    link: $2"
####
####
$favorite_text_browser -dump $url_browse_web
####
####
exit; fi
####
####
#### :rutina-final-expert-browser-web:
##########    english: expert-sockets-ss: The sockets option  ##########
##########    spanish: expert-sockets-ss: La opcion sockets   ##########
#### :rutina-inicial-expert-sockets-ss:
####
####
if   [ "$first_option" == "expert-sockets-ss" ]; then 
echo "$title_md [ $first_option ] [ Show whith ss: sockets ] "
if [ "$command_ss" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install ss command ]"; exit; fi
#### if [ "$command_awk" == "$NULL" ]; then 
#### echo "$title_md $text_fail [ Install awk command ]"; exit; fi
echo "$title_md sockets ipv4"
$command_ss -4
$command_ss -l4
echo "$title_md sockets ipv6"
$command_ss -6
$command_ss -l6
exit; fi
####
####
#### :rutina-final-expert-sockets-ss:
##########    english: expert-sockets-lsof: The sockets option lsof  ##########
##########    spanish: expert-sockets-lsof: La opcion sockets lsof   ##########
#### :rutina-inicial-expert-sockets-lsof:
####
####
if   [ "$first_option" == "expert-sockets-lsof" ]; then 
echo "$title_md [ $first_option ] [ Show whith lsof: sockets ] "
if [ "$command_lsof" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install lsof command ]"; exit; fi
$command_lsof -i
exit; fi
####
####
#### :rutina-final-expert-sockets-lsof:
##########    english: expert-sockets-netstat: The sockets option lsof  ##########
##########    spanish: expert-sockets-netstat: La opcion sockets lsof   ##########
#### :rutina-inicial-expert-sockets-netstat:
####
####
if   [ "$first_option" == "expert-sockets-netstat" ]; then 
echo "$title_md [ $first_option ] [ Show whith lsof: sockets ] "
if [ "$command_lsof" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install lsof command ]"; exit; fi
#### if [ "$command_awk" == "$NULL" ]; then 
#### echo "$title_md $text_fail [ Install awk command ]"; exit; fi
$command_netstat -l46
exit; fi
####
####
#### :rutina-final-expert-sockets-netstat:
##########    english: expert-show-webcert: get the certificate from one web       ##########
##########    spanish: expert-show-webcert: obtiene el certificado de una web      ##########
#### :rutina-inicial-expert-show-webcert:
####
####
if   [ "$first_option" == "expert-show-webcert" ] ; then 
echo "$title_md [ $first_option ] \
[ get one web certifcate from one server with port 443]"
case "$command_openssl"  in  $NULL)
echo "$text_md $text_fail [ install openssl ]"; exit ;; esac
####
####
if [ "$second_option" == "$NULL" ]; then
echo "[ get one web certifcate ] \
[ Example: $cmd_realpath webcert www.fast.com ]"; exit; fi
echo
$command_timeout -s SIGINT -v $time_server_waiting \
$command_openssl s_client -connect $second_option:443
exit; fi
####
####
#### :rutina-final-expert-show-webcert:
##########    english: expert-nmap-tcp: scan one net per tcp       ##########
##########    spanish: expert-nmap-tcp: rastrea una red por tcp    ##########
#### :rutina-inicial-expert-nmap-tcp:
####
####
if   [ "$first_option" == "expert-nmap-tcp" ]; then
echo "$title_md [ $first_option ]  [ scan with nmap tcp ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_basename $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_basename $first_option ip/net ]"; exit ; fi
$cmd_realpath save before-nmap-tcp 
$cmd_realpath add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sT $2
$cmd_realpath load before-nmap-tcp 
exit; fi
####
####
#### :rutina-final-expert-nmap-tcp:
##########    english: expert-nmap-syn: scan one net per syn         ##########
##########    spanish: expert-nmap-syn: rastrea una por peticiones   ##########
#### :rutina-inicial-expert-nmap-syn:
####
####
if   [ "$first_option" == "expert-nmap-syn" ]; then echo $give_cover
echo "$title_md [ $first_option ]  [ scan with nmap syn ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_basename $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_basename $first_option ip/net ]"; exit ; fi
$cmd_realpath save before-nmap-syn
$cmd_realpath add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sF $2
$cmd_realpath load before-nmap-syn
echo 
exit; fi
####
####
#### :rutina-final-expert-nmap-syn:
##########    english: expert-nmap-fin: scan one net per conexiones      ##########
##########    spanish: expert-nmap-fin: rastrea una red por conexiones   ##########
#### :rutina-inicial-expert-nmap-fin:
####
####
if   [ "$first_option" == "expert-nmap-fin" ] ; then
echo "$title_md [ $first_option ]  [ scan with nmap fin ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_basename $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_basename $first_option ip/net ]"; exit ; fi
$cmd_realpath save before-nmap-fin 
$cmd_realpath add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sT $2
$cmd_realpath load before-nmap-fin
echo 
exit; fi
####
####
#### :rutina-final-expert-nmap-fin:
##########    english: expert-nmap-udp: scan one net per udp       ##########
##########    spanish: expert-nmap-udp: rastrea una red por udp    ##########
#### :rutina-inicial-expert-nmap-udp:
####
####
if   [ "$first_option" == "expert-nmap-udp" ]; then
echo "$title_md [ $first_option ]  [ scan with nmap udp ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_basename $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_basename $first_option ip/net ]"; exit ; fi
$cmd_realpath save before-nmap-udp
$cmd_realpath add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sU $2
$cmd_realpath load before-nmap-udp
echo 
exit; fi
####
####
#### :rutina-final-expert-nmap-udp:
##########    english: expert-nmap-ping: scan one net per ping     ##########
##########    spanish: expert-nmap-ping: rastrea una red por ping  ##########
#### :rutina-inicial-expert-nmap-ping:
####
####
if   [ "$first_option" == "expert-nmap-ping" ] ; then 
echo "$title_md [ $first_option ]  [ scan with nmap ping ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_basename $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_basename $first_option ip/net ]"; exit ; fi
$cmd_realpath save before-nmap-ping
$cmd_realpath add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sn $2
$cmd_realpath load before-nmap-ping
exit; fi
####
####
#### :rutina-final-nmap-ping:
##########    english: -gui: Manage gui con three options  ##########
##########    spanish: -gui: Maneja gui con tres opciones  ##########
####
####
#### english: with third option
#### spanish: con tercera opcion
####
####
if [ "$first_option" == "gui" ] && [ "$third_option" != "$NULL" ]
then echo $head_waiting_gui
####
####
case $second_option in
#### 
#### 
"new-mini-custom")
cp "$default_minicfg_eng" "$default_directory_cache/$cmd_file-$third_option"
$favorite_realpath_graphicalldialog --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$default_directory_cache/$cmd_file-$third_option" \
--editable --title=NEW-MINI-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then $nada ;
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option\
ANDlaunch:$cmd_realpath-load-custom-$third_option ; exit
else rm "$default_directory_custom/$third_option" ; 
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"new-full-custom")
cp "$default_fullcfg_eng" "$default_directory_cache/$cmd_file-$third_option"
$favorite_realpath_graphicalldialog --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$default_directory_cache/$cmd_file-$third_option" \
--editable --title=NEW-FULL-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then $nada ;
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:-$cmd_realpath-load-custom-$third_option ; exit
else rm $default_directory_custom/$third_option ; 
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"nueva-mini-custom")
cp "$default_minicfg_spa" "$default_directory_cache/$cmd_file-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$default_directory_cache/$cmd_file-$third_option" \
--editable --title=NUEVA-MINI-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then $nada ;
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:$cmd_realpath-load-custom-$third_option ; exit
else rm $default_directory_custom/$third_option ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"nueva-completa-custom")
cp "$default_fullcfg_spa" "$default_directory_cache/$cmd_file-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$default_directory_cache/$cmd_file-$third_option \
--editable --title=NUEVA-COMPLETA-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then $nada ;
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:$cmd_realpath-load-custom-$third_option ; exit
else rm "$default_directory_custom/$third_option" ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"modify-custom")
if [ ! -f "$default_directory_custom/$third_option" ]
then $favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=file-not-found:$third_option ; exit ; fi 
cp "$default_directory_custom/$third_option" \
"$default_directory_cache/$cmd_file-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$default_directory_cache/$cmd_file-$third_option" \
--editable --title=MODIFY-CONFIG 1> $default_directory_custom/$third_option
if [ -s "$default_directory_custom/$third_option" ]; then $nada ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $default_directory_cache/$cmd_file-$third_option \
$default_directory_custom/$third_option
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled.file-$third_option; fi
;;
####
####
"expert-wpa-new")
$cmd_realpath expert-wpa-regen
cp $default_directory_wpa/defaultwpa $default_directory_wpa/wpaconfig_$third_option
$cmd_realpath gui expert-wpa-modify $third_option
;;
####
####
"expert-wpa-modify")
if [ ! -f "$default_directory_wpa/wpaconfig_$third_option" ]
then $favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=file-not-found:-wpaconfig_$third_option ; exit ; fi 
cp "$default_directory_wpa/wpaconfig_$third_option 
"$default_directory_cache/$cmd_file-$third_option
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$default_directory_cache/$cmd_file-$third_option \
--editable --title=MODIFY-CONFIG 1> $default_directory_wpa/wpaconfig_$third_option
if [ -s "$default_directory_wpa/wpaconfig_$third_option" ]; then  
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $default_directory_cache/$cmd_file-$third_option \
$default_directory_wpa/wpaconfig_$third_option
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled.file-wpaconfig-$third_option; fi
;;
####
####
*)$cmd_realpath "$second_option" "$third_option" "$quad_option" &> "$temporal_guifinal"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_realpath \
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
if [ "$first_option" == "gui" ] && [ "$second_option" != "$NULL" ]
then echo $head_waiting_gui
####
####
case $second_option in
#### 
####
list*)$cmd_realpath txt $second_option $third_option \
$quad_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_realpath \
--filename=$temporal_guifinal --auto-scroll ;;
####
####
"wizard-mini")
archivo=wizard-mini
cp $default_minicfg_eng $default_directory_cache/$cmd_file-$archivo
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$default_directory_cache/$cmd_file-$archivo \
--editable --title=WIZARD MINI 1> $default_directory_custom/$archivo
if [  -s $default_directory_custom/$archivo ]; then $nada ; 
$cmd_realpath -gui load-custom $archivo ; $cmd_realpath -gui list4;
else rm $default_directory_custom/$archivo ;
$favorite_realpath_graphicalldialog --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text Ok-$archivo-canceled; fi
;;
#### 
#### 
"wizard-full")
archivo=wizard-full
cp $default_fullcfg_eng $default_directory_cache/$cmd_file-$archivo
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$default_directory_cache/$cmd_file-$archivo \
--editable --title=WIZARD-FULL 1> $default_directory_custom/$archivo
if [  -s $default_directory_custom/$archivo ]; then $nada ; 
$cmd_realpath -gui load-custom $archivo ; $cmd_realpath -gui list4;
else rm $default_directory_custom/$archivo ;
$favorite_realpath_graphicalldialog  --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
#### 
#### 
"modify-custom")
if [ -f "$default_directory_custom/$third_option" ] ; then $nada
else $favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=file-not-found:-$third_option ; exit ; fi 
cp $default_directory_custom/$third_option \
$default_directory_cache/$cmd_file-$third_option
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$default_directory_cache/$cmd_file-$third_option \
--editable --title=MODIFY-CONFIG $third_option 1> $default_directory_custom/$third_option
if [ -s "$default_directory_custom/$third_option" ]; then $nada ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $default_directory_cache/$cmd_realpath-$third_option \
$default_directory_custom/$third_option
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled.file-$third_option; fi
;;
#### 
####
"preferences-modify")
archivo="default"
cp $file_default_preferences $file_default_preferences.old
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$file_default_preferences.old \
--editable --title=MODIFY-PREFERENCES 1> $file_default_preferences
if [ ! -s "$file_default_preferences" ];
then cp $file_default_preferences.old $file_default_preferences 
$favorite_realpath_graphicalldialog  --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
####
####
*)$cmd_realpath txt $second_option $third_option \
$quad_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_realpath \
--filename=$temporal_guifinal --auto-scroll
;;
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
if [ "$first_option" == "gui" ] && [ "$second_option" == "$NULL" ]
then echo $head_waiting_gui
####
####
$cmd_realpath txt $second_option $third_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_realpath \
--filename=$temporal_guifinal --auto-scroll 
exit; fi
####
####
##########    english: gui-shell-zenity: graphic enviroment            ##########
##########    spanish: gui-shell-zenity: entorno de comandos grafico   ##########
#### :rutina-inicial-gui-shell-zenity:
####
####
if   [ "$first_option" == "gui-shell-zenity" ]
then echo $head_waiting_gui ; echo $head_give_cover
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_realpath gui-shell-zenity"
untexto="$cmd_realpath gui-shell-zenity"
favorite_realpath_graphicalldialog="$command_zenity"
####
####
#### cd $default_directory_custom
####
####
menugtk="$($command_zenity --entry \
--title=Example:options \
--width=$config_graphicall_width --height=$config_graphicall_height )"
####
####
#### english: manage some configs    ####
#### spanish: maneja algunas configs ####
####
####
case "$menugtk" in
####
####
1) $cmd_realpath gui-zenity options; exit ;;
$NULL) $cmd_realpath gui-zenity options; exit ;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom ")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom ")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom ")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom ")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom ")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity nueva-mini-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity show-custom $unarchivo
;;
wizard-full*) $cmd_realpath -gui-zenity wizard-full ;;
wizard-mini*) $cmd_realpath -gui-zenity wizard-mini ;;
preferences-modify*) 
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-zenity preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
"$NULL")  exit ;;
*) fecha_temporal="$show_actual_date"
$cmd_realpath $menugtk &> /tmp/fwiptables-$fecha_temporal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=$cmd_realpath-gui-shell \
--filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal
;;
esac
$cmd_realpath gui-shell-zenity
exit ; fi
####
####
#### :rutina-final-gui-shell-zenity:
##########    english: gui-shell-yad: graphic enviroment            ##########
##########    spanish: gui-shell-yad: entorno de comandos grafico   ##########
#### :rutina-inicial-gui-shell-yad:
####
####
if   [ "$first_option" == "gui-shell-yad" ]
then echo $head_waiting_gui ; echo $head_give_cover
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_realpath gui-shell-yad"
untexto="$cmd_realpath gui-shell-yad"
favorite_realpath_graphicalldialog="$command_yad"
####
####
#### cd $default_directory_custom
####
####
menugtk="$($command_yad --entry \
--title=Example:options \
--width=$config_graphicall_width --height=$config_graphicall_height )"
####
####
#### english: manage some configs    ####
#### spanish: maneja algunas configs ####
####
####
case "$menugtk" in
####
####
1) $cmd_realpath gui-yad options; exit ;;
$NULL) $cmd_realpath gui-yad options; exit ;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom ")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom ")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom ")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom ")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom ")
$command_yad  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad nueva-mini-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad show-custom $unarchivo 
;;
wizard-full*) $cmd_realpath -gui-yad wizard-full ;;
wizard-mini*) $cmd_realpath -gui-yad wizard-mini ;;
preferences-modify*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_realpath -gui-yad preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
*) fecha_temporal="$show_actual_date"
$cmd_realpath $menugtk &> /tmp/fwiptables-$fecha_temporal
$command_yad --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=$cmd_realpath-gui-shelL-$menugtk \
--filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal ;;
esac
$cmd_realpath gui-shell-yad
exit ; fi
####
####
#### :rutina-final-gui-shell-yad:
##########    english: cli-menu: Manage list rules with one text menu          ##########
##########    spanish: cli-menu: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu:
####
####
if [ "$first_option" == "cli-menu" ]; then
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" --menu "Select" 0 0 0 \
0010 "$title_md $text_md [$cmd_realpath cli-menu] $text_md $title_md" \
0100 "$title_md [  --- Info Options --- ] $title_md" \
0200 "$title_md [ Firewall Control ] $title_md" \
0201  "$text_md stop" \
0202  "$text_md continue" \
0203  "$text_md reset" \
0204  "$text_md names"  \
0205  "$text_md show" \
0206  "$text_md save" \
0207  "$text_md load" \
0208  "$text_md actual" \
0209  "$text_md eraserules" \
0210  "$text_md wizard-mini" \
0211  "$text_md wizard-full" \
0212  "$text_md without-connection" \
0213  "$text_md input-permisive" \
0214  "$text_md input-established" \
0215  "$text_md eraserules4" \
0216  "$text_md eraserules6" \
0217  "$text_md eraserules" \
0300 "$title_md [ Firewall List With Conceptual ] $title_md" \
0301  "$text_md list4" \
0302  "$text_md list6"  \
0303  "$text_md list-filter4" \
0304  "$text_md list-filter6" \
0305  "$text_md list-forward" \
0306  "$text_md list-forward6" \
0307  "$text_md list-nat4" \
0308  "$text_md list-nat6" \
0309  "$text_md list-alltables" \
0314  "$text_md list-raw4" \
0315  "$text_md list-raw6" \
0316  "$text_md list-mangle4" \
0317  "$text_md list-mangle6" \
0318  "$text_md list-security4" \
0319  "$text_md list-security6" \
0320  "$text_md list-ebtables" \
0321  "$text_md list-arptables" \
0400 "$title_md [ Firewall List With Numeral ] $title_md" \
0401  "$text_md listn4" \
0402  "$text_md listn6" \
0403  "$text_md listn-filter4" \
0404  "$text_md listn-filter6" \
0405  "$text_md listn-forward" \
0406  "$text_md listn-forward6" \
0407  "$text_md listn-nat4" \
0408  "$text_md listn-nat6" \
0409  "$text_md listn-alltables" \
0414  "$text_md listn-raw4" \
0415  "$text_md listn-raw6" \
0416  "$text_md listn-mangle4" \
0417  "$text_md listn-mangle6" \
0418  "$text_md listn-security4" \
0419  "$text_md listn-security6" \
0420  "$text_md listn-ebtables" \
0421  "$text_md listn-arptables" \
0500 "$title_md [ Firewall Static ] $title_md" \
0507  "$text_md client-basic" \
0508  "$text_md client-web" \
0509  "$text_md client-ssh" \
0510  "$text_md client-telnet" \
0511  "$text_md client-git" \
0512  "$text_md games-shooter" \
0513  "$text_md game-wesnoth" \
0514  "$text_md game-minetest" \
0515  "$text_md game-freeciv" \
0516  "$text_md game-widelands" \
0517  "$text_md client-web" \
0518  "$text_md client-vnc" \
0519  "$text_md client-tor" \
0520  "$text_md client-vpn" \
0521  "$text_md client-torrent" \
0522  "$text_md lan-tor" \
0523  "$text_md lan-vpn" \
0524  "$text_md shield-ssh" \
0525  "$text_md server-ssh" \
0526  "$text_md server-web" \
0527  "$text_md server-vnc" \
0528  "$text_md server-print" \
0529  "$text_md server-samba" \
0530  "$text_md server-lamp" \
0531  "$text_md server-mail" \
0532  "$text_md server-ftp" \
0533  "$text_md server-news" \
0534  "$text_md server-teamspeak" \
0535  "$text_md server-mumble" \
0536  "$text_md server-sql" \
0537  "$text_md server-asterisk" \
0600 "$title_md [ Firewall load-custom ] $title_md" \
0606  "$text_md load-custom" \
0607  "$text_md clone-wallsystem" \
0611  "$text_md new-full-custom" \
0612  "$text_md nueva-completa-custom" \
0613  "$text_md new-mini-custom" \
0614  "$text_md nueva-mini-custom" \
0615  "$text_md show-custom" \
0616  "$text_md modify-custom" \
0617  "$text_md del-custom" \
0618  "$text_md names-custom" \
0619  "$text_md config-regen" \
0700 "$title_md [ Options Easy ] $title_md" \
0701  "$text_md preferences-read" \
0702  "$text_md preferences-modify" \
0703  "$text_md preferences-regen" \
0704  "$text_md filelog" \
0705  "$text_md autolog" \
0706  "$text_md ip4" \
0707  "$text_md ip6" \
0708  "$text_md speed-ip4" \
0709  "$text_md speed-ip6" \
0710  "$text_md sockets" \
0711  "$text_md notes" \
0712  "$text_md license" \
0715  "$text_md depends" \
0716  "$text_md info" \
0717  "$text_md version" \
0718  "$text_md list-options" \
0720  "$text_md info-options" \
0721  "$text_md nodes" \
0722  "$text_md date" \
0723  "$text_md free" \
0724  "$text_md expert" \
0725  "$text_md treeconf" \
0726  "$text_md commands" \
0727  "$text_md variables" \
0728  "$text_md intro" \
0729  "$text_md download" \
0730  "$text_md install" \
3>&1 1>&2 2>&3 )"
################################################################################
#### 
#### 
#### english: dialog choosed #### spanish: dialogo elegido
#### 
####
case $menuprincipal in
##########
##########
0010) clear ; $cmd_realpath txt readme  ;;
0100) clear ; $cmd_realpath txt info-options ;;
0200) clear ; $cmd_realpath txt firewall-control ;;
0300) clear ; $cmd_realpath txt firewall-listconceptual ;;
0400) clear ; $cmd_realpath txt firewall-listnumeral ;;
0500) clear ; $cmd_realpath txt firewall-wallsystem ;;
0600) clear ; $cmd_realpath txt firewall-wallcustom ;;
0700) clear ; $cmd_realpath txt options-easy ;;
################################################################################
0201) clear ; $cmd_realpath txt stop ;;
0202) clear ; $cmd_realpath txt continue ;;
0203) clear ; $cmd_realpath txt reset ;;
0204) clear ; $cmd_realpath txt names ;;
0205) clear ; $cmd_realpath txt names ; echo "$title_md"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_realpath show $nombrecillo ;; 
0206)archivo="$($favorite_realpath_textdialog --stdout \
--title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ;  echo "$title_md saved $archivo" ; $cmd_realpath save $archivo ;;
0207) clear ; $cmd_realpath names ; echo "$title_md"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_realpath load $nombrecillo ;;
0208) clear ; $cmd_realpath txt actual ;;
0209) clear ; $cmd_realpath txt eraserules ; $cmd_realpath cli list4   ;;
0210) clear ; $cmd_realpath txt wizard-mini ; $cmd_realpath cli list4  ;;
0211) clear ; $cmd_realpath txt wizard-full ; $cmd_realpath cli list4  ;;
0212) clear ; $cmd_realpath txt without-connection ; $cmd_realpath cli list4  ;;
0213) clear ; $cmd_realpath txt input-permisive ; $cmd_realpath cli list4   ;;
0213) clear ; $cmd_realpath txt input-established ; $cmd_realpath cli list4   ;;
0215) clear ; $cmd_realpath txt eraserules4 ; $cmd_realpath cli list4   ;;
0216) clear ; $cmd_realpath txt eraserules6 ; $cmd_realpath cli list6   ;;
0217) clear ; $cmd_realpath txt eraserules ; $cmd_realpath cli status   ;;
################################################################################
0301) clear ; $cmd_realpath txt list4 ;;
0302) clear ; $cmd_realpath txt list6 ;;
0303) clear ; $cmd_realpath txt list-filter4 ;;
0304) clear ; $cmd_realpath txt list-filter6 ;;
0305) clear ; $cmd_realpath txt list-forward ;;
0306) clear ; $cmd_realpath txt list-forward6 ;;
0307) clear ; $cmd_realpath txt list-nat4 ;;
0308) clear ; $cmd_realpath txt list-nat6 ;;
0309) clear ; $cmd_realpath txt list-alltables ;;
0314) clear ; $cmd_realpath txt list-raw4 ;;
0315) clear ; $cmd_realpath txt list-raw6 ;;
0316) clear ; $cmd_realpath txt list-mangle4 ;; 
0317) clear ; $cmd_realpath txt list-mangle6 ;;
0318) clear ; $cmd_realpath txt list-security4 ;;
0319) clear ; $cmd_realpath txt list-security6 ;;
0320) clear ; $cmd_realpath txt list-ebtables ;;
0321) clear ; $cmd_realpath txt list-arptables ;;
################################################################################
0401) clear ; $cmd_realpath txt listn4 ;;
0402) clear ; $cmd_realpath txt listn6 ;;
0403) clear ; $cmd_realpath txt listn-filter4 ;;
0404) clear ; $cmd_realpath txt listn-filter6 ;;
0405) clear ; $cmd_realpath txt listn-forward ;;
0406) clear ; $cmd_realpath txt listn-forward6 ;;
0407) clear ; $cmd_realpath txt listn-nat4 ;;
0408) clear ; $cmd_realpath txt listn-nat6 ;;
0409) clear ; $cmd_realpath txt listn-alltables ;;
0414) clear ; $cmd_realpath txt listn-raw4 ;;
0415) clear ; $cmd_realpath txt listn-raw6 ;;
0416) clear ; $cmd_realpath txt listn-mangle4 ;; 
0417) clear ; $cmd_realpath txt listn-mangle6 ;;
0418) clear ; $cmd_realpath txt listn-security4 ;;
0419) clear ; $cmd_realpath txt listn-security6 ;;
0420) clear ; $cmd_realpath txt list-ebtables ;;
0421) clear ; $cmd_realpath txt list-arptables ;;
################################################################################
0507) clear ; $cmd_realpath txt client-basic ; $cmd_realpath cli list4    ;;
0508) clear ; $cmd_realpath txt client-web ; $cmd_realpath cli list4    ;;
0509) clear ; $cmd_realpath txt client-ssh ; $cmd_realpath cli list4    ;;
0510) clear ; $cmd_realpath txt client-telnet ; $cmd_realpath cli list4    ;;
0511) clear ; $cmd_realpath txt client-git ; $cmd_realpath cli list4    ;;
0512) clear ; $cmd_realpath txt games-shooter ; $cmd_realpath cli list4   ;; 
0513) clear ; $cmd_realpath txt game-wesnoth ; $cmd_realpath cli list4    ;;
0514) clear ; $cmd_realpath txt game-minetest ; $cmd_realpath cli list4   ;;
0515) clear ; $cmd_realpath txt game-freeciv ; $cmd_realpath cli list4    ;;
0516) clear ; $cmd_realpath txt game-widelands ; $cmd_realpath cli list4  ;;
0517) clear ; $cmd_realpath txt client-web ; $cmd_realpath cli list4      ;;
0518) clear ; $cmd_realpath txt client-vnc ; $cmd_realpath cli list4      ;;
0519) clear ; $cmd_realpath txt client-tor ; $cmd_realpath cli list4      ;;
0520) clear ; $cmd_realpath txt client-vpn ; $cmd_realpath cli list4      ;;
0521) clear ; $cmd_realpath txt client-torrent ; $cmd_realpath cli list4  ;;
0522) clear ; $cmd_realpath txt lan-tor ; $cmd_realpath cli list4         ;;
0523) clear ; $cmd_realpath txt lan-vpn ; $cmd_realpath cli list4         ;; 
0524) clear ; $cmd_realpath txt shield-ssh ; $cmd_realpath cli list4      ;; 
0525) clear ; $cmd_realpath txt server-ssh ; $cmd_realpath cli list4      ;;
0526) clear ; $cmd_realpath txt server-web ; $cmd_realpath cli list4      ;;
0527) clear ; $cmd_realpath txt server-vnc ; $cmd_realpath cli list4      ;;
0528) clear ; $cmd_realpath txt server-print ; $cmd_realpath cli list4    ;;
0529) clear ; $cmd_realpath txt server-samba ; $cmd_realpath cli list4    ;;
0530) clear ; $cmd_realpath txt server-lamp ; $cmd_realpath cli list4     ;;
0531) clear ; $cmd_realpath txt server-mail ; $cmd_realpath cli list4     ;;
0532) clear ; $cmd_realpath txt server-ftp ; $cmd_realpath cli list4      ;;
0533) clear ; $cmd_realpath txt server-news ; $cmd_realpath cli list4     ;;
0534) clear ; $cmd_realpath txt server-teamspeak ; $cmd_realpath cli list4  ;;
0535) clear ; $cmd_realpath txt server-mumble ; $cmd_realpath cli list4   ;;
0536) clear ; $cmd_realpath txt server-sql ; $cmd_realpath cli list4      ;;
0537) clear ; $cmd_realpath txt server-asterisk ; $cmd_realpath cli list4 ;;
################################################################################
0606) clear ; $cmd_realpath txt names-custom
read -p "Input the custom name to load # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath load-custom $archivo ;;
0607) clear ; read -p "Input the systemfw name to clone # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath clone-wallsystem $archivo ;;
0611) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath new-full-custom $archivo ;;
0612) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath nueva-completa-custom $archivo ;;
0613) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath new-mini-custom $archivo ;;
0614) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath nueva-mini-custom $archivo ;;
0615) clear ; read -p "Input the custom to show config # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath show-custom $archivo ;;
0616) clear ; $cmd_realpath names-custom
read -p "Input the custom name to modify # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath modify-custom $archivo ;;
0617) clear ; $cmd_realpath names-custom
read -p "Input the custom name to delete # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_realpath del-custom $archivo ;;
0618) clear ; $cmd_realpath txt names-custom ;;
0619) clear ; $cmd_realpath txt config-regen ;;
################################################################################
0701) clear ; $cmd_realpath txt preferences-read ;;
0702) clear ; $cmd_realpath txt preferences-modify ;;
0703) clear ; $cmd_realpath txt preferences-regen ;;
0704) clear ; $cmd_realpath txt filelog ;;
0705) clear ; $cmd_realpath txt autolog ;;
0706) clear ; $cmd_realpath txt ip4 ;;
0707) clear ; $cmd_realpath txt ip6 ;;
0708) clear ; $cmd_realpath txt speed-ip4 ;;
0709) clear ; $cmd_realpath txt speed-ip6 ;;
0710) clear ; $cmd_realpath txt sockets ;;
0711) clear ; $cmd_realpath txt notes ;;
0712) clear ; $cmd_realpath txt license ;;
### 0713) clear ; $cmd_realpath cli about ;;
### 0714) clear ; $cmd_realpath cli examples ;;
0715) clear ; $cmd_realpath txt depends ;;
0716) clear ; $cmd_realpath txt info ;;
0717) clear ; $cmd_realpath txt version ;;
0718) clear ; $cmd_realpath txt list-options ;;
### 0719) clear ; $cmd_realpath cli clasic-options ;;
0720) clear ; $cmd_realpath txt info-options ;;
0721) clear ; $cmd_realpath txt nodes ;;
0722) clear ; $cmd_realpath txt date ;;
0723) clear ; $cmd_realpath txt free ;;
0724) clear ; $cmd_realpath txt expert ;;
0725) clear ; $cmd_realpath txt treeconf ;;
0726) clear ; $cmd_realpath txt commands ;;
0727) clear ; $cmd_realpath txt variables ;;
0728) clear ; $cmd_realpath txt intro ;;
0729) clear ; $cmd_realpath txt download;;
0730) clear ; $cmd_realpath txt install;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_realpath text-pause clear ; exit ;;
################################################################################
esac
$cmd_realpath text-pause
$cmd_realpath cli-menu-$favorite_basename_textdialog
exit; fi
####
####
#### :rutina-final-cli-menu:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]
then read -p '$title_md $text_ok $title_md Press [enter] \
to continue now with the cli-menu $title_md'
exit; fi
####
####
#### :rutina-final-text-pause:
##########    english: graphicall-pause: do pause     ##########
##########    spanish: graphicall-pause: hace pausa   ##########
#### :rutina-inicial-graphicall-pause:
####
####
if [ "$first_option" == "graphicall-pause" ]
then $favorite_realpath_graphicalldialog --forms \
--text="wait a moment, usually 1 minute max."
exit; fi
####
####
#### :rutina-final-graphicall-pause:
##################################################################################
##################################################################################
##########    english: gui-roll-zenity: gui roll general: gui with roll  #########
##########    spanish: gui-roll-zenity: gui roll general: gui con roll   #########
#### :rutina-inicial-gui-roll-zenity:
####
####
if [ "$first_option" == "gui-roll-zenity" ] ;
then echo $head_waiting_gui ; echo $head_give_cover ;
if [ "$command_zenity" == "$NULL" ] ;
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="Info|Firewall-Control|Firewall-List-With-Conceptual|\
Firewall-List-With-Numeral|firewall-wallcustom|\
firewall-wallsystem|Options-easy"
selection_menu="$($command_zenity --forms \
--text=gui-roll \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $command_zenity \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--info --text=good-bye ; exit ;;
Info)	
$cmd_realpath gui-zenity info ; exit ;;
Firewall-Control)
$cmd_realpath gui-roll-zenity-firewall-control ; exit ;;
Firewall-List-With-Conceptual)
$cmd_realpath gui-roll-zenity-firewall-listconceptual ; exit ;;
Firewall-List-With-Numeral)
$cmd_realpath gui-roll-zenity-firewall-listnumeral ; exit ;;
firewall-wallcustom)
$cmd_realpath gui-roll-zenity-firewall-wallcustom ; exit ;;
firewall-wallsystem)
$cmd_realpath gui-roll-zenity-firewall-wallsystem ; exit ;;
Options-easy)
$cmd_realpath gui-roll-zenity-option-easy ; exit ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity:
##########    english: gui-roll-zenity-firewall-control: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-control: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-control:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-control" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
|stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|wizard-mini|wizard-full|\
without-connection|input-permisive|input-established"
selection_menu="$($command_zenity --forms \
--text=gui-roll-firewall-control \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
####
case "$selection_final" in
1) $command_zenity \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--info --text=good-bye ; exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath -gui-zenity firewall-control ;;
stop)$cmd_realpath -gui-zenity stop
$cmd_realpath -gui-zenity list4;;
continue)$cmd_realpath -gui-zenity continue
$cmd_realpath -gui-zenity list4;;
reset)$cmd_realpath -gui-zenity reset
$cmd_realpath -gui-zenity list4;;
names)$cmd_realpath -gui-zenity names ;;
show)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Show-Firewall --entry-text=cfg-to-show)" ; 
$cmd_realpath -gui-zenity show $archivo ;;
save)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall --entry-text=cfg-to-save)" ; 
$cmd_realpath -gui-zenity save $archivo ;;
load)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Load-Firewall --entry-text=cfg-to-load)" ;
$cmd_realpath -gui-zenity load $archivo
$cmd_realpath -gui-zenity list4;;
actual)$cmd_realpath -gui-zenity actual ;;
eraserules4)$cmd_realpath -gui-zenity eraserules ; $cmd_realpath gui list4;;
eraserules6)$cmd_realpath -gui-zenity eraserules ; $cmd_realpath gui list6;;
eraserules)$cmd_realpath -gui-zenity eraserules ; $cmd_realpath gui list4;;
wizard-full)$cmd_realpath -gui-zenity wizard-full ; $cmd_realpath gui list4;;
wizard-mini)$cmd_realpath -gui-zenity wizard-mini ; $cmd_realpath gui list4;;
without-connection)$cmd_realpath -gui-zenity without-connection ; $cmd_realpath gui list4;;
input-permisive)$cmd_realpath -gui-zenity input-permisive ; $cmd_realpath gui list4;;
input-established)$cmd_realpath -gui-zenity input-established ; $cmd_realpath gui list4;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-control:
##########    english: gui-roll-zenity-firewall-listconceptual: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-listconceptual: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-listconceptual:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-listconceptual" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|\
list-raw4|list-raw6|list-security4|list-security6|\
list-ebtables|list-arptables"
selection_menu="$($command_zenity --forms \
--text=gui-roll-firewall-listconceptual \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $command_zenity \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--info --text=good-bye ; exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath -gui-zenity firewall-listconceptual ;;
ls4)$cmd_realpath -gui-zenity ls4 ;;
ls6)$cmd_realpath -gui-zenity ls6 ;;
list-alltables)$cmd_realpath -gui-zenity list-alltables ;;
list-filter4)$cmd_realpath -gui-zenity list-filter4 ;;
list-filter6)$cmd_realpath -gui-zenity list-filter6 ;;
list-nat4)$cmd_realpath -gui-zenity list-nat4 ;;
list-nat6)$cmd_realpath -gui-zenity list-nat6 ;;
list-mangle4)$cmd_realpath -gui-zenity list-mangle4 ;;
list-mangle6)$cmd_realpath -gui-zenity list-mangle6 ;;
list-raw4)$cmd_realpath -gui-zenity list-raw4 ;;
list-raw6)$cmd_realpath -gui-zenity list-raw6 ;;
list-security4)$cmd_realpath -gui-zenity list-security4 ;;
list-security6)$cmd_realpath -gui-zenity list-security6 ;;
list-ebtables)$cmd_realpath -gui-zenity list-ebtables ;;
list-arptables)$cmd_realpath -gui-zenity list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-listconceptual:
##########    english: gui-roll-zenity-firewall-listnumeral: gui roll ##########
##########    spanish: gui-roll-zenity-firewall-listnumeral: gui roll ##########
#### :rutina-inicial-gui-roll-zenity-firewall-listnumeral:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-listnumeral" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|lsn4|lsn6|\
listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|\
listn-raw4|listn-raw6|listn-security4|listn-security6|\
list-ebtables|list-arptables"
selection_menu="$($command_zenity --forms \
--text="gui-roll-firewall-listnumeral" \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $command_zenity \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--info --text=good-bye ; exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath -gui-zenity firewall-listnumeral ;;
lsn4)$cmd_realpath -gui-zenity lsn4 ;;
lsn6)$cmd_realpath -gui-zenity lsn6 ;;
listn-alltables)$cmd_realpath -gui-zenity listn-alltables ;;
listn-filter4)$cmd_realpath -gui-zenity listn-filter4 ;;
listn-filter6)$cmd_realpath -gui-zenity listn-filter6 ;;
listn-nat4)$cmd_realpath -gui-zenity listn-nat4 ;;
listn-nat6)$cmd_realpath -gui-zenity listn-nat6 ;;
listn-mangle4)$cmd_realpath -gui-zenity listn-mangle4 ;;
listn-mangle6)$cmd_realpath -gui-zenity listn-mangle6 ;;
listn-raw4)$cmd_realpath -gui-zenity listn-raw4 ;;
listn-raw6)$cmd_realpath -gui-zenity listn-raw6 ;;
listn-security4)$cmd_realpath -gui-zenity listn-security4 ;;
listn-security6)$cmd_realpath -gui-zenity listn-security6 ;;
list-ebtables)$cmd_realpath -gui-zenity list-ebtables ;;
list-arptables)$cmd_realpath -gui-zenity list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-listnumeral:
##########    english: gui-roll-zenity-firewall-wallcustom: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-wallcustom: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-wallcustom:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-wallcustom" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|load-custom|clone-wallsystem|\
new-full-custom|nueva-completa-custom|new-mini-custom|nueva-mini-custom|\
names-custom|show-custom|modify-custom|del-custom|config-regen"
selection_menu="$($command_zenity --forms \
--text=gui-roll-firewall-wallcustom \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath -gui-zenity firewall-wallcustom ;;
load-custom)archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Launch-Custom --entry-text=cfg_to_launch)" ; 
$cmd_realpath -gui-zenity load-custom $archivo ; $cmd_realpath gui list4;;
clone-wallsystem)archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Clone-firewall-static --entry-text=firewall_static_to_clone)" ; 
$cmd_realpath -gui-zenity clone-wallsystem $archivo ; $cmd_realpath gui list4;;
new-full-custom)
archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_realpath -gui-zenity new-full-custom $archivo ;;
nueva-completa-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_realpath -gui-zenity nueva-completa-custom $archivo ;;
new-mini-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-mini-custom \
--entry-text=Input_file_name_to_new_mini_configuration)" ;
$cmd_realpath -gui-zenity new-mini-custom $archivo ;;
nueva-mini-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_realpath -gui-zenity nueva-mini-custom $archivo ;;
names-custom)
$cmd_realpath -gui-zenity names-custom ;;
show-custom)
archivo="$($command_zenity --entry \ 
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Show-custom \
--entry-text=cfg-to-show)" ;
$cmd_realpath -gui-zenity show-custom $archivo ;;
modify-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=modify-custom --entry-text=cfg-to-modify)" ;
$cmd_realpath -gui-zenity modify-custom $archivo ;;
del-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=del-custom --entry-text=cfg-to-delete)" ;
$cmd_realpath -gui-zenity del-custom $archivo ;;
config-regen)$cmd_realpath -gui-zenity config-regen ;;
esac
####
####
exit ; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-wallcustom:
##########    english: gui-roll-zenity-firewall-wallsystem: gui-roll ##########
##########    spanish: gui-roll-zenity-firewall-wallsystem: gui-roll ##########
#### :rutina-inicial-gui-roll-zenity-firewall-wallsystem:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-wallsystem" ]
then echo $head_waiting_gui ; echo $head_give_cover ;
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
menu="gui-principal-menu|gui-info-menu|\
client-basic|client-web|client-ssh|client-telnet|client-ipp|client-irc|\
client-vpn|client-torrent|client-mail|client-news|\
client-ftp|client-git|client-vnc|client-torrent|\
client-vpn|client-tor|lan-tor|lan-vpn|shield-ssh|\
games-shooter|game-wesnoth|game-minetest|game-freeciv|\
game-widelands|server-proxy|server-web|server-vnc|\
server-samba|server-ssh|server-print|server-lamp|\
server-domain|server-news|server-mail|server-ftp|\
server-teamspeak|server-mumble|server-sql|server-asterisk"
selection="$($command_zenity --forms \
--text=gui-roll-firewall-wallcustom \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$menu)"
#### 
#### 
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath gui-zenity firewall-wallsystem ;;
client-basic)$cmd_realpath gui-zenity client-basic     ;
$cmd_realpath gui-zenity list4 ;;
client-web)$cmd_realpath gui-zenity client-web         ;
$cmd_realpath gui-zenity list4 ;;
client-ssh)$cmd_realpath gui-zenity client-ssh         ;
$cmd_realpath gui-zenity list4 ;;
client-telnet)$cmd_realpath gui-zenity client-telnet   ;
$cmd_realpath gui-zenity list4 ;;
client-ipp)$cmd_realpath gui-zenity client-ipp         ;
$cmd_realpath gui-zenity list4 ;;
client-irc)$cmd_realpath gui-zenity client-irc         ;
$cmd_realpath gui-zenity list4 ;;
client-mail)$cmd_realpath gui-zenity client-mail       ;
$cmd_realpath gui-zenity list4 ;;
client-news)$cmd_realpath gui-zenity client-news       ;
$cmd_realpath gui-zenity list4 ;;
client-ftp)$cmd_realpath gui-zenity client-ftp         ;
$cmd_realpath gui-zenity list4 ;;
client-git)$cmd_realpath gui-zenity client-git         ;
$cmd_realpath gui-zenity list4 ;;
client-vnc)$cmd_realpath gui-zenity client-vnc         ;
$cmd_realpath gui-zenity list4 ;;
client-torrent)$cmd_realpath gui-zenity client-torrent ;
$cmd_realpath gui-zenity list4 ;;
client-vpn)$cmd_realpath gui-zenity client-vpn         ;
$cmd_realpath gui-zenity list4 ;;
client-tor)$cmd_realpath gui-zenity client-tor         ;
$cmd_realpath gui-zenity list4 ;;
games-shooter)$cmd_realpath gui-zenity games-shooter   ;
$cmd_realpath gui-zenity list4 ;;
game-wesnoth)$cmd_realpath gui-zenity game-wesnoth     ;
$cmd_realpath gui-zenity list4 ;;
game-minetest)$cmd_realpath gui-zenity game-minetest   ;
$cmd_realpath gui-zenity list4 ;;
game-freeciv)$cmd_realpath gui-zenity game-freeciv     ;
$cmd_realpath gui-zenity list4 ;;
game-widelands)$cmd_realpath gui-zenity game-widelands ;
$cmd_realpath gui-zenity list4 ;;
lan-tor)$cmd_realpath gui-zenity lan-tor               ;
$cmd_realpath gui-zenity list4 ;;
lan-vpn)$cmd_realpath gui-zenity lan-vpn               ;
$cmd_realpath gui-zenity list4 ;;
server-ssh)$cmd_realpath gui-zenity server-ssh         ;
$cmd_realpath gui-zenity list4 ;;
server-web)$cmd_realpath gui-zenity server-web         ;
$cmd_realpath gui-zenity list4 ;;
server-proxy)$cmd_realpath gui-zenity server-proxy     ;
$cmd_realpath gui-zenity list4 ;;
server-vnc)$cmd_realpath gui-zenity server-vnc         ;
$cmd_realpath gui-zenity list4 ;;
server-samba)$cmd_realpath gui-zenity server-samba     ;
$cmd_realpath gui-zenity list4 ;;
server-news)$cmd_realpath gui-zenity server-news       ;
$cmd_realpath gui-zenity list4 ;;
server-mail)$cmd_realpath gui-zenity server-mail       ;
$cmd_realpath gui-zenity list4 ;;
server-ftp)$cmd_realpath gui-zenity server-ftp         ;
$cmd_realpath gui-zenity list4 ;;
server-print)$cmd_realpath gui-zenity server-print     ;
$cmd_realpath gui-zenity list4 ;;
server-lamp)$cmd_realpath gui-zenity server-lamp       ;
$cmd_realpath gui-zenity list4 ;;
server-teamspeak)$cmd_realpath gui-zenity server-teamspeak ;
$cmd_realpath gui-zenity list4 ;;
server-mumble)$cmd_realpath gui-zenity server-mumble       ;
$cmd_realpath gui-zenity list4 ;;
server-sql)$cmd_realpath gui-zenity server-sql             ;
$cmd_realpath gui-zenity list4 ;;
server-asterisk)$cmd_realpath gui-zenity server-asterisk   ;
$cmd_realpath gui-zenity list4 ;;
server-domain)$cmd_realpath gui-zenity server-domain       ;
$cmd_realpath gui-zenity list4 ;;
esac
####
####
exit ; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-wallsystem:
##########    english: gui-roll-zenity-option-easy: gui with roll  ##########
##########    spanish: gui-roll-zenity-option-easy: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-option-easy:
####
####
if [ "$first_option" == "gui-roll-zenity-option-easy" ] ;
then echo $head_waiting_gui ; echo $head_give_cover ;
if [ "$command_zenity" == "$NULL" ] ;
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|\
list-options|info-options|expert|\
filelog|autolog|ip4|ip6|notes|speed-ip4|speed-ip6|\
sockets|nodes|date|free|version|treeconf|\
depends|commands|variables|license|examples|intro"
####
####
selection="$($command_zenity --forms \
--text=$first_option \
--title=Gui-roll-With-$cmd_basename-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
####
####
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_realpath gui-roll-zenity ;;
gui-info-menu)$cmd_realpath -gui-zenity options-easy ;;
preferences-read)$cmd_realpath -gui-zenity preferences-read ;;
preferences-modify)$cmd_realpath -gui-zenity preferences-modify ;;
preferences-regen)$cmd_realpath -gui-zenity preferences-regen ;;
preferences-example)$cmd_realpath -gui-zenity preferences-example ;;
list-options)$cmd_realpath -gui-zenity list-options ;;
info-options)$cmd_realpath -gui-zenity info-options ;;
expert)$cmd_realpath -gui-zenity expert ;;
filelog) $cmd_realpath -gui-zenity filelog ;; 
autolog) $cmd_realpath -gui-zenity autolog ;;
ip4)$cmd_realpath -gui-zenity ip4 ;;
ip6)$cmd_realpath -gui-zenity ip6 ;;
notes)$cmd_realpath -gui-zenity notes ;;
speed-ip4)$cmd_realpath -gui-zenity speed-ip4 ;;
speed-ip6)$cmd_realpath -gui-zenity speed-ip6 ;;
sockets)$cmd_realpath -gui-zenity sockets ;;
nodes) $cmd_realpath -gui-zenity nodes ;;
date) $cmd_realpath -gui-zenity date ;;
free) $cmd_realpath -gui-zenity free ;;
version) $cmd_realpath -gui-zenity version ;;
treeconf)$cmd_realpath -gui-zenity treeconf ;;
depends)$cmd_realpath -gui-zenity depends ;;
license) $cmd_realpath -gui-zenity depends ;;
examples)$cmd_realpath -gui-zenity examples ;;
intro) $cmd_realpath -gui-zenity intro ;;
variables) $cmd_realpath -gui-zenity variables ;;
commands) $cmd_realpath -gui-zenity variables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-option-easy:
##########    english: gui-menu: gui menu general: gui con menu  ##########
##########    spanish: gui-menu: gui menu general: gui con menu  ##########
#### :rutina-inicial-gui-menu:
####
####
if [ "$first_option" == "gui-menu" ] ;
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="Firewall-control|Firewall-listconceptual|\
Firewall-listnumeral|Firewall-wallcustom|Firewall-wallsystem|Options-easy|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_basename-$cmd_version \
--list $selection_menu)"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
####
case $final in
1*) exit ;;
Firewall-control*)
$cmd_realpath gui-menu-firewall-control $second_option ;;
Firewall-listconceptual*)
$cmd_realpath gui-menu-firewall-listconceptual $second_option ;;
Firewall-listnumeral*)
$cmd_realpath gui-menu-firewall-listnumeral $second_option ;;
Firewall-wallcustom*)
$cmd_realpath gui-menu-firewall-wallcustom $second_option ;;
Firewall-wallsystem*)
$cmd_realpath gui-menu-firewall-wallsystem $second_option ;;
Options-easy*)
$cmd_realpath gui-menu-options-easy $second_option ;;
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
if   [ "$first_option" == "gui-menu-firewall-control" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|\
without-connection|input-permisive|input-established|wizard-mini|wizard-full"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_basename-$cmd_version \
--list $selection_menu)"
echo "$title_md The option selected:  $final" ;
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
####
case "$final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option  ;;
gui-info-menu*)$cmd_realpath gui-$second_option firewall-control ;;
stop*)$cmd_realpath gui-$second_option stop ;
$cmd_realpath gui-$second_option list4 ;;
continue*)$cmd_realpath gui-$second_option continue ;
$cmd_realpath gui-$second_option list4 ;;
reset*)$cmd_realpath gui-$second_option reset ;
$cmd_realpath gui-$second_option list4 ;;
names*)$cmd_realpath gui-$second_option names ;;
show*)archivo="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-show)" 
$cmd_realpath gui-$second_option $archivo ;;
save*)archivo="$($second_option--entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-save)" 
$cmd_realpath gui-$second_option save $archivo ;;
load*)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-load)" 
$cmd_realpath gui-$second_option load $archivo ;
$cmd_realpath gui-$second_option list4 ;;
actual*)$cmd_realpath gui-$second_option actual ;;
eraserules4*)$cmd_realpath gui-$second_option eraserules4 ;;
eraserules6*)$cmd_realpath gui-$second_option eraserules6 ;;
eraserules*)$cmd_realpath gui-$second_option eraserules ;;
wizard-full*)$cmd_realpath gui-$second_option wizard-full ;
$cmd_realpath gui-$second_option list4 ;;
wizard-mini*)$cmd_realpath gui-$second_option wizard-mini ;
$cmd_realpath gui-$second_option list4 ;;
without-connection*)$cmd_realpath gui-$second_option without-connection ;
$cmd_realpath gui-$second_option list4 ;;
input-permisive*)$cmd_realpath gui-$second_option input-permisive ;
$cmd_realpath gui-$second_option list4 ;;
input-established*)$cmd_realpath gui-$second_option input-established ;
$cmd_realpath gui-$second_option list4 ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-control:
##########    english: gui-menu-firewall-listconceptual: gui with menu   ##########
##########    spanish: gui-menu-firewall-listconceptual: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-listconceptual:
####
####
if   [ "$first_option" == "gui-menu-firewall-listconceptual" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|list-raw4|list-raw6|\
list-security4|list-security6|list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_basename-$cmd_version \
--list $selection_menu )"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option ;;
gui-info-menu*)$cmd_realpath gui-$second_option firewall-listconceptual ;;
ls4*)$cmd_realpath gui-$second_option ls4 ;;
ls6*)$cmd_realpath gui-$second_option ls6 ;;
list-alltables*)$cmd_realpath gui-$second_option list-alltables ;;
list-filter4*)$cmd_realpath gui-$second_option list-filter4 ;;
list-filter6*)$cmd_realpath gui-$second_option list-filter6 ;;
list-nat4*)$cmd_realpath gui-$second_option list-nat4 ;;
list-nat6*)$cmd_realpath gui-$second_option list-nat6 ;;
list-mangle4*)$cmd_realpath gui-$second_option list-mangle4 ;;
list-mangle6*)$cmd_realpath gui-$second_option list-mangle6 ;;
list-raw4*)$cmd_realpath gui-$second_option list-raw4 ;;
list-raw6*)$cmd_realpath gui-$second_option list-raw6 ;;
list-security4*)$cmd_realpath gui-$second_option list-security4 ;;
list-security6*)$cmd_realpath gui-$second_option list-security6 ;;
list-ebtables*)$cmd_realpath gui-$second_option list-ebtables ;;
list-arptables*)$cmd_realpath gui-$second_option list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-listconceptual:
##########    english: gui-menu-firewall-listnumeral: gui with menu   ##########
##########    spanish: gui-menu-firewall-listnumeral: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-listnumeral:
####
####
if   [ "$first_option" == "gui-menu-firewall-listnumeral" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|lsn4|lsn6|\
listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|\
listn-raw4|listn-raw6|listn-security4|listn-security6|\
list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_realpath-$cmd_version \
--list $selection_menu )"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option ;;
gui-info-menu*)$cmd_realpath gui-$second_option firewall-listnumeral ;;
lsn4*)$cmd_realpath gui-$second_option lsn4 ;;
lsn6*)$cmd_realpath gui-$second_option lsn6 ;;
listn-alltables*)$cmd_realpath gui-$second_option listn-alltables ;;
listn-filter4*)$cmd_realpath gui-$second_option listn-filter4 ;;
listn-filter6*)$cmd_realpath gui-$second_option listn-filter6 ;;
listn-nat4*)$cmd_realpath gui-$second_option listn-nat4 ;;
listn-nat6*)$cmd_realpath gui-$second_option listn-nat6 ;;
listn-mangle4*)$cmd_realpath gui-$second_option listn-mangle4 ;;
listn-mangle6*)$cmd_realpath gui-$second_option listn-mangle6 ;;
listn-raw4*)$cmd_realpath gui-$second_option listn-raw4 ;;
listn-raw6*)$cmd_realpath gui-$second_option listn-raw6 ;;
listn-security4*)$cmd_realpath gui-$second_option listn-security4 ;;
listn-security6*)$cmd_realpath gui-$second_option listn-security6 ;;
list-ebtables*)$cmd_realpath gui-$second_option list-ebtables ;;
list-arptables*)$cmd_realpath gui-$second_option list-arptables ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-listnumeral:
##########    english: gui-menu-firewall-wallcustom: gui with menu   ##########
##########    spanish: gui-menu-firewall-wallcustom: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-wallcustom:
####
####
if [ "$first_option" == "gui-menu-firewall-wallcustom" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
load-custom|clone-wallsystem|\
new-full-custom|nueva-completa-custom|\
new-mini-custom|nueva-mini-custom|\
names-custom|show-custom|modify-custom|\
del-custom|config-regen"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_basename-$cmd_version \
--list $selection_menu )"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option ;;
gui-info-menu*) $cmd_realpath gui-$second_option firewall-wallcustom ;;
load-custom*)archivo="$($second_option  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Launch-Custom \
--entry-text=cfg-to-launch)" ; 
$cmd_realpath gui-$second_option load-custom $archivo ;
$cmd_realpath gui-$second_option list4 ;;
clone-wallsystem*)archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Clone-static \
--entry-text=static-firewall-to-clone-config)" ; 
$cmd_realpath gui-$second_option clone-wallsystem $archivo ;
$cmd_realpath gui-$second_option list4;;
new-full-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_realpath -gui-$second_option new-full-custom $archivo ;;
nueva-completa-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" 
$cmd_realpath gui-$second_option nueva-completa-custom $archivo ;;
new-mini-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height --entry \
--title=new-mini-custom \
--entry-text=Input_file_ name_ to_ new_ mini_configuration)" ;
$cmd_realpath gui-$second_option new-mini-custom $archivo ;;
nueva-mini-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_realpath gui-$second_option nueva-mini-custom $archivo ;;
names-custom*) $cmd_realpath gui-menu-$second_option names-custom ;;
show-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=show-custom \
--entry-text=cfg-to-show)" ;
$cmd_realpath gui-$second_option show-custom $archivo ;;
modify-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=modify-custom \
--entry-text=cfg-to-modify)" ;
$cmd_realpath gui-$second_option modify-custom $archivo ;;
del-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=del-custom \
--entry-text=cfg-to-delete)";
$cmd_realpath gui-$second_option del-custom $archivo ;;
config-regen*)$cmd_realpath gui-$second_option  config-regen ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-wallcustom:
##########   english: gui-menu-firewall-wallsystem: gui with menu    ##########
##########   spanish: gui-menu-firewall-wallsystem: gui con menu     ##########
#### :rutina-inicial-gui-menu-firewall-wallsystem:
####
####  
if [ "$first_option" == "gui-menu-firewall-wallsystem" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
client-basic|client-web|client-ssh|client-telnet|client-ipp|client-irc|\
client-mail|client-news|client-ftp|\
client-git|client-vnc|client-torrent|client-vpn|\
client-tor|lan-tor|lan-vpn|shield-ssh|\
games-shooter|game-wesnoth|game-minetest|game-freeciv|game-widelands|\
server-web|server-vnc|server-samba|server-ssh|\
server-print|server-lamp|server-domain|\
server-news|server-mail|server-ftp|server-teamspeak|\
server-mumble|server-sql|server-asterisk"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_basename-$cmd_version \
--list $selection_menu )"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option ;;
gui-info-menu*)$cmd_realpath gui-$second_option firewall-wallsystem ;;
client-basic*)$cmd_realpath gui-$second_option client-basic ;
$cmd_realpath gui-$second_option list4 ;;
client-web*)$cmd_realpath gui-$second_option client-web ;
$cmd_realpath gui-$second_option list4 ;;
client-ssh*)$cmd_realpath gui-$second_option client-ssh ;
$cmd_realpath gui-$second_option list4 ;;
client-telnet*)$cmd_realpath gui-$second_option client-telnet ;
$cmd_realpath gui-$second_option list4 ;;
client-ipp*)$cmd_realpath gui-$second_option client-ipp ;
$cmd_realpath gui-$second_option list4 ;;
client-irc*)$cmd_realpath gui-$second_option client-irc ;
$cmd_realpath gui-$second_option list4 ;;
client-mail*)$cmd_realpath gui-$second_option client-mail ;
$cmd_realpath gui-$second_option list4 ;;
client-news*)$cmd_realpath gui-$second_option client-news ;
$cmd_realpath gui-$second_option list4 ;;
client-ftp*)$cmd_realpath gui-$second_option client-ftp ;
$cmd_realpath gui-$second_option list4 ;;
client-git*)$cmd_realpath gui-$second_option client-git ;
$cmd_realpath gui-$second_option list4 ;;
client-vnc*)$cmd_realpath gui-$second_option client-vnc ;
$cmd_realpath gui-$second_option list4 ;;
client-torrent*)$cmd_realpath gui-$second_option client-torrent ;
$cmd_realpath gui-$second_option list4 ;;
client-vpn*)$cmd_realpath gui-$second_option client-vpn ;
$cmd_realpath gui-$second_option list4 ;;
client-tor*)$cmd_realpath gui-$second_option client-tor ;
$cmd_realpath gui-$second_option list4 ;;
games-shooter*)$cmd_realpath gui-$second_option games-shooter ;
$cmd_realpath gui-$second_option list4 ;;
game-wesnoth*)$cmd_realpath gui-$second_option game-wesnoth ; 
$cmd_realpath gui-$second_option list4 ;;
game-minetest*)$cmd_realpath gui-$second_option game-minetest ;
$cmd_realpath gui-$second_option list4 ;;
game-freeciv*)$cmd_realpath gui-$second_option game-freeciv ;
$cmd_realpath gui-$second_option list4;;
game-widelands*)$cmd_realpath gui-$second_option game-widelands ;
$cmd_realpath gui-$second_option list4 ;;
lan-tor*)$cmd_realpath gui-$second_option lan-tor ;
$cmd_realpath gui-$second_option list4 ;;
lan-vpn*)$cmd_realpath gui-$second_option lan-vpn ;
$cmd_realpath gui-$second_option list4 ;;
shield-ssh*)$cmd_realpath gui-$second_option shield-ssh ;
 $cmd_realpath gui-$second_option list4 ;;
server-ssh*)$cmd_realpath gui-$second_option server-ssh ;
$cmd_realpath gui-$second_option list4 ;;
server-web*)$cmd_realpath gui-$second_option server-web ;
 $cmd_realpath gui-$second_option list4 ;;
server-vnc*)$cmd_realpath gui-$second_option server-vnc ;
$cmd_realpath gui-$second_option list4 ;;
server-samba*)$cmd_realpath gui-$second_option server-samba ;
$cmd_realpath gui-$second_option list4 ;;
server-news*)$cmd_realpath gui-$second_option server-news ;
$cmd_realpath gui-$second_option list4 ;;
server-mail*)$cmd_realpath gui-$second_option server-mail ;
$cmd_realpath gui-$second_option list4 ;;
server-ftp*)$cmd_realpath gui-$second_option server-ftp ;
$cmd_realpath gui-$second_option list4 ;;
server-print*)$cmd_realpath gui-$second_option server-print ;
$cmd_realpath gui-$second_option list4 ;;
server-lamp*)$cmd_realpath gui-$second_option server-lamp ;
$cmd_realpath gui-$second_option list4 ;;
server-teamspeak*)$cmd_realpath gui-$second_option server-teamspeak ;
$cmd_realpath gui-$second_option list4 ;;
server-mumble*)$cmd_realpath gui-$second_option server-mumble ;
$cmd_realpath gui-$second_option list4 ;;
server-sql*)$cmd_realpath gui-$second_option server-sql ;
$cmd_realpath gui-$second_option list4 ;;
server-asterisk*)$cmd_realpath gui-$second_option server-asterisk ;
$cmd_realpath gui-$second_option list4 ;;
server-domain*)$cmd_realpath gui-$second_option server-domain ;
$cmd_realpath gui-$second_option list4 ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-wallsystem:
##########    english: gui-menu-options-easy: gui with menu   ##########
##########    spanish: gui-menu-options-easy: gui con menu    ##########
#### :rutina-inicial-gui-menu-options-easy:
####
####
if [ "$first_option" == "gui-menu-options-easy" ]
then echo $head_waiting_gui ; echo $head_give_cover
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|\
list-options|clasic-options|info-options|expert|download|intro|\
ip4|ip6|speed-ip4|speed-ip6|sockets|license|notes|treeconf|\
examples|depends|variables|commands"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_realpath-$cmd_version \
--list $selection_menu )"
####
####
if [ "$second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$title_md option selected: $final" ; echo ;
#### 
####
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_realpath gui-menu-$second_option ;;
gui-info-menu*)$cmd_realpath gui-$second_option options-easy ;;
preferences-read*)$cmd_realpath gui-$second_option preferences-read ;;
preferences-modify*)$cmd_realpath gui-$second_option preferences-modify ;;
preferences-regen*)$cmd_realpath gui-$second_option preferences-regen ;;
preferences-example*)$cmd_realpath gui-$second_option preferences-example ;;
list-options*)$cmd_realpath gui-$second_option list-options ;;
clasic-options*)$cmd_realpath gui-$second_option clasic-options ;;
info-options*)$cmd_realpath gui-$second_option info-options ;;
expert*)$cmd_realpath gui-$second_option expert ;;
intro*)$cmd_realpath gui-$second_option intro ;;
download*)$cmd_realpath gui-$second_option download ;;
ip4*)$cmd_realpath gui-$second_option ip4 ;;
ip6*)$cmd_realpath gui-$second_option ip6 ;;
speed-ip4*)$cmd_realpath gui-$second_option speed-ip4 ;;
speed-ip6*)$cmd_realpath gui-$second_option speed-ip6 ;;
sockets*)$cmd_realpath gui-$second_option sockets ;;
treeconf*)$cmd_realpath gui-$second_option treeconf ;;
examples*)$cmd_realpath gui-$second_option examples ;;
depends*)$cmd_realpath gui-$second_option depends ;;
notes*)$cmd_realpath gui-$second_option notes ;;
license*)$cmd_realpath gui-$second_option license ;;
variables*) $cmd_realpath gui-$second_option variables ;;
commands*) $cmd_realpath gui-$second_option commands ;;
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
##########   english: load-custom: firewall      ##########
##########   spanish: load-custom: cortafuegos   ##########
#### :rutina-inicial-load-custom:
####
####
if [ "$first_option" == "load-custom" ]
then echo "$title_md $text_info [ loading firewall wallcustom $second_option ]"
launch_rules_firewall="yes" ;
type_firewall="wallcustom" ;
name_firewall="$second_option" ;
####
####
#### english: configure load-custom variables if there are
#### spanish: configura variables modificadas si estan ahi
####
####
if [ -f "$default_directory_custom/$second_option" ]
then source $default_directory_custom/$second_option ; fi
####
####
if [ ! -f "$default_directory_custom/$second_option" ]
then  $cmd_realpath names-custom ; exit; fi
####
####
fi
####
####
#### :rutina-final-load-custom:
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
#### :rutina-inicial-before-without-connection:
####
####
####   #### english: firewall of system without-connection:
####   #### spanish: cortafuego del sistema without-connection:
####
####
if [ "$first_option" == "without-connection" ]; then
echo "$title_md $text_info [ loading firewall wallsystem without-connection ]" ;
launch_rules_firewall="yes" ;
type_firewall="without-connection";
name_firewall="$first_option";
fi
#### :rutina-final-before-without-connection:
#### ##################################################
#### ##################################################
#### :rutina-inicial-before-input-permisive:
####
####
####   #### english: firewall of system input-permisive:
####   #### spanish: cortafuego del sistema input-permisive:
####
####
if [ "$first_option" == "input-permisive" ]; then
echo "$title_md $text_info [ loading firewall wallsystem input-permisive ]" ;
launch_rules_firewall="yes" ;
type_firewall="input-permisive" ;
name_firewall="$first_option";
fi
####
####
#### :rutina-final-before-input-permisive:
#### ##################################################
#### ##################################################
#### :rutina-inicial-before-input-established:
####
####
####   #### english: firewall of system input-established:
####   #### spanish: cortafuego del sistema input-established:
####
####
if [ "$first_option" == "input-established" ]; then
echo "$title_md $text_info [ loading firewall wallsystem input-established ]" ;
launch_rules_firewall="yes" ;
type_firewall="input-established" ;
name_firewall="$first_option";
fi
####
####
#### :rutina-final-before-input-established:
#### ##################################################
#### ##################################################
#### :rutina-inicial-shield-ssh:
####
####   #### english: firewall of system shield-ssh:
####   #### spanish: cortafuego del sistema shield-ssh:
####
####
if [ "$first_option" == "shield-ssh" ]; then
echo "$title_md $text_info [ loading firewall wallsystem shield-ssh ]" ;
launch_rules_firewall="yes" ;
type_firewall="wallsystem"    ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
allow_shield_maxtries="" ;
config_shield_maxtries="30" ;
config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="ssh" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-shield-ssh:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-ssh:
####
####   #### english: firewall of system shield-ssh:
####   #### spanish: cortafuego del sistema shield-ssh:
####
####
if [ "$first_option" == "client-ssh" ]; then
echo "$title_md $text_info [ loading firewall wallsystem client-ssh ]" ;
launch_rules_firewall="yes" ;
type_firewall="wallsystem"    ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="20" ;
config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-ssh:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-telnet:
####
####   #### english: firewall of system shield-ssh:
####   #### spanish: cortafuego del sistema shield-ssh:
####
####
if [ "$first_option" == "client-telnet" ]; then
echo "$title_md $text_info [ loading firewall wallsystem client-telnet ]" ;
launch_rules_firewall="yes" ;
type_firewall="wallsystem"    ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
allow_shield_maxtries="no" ;
config_shield_maxtries="20" ;
config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,telnet" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-telnet:
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
echo "$title_md $text_info [ loading firewall wallsystem client-basic ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
####
####
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
echo "$title_md $text_info [ loading firewall wallsystem client-web ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-git ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,git" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-ipp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ipp" ;
client_port_udp="domain,bootpc,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-irc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-irc:
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
echo "$title_md $text_info [ loading firewall client-vnc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web and vnc
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-vnc:
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
echo "$title_md $text_info [ loading firewall wallsystem client-torrent ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect web normal and bittorrent too
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,9091,51413" ;
server_port_tcp="9091,51413" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-vpn ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect web normal and web vpn
server_port_udp="" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,500,1194,1701,4500" ; 
client_port_tcp="http,https,http-alt,ssh,443,1701,1723" ; 
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-tor ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect web normal and web tor
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,9000:9170" ;
server_port_tcp="9000:9170" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-news ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
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
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-mail ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
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
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem client-ftp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### client ftp:
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-ftp:
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
echo "$title_md $text_info [ loading firewall wallsystem client-proxy ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,3128,ssh" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem lan-vpn ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### vpn ports to connects ports vpn
#### with necesary ports to connect gatway and date, domain for your ip
server_port_udp="" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,500,1194,1701,4500" ; 
client_port_tcp="1701,1723" ; 
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem lan-tor ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### lan tor, 9000:9170 for connect to tor
#### with necesary ports to connect gatway and date, domain for your ip
server_port_udp="" ;
client_port_udp="bootpc,domain,domain-s,ntp" ;
client_port_tcp="9000:9170" ;
server_port_tcp="9000:9170" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem games-shooter ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem games-udp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="1025:65000" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-games-udp:
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
echo "$title_md $text_info [ loading firewall wallsystem game-wesnoth ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers 
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### game wesnoth port 14999 and 15001 usually
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,14950:15050" ;
server_port_tcp="14950:15050" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem game-minetest ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### game minetest and minecraft porst 25k and 35k /udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,25000:35000" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,25000:35000" ;
server_port_tcp="25000:35000" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem game-freeciv ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### for default 5556 port tcp perhaps 5555 too
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5555:5556" ;
server_port_tcp="5555:5556" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem game-widelands ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### for default 7396 port tcp and 7396 udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,7396" ; 
server_port_udp="7396" ;
client_port_tcp="ssh,http,https,http-alt,7396" ;
server_port_tcp="7396" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-game-widelands:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-uid-root:
####
####
####   #### english: firewall of system 
####   #### spanish: cortafuego del sistema 
####
####
if [ "$first_option" == "client-uid-root" ]; then
echo "$title_md $text_info [ loading firewall wallsystem client-uid-root ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="" ;
client_port_udp="" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
allow_output_uid= 
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
config_output_uid=root
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-uid-root:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-gid-users:
####
####
####   #### english: firewall of system 
####   #### spanish: cortafuego del sistema
####
####
if [ "$first_option" == "client-gid-users" ]; then
echo "$title_md $text_info [ loading firewall wallsystem client-gid-users ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers 
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="" ;
client_port_udp="" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
allow_output_gid=  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
config_output_gid=users 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-gid-users:
#### ##################################################
#### ##################################################
#### :rutina-inicial-client-gid-net:
####
####
####   #### english: firewall of system 
####   #### spanish: cortafuego del sistema 
####
####
if [ "$first_option" == "client-gid-net" ]; then
echo "$title_md $text_info [ loading firewall wallsystem client-gid-net ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="" ;
client_port_udp="" ;
server_port_tcp="" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
allow_output_gid=  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
config_output_gid=net 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-client-gid-net:
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
echo "$title_md $text_info [ loading firewall wallsystem server-web ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh,http,https,http-alt" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-vnc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"      
#### you can connect normal web and vnc
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="ssh,5900:5910" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-ftp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
server_port_tcp="ssh,http,https,ftp,ftp-data,ftps,ftps-data" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-ftp:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-gateway:
####
####
####   #### english: firewall of system server-gateway:
####   #### spanish: cortafuego del sistema server-gateway:
####
####
if [ "$first_option" == "server-gateway" ]; then
echo "$title_md $text_info [ loading firewall wallsystem server-gateway ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft=""             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="ssh,http,https,http-alt" ;
server_port_tcp="ssh,http,https,http-alt" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
allow_forward_ip4=
# allow_forward_ip6= 
allow_gateway_ip4= 
# allow_gateway_ip6= 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping= 
# allow_output_ping= 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
config_gateway_ip4=192.168.0.1/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-gateway:
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
echo "$title_md $text_info [ loading firewall wallsystem server-proxy ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server http and https and ssh /tcp and https udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,3128,ssh" ;
server_port_tcp="ssh,http,https,http-alt,3128" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-news ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"       
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 
#### may be changed to use TLS via the STARTTLS command. 
server_port_udp="" ; 
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
client_port_tcp="http,https,http-alt,ssh,119,433,563" ;
server_port_tcp="ssh,http,https,119,433,563" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-mail ]" ;
####
####
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
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
####
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh,25,119,433,563,25:26,995,110,465,587,143,993" ;
server_port_tcp="ssh,http,https,25,119,433,563,25:26,995,110,465,587,143,993" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-samba ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server samba and active directory
client_port_tcp="http,https,http-alt,ssh,ldap,636,microsoft-ds" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,ldap,636,137:139" ;
server_port_tcp="ssh,ldap,636,microsoft-ds" ; 
server_port_udp="ssh,ntp,domain,domain-s,ldap,636,137:139" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-samba:
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
echo "$title_md $text_info [ loading firewall wallsystem server-print ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ; 
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server ipp and printer
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh,printer,ipp" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-ssh ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server ssh 22/tcp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-ssh:
#### ##################################################
#### ##################################################
#### :rutina-inicial-server-telnet:
####
####
####   #### english: firewall of system server-telnet:
####   #### spanish: cortafuego del sistema server-telnet:
####
####
if [ "$first_option" == "server-telnet" ]; then
echo "$title_md $text_info [ loading firewall wallsystem server-telnet ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server ssh 22/tcp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,telnet" ;
server_port_tcp="ssh,telnet" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-telnet:
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
echo "$title_md $text_info [ loading firewall wallsystem server-lamp ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
####  english: udp: 20 is ftp-data, 21 is ftp, 989 is ftps-data y 990 is ftps
####  english: tcp: 10000 is webmin, 3306 is mysql, 5432 is postgresql
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_udp="https" ;
client_port_tcp="http,https,http-alt,ssh,20,21,989,990" ;
server_port_tcp="ssh,http,https,10000,3306,5432" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-asterisk ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
####    UDP:5060 SIP (sip.conf), newer Versions support TCP:5060
####    UDP:10000-20000 RTP (rtp.conf) for the media stream, a higher Portrange
####    UDP:5036 IAX2
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5060,10000:20000,5036" ;
server_port_udp="5060,10000:20000,5036" ;
client_port_tcp="http,https,http-alt,ssh,5060" ;
server_port_tcp="ssh,5060" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
#### :rutina-final-server-asterisk:
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
echo "$title_md $text_info [ loading firewall wallsystem server-mumble ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers 
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### mumble port 64738 tcp and 64738 udp
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,64738" ;
server_port_udp="64738" ;
client_port_tcp="http,https,http-alt,ssh,64738" ;
server_port_tcp="ssh,64738" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-teamspeak ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### Service	        Protocol	Local Port (Server)
#### Voice	        UDP	9987
#### Filetransfer	TCP	30033
#### ServerQuery (raw)	TCP	10011
#### ServerQuery (SSH)	TCP	10022
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,9987" ;
server_port_udp="9987" ;
client_port_tcp="http,https,http-alt,ssh,30033,10011,10022" ;
server_port_tcp="ssh,30033,10011,10022" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-sql ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
####  POSTGRESQL 5432/tcp and 5432/udp
####  Technology	Default Port	Required
####  MySQL Client to Server - MySQL Protocol – 3306	3306/tcp	Optional - pick at least 1
####  MySQL Client to Server – New X Protocol – 33060	33060/tcp	Optional - pick at least 1
####  Connects via SSH Tunnel	22/tcp	Optional - pick at least 1
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5432" ;
server_port_udp="5432" ;
client_port_tcp="http,https,http-alt,ssh,5432,3306,3360" ;
server_port_tcp="ssh,5432,3306,3360" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-irc ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### you can connect normal web
server_port_udp="" ;
client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
server_port_tcp="ssh,ircs-u,ircd" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
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
echo "$title_md $text_info [ loading firewall wallsystem server-domain ]" ;
launch_rules_firewall="yes" ; 
type_firewall="wallsystem" ;
name_firewall="$first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# allow_use_legacy=""        
# allow_use_nft="no"             
# allow_use_ipv4=""            
# allow_use_ipv6=""           
# allow_separate_rules=""
#### english: max tries for each hour 
# allow_shield_maxtries="no" ;
# config_shield_maxtries="12" ;
# config_shield_port="22" ;
#### english: log port servers
# logserver_port_tcp="no"    
# logserver_port_udp="no"    
#### server domain and domain-s
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https," ;
server_port_udp="domain,domain-s" ;
client_port_tcp="http,https,http-alt,ssh" ;
server_port_tcp="ssh" ;
# config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# allow_string_denied=no 
# allow_string_allowed=no 
# allow_forward_ip4=no 
# allow_forward_ip6=no 
# allow_gateway_ip4=no 
# allow_gateway_ip6=no 
# allow_dmz_ip4=no 
# allow_dmz_ip6=no 
# allow_input_all=no 
# allow_output_all=no 
# allow_input_state=no 
# allow_output_state=no 
# allow_input_bandwidth=no 
# allow_output_bandwidth=no 
# allow_input_maxconnect=no 
# allow_output_maxconnect=no 
# allow_input_ping=no 
# allow_output_ping=no 
# allow_mac_whitelist=no 
# allow_mac_blacklist=no 
# allow_net_whitelist=no 
# allow_net_blacklist=no 
# allow_output_uid=no  
# allow_output_gid=no  
# allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# config_string_denied=.fb.com,.facebook.com,xxx.html 
# config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# config_mac_whitelist=d4:12:43:01:36:2e 
# config_mac_blacklist=d4:12:43:01:36:2e 
# config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# config_net_blacklist=facebook.com,www.facebook.com 
# config_gateway_ip4=192.168.0.0/24
# config_gateway_ip6=::1
# config_dmz_ip4=192.168.1.7
# config_dmz_ip6=d4:12:43:01:36:2e 
# config_input_state=new,related,established 
# config_output_state=new,related,established 
# config_input_bandwidth=12512 
# config_output_bandwidth=512 
# config_input_maxconnect=72 
# config_output_maxconnect=72 
# config_output_uid=root 
# config_output_gid=root 
# config_others_protocols=icmp,igmp 
# config_ipv4_netclient=0/0 
# config_ipv4_netserver=0/0 
# config_ipv6_netclient=::/0 
# config_ipv6_netserver=::/0 
fi
####
####
#### :rutina-final-server-domain:
####################################################################
####################################################################
####
####
####################################################################
####################################################################
####
####
############################       english: default: without other valid options
############################	   spanish: default: sin otra valida opcion
####
####
if [ "$launch_rules_firewall" != "yes" ]
then echo $head_give_cover
echo "### #$text_fail [ first option: $first_option \
| without first option: $without_first_option ]"
$cmd_realpath options ; exit ; fi
####
####
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-sane-variables-firewall:
####
####
#### sane variables
#### 
####
case "$allow_use_legacy"  in "no")   ;; *) allow_use_legacy=""    ;; esac
case "$allow_use_nft"     in "no")   ;; *) allow_use_nft=""       ;; esac
case "$allow_use_ipv4"    in "no")   ;; *) allow_use_ipv4=""      ;; esac
case "$allow_use_ipv6"    in "no")   ;; *) allow_use_ipv6=""      ;; esac
####
####
case "$config_string_algoritmo" in "bm"|"kmp") ;;
*) config_string_algoritmo="bm" ;; esac
case "$config_close_deny" in "DROP"|"REJECT") ;;
*) config_close_deny="DROP"  ;; esac
####
####
case "$NULL" in "$allow_autosave")         ;;  *)  allow_autosave="no" ;;  esac
case "$NULL" in "$allow_string_denied")    ;;  *)  allow_string_denied="no" ;;  esac
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
case "$NULL" in "$config_system_log")      ;;  *)  config_system_log="log" ;; esac
####
####
####
####
#### :rutina-final-sane-variables-firewall:
#################################################################
#################################################################
####                                                                                            ###############
#### Knowed now sure that:         launch_rules_firewall="yes"                              ###############
####                                                                                            ###############
#################################################################
#################################################################
####                                                                                            ###############
####          ready to launch rules ..    -  rules -
###############
####                                                                                            ###############
#################################################################
#################################################################
####                                                                                            ###############
####                                                                                            ###############
####
####  english: Options for launch rules:     
####           system firewall with designed previous
####  spanish: Opciones para lanzar reglas:  
####           firewall del sistema con diseño previo
####                                                                                            ###############
####                                                                                            ###############
#################################################################
#################################################################
########################################     english: ipv4 iptables input-permisive:
########################################     spanish: ipv4 iptables todo permisivo
#### :rutina-inicial-code-input-permisive:
####
####
#### legacy ip4
####
####
if [ "$type_firewall" == "input-permisive" ]; then $cmd_realpath eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy  $command_iptableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft $command_iptablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft  $command_iptablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
########################################     english: ipv6 iptables input-permisive:
########################################     spanish: ipv6 iptables todo permisivo
####
####
#### english: legacy ipv6 127.0.0.1 acept and the others legacy ipv6 accept too
#### spanish: legacy ipv6 127.0.0.1 acepta y los otros legacy ipv6 acepta tambien
####
####
$allow_use_legacy $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A INPUT   \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$allow_use_legacy $command_iptableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
$allow_use_legacy $command_iptableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
echo "$title_md $text_ok [ Launched: firewall ] \
[ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-input-permisive:
########################################     english: ipv4 iptables input-established:
########################################     spanish: ipv4 iptables input-established
#### :rutina-inicial-code-input-established:
####
####
#### legacy ip4
####
####
if [ "$type_firewall" == "input-established" ]; then $cmd_realpath eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy  $command_iptableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy  $command_iptableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
### $allow_use_legacy  $command_iptableslegacy -A FORWARD \
### -j ACCEPT \
### -m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft $command_iptablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_iptablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft  $command_iptablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
### $allow_use_nft $allow_use_ipv4   $command_iptablesnft -A FORWARD \
### -j ACCEPT \
### -m comment --comment all-forward &> /dev/null
####
####
########################################     english: ipv6 iptables input-permisive:
########################################     spanish: ipv6 iptables todo permisivo
####
####
#### english: legacy ipv6 127.0.0.1 acept and the others legacy ipv6 accept too
#### spanish: legacy ipv6 127.0.0.1 acepta y los otros legacy ipv6 acepta tambien
####
####
$allow_use_legacy $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
### allow_use_legacy $command_ip6tableslegacy -A FORWARD \
### -j ACCEPT \
### -m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A INPUT   \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
### $allow_use_nft $allow_use_ipv6   $command_ip6tablesnft -A FORWARD \
### -j ACCEPT \
### -m comment --comment all-forward &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$allow_use_legacy $command_iptableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
$allow_use_legacy $command_iptableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
echo "$title_md $text_ok [ Launched: firewall ] \
[ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-input-established:
########################################     english: ipv4 iptables without-connection:
########################################     spanish: ipv4 iptables desconectado
#### :rutina-inicial-code-without-connection:
####
####
#### legacy ip4
####
####
if [ "$type_firewall" == "without-connection" ]
then $cmd_realpath eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: legacy ipv4 127.0.0.1 acepta
####
####
$allow_use_legacy $command_iptableslegacy -A INPUT  \
-s $config_ip4_localhost -d $config_ip4_localhost   -j ACCEPT \
-m comment --comment host-localhost  &> /dev/null
$allow_use_legacy $command_iptableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_iptableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: nft ipv4 127.0.0.1 acepta
####
####
$allow_use_nft $command_iptablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_iptablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_iptablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
########################################     english: ipv6 iptables without-connection
########################################     spanish: ipv6 iptables desconectado
####
####
#### english: legacy ipv6 127.0.0.1 acept
#### spanish: legacy ipv6 127.0.0.1 acepta
####
####
$allow_use_legacy $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept
#### spanish: nft ipv6 127.0.0.1 acepta
####
####
$allow_use_nft $command_ip6tablesnft -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip6tablesnft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
########################################     english: close in without-connection
########################################     spanish: cierra en without-connection
####
####
$allow_use_legacy $command_iptableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$allow_use_nft $command_iptablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$allow_use_legacy $command_ip6tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$allow_use_nft $command_ip6tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####  
echo "$title_md $text_ok [ Launched: firewall ] \
[ Type: $type_firewall ] [ Name: $name_firewall ]"
exit; fi
####
####
#### :rutina-final-code-without-connection:
#############################################################
#############################################################
####                                                                                            ###############
####  ready to launch rules load-custom OR systemfw :
####  systemfw/customfw rules -
###############
####                                                                                            ###############
#############################################################
#############################################################
####
####
#############################################################
#############################################################
####                                                                                            ###############
####                                                                                            ###############
####
####  english: Options for launch rules:     
####           system firewall load-custom
####  spanish: Opciones para lanzar reglas:  
####           firewall del sistema load-custom
####                                                                                            ###############
####                                                                                            ###############
#############################################################
#############################################################
#### :rutina-inicial-code-wizard:
####
####
##############################       english: overwrite system varibles with the config cfg
##############################       spanish: sobreescribe las variables con la config cfg
####
####
if [ "$first_option" == "load-custom" ]
then if [ -f $default_directory_custom/$second_option ]
then source $default_directory_custom/$second_option &> /dev/null
else echo "$text_md $text_fail [ Config file not found ]"
exit ; fi ; fi
####
####
##############################      english: selective state of intput/oputut          
##############################      spanish: estado selectivo de entrada/salida        
####
####
if [ "$allow_input_state" == "$NULL" ]
then config_input_state="-m state --state $config_input_state"
else config_input_state="$NULL"  ; fi
if [ "$allow_output_state" == "$NULL" ]
then config_output_state="-m state --state $config_output_state"
else config_output_state="$NULL" ; fi
####
####
##############################      english: 
#### output_uid or output_gid for input established status        #####################
##############################      spanish:
#### usuario o grupo para establecidos de entrada de estado       #####################
####
####
config_uid_gid=no
if [ "$allow_output_uid" == "$NULL" ]
then config_uid_gid="" ; else $nada ; fi
if [ "$allow_output_gid" == "$NULL" ]
then config_uid_gid="" ; else $nada ; fi
####
####
###################################################################
###################################################################
####                                                                                            ###############
#### Launching rules ..                             ###############
####                                                                                            ###############
###################################################################
###################################################################
####
####
######################### english: iptables rules ipv4  iptables-legacy
######################### spanish: reglas de iptables ipv4   iptables-legacy
####
####
#### english: erase all rules
#### spanish: borra todas las reglas
####
####
$cmd_realpath eraserules &> /dev/null
####
####
######################### english: ebtables mac rules
######################### spanish: ebtables mac rules
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
$allow_mac_blacklist $command_ebtables -A OUTPUT \
-d $config_mac_blacklist  -j $config_close_deny \
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
$allow_use_legacy $command_iptableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_iptableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_nft $command_iptablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_iptablesnft -A OUTPUT -s \
$config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_legacy $command_iptableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_iptablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
fi
####
####
if [ "$config_ip6_localhost" != "$NULL" ]; then
####
####
$allow_use_legacy $command_ip6tableslegacy -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_nft $command_ip6tablesnft -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip6tablesnft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_legacy $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
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
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A OUTPUT -d $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptablesnft \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptablesnft \
-A OUTPUT -d $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A OUTPUT -d $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tablesnft \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tablesnft \
-A OUTPUT -d $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
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
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptablesnft \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptablesnft \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $command_ip6tablesnft \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tablesnft \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
done
####
fi
####
####
####################################### english: drop for string in header
####################################### spanish: deniega para cadena in cabecera
####
####
if [ "$allow_string_denied" == "$NULL" ]; then
####
for string_close in $(echo $config_string_denied | $command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_iptableslegacy \
-A  OUTPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $command_iptablesnft \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_iptablesnft \
-A  OUTPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy \
-A  OUTPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $command_ip6tablesnft \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $command_ip6tablesnft \
-A  OUTPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
done
####
fi
####
####
####################################### english: allow for string in header
####################################### spanish: permite para cadena in cabecera
####
####
if [ "$allow_string_allowed" == "$NULL" ]; then
####
for string_allow in $(echo $config_string_allowed | $command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####holahola
$allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy  -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy  -A  OUTPUT \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  \
$command_iptablesnft     -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  \
$command_iptablesnft     -A  OUTPUT \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
#### ipv6
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv6 $allow_use_legacy $command_ip6tableslegacy -A  OUTPUT \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $command_ip6tablesnft    -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft  $command_ip6tablesnft    -A  OUTPUT \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft  $allow_use_ipv4  $command_iptablesnft -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_legacy  $allow_use_ipv6  $command_ip6tableslegacy -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft  $allow_use_ipv6  $command_ip6tablesnft -A INPUT \
-p tcp -m multiport --dport $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptablesnft -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_legacy  $allow_use_ipv6  $command_ip6tableslegacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft     $allow_use_ipv6  $command_ip6tablesnft -A INPUT \
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
$allow_use_ipv4 $allow_use_legacy $allow_input_bandwidth \
$command_iptableslegacy -A  INPUT \
-m hashlimit --hashlimit-above   "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinputlegacy  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_bandwidth \
$command_iptablesnft -A INPUT \
-m hashlimit    --hashlimit-above "$config_input_bandwidth"kb/sec  \
--hashlimit-name maxinputnft  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
if [ "$allow_output_bandwidth" == "$NULL" ] ; then
####
####
$allow_use_ipv4 $allow_use_legacy $allow_output_bandwidth \
$command_iptableslegacy -A OUTPUT \
-m hashlimit --hashlimit-above  "$config_output_bandwidth"kb/sec \
--hashlimit-mode dstip --hashlimit-name maxoutputlegacy -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null

####
####
$allow_use_ipv4 $allow_use_nft $allow_output_bandwidth \
$command_iptablesnft -A OUTPUT \
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
$allow_use_ipv6 $allow_use_legacy $allow_input_bandwidth \
$command_ip6tableslegacy -A INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_input_bandwidth \
$command_ip6tablesnft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
####
if [ "$allow_output_bandwidth" == "$NULL" ] ; then
####
$allow_use_ipv6 $allow_use_legacy $allow_output_bandwidth \
$command_ip6tableslegacy -A OUTPUT -m hashlimit --hashlimit-above \
"$config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_output_bandwidth \
$command_ip6tablesnft -A OUTPUT -m hashlimit --hashlimit-above \
"$config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $config_close_deny \
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
$allow_use_ipv4 $allow_use_legacy $allow_input_maxconnect \
$command_iptableslegacy -A INPUT -m connlimit --connlimit-above \
$config_input_maxconnect   -j $config_close_deny  \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_maxconnect \
$command_iptablesnft   -A INPUT -m connlimit --connlimit-above \
$config_input_maxconnect       -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv4 $allow_use_legacy $allow_output_maxconnect \
$command_iptableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect \
-j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_output_maxconnect \
$command_iptablesnft  -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect \
-j $config_close_deny \
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
$allow_use_ipv6 $allow_use_legacy $allow_input_maxconnect \
$command_ip6tableslegacy -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect \
-j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_input_maxconnect \
$command_ip6tablesnft   -A INPUT  \
-m connlimit --connlimit-above $config_input_maxconnect \
-j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv6 $allow_use_legacy $allow_output_maxconnect \
$command_ip6tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect \
-j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv6 $allow_use_nft $allow_output_maxconnect \
$command_ip6tablesnft  -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect \
-j $config_close_deny \
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
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 legacy udp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_udp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
####    CLIENT  TCP
####
#### ipv4 legacy tcp
####
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4     $command_iptablesnft -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_iptablesnft -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 legacy udp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_udp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4     $command_iptablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_iptablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp \
-d $config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_iptableslegacy -A OUTPUT \
-p udp -m multiport --sports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_iptablesnft    -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptablesnft    -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_iptablesnft    -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_iptablesnft    -A OUTPUT \
-p udp -m multiport --sports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
#### ipv6
####
####
$allow_use_legacy  $allow_use_ipv6   $command_ip6tableslegacy -A INPUT   \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tableslegacy -A INPUT   \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6   $command_ip6tableslegacy -A OUTPUT  \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv6   $command_ip6tableslegacy -A OUTPUT  \
-p udp -m multiport --sports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv6   $command_ip6tablesnft    -A INPUT   \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv6   $command_ip6tablesnft    -A INPUT   \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv6   $command_ip6tablesnft    -A OUTPUT  \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv6   $command_ip6tablesnft    -A OUTPUT  \
-p udp -m multiport --sports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
####################################### english: rules allow server ports with tcp
####################################### spanish: reglas para permitir puertos servidor tcp
####
####
#### without separate rules
####
####
if [ "$allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
fi
####
####
################ english: rules allow server ports with udp         #######################
################ spanish: reglas para permitir puertos servidor udp #######################
####
####
if [ "$allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
fi
####
####
#### without separate rules 
####
####
####################################### english: rules allow server ports with tcp
####################################### spanish: reglas para permitir puertos servidor tcp
####
####
#### with separate rules
####
####
if [ "$allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $server_port_tcp | $command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_iptableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A INPUT \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_iptablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $one_udp -s $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft  $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
done; fi
####
####
#### with separate rules
####
####
################## english: rules from input of legacy ipv4 for ping, uid, gid and protocols
################## spanish: reglas de entrada de legacy ipv4 para ping, uid, gid y protocolos
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_ping \
$command_iptableslegacy -A INPUT  \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping \
$command_iptableslegacy -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp resquest" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $config_uid_gid \
$command_iptableslegacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols \
$command_iptableslegacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
################# english: rules from output of legacy ipv4 for ping, uid, gid and protocols
################# spanish: reglas de salida de legacy ipv4 para ping, uid, gid y protocolos
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_output_ping \
$command_iptableslegacy   -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping \
$command_iptableslegacy -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_output_uid \
$command_iptableslegacy   -A OUTPUT \
-m owner --gid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_output_gid \
$command_iptableslegacy   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols \
$command_iptableslegacy -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
################# english: ipv6 filter legacy rules for ping, uid, gid and protocols
################# spanish: ipv6 filtros legacy reglas para ping, uid, gid y protocolos
####
#### 
#### english: ipv6 filter legacy rules input 
#### spanish: ipv6 filtros de legacy reglas de entrada
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_ping \
$command_ip6tableslegacy -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_input_ping \
$command_ip6tableslegacy -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $config_uid_gid \
$command_ip6tableslegacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy  $allow_use_ipv6 $allow_others_protocols \
$command_ip6tableslegacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter legacy rules output
#### spanish: ipv6 filtros legacy reglas de salida
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_output_ping \
$command_ip6tableslegacy   -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv6 $allow_input_ping \
$command_ip6tableslegacy -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv6 $allow_output_uid \
$command_ip6tableslegacy   -A OUTPUT \
-m owner --gid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv6 $allow_output_gid \
$command_ip6tableslegacy   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
$allow_use_legacy  $allow_use_ipv6 $command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy6  $allow_use_ipv6 $allow_others_protocols \
$command_ip6tableslegacy -A OUTPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
############### english: iptables rules ipv4  iptables-nft for ping, uid, gid and protocols
############### spanish: reglas de iptables ipv4 iptables-nft para ping, uid, gid y protocolos
####
####
#### english: ipv4 filter nft rules input
#### spanish: ipv4 filter nft reglas de entrada
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_ping \
$command_iptablesnft -A INPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping \
$command_iptablesnft -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $config_uid_gid \
$command_iptablesnft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols \
$command_iptablesnft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv4 filter nft rules output
#### spanish: ipv4 filter nft reglas de salida
####
####
$allow_use_nft $allow_use_ipv4 $allow_output_ping \
$command_iptablesnft -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping \
$command_iptablesnft -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_output_uid \
$command_iptablesnft   -A OUTPUT \
-m owner --uid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_output_gid \
$command_iptablesnft   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols \
$command_iptablesnft -A OUTPUT \
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
$allow_use_nft $allow_use_ipv6 $allow_output_ping \
$command_ip6tablesnft -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_input_ping \
$command_ip6tablesnft -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "imcp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $config_uid_gid \
$command_ip6tablesnft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv6 $allow_others_protocols \
$command_ip6tablesnft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter nft rules output
#### spanish: ipv6 filtros nft reglas de salida
####
####
$allow_use_nft $allow_use_ipv6 $allow_output_ping \
$command_ip6tablesnft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_input_ping \
$command_ip6tablesnft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv6 $allow_output_uid \
$command_ip6tablesnft -A OUTPUT \
-m owner --uid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv6 $allow_output_gid \
$command_ip6tablesnft -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv6 $allow_others_protocols \
$command_ip6tablesnft -A OUTPUT \
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
####
####
#### english: do masquerade nat ip4 and ip6 ALLOW GATEWAY
#### spanish: hace nat masquerade ip4 y ip6 PERMITIR GATEWAY
####
####
if [ "$allow_gateway_ip4" == "$NULL" ]; then 
####
####
$allow_use_nft    $allow_use_ipv4    $allow_gateway_ip4 \
$command_iptablesnft -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv4 $allow_gateway_ip4 \
$command_iptableslegacy -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
####
####
$allow_use_nft $allow_use_ipv4 \
$allow_gateway_ip4 $command_iptablesnft -t nat \
-A PREROUTING -j ACCEPT -d $config_gateway_ip4 \
-m comment --comment "ip gateway"  &>/dev/null
$allow_use_legacy $allow_use_ipv4 \
$allow_gateway_ip4 $command_iptableslegacy -t nat \
-A PREROUTING -j ACCEPT -d $config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
####
fi
####
####
if [ "$allow_gateway_ip6" == "$NULL" ]; then 
####
####
$allow_use_nft $allow_use_ipv6 $allow_gateway_ip6 \
$command_ip6tablesnft -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_gateway_ip6 \
$command_ip6tableslegacy -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
####
####
$allow_use_nft $allow_use_ipv6 $allow_gateway_ip6 \
$command_ip6tablesnft -t nat \
-A PREROUTING -j ACCEPT -d $config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_gateway_ip6 \
$command_ip6tableslegacy -t nat \
-A PREROUTING -j ACCEPT -d $config_gateway_ip6 \
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
$allow_use_nft    $allow_use_ipv4    $allow_dmz_ip4 \
$command_iptablesnft -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
$allow_use_legacy $allow_use_ipv4    $allow_dmz_ip4 \
$command_iptableslegacy -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
####
fi
####
####
if [ "$config_dmz_ip6" == "$NULL" ]; then 
####
####
$allow_use_nft $allow_use_ipv6    $allow_dmz_ip6 \
$command_ip6tablesnft -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip6 \
-m comment --comment "ip dmz" &>/dev/null
$allow_use_legacy $allow_use_ipv6 $allow_dmz_ip6 \
$command_ip6tableslegacy -t nat \
-A PERROUTING -j DNAT --to-destination $config_dmz_ip6 \
-m comment --comment "ip dmz" &>/dev/null
####
fi
####
####
################# english: iptables ipv4 and ipv6 with forward rules ALLOW FORWARD
################# spanish: iptables ipv4 y ipv6 con reglas de reenvio PERMITIR FORWARD
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
$allow_use_legacy $allow_forward_ip4 $command_iptableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter legacy rules forward
$allow_use_legacy $allow_forward_ip6 $command_ip6tableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv4 filter nft rules forward
$allow_use_nft $allow_forward_ip4 $command_iptablesnft \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter nft rules forward
$allow_use_nft $allow_forward_ip6 $command_ip6tablesnft \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
######################### input log close
####
####
if [ "$allow_close_log" == "$NULL" ]; then
####
####
#### english: nft INPUT LOG CLOSE
#### spanish: nft INPUT LOG CLOSE
####
####
$launch_custom $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A INPUT   -j $config_system_log \
-m comment --comment close-log &> /dev/null
$launch_custom $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A INPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
####
####
#### english: legacy INPUT LOG CLOSE
#### spanish: legacy INPUT LOG CLOSE 
####
####
$launch_custom $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy  -t filter -A INPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
$launch_custom $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A INPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
####
####
fi
####
####
######################### output log close
####
####
if [ "$allow_close_log" == "$NULL" ]; then
####
####
#### english: nft OUPUT LOG CLOSE
#### spanish: nft OUPUT LOG CLOSE
####
####
$launch_custom $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A OUTPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
$launch_custom $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A OUTPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
####
####
#### english: legacy OUPUT LOG CLOSE
#### spanish: legacy OUPUT LOG CLOSE 
####
####
$launch_custom $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy  -t filter -A OUTPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
$launch_custom $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A OUTPUT  -j $config_system_log \
-m comment --comment close-log &> /dev/null
####
####
fi
####
####
##################### iptables ipv4 and ipv6 closed with drop input,
####                  and drop forward, and drop output rules
##################### iptables ipv4 y ipv6 cierran la entrada,
####                  reemvio y salida con reglas de dropeo
####
####
if [ "$config_close_deny" != "$NULL" ]; then 
####
####
#### ipv4 drop rules iptables-legacy
$allow_use_legacy $command_iptableslegacy -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_iptableslegacy -A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### ipv6 drop rules iptables-legacy
$allow_use_legacy $command_ip6tableslegacy -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip6tableslegacy -A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### ipv4 drop rules iptables-nft
$allow_use_nft $command_iptablesnft -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_iptablesnft -A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
#### ipv6 drop rules iptables-nft
$allow_use_nft $command_ip6tablesnft -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip6tablesnft -A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
fi
####
####
#################### english: iptables ipv4 and ipv6 with variable input_all
#################### english: iptables ipv4 y ipv6 con variable input_all
####
####
if [ "$allow_input_all" == "$NULL" ]; then 
####
####
#### english: nft INPUT deleted
#### spanish: nft INPUT borradas
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -F INPUT  &> /dev/null
####
####
#### english: legacy INPUT deleted
#### spanish: legacy INPUT borradas
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -F INPUT  &> /dev/null
####
####
#### english: nft INPUT 127.0.0.1 accept
#### spanish: nft INPUT ::1 acepta
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy INPUT 127.0.0.1 accept
#### spanish: legacy INPUT ::1 acepta
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy -t filter -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment close-rule &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A INPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy4 INPUT  limit bandwidth
#### spanish: legacy6 INPUT limita ancho de banda
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$allow_input_bandwidth iptables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$allow_input_bandwidth ip6tables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 INPUT limit bandwidth
#### spanish: nft6 INPUT limita ancho de banda
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$allow_input_bandwidth iptables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$allow_input_bandwidth ip6tables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$allow_input_maxconnect  $command_iptableslegacy -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect \
-j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$allow_input_maxconnect $command_iptablesnft   -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect \
-j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$allow_input_maxconnect  $command_ip6tableslegacy -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$allow_input_maxconnect $command_ip6tablesnft   -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect -j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: nft INPUT ACCEPT all or input_state
#### spanish: nft INPUT acepta todo o estado de entrada
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $command_iptablesnft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tablesnft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input state"  &> /dev/null
####
####
####
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$allow_use_ipv4 $command_iptablesnft -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A INPUT \
-j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
fi
####
####
############### english: iptables ipv4 and ipv6 with variable output_all
############### english: iptables ipv4 y ipv6 con variable output_all
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
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_nft $command_iptablesnft -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_nft $command_ip6tablesnft -t filter -F OUTPUT  &> /dev/null
####
####
#### english: legacy OUTPUT deleted
#### spanish: legacy OUTPUT borradas
####
####
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_legacy $command_iptableslegacy -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_legacy $command_ip6tableslegacy -t filter -F OUTPUT  &> /dev/null
####
####
#### english: nft OUTPUT 127.0.0.1 accept
#### spanish: nft OUTPUT ::1 acepta
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_nft $command_ip6tablesnft -t filter -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy OUTPUT 127.0.0.1 accept
#### spanish: legacy OUTPUT ::1 acepta
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy \
 $command_iptableslegacy -t filter -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
fi
####
####
########### english: allow output bandwidth
########### spanish: acepta velocidad de conexiones de salida
####
####
if [ "$allow_output_bandwidth" == "$NULL" ]; then 
####
####
#### english: legacy4 OUTPUT limit bandwidth
#### spanish: legacy6 OUTPUT limita ancho de banda
####
#### 
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_legacy $allow_output_bandwidth iptables-legacy -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy \
$allow_output_bandwidth ip6tables-legacy -A  OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 OUTPUT limit bandwidth
#### spanish: nft6 OUTPUT limita ancho de banda
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft \
$allow_output_bandwidth iptables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft \
$allow_output_bandwidth ip6tables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
fi
####
####
################### english: allow output maxconnect
################### spanish: acepta maximo de conexiones de salida
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then 
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_legacy $allow_output_maxconnect  $command_iptableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_nft $allow_output_maxconnect $command_iptablesnft   -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_legacy $allow_output_maxconnect  $command_ip6tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_nft $allow_output_maxconnect $command_ip6tablesnft   -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
fi
####
####
################### english: allow output all
################### spanish: acepta toda salida
####
####
if [ "$allow_output_all" == "$NULL" ]; then 
####
####
#### english: nft OUTPUT ACCEPT all or input_state
#### spanish: nft OUTPUT acepta todo o estado de entrada
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy -t filter  -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "input state" &> /dev/null
####
####
fi
######################### output close rule
####
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft \
$command_iptablesnft -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy \
$command_iptableslegacy  -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A OUTPUT  -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
################ english: show text when active load-custom rules
################ spanish: muestra texto cuando activas las load-custom reglas
####
####  
echo "$title_md $text_ok [ Launched: firewall ] \
[ Type: $type_firewall ] [ Name: $name_firewall ]"
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
####    # Download repository: With clone/pull/fetch https:// or ssh://
####
####    First time, download repository to folder user:
####    git clone https://git.code.sf.net/p/f-iptables/code
####    Download updates from repository to folder user:
####    git pull  https://f-iptables@git.code.sf.net/p/f-iptables/code
####    Recover repository from server repository to folder user:
####    git fetch https://f-iptables@git.code.sf.net/p/f-iptables/code
####
####    # upload repository: update commit and push
####
####    Update files from local repository:  
####    git commit -a OR git commit -a -m change-done
####    Upload files to repository from local repository:
####    git push ssh://f-iptables@git.code.sf.net/p/f-iptables/code
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
