#!/bin/bash
####
####
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
####   English: This program has the license GPL v2, LGPL v2.
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
##########    english: are you root: uid 0 ?                ##########
##########    spanish: eres admnistrador: identificador 0 ? ##########
#### :rutina-inicial-necesary-root:
####
####
if [ "$(id -u)" != "0" ] ; then echo ; echo
####
####
echo "### $text_fail [ fwiptables needs root to work ]"
echo "### $text_info [ Try with root user ]" ; echo
####
####
exit ; fi
####
####
#### :rutina-final-necesary-root:
##########     english name, description and version    ##########
##########     spanish: nombre, descripcion y version   ##########
#### :rutina-inicial-cmd-env:
####
####
#### ########## ########## ##########
#### variables configs for fwiptables program
#### ########## ########## ##########
####
####
#### The name file command
cmd_name="fwiptables"                                         # Name firewall
#### the installed location
cmd_filename="fwiptables"                                     # Filename installed
cmd_directory="/usr/bin"                                      # Directory installed
#### the path firewall and any command                        
cmd_path="/usr/bin:/usr/sbin:/bin:/sbin"                      # Config for PATH
PATH="$cmd_path"                                              # PATH for fwiptables
#### find any command in system
cmd_where="which"                                             # Find each command
#### the source file command         
cmd_basename="$(basename $0)"                                 # Only name filename
cmd_realpath="$(realpath $0)"                                 # path name filename
#### internal notinstalled,installed         
cmd_notinstalled="$0"
cmd_installed="$cmd_directory/$cmd_filename"                  # Full path filename
#### internal cycle command firewall
cmd_internal="$cmd_installed"                                 # your choosed internal
if [ -f "$cmd_installed" ]
then cmd_internal="$cmd_installed"
else cmd_internal="$cmd_notinstalled"
fi
#### The number version firewall
cmd_year="24"                                                 # Number year version
cmd_month="10"                                                # Number mouth version
cmd_letter="K"                                                # Number letter version
cmd_version="$cmd_year-$cmd_month-$cmd_letter"                # Final date like number version
cmd_released="Year 20$cmd_year / Month $cmd_month"
#### The data version firewall
cmd_developer="Francisco Garcia"                              # Actual developer
cmd_contact="fwiptables@gmx.com"                              # Actual contact
cmd_shortdescription="FireWall With iptables"                 # Description short
cmd_longdescription="iptables template in one script"         # Description long
cmd_requisite_program="awk,cat,cut,date,file,id,sed"          # Program requisite
cmd_requisite_firewall4="iptables-legacy,iptables-nft"        # Firewall requisite
cmd_requisite_firewall6="ip6tables-legacy,ip6tables-nft"      # Firewall requisite
cmd_license="LGPL v2, GPL v2"                                 # Program license
#### posible front-end firewall
cmd_posible_cli="dialog,whiptail"                             # Posible cli
cmd_posible_gui="yad,zenity"                                  # Posible gui
#### info xdg session firewall
cmd_session="$XDG_SESSION_TYPE"                               # Sesssion XDG
cmd_xdg="/run/user/0"                                         # Folder XDG
#### info file format firewall
cmd_format=$(file $0 | \
awk '{print $2 "_" $3 "_" $4}')                               # File format
#### info date logs var in log,logcmd,..
cmd_get_date="$(date +DAY_%Y-%m-%d_HOUR_%H-%M-%S)"            # format date
cmd_log_date="$cmd_get_date"
cmd_opt_date="LOG_[$cmd_get_date]_OPT_"
# cmd_log_date="$(date +LOG_DAY_%Y-%m-%d_HOUR_%H-%M-%S)"        # log date
# cmd_opt_date="$(date +LOG_DAY_%Y-%m-%d_HOUR_%H-%M-%S_OPT_)"   # log date
#### cmd_opt_date="$cmd_log_date-_OPT_"                       # opt date
####
####
#### ########## ########## ##########
####
####
#### :rutina-final-cmd-env:
##########     english name, description and version    ##########
##########     spanish: nombre, descripcion y version   ##########
#### :rutina-inicial-web-official:
####
####
content_license_gplv3=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-GPLv3.txt?format=raw"
content_license_gplv2=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-GPL.txt?format=raw"
content_license_lgplv2=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-LGPL.txt?format=raw"
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
web_download_myradio=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/myradio-bash?format=raw" ;
####
####
#### :rutina-final-web-official:
##########   english: search programs: programs path           ##########
##########   spanish: busca los programas: ruta de programas   ##########
#### :rutina-inicial-possible-commands:
####
####
command_arp="$($cmd_where arp)"
command_arpscan="$($cmd_where arp-scan)"
command_arptables="$($cmd_where arptables)"
command_awk="$($cmd_where awk)"
command_bash="$($cmd_where bash)"
command_bc="$($cmd_where bc)"
command_cat="$($cmd_where cat)"
command_convert="$($cmd_where convert)"
command_cpufreqinfo="$($cmd_where cpufreq-info)"
command_cpupower="$($cmd_where cpupower)"
command_curl="$($cmd_where curl)"
command_cut="$($cmd_where cut)"
command_date="$($cmd_where date)"
command_dd="$($cmd_where dd)"
command_dhclient="$($cmd_where dhclient)"
command_dhclientscript="$($cmd_where dhclient-script)"
command_dhcpcd="$($cmd_where dhcpcd)"
command_dialog="$($cmd_where dialog)"
command_dig="$($cmd_where dig)"
command_dpkg="$($cmd_where dpkg)"
command_ebtables="$($cmd_where ebtables)"
command_editor="$($cmd_where editor)"
command_egrep="$($cmd_where egrep)"
command_elinks="$($cmd_where elinks)"
command_file="$($cmd_where file)"
command_find="$($cmd_where find)"
command_fmt="$($cmd_where fmt)"
command_geoiplookup="$($cmd_where geoiplookup)"
command_glxgears="$($cmd_where glxgears)"
command_gpg="$($cmd_where gpg)"
command_grep="$($cmd_where grep)"
command_halt="$($cmd_where halt)"
command_host="$($cmd_where host)"
command_id="$($cmd_where id)"
command_ifconfig="$($cmd_where ifconfig)"
command_init="$($cmd_where init)"
command_ip="$($cmd_where ip)"
command_ip4tableslegacy="$($cmd_where iptables-legacy)"
command_ip4tablesnft="$($cmd_where iptables-nft)"
command_ip6tableslegacy="$($cmd_where ip6tables-legacy)"
command_ip6tablesnft="$($cmd_where ip6tables-nft)"
command_iperf="$($cmd_where iperf)"
command_iperf3="$($cmd_where iperf3)"
command_iw="$($cmd_where iw)"
command_links="$($cmd_where links)"
command_links2="$($cmd_where links2)"
command_logname="$($cmd_where logname)"
command_lpinfo="$($cmd_where lpinfo)"
command_lpstat="$($cmd_where lpstat)"
command_ls="$($cmd_where ls)"
command_lsblk="$($cmd_where lsblk)"
command_lscpu="$($cmd_where lscpu)"
command_lsgpu="$($cmd_where lsgpu)"
command_lshw="$($cmd_where lshw)"
command_lsof="$($cmd_where lsof)"
command_lspci="$($cmd_where lspci)"
command_lsusb="$($cmd_where lsusb)"
command_lynx="$($cmd_where lynx)"
command_m2r="$($cmd_where m2r)"
command_md5sum="$($cmd_where md5sum)"
command_mdp="$($cmd_where mdp)"
command_mkdir="$($cmd_where mkdir)"
command_mpg123="$($cmd_where mpg123)"
command_mpg123="$($cmd_where mpg123)"
command_mpg321="$($cmd_where mpg321)"
command_mpg321="$($cmd_where mpg321)"
command_nano="$($cmd_where nano)"
command_netstat="$($cmd_where netstat)"
command_netstatnat="$($cmd_where netstat-nat)"
command_nmap="$($cmd_where nmap)"
command_ntpdate="$($cmd_where ntpdate)"
command_obash="$($cmd_where obash)"
command_openssl="$($cmd_where openssl)"
command_pico="$($cmd_where pico)"
command_ping="$($cmd_where ping)"
command_poweroff="$($cmd_where poweroff)"
command_rdate="$($cmd_where rdate)"
command_readlink="$($cmd_where readlink)"
command_reboot="$($cmd_where reboot)"
command_resolveip="$($cmd_where resolveip)"
command_route="$($cmd_where route)"
command_sed="$($cmd_where sed)"
command_shutdown="$($cmd_where shutdown)"
command_sleep="$($cmd_where sleep)"
command_sntp="$($cmd_where sntp) -S"
command_ss="$($cmd_where ss)"
command_sudo="$($cmd_where sudo)"
command_sysctl="$($cmd_where sysctl)"
command_systemctl="$($cmd_where systemctl)"
command_tar="$($cmd_where tar)"
command_tcpdump="$($cmd_where tcpdump)"
command_tee="$($cmd_where tee)"
command_timeout="$($cmd_where timeout)"
command_torify="$($cmd_where torify)"
command_tracepath="$($cmd_where tracepath)"
command_traceroute="$($cmd_where traceroute)"
command_tree="$($cmd_where tree)"
command_tree="$($cmd_where tree)"
command_txt2html="$($cmd_where txt2html)"
command_uname="$($cmd_where uname)"
command_uuid="$($cmd_where uuid)"
command_vi="$($cmd_where vi)"
command_vim="$($cmd_where vim)"
command_vlc="$($cmd_where vlc) -I dummy -d"
command_w3m="$($cmd_where w3m)"
command_wget="$($cmd_where wget)"
command_whiptail="$($cmd_where whiptail)"
command_wpapassphrase="$($cmd_where wpa_passphrase)"
command_wpasupplicant="$($cmd_where wpa_supplicant)"
command_xhost="$($cmd_where xhost)"
command_xrandr="$($cmd_where xrandr)"
command_yad="$($cmd_where yad)"
command_zenity="$($cmd_where zenity)"
command_zgrep="$($cmd_where zgrep)"
command_wc="$($cmd_where wc)"
####
####
#### :rutina-final-possible-commands:
##########  english: variables: variables to declare     ##########
##########  spanish: variables: variables para declarar  ##########
#### :rutina-inicial-variables-system:
####
####
allow_close_log="no"      
allow_dmz_ip4="no"    
allow_dmz_ip6="no"    
allow_expert_commands=""
allow_forward_ip4="no"    
allow_forward_ip6="no"    
allow_gateway_ip4="no"    
allow_gateway_ip6="no"    
allow_input_all="no"    
allow_input_bandwidth="no"    
allow_input_maxconnect="no"    
allow_input_ping="no"     
allow_input_state="no"    
allow_mac_blacklist="no"    
allow_mac_whitelist="no"    
allow_net_blacklist="no"    
allow_net_whitelist="no"     
allow_others_protocols="no"     
allow_output_all="no"     
allow_output_bandwidth="no"     
allow_output_gid="no"     
allow_output_maxconnect="no"     
allow_output_ping="no"     
allow_output_state="no"     
allow_output_uid="no"     
allow_save_logcmd=""          
allow_separate_rules=""        
allow_shield_maxtries="no"    
allow_show_option="no"  
allow_show_time="no"
allow_string_allowed="no"   
allow_string_denied="no"     
allow_system_ulog="no"   
allow_use_ipv4=""                         
allow_use_ipv6=""                         
allow_use_legacy=""                       
allow_use_nft="no"                        
client_port_tcp="ssh,http,https"     
client_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     
config_close_deny="DROP"
config_dmz_ip4=""     
config_dmz_ip6=""     
config_gateway_ip4="0/0"    
config_gateway_ip6="::/0"    
config_graphicall_height="550"
config_graphicall_width="750"
config_input_bandwidth="12512"     
config_input_maxconnect="72"     
config_input_state="related,established"     
config_ip4_localhost="127.0.0.1"    
config_ip6_localhost="::1"    
config_ipv4_netclient="0/0"     
config_ipv4_netserver="0/0"     
config_ipv6_netclient="::/0"     
config_ipv6_netserver="::/0"   
config_mac_blacklist=""     
config_mac_whitelist=""     
config_net_blacklist="yandex.com,baidu.com,google.com"     
config_net_whitelist="deb.debian.org"     
config_others_protocols="icmp,igmp"     
config_output_bandwidth="512"     
config_output_gid="root"     
config_output_maxconnect="72"     
config_output_state="related,established"     
config_output_uid="root"     
config_shield_maxtries="10"  
config_shield_maxtries="12"     
config_shield_port="22" 
config_shield_port="22"
config_firewall_option="### $cmd_name $1 $2 $3 $4"
config_show_time="### date $($command_date)"
config_string_algoritmo="kpm"
config_string_allowed="one-string-that-like-how-a-passord,sourceforge.net"  
config_string_denied=".fb.com,.facebook.com,xxx.html" 
favorite_date_command=""
favorite_realpath_graphicalldialog=""
favorite_realpath_textdialog=""
favorite_text_browser=""
favorite_text_editor=""        
launch_rules_firewall="no"
list_rules_conceptual=""   
logserver_port_tcp="no"     
logserver_port_udp="no"     
miniclient_port_tcp="ssh,http,https"     
miniclient_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     
outcli="cli"
serverip_discover_ipv4="http://httpbin.org/ip"
serverip_discover_ipv6="http://httpbin.org/ip"
serverip_iperf_ipv4="ping.online.net"       
serverip_iperf_ipv6="ping6.online.net"      
serverport_iperf_ipv4="5200"                
serverport_iperf_ipv6="5200"
server_port_tcp=""     
server_port_udp=""     
server_radio_online="https://www.tdtchannels.com/lists/radio.m3u8"
time_server_waiting="9s"    
without_first_option="options"
####
####
#### :rutina-final-variables-system:
##########   english: necesary programs: programs path           ##########
##########   spanish: necesarios programas: ruta de programas    ##########
#### :rutina-inicial-necesary-commands:
####
####
#### system requisite utils
for requisite in $(echo $cmd_requisite_program | sed 's/,/ /g') ; do 
if [ "$($cmd_where $requisite)" == "$NULL" ]; then
echo "### program $requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_program"
exit; fi ; done
####
####
#### system requisite firewall4
for requisite in $(echo $cmd_requisite_firewall4 | sed 's/,/ /g') ; do 
if [ "$($cmd_where $requisite)" == "$NULL" ]; then
echo "### program $requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_firewall4"
exit; fi ; done
####
####
#### system requisite firewall6
for requisite in $(echo $cmd_requisite_firewall6 | sed 's/,/ /g') ; do 
if [ "$($cmd_where $requisite)" == "$NULL" ]; then
echo "### program $requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_firewall6"
exit; fi ; done
####
####
#### :rutina-final-necesary-commands:
##########    english: options priority        ##########
##########    spanish: prioridad de opciones   ##########
#### :rutina-inicial-options-order:
####
####
#### #### english: option for default    #### spanish: opcion por defecto
zero_dir="$(pwd)" ;
#### #### english: option for default    #### spanish: opcion por defecto
zero_option="$cmd_internal" ;
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
#### :rutina-final-options-order:
##########   english: profile y support X11 for root       ##########
##########   spanish: profile y soporte de X11 for root    ##########
#### :rutina-inicial-xhost:
####
####
#### allow root launch gui graphical in X11
####
####
if [ "$(logname)" != "$NULL" ] && [ "$(id -u)" == 0 ]; then
####
####
if [ "$command_sudo" != "$NULL" ]; then
$command_sudo -u "$(logname)" $command_xhost +SI:localuser:root &> /dev/null
else $command_sudo -u 0 $command_xhost +SI:localuser:root &> /dev/null
fi
####
####
fi
####
####
#### :rutina-final-xhost:
##########  english: files:    files and folders from fwiptables          ##########
##########  spanish: archivos: archivos y carpetas desde fwiptables       ##########
#### :rutina-inicial-config-folders:
####
####
#### english: permanent directory tree:   permanent directory and path directory config files
#### spanish: directorio permanente en arbol:   directorios permanentes y ruta de directorios 
####
####
#### #### Prepare directory data/cache: config for root 
####
####
if [ "$HOME" == "$NULL" ] ; then default_root_home="/root" 
else default_root_home="$HOME"; fi
####
####
#### Prepare directory cache: OR run OR /root/.cache/$cmd_filename
####
####
directory_cache_run="/run/$cmd_filename"  ### ununsed
directory_cache_home="$default_root_home/.cache/$cmd_filename"
####
####
#### #### variables tree and .cache ####
####
####
#### Root .cache 
directory_cache_necesary="$directory_cache_home"
####
####
#### Root .config
directory_data_necesary="$default_root_home/.config/$cmd_filename"
#### Tree .config
default_directory_template="$directory_data_necesary/fwiptables-template"
default_directory_control="$directory_data_necesary/fwiptables-control"
default_directory_custom="$directory_data_necesary/fwiptables-custom"
default_directory_preferences="$directory_data_necesary/fwiptables-preferences"
default_directory_logcmd="$directory_data_necesary/fwiptables-logcmd"
default_directory_logs="$directory_data_necesary/fwiptables-log"
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
#### :rutina-final-config-folders:
##########   english: if sane config directory                       ##########
##########   spanish: comprobar sanos directorios de configuracion   ##########
#### :rutina-inicial-configs-files:
####
####
#### english: templates cfg
#### spanish: plantillas cfg
####
####
default_tinycfg_eng="$default_directory_template/default-tiny-english.cfg"
default_tinycfg_spa="$default_directory_template/default-tiny-spanish.cfg"
default_minicfg_eng="$default_directory_template/default-mini-english.cfg"
default_minicfg_spa="$default_directory_template/default-mini-spanish.cfg"
default_fullcfg_eng="$default_directory_template/default-full-english.cfg"
default_fullcfg_spa="$default_directory_template/default-full-spanish.cfg"
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
file_default_logcmd="$default_directory_logcmd/default-logcmd-$cmd_version"
####
####
#### english: temporal files
#### spanish: archivos temporales
####
####
temporal_text="$directory_cache_necesary/$cmd_opt_date-text.txt"
temporal_textfinal="$directory_cache_necesary/$cmd_opt_date-text-final.txt"
temporal_gui="$directory_cache_necesary/$cmd_opt_date-textfinal.txt"
temporal_guifinal="$directory_cache_necesary/$cmd_opt_date-text-final.txt"
output_log="$directory_cache_necesary/$cmd_opt_date-textfinal.txt"
output_logfinal="$directory_cache_necesary/$cmd_opt_date-text-final.txt"
####
####
#### :rutina-final-config-files:
##########   english: if sane config directory                       ##########
##########   spanish: comprobar sanos directorios de configuracion   ##########
#### :rutina-inicial-sane-folders:
####
####
#### sane cache root
####
####
if [ ! -d "$directory_cache_necesary" ]; then
$command_mkdir -p $directory_cache_necesary &> /dev/null ; fi
####
####
#### sane data root
####
####
if [ ! -d "$default_directory_data_necesary" ]; then
$command_mkdir -p $default_directory_data_necesary &> /dev/null ; fi
####
####
#### sane default log
####
####
if [ ! -f "$file_default_logcmd" ]
then touch $file_default_logcmd &> /dev/null  ; fi
####
####
#### sane data tree
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
if [ ! -d "$default_directory_logcmd" ]; then
$command_mkdir -p "$default_directory_logcmd" &> /dev/null ; fi
if [ ! -d "$default_directory_logs" ]; then
$command_mkdir -p "$default_directory_logs" &> /dev/null ; fi
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
#### :rutina-final-sane-folders:
##########  english: variables: variables to declare     ##########
##########  spanish: variables: variables para declarar  ##########
#### :rutina-inicial-variables-header:
####
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
give_load="$title_md $text_ok [ Load firewall ] [ Firewall With iptables ]"
give_preferences="$title_md [ Configure ] [ $cmd_internal preferences-modify ]"
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
####
#### :rutina-final-variables-header:
##########  english: system-variables: variables to declare     ##########
##########  spanish: system-variables: variables para declarar  ##########
#### :rutina-inicial-variables-misc:
####
####
#### config proxy file
####
####
file_conf_clientproxy="$default_directory_proxy/fwiptables-proxy"
####
####
#### config radio music
####
####
name_radio_group="radio.m3u8"
file_radio_config="$default_directory_radio/fwiptables-config-$name_radio_group"
file_radio_cache="$default_directory_radio/fwiptables-cache-$name_radio_group"
####
####
#### config web adblock
####
####
web_blacklist_fademind="https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
web_blacklist_mvps="http://winhelp2002.mvps.org/hosts.txt"
web_blacklist_adaway="https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt"
web_blacklist_stevenblack="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
####
####
#### config file adblock
####
####
file_blacklist_fademind="$default_directory_adblock/hosts.blacklist_fademind"
file_blacklist_mvps="$default_directory_adblock/hosts.blacklist_mvps"
file_blacklist_adaway="$default_directory_adblock/hosts.blacklist_adaway"
file_blacklist_stevenblack="$default_directory_adblock/hosts.blacklist_stevenblack"
####
####
#### config to usernotes,expert-gen-usernotes
####
####
config_user_notes=$default_directory_preferences/user-notes.txt
first_user_notes="$(echo $second_option | cut -d "," -f 1)"
second_user_notes="$(echo $third_option | cut -d "," -f 1)"
####
####
#### :rutina-final-variables-misc:
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-variables-update-secondtime:
####
####
#### sane preferences
if [ ! -f "$file_default_preferences" ]
then $cmd_internal preferences-example &> $file_default_preferences ; fi
####
####
#### load preferences
if [ -f "$file_default_preferences" ] ;
then source $file_default_preferences ; fi
####
####
if [ "$without_first_option" = "$NULL" ] ; then without_first_option="options" ; fi
####
####
#### :rutina-final-variables-update-secondtime:
##########    english: Update first option               ##########
##########    spanish: Actualiza primera opción          ##########
#### :rutina-inicial-option-whithout:
####
####
#### Without first option
####
####
if [ "$first_option" = "$NULL" ]; then
echo "### $text_info [ Default Option: $without_first_option ] [ List Options: options ]"
echo "### $text_info [ Configure Default Option: $cmd_name preferences-modify ]"
first_option="$without_first_option" ; fi
####
####
#### :rutina-final-option-without:
##########    english: Update variables             ##########
##########    spanish: Actualiza variables          ##########
#### :rutina-inicial-variables-sane:
####
####
#### sane variables
case "$NULL" in 
"$choosed_iptables")      ;; *) choosed_iptables="no"      ;;
"$launch_rules_firewall") ;; *) launch_rules_firewall="no" ;;
"$name_firewall")         ;; *) name_firewall="no"         ;;
"$type_firewall")         ;; *) type_firewall="no"        ;;
esac
####
####
#### configure expert commands
if [ "$allow_expert_commands" == "no" ]; then
####
####
case "$first_option" in 
exper*) echo "$title_md See in preferences allow_expert_commands to active it option"
exit ;; esac
####
####
case "$second_option" in
exper*) echo "$title_md See in preferences allow_expert_commands to active it option"
exit ;; esac
####
####
fi
####
####
#### :rutina-final-variables-sane:
##########      english: search favorite iperf: favorite iperf command        ##########
##########      spanish: busca preferida fecha: favorita comando de iperf     ##########
#### :rutina-inicial-favorite-iperf:
####
####
#### choose iperf3 and the iperf to speed ip
if [ "$favorite_iperf_command" == "$NULL" ]; then
####
####
if [ "$command_iperf3"    != "$NULL" ]; then
favorite_iperf_command="$command_iperf3" ; fi
if [ "$command_iperf"   != "$NULL" ]; then
favorite_iperf_command="$command_iperf" ; fi
####
####
fi
####
####
#### :rutina-final-favorite-iperf:
##########      english: search favorite date: favorite date command        ##########
##########      spanish: busca preferida fecha: favorita comando de fecha   ##########
#### :rutina-inicial-favorite-date:
####
####
#### configure favorite date
if [ "$favorite_date_command" == "$NULL" ]; then
####
####
if [ "$command_rdate"   != "$NULL" ]; then
favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then
favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then
favorite_date_command="$command_ntpdate"         ; fi
####
####
fi
####
####
#### :rutina-final-favorite-date:
##########      english: search favorite text editor: favorite editor text     ##########
##########      spanish: busca preferido editor: favorite editor de texto     ##########
#### :rutina-inicial-favorite-editor:
####
####
#### configure text editor
if [ "$favorite_text_editor" == "$NULL" ]; then
####
####
if [ "$command_vi"  != "$NULL" ]  ; then    
favorite_text_editor="$command_vi"      ; fi
if [ "$command_vim"  != "$NULL" ]  ; then   
favorite_text_editor="$command_vim"     ; fi
if [ "$command_pico" != "$NULL" ] ; then  
favorite_text_editor="$command_pico"    ; fi
if [ "$command_editor" != "$NULL" ] ; then  
favorite_text_editor="$command_editor"  ; fi
if [ "$command_nano"  != "$NULL" ] ; then   
favorite_text_editor="$command_nano"    ; fi
####
####
fi
####
####
#### :rutina-final-favorite-editor:
##########      english: search favorite text dialog: favorite text dialog     ##########
##########      spanish: busca preferido text dialogo: favorite text dialog    ##########
#### :rutina-inicial-favorite-dialog:
####
####
#### configure favorite dialog cli text
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
####
####
if [ "$command_dialog"  != "$NULL" ]  ; then  
favorite_realpath_textdialog="$command_dialog"
favorite_basename_textdialog="$(basename $command_dialog)"
fi
####
####
if [ "$command_whiptail" != "$NULL" ] ; then  
favorite_realpath_textdialog="$command_whiptail"
favorite_basename_textdialog="$(basename $command_whiptail)"
fi
####
####
fi
####
####
#### :rutina-final-favorite-dialog:
##########      english: search favorite dialog: favorite dialog     ##########
##########      spanish: busca preferido dialogo: favorite dialog   ##########
#### :rutina-inicial-favorite-graphicall:
####
####
#### configure favorite graphicall gui
if [ "$favorite_realpath_graphicalldialog" == "$NULL" ]; then
####
####
if [ "$command_zenity"  != "$NULL" ] ; then  
favorite_realpath_graphicalldialog="$command_zenity"
favorite_basename_graphicalldialog="$(basename $command_zenity)"
fi
####
####
if [ "$command_yad"     != "$NULL" ] ; then  
favorite_realpath_graphicalldialog="$command_yad"
favorite_basename_graphicalldialog="$(basename $command_yad)"
fi
####
####
fi
####
####
#### :rutina-final-favorite-graphicall:
##########      english: search favorite browser: favorite browser     ##########
##########      spanish: busca preferido navegador: favorite browser   ##########
#### :rutina-inicial-favorite-browser:
####
####
#### configure favorite browser text
if [ "$favorite_text_browser" == "$NULL" ]; then
####
####
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
####
####
fi
####
####
#### :rutina-final-favorite-browser:
##########      english: search favorite dhcp Discover ip net     ##########
##########      spanish: busca preferido dhcp Descubre la ip      ##########
#### :rutina-inicial-favorite-dhcp:
####
####
#### configure favorite dhcp command
if [ "$favorite_dhcp_command" == "$NULL" ]; then
####
####
if [ "$command_dhcpcd"  != "$NULL" ]         ; then
favorite_dhcp_command="$command_dhcpcd"           ; fi
if [ "$command_dhclientscript" != "$NULL" ] ; then  
favorite_dhcp_command="$command_dhclientscript"  ; fi
if [ "$command_dhclient"   != "$NULL" ] ;      then  
favorite_dhcp_command="$command_dhclient"         ; fi
####
####
fi
####
####
#### :rutina-final-favorite-dhcp:
##########      english: search favorite date: favorite date command        ##########
##########      spanish: busca preferida fecha: favorita comando de fecha   ##########
#### :rutina-inicial-favorite-date-command:
####
####
#### configure favorite dialog update time
if [ "$favorite_date_command" == "$NULL" ]; then
####
####
if [ "$command_rdate"   != "$NULL" ]; then  
favorite_date_command="$command_rdate -4 -a -n"  ; fi
if [ "$command_sntp"    != "$NULL" ]; then  
favorite_date_command="$command_sntp"            ; fi
if [ "$command_ntpdate" != "$NULL" ]; then  
favorite_date_command="$command_ntpdate"         ; fi
####
####
fi
####
####
#### :rutina-final-favorite-date:
##########      english: search favorite text music player             ##########
##########      spanish: busca preferida texto reproductor de musica   ##########
#### :rutina-inicial-favorite-music:
####
####
#### configure favorite player
if [ "$favorite_text_music" == "$NULL" ]; then
####
####
if [ "$command_vlc" != "$NULL" ]; then  
favorite_text_music="$command_vlc"      ; fi
####
####
fi
####
####
#### :rutina-final-favorite-music:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-simple:
####
####
##########     ALIAS SIMPLE
##########     ALIAS SIMPLE
####
####
#### english:  alias firewall-list with conceputal firewall-listconceptual:
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
case "$first_option" in
"output")         first_option="optional-output"  ;;
"control")        first_option="firewall-wallcontrol" ;;
"listconceptual") first_option="firewall-listconceptual" ;;
"listnumeral")    first_option="firewall-listnumeral" ;;
"wallcustom")     first_option="firewall-wallcustom" ;;
"wallsystem")     first_option="firewall-wallsystem" ;;
"easy")           first_option="firewall-netsystem" ;;
"custom")         first_option="load-custom" ;;
"examples")       first_option="options-examples" ;;
"regen")          first_option="templates-regen" ;;
"expert")         first_option="options-expert" ;;
"ver")            first_option="version" ;;
"client-squid")   first_option="client-proxy" ;;
"server-squid")   first_option="server-proxy" ;;
"all-names")      first_option="names" ;;
"list-options")   first_option="options" ;;
"mini-options")   first_option="options" ;;
"options-mini")   first_option="options" ;;
"sentlog")        first_option="logfiles" ;;
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
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-output:
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
"-info") first_option="info" ;;
"--info") first_option="info" ;;
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
"silent") first_option="silent" ;;
"-silent") first_option="silent" ;;
"--silent") first_option="silent" ;;
"-pdf") first_option="pdf" ;;
"--pdf") first_option="pdf" ;;
"i") first_option="info" ;;
"n") first_option="narrowtxt" ;;
"t") first_option="txt" ;;
"c") first_option="cli" ;;
"g") first_option="gui" ;;
"l") first_option="log" ;;
"s") first_option="silent" ;;
"p") first_option="pdf" ;;
"-i") first_option="info" ;;
"-n") first_option="narrowtxt" ;;
"-t") first_option="txt" ;;
"-c") first_option="cli" ;;
"-g") first_option="gui" ;;
"-l") first_option="log" ;;
"-s") first_option="silent" ;;
"-p") first_option="pdf" ;;
esac
####
####
case "$first_option" in
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
#### :rutina-final-alias-output:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-interface:
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
"gui-roll")
favorite_realpath_graphicalldialog="$command_zenity" ;
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-roll" 
second_option="$favorite_basename_graphicalldialog"
;;
"gui-roll-zenity")
favorite_realpath_graphicalldialog="$command_zenity" ;
favorite_basename_graphicalldialog="$(basename $favorite_realpath_graphicalldialog)" ;
first_option="gui-roll-zenity" 
second_option="$favorite_basename_graphicalldialog"
;;
####
####
esac
####
####
#### :rutina-final-alias-interface:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-drop-warning:
####
####
#### english: alias simple for options commons
####
####
case "$first_option" in
"output")         first_option="optional-output"  ;;
"control")        first_option="firewall-wallcontrol" ;;
"listconceptual") first_option="firewall-listconceptual" ;;
"listnumeral")    first_option="firewall-listnumeral" ;;
"wallcustom")     first_option="firewall-wallcustom" ;;
"wallsystem")     first_option="firewall-wallsystem" ;;
"easy")           first_option="firewall-netsystem" ;;
"custom")         first_option="load-custom" ;;
"examples")       first_option="options-examples" ;;
"regen")          first_option="templates-regen" ;;
"expert")         first_option="options-expert" ;;
"ver")            first_option="version" ;;
"client-squid")   first_option="client-proxy" ;;
"server-squid")   first_option="server-proxy" ;;
"all-names")      first_option="names" ;;
"options")        first_option="options" ;;
"mini-options")   first_option="options" ;;
"options-mini")   first_option="options" ;;
"sentlog")        first_option="logfiles" ;;
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
#### :rutina-inicial-drop-warning:
####
####
#### supress error messages
case $first_option in 
"ls4") $cmd_internal list4 &> $temporal_text-list4
$command_cat $temporal_text-list4 | $command_grep -E -v Warning: ; exit ;;
"ls6") $cmd_internal list6 &> $temporal_text-list6
$command_cat $temporal_text-list6 | $command_grep -E -v Warning: ; exit ;;
"lsn4") $cmd_internal listn4 &> $temporal_text-listn4
$command_cat $temporal_text-listn4 | $command_grep -E -v Warning: ; exit ;;
"lsn6") $cmd_internal listn6 &> $temporal_text-listn6
$command_cat $temporal_text-listn6 | $command_grep -E -v Warning: ; exit ;;
esac ; 
####
####
#### :rutina-final-drop-warning:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-config-esquive:
####
####
#### english:  alias esquive templates
####
####
case "$first_option" in
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom")
$cmd_internal templates-regen &> /dev/null ;; esac
####
####
if [ "$first_option" == "txt" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_internal $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "narrowtxt" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_internal $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "cli" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_internal $second_option $third_option ; exit ;; esac ; fi
####
####
if [ "$first_option" == "gui" ]; then 
case "$second_option" in
#### "$NULL"|"options") 
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") $cmd_internal templates-regen  &> /dev/null ;; esac ; fi
####
####
if [ "$first_option" == "log" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom")
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in log optional-output." ;
exit ;; esac ; fi
####
####
if [ "$first_option" == "pdf" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom") 
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in pdf optional-output." ;
exit ;; esac ; fi
####
####
if [ "$first_option" == "silent" ]; then 
case "$second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-modify"|\
"modify-custom")
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in silent optional-output." ;
exit ;; esac ; fi
####
####
#### :rutina-final-config-esquive:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-narrowtxt:
####
####
#### output narrow:      General text without warnings version list narrow
####
####
if [ "$first_option" == "narrowtxt" ] ;then echo "$head_waiting_narrow"
####
####
case $second_option in 
ls*|list*) $cmd_internal $second_option &> $temporal_text 
$command_cat  $temporal_text | $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_textfinal
$command_cat  $temporal_textfinal | $command_grep -E -v Warning: ; exit ;;
"$NULL") $cmd_internal \
| $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_text
$command_cat  $temporal_text | $command_grep -E -v Warning: ; exit ;;
*) $cmd_internal $second_option $third_option $quad_option \
| $command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' &> $temporal_text
$command_cat  $temporal_text | $command_grep -E -v Warning: ; exit ;;
#### *) echo "$title_md Narrow option works only to list rules" ;; 
esac
####
####
exit ; fi
####
####
#### :rutina-final-alias-narrowtxt:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-txt:
####
####
#### output txt:      General text without warnings version list normal
####
####
if [ "$first_option" == "txt" ]; then echo "$head_waiting_txt"
####
####
case $second_option in 
ls*|list*) $cmd_internal $second_option $third_option &> $temporal_text
$command_cat  $temporal_text | $command_grep -E -v Warning: ; exit ;;
*) $cmd_internal $second_option $third_option $quad_option ; exit ;; esac ; fi
####
####
#### :rutina-final-alias-text:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-cli:
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
#### thebox="$($cmd_internal txt $second_option $third_option)"
####
#### --clear --notags
case $second_option in 
ls*|list*) $favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_internal txt $second_option)" 0 0 ; exit ;;
*) $favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_internal $second_option $third_option $quad_option)" 0 0 ; exit ;;
#### *) echo "$title_md cli works only with list options" ; exit ;;
esac ; fi
####
####
#### $cmd_internal text-pause ; clear ; exit ; fi
####
####
#### :rutina-final-alias-cli:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-alias-log:
####
####
#### output log
####
####
if [ "$first_option" == "log" ]
####
####
then echo "$head_waiting_log"
echo "### ### $text_info [ $second_option $third_option $quad_option ] \
[ $cmd_log_date ]" &> $output_log
$cmd_internal $second_option $third_option $quad_option &> $output_log
$command_cat  $output_log | $command_grep -E -v Warning: \
&> $default_directory_logs/$cmd_opt_date-$second_option.txt
echo "$title_md [ file ]  $default_directory_logs/$cmd_opt_date-$second_option.txt"
####
####
exit ; fi
####
####
#### output pdf
####
####
if [ "$first_option" == "pdf" ]
####
####
then case $command_convert in "$NULL") 
echo "$title_md install imagemagick to print pdf to $default_directory_pdf" ; exit ;; esac
#### allow print to PDF policy
echo "$head_waiting_pdf"
sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-*/policy.xml &> /dev/null
#### send print to home output fwiptables.pdf
$cmd_internal $second_option $third_option $quad_option | $command_convert -page A3 text:- \
$default_directory_pdf/$cmd_opt_date-$second_option.pdf 
echo "$title_md [ file ] $default_directory_pdf/$cmd_opt_date-$second_option.pdf"
####
####
exit ; fi
####
####
#### silent: output null
####
####
if [ "$first_option" == "silent" ]
####
####
then $cmd_internal "$second_option" "$third_option" "$quad_option" &> /dev/null
####
####
exit ; fi
####
####
#### :rutina-final-alias-log:
##########     english: cmdlog:       ##########
##########     spanish: autoguardado  ##########
#### :rutina-inicial-allow-logcmd:
####
####
if [ "$allow_save_logcmd" != "no" ]
####
####
then head_logcmd="date: $cmd_log_date \
path: $cmd_internal ver: $cmd_version \
opt: $first_option $second_option $third_option"
echo $head_logcmd >> $file_default_logcmd
####
####
fi
####
####
#### :rutina-final-allow-logcmd:
##########     english: show option         ##########
##########     spanish: mostrar opcion      ##########
#### :rutina-inicial-allow-show-option:
####
####
if [ "$allow_show_option" == "" ] ; then
####
####
echo "$config_firewall_option"
####
####
fi
####
####
#### :rutina-final-allow-show-option:
##########     english: time              ##########
##########     spanish: mostrar fecha     ##########
#### :rutina-inicial-allow-show-time:
####
####
if [ "$allow_show_time" == "" ] ; then
####
####
echo "$config_show_time"
####
####
fi
####
####
#### :rutina-final-allow-show-time:
##########   english: logfiles: Read log fwiptables-logfiles  ##########
##########   spanish: logfiles: Lee log  fwiptables-logfiles  ##########
#### :rutina-inicial-config-logfiles:
####
####
if [ "$first_option" == "logfiles" ] ; then
####
####
echo 
ls -1 $default_directory_logs
echo
echo 
echo "### ### [ folder: ] [ $default_directory_logs ]"
####
####
exit; fi
####
####
#### :rutina-final-config-logfiles:
##########    english: logcmd: Read log fwiptables-logcmd   ##########
##########    spanish: logcmd: Lee log  fwiptables-logcmd   ##########
#### :rutina-inicial-config-logcmd:
####
####
if [ "$first_option" == "logcmd" ] || [ "$first_option" == "autolog" ] ; then
####
####
echo "$title_md $text_info [ last 50 lines from file showed ] [ $file_default_logcmd ]"
if [ ! -f $file_default_logcmd ]; then touch $file_default_logcmd ; fi
echo
$command_cat   "$file_default_logcmd" | tail -50
echo
echo "$title_md $text_info [ last 50 lines from file showed ] [ $file_default_logcmd ]"
####
####
exit; fi
####
####
#### :rutina-final-config-logcmd:
##########    english: log-stat: Read stats log fwiptables-logcmd    ##########
##########    spanish: log-stat: show stats log  fwiptables-logcmd   ##########
#### :rutina-inicial-log-stat:
####
####
if [ "$first_option" == "log-stat" ] ; then
####
####
if [ "$command_wc" == "$NULL" ] ; then
echo "$text_info Please install wc command"; exit; fi
####
####
echo "$title_md The logcmd with log-stat"
conteo="$($command_cat $file_default_logcmd | $command_wc -l)"
echo "$text_md $conteo Commands launched. Logged with automatic logcmd"
echo "$text_md file: $file_default_logcmd"
####
####
echo "$title_md The logs with log-stat"
conteo="$($command_ls -1 $default_directory_logs | $command_wc -l)"
echo "$text_md $conteo Commands output. Logged with output log"
echo "$text_md folder: $default_directory_logs"
####
####
echo "$title_md The pdf with log-stat"
conteo="$($command_ls -1 $default_directory_pdf | $command_wc -l)"
echo "$text_md $conteo Commands output. Logged with output pdf"
echo "$text_md folder: $default_directory_pdf"
####
####
exit; fi
####
####
#### :rutina-final-log-stat:
##########    english: version: system script, the version option              ##########
##########    spanish: version: script de sistema, la opcion mostrar version   ##########
#### :rutina-inicial-version:
####
####
if [ "$first_option" == "version" ]; then
####
####
echo "$text_md $text_md     Detail Firewall: Detail Version            $text_md"
####
####
if [ "$(echo $XDG_SESSION_TYPE)" != "$NULL" ]; then
echo "$text_md $text_md         Session XDG: $XDG_SESSION_TYPE         $text_md"
fi
####
####
echo "$text_md $text_md       Name Firewall: $cmd_name                 $text_md"
echo "$text_md $text_md    Version Firewall: $cmd_version              $text_md"
echo "$text_md $text_md   Released Firewall: $cmd_released             $text_md"
echo "$text_md $text_md     Source Firewall: $cmd_notinstalled         $text_md"
echo "$text_md $text_md   Internal Firewall: $cmd_internal             $text_md"
echo "$text_md $text_md   Short Description: $cmd_shortdescription     $text_md"
echo "$text_md $text_md    Long Description: $cmd_longdescription      $text_md"
echo "$text_md $text_md      Data Directory: $directory_data_necesary  $text_md"
echo "$text_md $text_md     Cache Directory: $directory_cache_necesary $text_md"
echo "$text_md $text_md      Finder Program: $cmd_where                $text_md"
echo "$text_md $text_md   Requisite Program: $cmd_requisite_program    $text_md"
echo "$text_md $text_md Requisite Firewall4: $cmd_requisite_firewall4  $text_md"
echo "$text_md $text_md Requisite Firewall6: $cmd_requisite_firewall6  $text_md"
echo "$text_md $text_md      Automatic Edit: $favorite_text_editor     $text_md"
echo "$text_md $text_md       Automatic cli: $favorite_realpath_textdialog       $text_md"
echo "$text_md $text_md       Automatic gui: $favorite_realpath_graphicalldialog $text_md"
echo "$text_md $text_md       Automatic pdf: $command_convert          $text_md"
echo "$text_md $text_md     Configured PATH: $PATH                     $text_md"
echo "$text_md $text_md         File Format: $cmd_format               $text_md"
echo "$text_md $text_md    Developer Actual: $cmd_developer            $text_md"
echo "$text_md $text_md        Email Report: $cmd_contact              $text_md"
echo "$text_md $text_md     License Program: $cmd_license              $text_md"
####
####
exit ; fi
####
####
#### :rutina-final-version:
##########    english: expert-cpufreq-info: info cpu frequence                 ##########
##########    spanish: expert-cpufreq-info: informacion de frecuencia de cpu   ##########
#### :rutina-inicial-expert-cpufreq:
####
####
if [ "$first_option" == "expert-cpufreq-info" ] ; then
####
####
echo "$title_md [ $first_option ] [ show cpu frequence info ]"
if [ "$command_cpufreqinfo" == "$NULL" ]; then
echo "$title_md please install cpufreq-info"; fi
$command_cpufreqinfo
####
####
exit; fi
####
####
#### :rutina-final-expert-cpufreq:
##########    english: expert-cpupower-info: info cpu frequence                 ##########
##########    spanish: expert-cpupower-info: informacion de frecuencia de cpu   ##########
#### :rutina-inicial-expert-cpupower:
####
####
if [ "$first_option" == "expert-cpupower-info" ] ; then
####
####
echo "$title_md [ $first_option ] [ show cpu frequence info ]"
if [ "$command_cpupower" == "$NULL" ]; then
echo "$title_md please install cpupower"; fi
$command_cpupower -c all frequency-info
####
####
exit; fi
####
####
#### :rutina-final-expert-cpupower:
##########    english: expert-configs-save: configurations backups in actual folder    ##########
##########    spanish: expert-configs-save: copia de configuraciones en carpeta actual ##########
#### :rutina-inicial-expert-configs-save:
####
####
if [ "$first_option" == "expert-configs-save" ] ; then
####
####
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
####
####
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
#### :rutina-inicial-expert-wpascan:
####
####
if   [ "$first_option" == "expert-wpa-scan" ]; then
####
####
echo "$title_md [ $first_option ]  [ Show SSID from net wifi ] "
if   [ "$command_iw" == "$NULL" ]; then 
echo "$title_md $text_info [ Please, Install iw to work ]" ; exit ; fi
for a in $($command_cat  /proc/net/dev | $command_grep -i  : | cut -d ":" -f 1)
do $command_ifconfig $a up
$command_iw $a scan | $command_grep -E -i "on $a|ssid" ; done
####
####
exit; fi
####
####
#### :rutina-final-expert-wpascan:
##########    english: expert-wpa-new: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-new: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpanew:
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
$cmd_internal expert-wpa-regen
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
$cmd_internal expert-wpa-regen
cp $default_directory_wpa/defaultwpa $default_directory_wpa/wpaconfig_$second_option
editor $default_directory_wpa/wpaconfig_$second_option
####
####
exit; fi
####
####
#### :rutina-final-expert-wpanew:
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
####
####
exit; fi
####
####
#### :rutina-final-expert-wpamodify:
##########    english: expert-wpa-list: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-list: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpalist:
####
####
if [ "$first_option" == "expert-wpa-list" ]
####
####
then ls -1 "$default_directory_wpa" | cut -d "_" -f 2-
####
####
exit ; fi
####
####
#### :rutina-final-expert-wpalist:
##########    english: expert-wpa-show: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-show: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpashow:
####
####
if [ "$first_option" == "expert-wpa-show" ]; then
####
####
if [ "$second_option" == "$NULL" ]
then $cmd_internal expert-wpa-list
echo "$title_md $text_info use: $first_option nameconfig" ; exit ; fi
if [ -f "$default_directory_wpa/wpaconfig_$second_option" ]; then
echo "$title_md $title_md $title_md $title_md wpa config_:"
$command_cat  "$default_directory_wpa/wpaconfig_$second_option"
echo "$title_md $title_md $title_md $title_md wpa connect_:"
$command_cat  "$default_directory_wpa/wpaconnect_$second_option"
else echo "$title_md $text_fail use: $first_option nameconfig"; exit ; fi
####
####
exit; fi
####
####
#### :rutina-final-expert-wpashow:
##########    english: expert-wpa-connect: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-connect: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpaconnect:
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
####
####
exit; fi
####
####
#### :rutina-final-expert-wpaconnect:
##########    english: expert-wpa-regen: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-regen: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wparegen:
####
####
if [ "$first_option" == "expert-wpa-regen" ]; then
####
####
if [ "$command_wpapassphrase" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; fi
if [ "$command_wpasupplicant" == "$NULL" ]
then echo "$title_md $text_fail Install wpa_passphrase"; fi
$cmd_internal expert-wpa-example &> $default_directory_wpa/defaultwpa
####
####
exit; fi
####
####
#### :rutina-final-expert-wparegen:
##########    english: expert-wpa-example: example from a file wpa_supplicant   ##########
##########    spanish: expert-wpa-example: ejemplo de un archivo wpa_supplicant ##########
#### :rutina-inicial-expert-wpaexample:
####
####
if [ "$first_option" == "expert-wpa-example" ]; then
####
####
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
####
####
exit; fi
####
####
#### :rutina-final-expert-wpaexample:
##########    english: preferences-modify: modify preferences   ##########
##########    spanish: preferences-modify: modify preferences   ##########
#### :rutina-inicial-preferences-modify:
####
####
if [ "$first_option" == "preferences-modify" ]; then 
echo "$cycle_header firewall $first_option"; echo
####
####
echo "$title_md [ $first_option ] [ modify the default fwiptables ] "
$favorite_text_editor $file_default_preferences
echo "$title_md $text_info [ file $file_default_preferences ]"
####
####
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
####
####
echo "$title_md [ $first_option ] [ modify the default dialog ] "
echo 
$favorite_text_editor $default_dialogrc
echo "$title_md $text_info [ edit file $default_dialogrc to change variables ]"
####
####
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
####
####
$command_cat  $file_default_preferences
echo "$title_md $text_info [ file $file_default_preferences ]"
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
####
####
$cmd_internal preferences-example &> $file_default_preferences
echo "$title_md $text_ok [ Regenerated ] [ $cmd_internal values for default ]"
echo "$title_md $text_ok [ Regenerated ] [ $file_default_preferences ]"
####
####
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
####
####
echo "$title_md"
echo "$title_md"
echo "$title_md $title_md default option when not option are there"
echo "without_first_option=options                    ## read below"
echo "$title_md type: void or one valid option required to works"
echo "$title_md example1:options example2:list4 example3:ip4"
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
echo "$title_md $title_md default logcmd"
echo "allow_save_logcmd=                              ## or void for yes or no"
echo "$title_md $title_md default header"
echo "allow_show_option=                              ## or void for yes or no"
echo "allow_show_time=no                              ## or void for yes or no"
echo "$title_md"  
echo "$title_md $title_md mini client ports from side client: for miniserver tcp/udp"  
echo "miniclient_port_tcp=ssh,http,https"
echo "miniclient_port_udp=domain,domain-s,bootpc,bootps,ntp,https"
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
####
####
exit ; fi
####
####
#### :rutina-final-preferences-example:
##########    english: resolve : get net info               ##########
##########    spanish: resolve : da informacion de la red   ##########
#### :rutina-inicial-resolve:
####
####
if [ "$first_option" == "resolve" ]; then
####
####
echo "$title_md $text_info $title_md [ Domain resolve ] [ nameserver and search ] $title_md"
if [ -f /etc/resolv.conf ]
then echo "$text_md $text_md File: /etc/resolv.conf"
$command_cat  /etc/resolv.conf | $command_grep -E "nameserver|search" | \
$command_awk '{print "     " $1 " " $2}' ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$text_md $text_md File: /etc/resolv.conf.head"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$text_md $text_md File: /etc/resolv.conf.body"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$text_md $text_md File: /etc/resolv.conf.tail"; fi
if [ -d /etc/resolvconf ]
then echo "$text_md $text_md Directory: /etc/resolvconf" ; fi
####
####
exit; fi
####
####
#### :rutina-final-resolve:
##########    english: network : get net info               ##########
##########    spanish: network : da informacion de la red   ##########
#### :rutina-inicial-network:
####
####
if [ "$first_option" == "network" ]; then
####
####
$cmd_internal network4
$cmd_internal network6
####
####
exit; fi
####
####
#### :rutina-final-network:
##########    english: network4 : get net info               ##########
##########    spanish: network4 : da informacion de la red   ##########
#### :rutina-inicial-network4:
####
####
if [ "$first_option" == "network4" ]; then
####
####
echo "$title_md $text_info ### [ Network Route ] [ Route ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip -4 route ; fi
####
####
echo "$title_md $text_info ### [ Configured ip ] [ inet ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip address ls | $command_egrep ": |inet " ; fi
####
####
exit; fi 
####
####
#### :rutina-final-network4:
##########    english: network6 : get net info               ##########
##########    spanish: network6 : da informacion de la red   ##########
#### :rutina-inicial-network6:
####
####
if [ "$first_option" == "network6" ]; then
####
####
echo "$title_md $text_info ### [ Network Route ] [ Route ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip -6 route ; fi
####
####
echo "$title_md $text_info ### [ Configured ip ] [ inet ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$text_md $text_info [ install ip command ]"
else $command_ip address ls | $command_egrep ": |inet6 " ; fi
####
####
exit; fi
####
####
#### :rutina-final-network6:
##########    english: ip : get net info               ##########
##########    spanish: ip : da informacion de la red   ##########
#### :rutina-inicial-ip:
####
####
if [ "$first_option" == "ip" ]; then
####
####
$cmd_internal ip4
$cmd_internal ip6
####
####
exit ; fi
####
####
#### :rutina-final-ip:
##########    english: address : get net info               ##########
##########    spanish: address : da informacion de la red   ##########
#### :rutina-inicial-address:
####
####
if [ "$first_option" == "address" ]; then
####
####
$cmd_internal address4
$cmd_internal address6
####
####
exit ; fi
####
####
#### :rutina-final-address:
##########    english: ip4 : get net info               ##########
##########    spanish: ip4 : da informacion de la red   ##########
#### :rutina-inicial-ip4:
####
####
if [ "$first_option" == "ip4" ]; then
####
####
echo "$title_md $text_info ### [ Private ip ] [ Address ipv4 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$title_md $text_info [ install ip command ]"
else  $command_ip -4 address | $command_grep -i  inet | \
$command_grep -iv 127.0.0.1 | $command_sed 's/inet//g' | \
$command_cut -d "/" -f 1 ; fi
####
####
echo "$title_md $text_info ### [ Public ip ] [ Address ipv4 ] ###"
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md $text_info [ install curl command ]" ;
else public_ip4="$($command_curl -k -s -4 $serverip_discover_ipv4 -w '\n'| head -1)"
if [ "$public_ip4" == "<!DOCTYPE html>" ] || [ "$public_ip4" == "" ] ;
then echo "fail: public ip hidden for dns server" ;
else echo "$text_md   $public_ip4"; fi ; fi
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
####
####
echo "$title_md $text_info ### [ Private ip ] [ Address ipv6 ] ###"
if [ "$command_ip" == "$NULL" ]
then echo "$title_md $text_info [ install ip command ]"
else  $command_ip -6 address | $command_grep -i  inet6 | \
$command_grep -iv 127.0.0.1 | $command_sed 's/inet6//g' | \
$command_cut -d "/" -f 1 ; fi
####
####
echo "$title_md $text_info ### [ Public ip ] [ Address ipv6 ] ###"
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md $text_info [ install curl command ]" ;
else public_ip6="$($command_curl -k -s -6 $serverip_discover_ipv4 -w '\n'| head -1)"
if [ "$public_ip4" == "<!DOCTYPE html>" ] || [ "$public_ip4" == "" ] ;
then echo "fail: public ip hidden for dns server" ;
else echo "$text_md   $public_ip6"; fi; fi
####
####
exit; fi
####
####
#### :rutina-final-ip6:
##########    english: sockets: The sockets option  ##########
##########    spanish: sockets: La opcion sockets   ##########
#### :rutina-inicial-sockets:
####
####
if   [ "$first_option" == "sockets" ]; then
####
####
echo "$title_md [ $first_option ] [ Show whith ss: LISTEN sockets ] "
if [ "$command_ss" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install ss command ]"; exit; fi
if [ "$command_awk" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install awk command ]"; exit; fi
$command_ss -l -460  | $command_grep "\:\*" | \
$command_awk '{print "     " $1 " " $2 " " $5}'
####
####
exit; fi
####
####
#### :rutina-final-sockets:
##########    english: address4 : get net info               ##########
##########    spanish: address4 : da informacion de la red   ##########
#### :rutina-inicial-address4:
####
####
if [ "$first_option" == "address4" ]; then
####
####
echo "$title_md [ $first_option ]  [ show info about net address ip4 ]"
$cmd_internal network4
$cmd_internal ip4
$cmd_internal resolve
$cmd_internal sockets
####
####
exit; fi
####
####
#### :rutina-final-address4:
##########    english: address6 : get net info               ##########
##########    spanish: address6 : da informacion de la red   ##########
#### :rutina-inicial-address6:
####
####
if [ "$first_option" == "address6" ]; then
####
####
echo "$title_md [ $first_option ]  [ show info about net address ip6 ]"
$cmd_internal network6
$cmd_internal ip6
$cmd_internal resolve
$cmd_internal sockets
####
####
exit; fi
####
####
####
####
#### :rutina-final-address6:
##########    english: expert-conf-clientproxy: get net info               ##########
##########    spanish: expert-conf-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-confclientproxy
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
then $command_cat  "$default_directory_proxy/fwiptables-proxy-$second_option" ; fi
###
###
exit ; fi
####
####
#### :rutina-final-expert-confclientproxy
##########    english: expert-show-clientproxy: get net info               ##########
##########    spanish: expert-show-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-showclientproxy
####
####
if [ "$first_option" == "expert-show-clientproxy" ]; then echo
####
####
echo "$title_md $text_info ### [ Proxy tunnel ] [ Address proxy ] ###"
echo "$title_md [ Necesary:  ] WHITHOUT script shell and WHITHOUT exit command ]"
echo "$title_md [ Editable:  ] declare -x HTTPS_PROXY=https://127.0.0.1:8080"
echo "$title_md [ configure: ] $cmd_internal expert-conf-clientproxy user:pass@ip:port"
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
echo ; $command_cat  "$default_directory_proxy/$second_option" ; exit ; fi
####
####
exit ; fi
####
####
#### :rutina-final-expert-showclientproxy
##########    english: expert-active-clientproxy: get net info               ##########
##########    spanish: expert-active-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactiveclientproxy
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
#### :rutina-final-expert-activeclientproxy
##########    english: expert-deactive-clientproxy: get net info               ##########
##########    spanish: expert-deactive-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactiveclientproxy
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
#### :rutina-final-expert-deactiveclientproxy
##########    english: expert-show-resolve : get net info               ##########
##########    spanish: expert-show-resolve : da informacion de la red   ##########
#### :rutina-inicial-expert-showresolve
####
####
if [ "$first_option" == "expert-show-resolve" ]; then echo
####
####
echo "$title_md $text_info ### [ Domain resolve ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf ]"
$command_cat  /etc/resolv.conf | $command_grep -E "nameserver|search"      ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$title_md [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ]
then echo "$title_md [ yes directory ] [ /etc/resolvconf ]"      ; fi
####
####
exit; fi
####
####
#### :rutina-final-expert-showresolve
##########    english: expert-trace-tcp4: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-tcp4: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-tracetcp4:
####
####
if   [ "$first_option" == "expert-trace-tcp4" ]; then
####
####
echo "$title_md [ $first_option ]  [ trace ip or host with tcp ipv4 ]"
case $command_tracepath in "$NULL")
echo "$title_md $text_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_internal $first_option host"; exit; fi
$cmd_internal save before-trace-tcp4 
$cmd_internal eraserules4
echo "$duo_md $text_ok [ tracepath -4 $2 ] "
$command_tracepath -4 $2
$cmd_internal load before-trace-tcp4
####
####
exit; fi
####
####
#### :rutina-final-expert-tracetcp4:
##########    english: expert-trace-tcp6: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-tcp6: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-tracetcp6:
####
####
if   [ "$first_option" == "expert-trace-tcp6" ]; then
####
####
echo "$title_md [ $first_option ]  [ trace ip or host with tcp ipv6 ]"
case $command_tracepath in "$NULL")
echo "$title_md $text_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_internal $first_option host"; exit; fi
$cmd_internal save before-trace-ip6 
$cmd_internal eraserules6
echo "$duo_md $text_ok [ tracepath -6 $2 ] "
$command_tracepath -6 $2
$cmd_internal load before-trace-ip6
####
####
exit; fi
####
####
#### :rutina-final-expert-tracetcp6:
##########    english: expert-trace-icmp4: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-icmp4: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-icmp4:
####
####
if   [ "$first_option" == "expert-trace-icmp4" ]; then
####
####
echo "$title_md [ $first_option ]  [ trace ip or host with icmp ipv4 ]"
case $command_traceroute in "$NULL")
echo "$title_md $text_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_internal $first_option host"; exit ; fi
$cmd_internal save before-trace-icmp4 
$cmd_internal eraserules4
echo "$duo_md $text_ok [ traceroute -4 $2 ] "
$command_traceroute -4 $2
$cmd_internal load before-trace-icmp4
####
####
exit; fi
####
####
#### :rutina-final-expert-traceicmp4:
##########    english: expert-trace-icmp6: traceroute with tcp and ipv4   ##########
##########    spanish: expert-trace-icmp6: traceroute con tcp y ipv4      ##########
#### :rutina-inicial-expert-trace-icmp6:
####
####
if   [ "$first_option" == "expert-trace-icmp6" ]; then
####
####
echo "$title_md [ $first_option ]  [ trace ip or host with icmp ipv6 ]"
case $command_traceroute in "$NULL")
echo "$title_md $text_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$title_md use: $cmd_internal $first_option host"; exit ; fi
$cmd_internal save before-trace-icmp6 
$cmd_internal eraserules6
echo "$duo_md $text_ok [ traceroute -6 $2 ] "
$command_traceroute -6 $2
$cmd_internal load before-trace-icmp6
####
####
exit; fi
####
####
#### :rutina-final-expert-traceicmp6:
##########    english: myradio program       ##########
##########    spanish: myradio programa      ##########
#### :rutina-inicial-expert-myradio-install:
####
####
if   [ "$first_option" == "expert-myradio-install" ]; then
####
####
echo "$title_md [ $first_option ]  [ myradio download ] [ expert-myradio-install md]"
echo "$title_md Downloading myradio stable latest in $default_directory_radio/myradio-bash"
$command_curl $web_download_myradio -s -L \
-o $default_directory_radio/myradio-bash || echo "Without internet" || exit \
&& chmod ugo+x $default_directory_radio/myradio-bash &> /dev/null
cp $default_directory_radio/myradio-bash /usr/bin/myradio-bash && \
echo "$title_md installed myradio-bash in /usr/bin/myradio-bash"
####
####
exit; fi
####
####
#### :rutina-final-expert-myradio-install:
##########    english: utils: posible util depends       ##########
##########    spanish: utils: posible util dependencias  ##########
#### :rutina-inicial-utils:
####
####
if [ "$first_option" == "utils" ]; then
####
####
echo "$title_md [ $first_option ] [ List for posible utils programs ] [ utils md ] "
if [ "$command_fmt" == "$NULL" ]; then
$cmd_internal code possible-commands | $command_grep -E "^command_" | \
$command_cut -d "=" -f 1 | $command_cut -d "_" -f 2
else
$cmd_internal code possible-commands | $command_grep -E "^command_" | \
$command_cut -d "=" -f 1 | $command_cut -d "_" -f 2 | $command_fmt ; fi ; 
####
####
exit ; fi
####
####
#### :rutina-final-utils:
##########    english: depends: depends            ##########
##########    spanish: depends: dependencias  ##########
#### :rutina-inicial-depends:
####
####
if [ "$first_option" == "depends" ]; then
####
####
echo "$title_md $text_md [ Configuration files ] $text_md"
echo "$text_md $text_md Directory  data:         $directory_data_necesary $text_md"
echo "$text_md $text_md Directory cache:         $directory_cache_necesary $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ Log files ]           $text_md"
echo "$text_md $text_md File logcmd:             $file_default_logcmd $text_md"
echo "$text_md $text_md Folder log:              $default_directory_logs $text_md"
echo "$text_md $text_md Folder pdf:              $default_directory_pdf $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ optional output ]     $text_md"
echo "$text_md $text_md dialog cli:              $command_dialog $text_md"
echo "$text_md $text_md whiptail cli             $command_whiptail $text_md"
echo "$text_md $text_md zenity gui:              $command_zenity $text_md"
echo "$text_md $text_md yad gui:                 $command_yad $text_md"
echo "$text_md $text_md convert pdf:             $command_convert $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ Automatic iptables ]  $text_md"
echo "$text_md $text_md iptables legacy:         $command_ip4tableslegacy $text_md"
echo "$text_md $text_md iptables nft:            $command_ip4tablesnft $text_md"
echo "$text_md $text_md ip6tables legacy:        $command_ip6tableslegacy $text_md"
echo "$text_md $text_md ip6tables nft:           $command_ip6tablesnft $text_md"
echo "$text_md $text_md arptables:               $command_arptables $text_md"
echo "$text_md $text_md ebtables:                $command_ebtables $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ Automatic favorites ] $text_md"
echo "$text_md $text_md Automatic txt:           $command_bash $text_md"
echo "$text_md $text_md Automatic cli:           $favorite_realpath_textdialog $text_md"
echo "$text_md $text_md Automatic gui:           $favorite_realpath_graphicalldialog $text_md"
echo "$text_md $text_md Automatic pdf:           $command_convert $text_md"
echo "$text_md $text_md Automatic editor:        $favorite_text_editor $text_md"
echo "$text_md $text_md Automatic browser:       $favorite_text_browser $text_md"
echo "$text_md $text_md Automatic ntpdate:       $favorite_date_command $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ Necesary utils ]      $text_md"
echo "$text_md $text_md iptables nft:            $command_ip4tablesnft $text_md"
echo "$text_md $text_md iptables legacy:         $command_ip4tableslegacy $text_md"
echo "$text_md $text_md iptables nft:            $command_ip6tablesnft $text_md"
echo "$text_md $text_md iptables legacy:         $command_ip6tableslegacy $text_md"
echo "$text_md $text_md id command:              $command_id $text_md"
echo "$text_md $text_md awk command:             $command_awk $text_md"
echo "$text_md $text_md sed command:             $command_sed $text_md"
echo "$text_md $text_md cat command:             $command_cat $text_md"
echo "$text_md $text_md cut command:             $command_cut $text_md"
echo "$text_md $text_md date command:            $command_date $text_md"
echo "$text_md $text_md file command:            $command_file $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md Posible utils found in command: fwiptables utils $text_md"
####
####
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
####
####
echo "$title_md $text_md [ One example with input-established ]              $text_md"
echo "$text_md $text_md  $text_md"  
echo "$text_md $text_md  Launch: input-stablished                            $text_md"
echo "$text_md $text_md  $cmd_internal input-stablished                      $text_md"  
echo "$text_md $text_md  Explain: Client for all ports without servers ports $text_md"
echo "$text_md $text_md  $text_md"  
echo "$title_md $text_md [ Several examples with tiny server ]               $text_md"
echo "$text_md $text_md  $text_md"  
echo "$text_md $text_md  Launch: wizard tiny                                 $text_md"
echo "$text_md $text_md  $cmd_internal wizard-tiny                           $text_md"  
echo "$text_md $text_md  Launch: tinyserver-tcp ports                        $text_md"
echo "$text_md $text_md  $cmd_internal tinyserver-tcp 21:25,80               $text_md"  
echo "$text_md $text_md  Launch: tinyserver-udp ports                        $text_md"
echo "$text_md $text_md  $cmd_internal tinyserver-udp 67:68,443              $text_md"  
echo "$text_md $text_md  Explain: Client for all ports                       $text_md"
echo "$text_md $text_md  $text_md" 
echo "$title_md $text_md [ Several examples with mini server ]               $text_md"
echo "$text_md $text_md  $text_md"
echo "$text_md $text_md  Launch: wizard mini                                 $text_md"
echo "$text_md $text_md  $cmd_internal wizard-mini                           $text_md"  
echo "$text_md $text_md  Explain: Wizard firewall for clients and servers    $text_md"
echo "$text_md $text_md  $text_md"
echo "$text_md $text_md  Launch: miniserver-tcp ports                        $text_md"
echo "$text_md $text_md  $cmd_internal miniserver-tcp 21:25,80               $text_md"  
echo "$text_md $text_md  Launch: miniserver-udp ports                        $text_md"
echo "$text_md $text_md  $cmd_internal miniserver-udp 67:68,443              $text_md"  
echo "$text_md $text_md  Explain: Read miniserver clients ports in preferences file $text_md"
echo "$text_md $text_md  $text_md"
echo "$text_md $text_md  $text_md"
echo "$title_md $text_md [ Without optional output ]       $text_md"  
echo "$text_md $text_md  $text_md"  
echo "$text_md $text_md  Explain: depends                  $text_md"
echo "$text_md $text_md  $cmd_internal depends             $text_md"  
echo "$text_md $text_md  Explain: List firewall saved      $text_md"
echo "$text_md $text_md  $cmd_internal names               $text_md"  
echo "$text_md $text_md  Explain: List configs saved       $text_md"
echo "$text_md $text_md  $cmd_internal names-custom        $text_md"  
echo "$text_md $text_md  Explain: Get info speed ipv4      $text_md"
echo "$text_md $text_md  $cmd_internal speed-ip4           $text_md"  
echo "$text_md $text_md  Explain: Show listen sockets      $text_md"
echo "$text_md $text_md  $cmd_internal sockets             $text_md"  
echo "$text_md $text_md  Explain: List last options        $text_md"
echo "$text_md $text_md  $cmd_internal logcmd              $text_md"   
echo "$text_md $text_md  Explain: modify default variables $text_md"
echo "$text_md $text_md  $cmd_internal preferences-modify  $text_md"  
echo "$text_md $text_md"
echo "$title_md $text_md [ With optional output ]          $text_md"  
echo "$text_md $text_md  $text_md"
echo "$text_md $text_md  Example with info"        
echo "$text_md $text_md  $cmd_internal info list           $text_md"  
echo "$text_md $text_md  Example with expert"      
echo "$text_md $text_md  $cmd_internal txt expert          $text_md"  
echo "$text_md $text_md  Example with code ip4"    
echo "$text_md $text_md  $cmd_internal cli code ip4        $text_md"  
echo "$text_md $text_md  Example with list rules"  
echo "$text_md $text_md  $cmd_internal cli lsn4            $text_md"  
echo "$text_md $text_md  Example with nodes"       
echo "$text_md $text_md  $cmd_internal gui nodes           $text_md"  
echo "$text_md $text_md  Example with web browser "
echo "$text_md $text_md  $cmd_internal gui web kernel.org  $text_md"  
echo "$text_md $text_md  $text_md "
echo "$text_md $text_md  Launch client web firewall in silent   "
echo "$text_md $text_md  $cmd_internal silent client-web   $text_md"  
echo "$text_md $text_md  List iptables rules with output txt    "
echo "$text_md $text_md  $cmd_internal txt ls4             $text_md"  
echo "$text_md $text_md  List firewall with output cli whiptail "
echo "$text_md $text_md  $cmd_internal cli-wiptail names   $text_md"  
echo "$text_md $text_md  List sockets ip with output gui yad    "
echo "$text_md $text_md  $cmd_internal gui-yad sockets     $text_md"  
echo "$text_md $text_md  All options in text menu               "
echo "$text_md $text_md  $cmd_internal cli-menu            $text_md"  
echo "$text_md $text_md  All options in window menu             "
echo "$text_md $text_md  $cmd_internal gui-menu-yad        $text_md"  
echo "$text_md $text_md  All options in window roll             "
echo "$text_md $text_md  $cmd_internal gui-roll-zenity     $text_md"  
echo "$text_md $text_md  All options in window shell             "
echo "$text_md $text_md  $cmd_internal gui-shell-yad       $text_md"
####
####
exit; fi
####
####
#### :rutina-final-examples:
#### :rutina-inicial-options-examples:
##########    english: weather: show the weather with wttr.in     ##########
##########    spanish: el tiempo: muestra el tiempo con wttr.in   ##########
#### :rutina-inicial-expert-showweather:
####
####
if   [ "$first_option" == "expert-show-weather" ]; then
####
####
case $command_curl in "$NULL") echo "$title_md $text_fail [ Install a curl ]"; exit ;; esac
$command_curl -s wttr.in/?3n?T
####
####
exit; fi
####
####
#### :rutina-final-expert-showweather:
##########    english: treeconf: tree configs in fwiptables     ##########
##########    spanish: treeconf: arbol de conf en fwiptables    ##########
#### :rutina-inicial-treeconf:
####
####
if   [ "$first_option" == "treeconf" ];  then
####
####
if   [ "$command_tree" == "$NULL" ] ; then 
echo "$title_md $text_fail please install tree command" ; exit ; fi
####
####
$command_tree $directory_data_necesary
####
####
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
####
####
if   [ "$command_tree" == "$NULL" ] ; then 
echo "$title_md $text_fail please install tree command" ; exit ; fi
####
####
$command_tree $directory_cache_necesary
####
####
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
####
####
echo "$title_md [ cleaning ] clean cache: deleting cache $cmd_internal"
rm -R $directory_cache_necesary/*
####
####
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
####
####
echo "$text_md                     Iptables firewall manage commands $text_md" 
echo "$text_md      Legacy or nft: whith one of them is sufficent $text_md"   
echo "$text_md    iptables-legacy: support for xtables ipv4 $text_md"    
echo "$text_md       iptables-nft: support for nftables ipv4 $text_md" 
echo "$text_md   ip6tables-legacy: support for xtables ipv6 $text_md"    
echo "$text_md      ip6tables-nft: support for nftables ipv6 $text_md"
echo "$text_md                     Firewall recomendation with full client $text_md" 
echo "$text_md    Client prefered: input-established $text_md" 
echo "$text_md    Server prefered: tinyserver-tcp tcp-ports-server $text_md" 
echo "$text_md                     Some options and sub-otions $text_md" 
echo "$text_md    shield maxtries: limit against attack per bruteforce $text_md"   
echo "$text_md          Blacklist: excepcionals hosts dropped in firewall $text_md"   
echo "$text_md          whitelist: excepcionals hosts allowed in firewall $text_md" 
echo "$text_md         tinyserver: client in all allowed, and servers manually $text_md"
echo "$text_md         miniserver: normal ports in client, and servers manually $text_md"
echo "$text_md  input-established: the computer is only client $text_md"   
echo "$text_md     output uid/gid: User and/or group with conection allowed $text_md"   
echo "$text_md                     Necesary Ports perhaps if use it $text_md"  
echo "$text_md                ntp: Port necesary to update the time and date $text_md"   
echo "$text_md             bootpc: Port necesary to dhcp and get ip $text_md"   
echo "$text_md             domain: This port is necesary to domain resolver $text_md"   
echo "$text_md              https: This port is necesary for udp named web html5$text_md"   
echo "$text_md          ipv6-icmp: Necesary protocol in ipv6 $text_md"   
echo "$text_md         ipv4 ports: ipv6 works too with old ipv4 ports $text_md"
####
####
exit; fi
####
####
#### :rutina-final-notes:
##########   english: templates-regen: templates-regen template wizard files       ##########
##########   spanish: templates-regen: templates-regenera template wizard archivos ##########
#### :rutina-inicial-templates-regen:
####
####
if [ "$first_option" == "templates-regen" ]; then
####
####
$cmd_internal template-tiny-es &> $default_tinycfg_spa
$cmd_internal template-tiny-en &> $default_tinycfg_eng
$cmd_internal template-mini-es &> $default_minicfg_spa
$cmd_internal template-mini-en &> $default_minicfg_eng
$cmd_internal template-full-es &> $default_fullcfg_spa
$cmd_internal template-full-en &> $default_fullcfg_eng
####
####
exit; fi
####
####
#### :rutina-final-templates-regen:
##########  english:  template-tiny-es: for working sane         ########## 
##########  spanish:  template-tiny-es: para funcionamiento sano ##########
#### :rutina-inicial-template-tinyes:
####
####
if [ "$first_option" == "template-tiny-es" ]; then
####
####
echo "$title_md"
echo "$title_md Tiny firewall esta permitido como *cliente* para todos los protocolos y puertos"
echo "$title_md"
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
echo "$title_md SERVER PORTS $title_md "
echo "$title_md Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "server_port_tcp=ssh "
echo "$title_md puertos tcp para servidor "
echo "server_port_udp= "
echo "$title_md puertos udp para servidor "
echo "$title_md REGLAS GENERALES $title_md "
echo "$title_md Regla general en tabla "
echo "allow_separate_rules= "
echo "$title_md"
echo "$title_md Tiny firewall esta permitido como *cliente* para todos los protocolos y puertos"
echo "$title_md"
####
####
exit; fi
####
####
#### :rutina-final-template-tinyes:
##########  english:  template-tiny-en: for working sane         ########## 
##########  spanish:  template-tiny-en: para funcionamiento sano ##########
#### :rutina-inicial-template-tinyen:
####
####
if [ "$first_option" == "template-tiny-en" ]; then
####
####
echo "$title_md"
echo "$title_md Tiny firewall is allowed like *client* for all protocols and ports"
echo "$title_md"
echo "$title_md NETFILTER $title_md "
echo "$title_md The iptables firewall netfilter, choose one or both  "
echo "allow_use_legacy=no "
echo "$title_md xtables, void for yes, or no "
echo "allow_use_nft= "
echo "$title_md neftables, void for yes, or no "
echo "$title_md PROTOCOL IP $title_md "
echo "$title_md procol ip, void for yes, or no "
echo "allow_use_ipv4= "
echo "$title_md void for yes, or no "
echo "allow_use_ipv6= "
echo "$title_md void for yes, or no "
echo "$title_md SERVER PORTS $title_md "
echo "$title_md server ports, add with , or ranges with :"
echo "server_port_tcp=ssh "
echo "$title_md tcp port to server"
echo "server_port_udp= "
echo "$title_md udp port to server"
echo "$title_md GENERAL RULES $title_md "
echo "$title_md General rules in table "
echo "allow_separate_rules= "
echo "$title_md"
echo "$title_md Tiny firewall is allowed like *client* for all protocols and ports"
echo "$title_md"
####
####
exit; fi
####
####
#### :rutina-final-template-tinyen:
##########  english:  template-mini-es: for working sane         ########## 
##########  spanish:  template-mini-es: para funcionamiento sano ##########
#### :rutina-inicial-template-minies:
####
####
if [ "$first_option" == "template-mini-es" ]; then
####
####
echo "$title_md $cmd_shortdescription from $cmd_internal version $cmd_version $title_md "
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
exit ; fi
####
####
#### :rutina-final-template-minies:
##########  english:  template-full-es: for working sane         ########## 
##########  spanish:  template-full-es: para funcionamiento sano ##########
#### :rutina-inicial-template-fulles:
####
####
if [ "$first_option" == "template-full-es" ]; then
####
####
#### english: basic options in configurations file cfg
#### spanish: basicas opciones in configuracion de archivo cfg
####
####
echo "$title_md $cmd_shortdescription from $cmd_internal version $cmd_version $title_md "
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
####
####
exit ; fi
####
####
#### :rutina-final-template-fulles:
##########  english:  template-mini-en: for working sane         ########## 
##########  spanish:  template-mini-en: para funcionamiento sano ##########
#### :rutina-inicial-template-minien:
####
####
if [ "$first_option" == "template-mini-en" ]; then
####
####
echo "$title_md $cmd_shortdescription from $cmd_internal version $cmd_version $title_md "
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
exit ; fi
####
####
#### :rutina-final-template-minien:
##########  english:  template-full-en: for working sane         ########## 
##########  spanish:  template-full-en: para funcionamiento sano ##########
#### :rutina-inicial-template-fullen:
####
####
if [ "$first_option" == "template-full-en" ]; then
####
####
echo "$title_md $cmd_shortdescription from $cmd_internal version $cmd_version $title_md "
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
####
####
exit ; fi
####
####
#### :rutina-final-template-fullen:
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
####
####
echo "$title_md [ autosave ] [ firewall saved ] [ autosave-fwiptables ]" ;
$cmd_internal save autosave-fwiptables &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-autosave:
##########    english: ntp: update the date and time    ##########
##########    spanish: ntp: actualiza la fecha y hora   ##########
#### :rutina-inicial-ntp:
####
####
if   [ "$first_option" == "ntp" ]; then
####
####
echo "$title_md [ $first_option ] \
[ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]
then echo "$text_md $text_fail [ Install one ntp client ]" ; fi
echo "$text_md Old date: $cmd_log_date"
echo "$text_md [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $cmd_log_date"
####
####
exit; fi
####
####
#### :rutina-final-ntp:
##########    english: options: wellcome with semi help    ##########
##########    spanish: options: bienvenida con semi ayuda  ##########
#### :rutina-inicial-options:
####
####
if [ "$first_option" == "options" ]; then 
####
####
echo "$text_md $cmd_internal [optional-output] first_option [second_option] $text_md"
echo "$title_md    optional-output $text_md"
echo "$text_md [ t|txt n|narrowtxt l|log c|cli g|gui p|pdf s|silent i|info ] $text_md"
echo "$text_md [ cli-dialog cli-whiptail cli-menu cli-menu-compact ] $text_md"
echo "$text_md [ gui-zenity gui-yad gui-menu gui-menu-zenity gui-menu-yad ] $text_md"
echo "$text_md [ gui-roll-zenity gui-shell gui-shell-zenity gui-shell-yad ] $text_md"
echo "$title_md    firewall-listconceptual $text_md"
echo "$text_md ls4 ls6 status list-filter4 list-filter6 list-nat4 list-nat6 $text_md"
echo "$text_md list-raw4 list-raw6 list-mangle4 list-mangle6 list-security4 $text_md"
echo "$text_md list-security6 list-ebtables list-arptables list-alltables $text_md"
echo "$title_md    firewall-listnumeral $text_md"
echo "$text_md lsn4 lsn6 statusn listn-filter4 listn-filter6 listn-nat4 $text_md"
echo "$text_md listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6 $text_md"
echo "$text_md listn-security4 listn-security6 listn-alltables $text_md"
echo "$title_md    firewall-wallcontrol $text_md"
echo "$text_md stop continue reset show save load names actual eraserules $text_md"
echo "$text_md eraserules4 eraserules6 without-connection input-permisive $text_md"
echo "$text_md input-established wizard-tiny wizard-mini wizard-full $text_md"
echo "$text_md tinyserver-tcp tinyserver-udp miniserver-tcp miniserver-udp $text_md"
echo "$title_md    firewall-wallcustom $text_md"
echo "$text_md new-full-custom nueva-completa-custom new-mini-custom $text_md"
echo "$text_md nueva-mini-custom new-tiny-custom nueva-diminuta-custom $text_md"
echo "$text_md clone-wallsystem load-custom loadtiny-custom $text_md"
echo "$text_md show-custom modify-custom del-custom names-custom $text_md"
echo "$title_md    firewall-wallsystem $text_md"
echo "$text_md client-basic client-web client-ssh client-telnet client-ipp $text_md"
echo "$text_md client-irc client-git client-vnc client-news client-vpn $text_md"
echo "$text_md client-torrent client-vpn client-ftp client-proxy client-mail $text_md"
echo "$text_md client-tor game-widelands games-udp games-shooter game-wesnoth $text_md"
echo "$text_md game-minetest game-freeciv lan-tor lan-vpn shield-ssh server-ssh $text_md"
echo "$text_md server-telnet server-irc server-vnc server-print server-webserver $text_md"
echo "$text_md server-lamp server-news server-ftp server-mail server-teamspeak $text_md"
echo "$text_md server-mumble server-gateway server-sql server-samba server-proxy $text_md"
echo "$text_md server-asterisk client-uid-root client-gid-users client-gid-net  $text_md"
echo "$title_md    firewall-netsystem $text_md"
echo "$text_md preferences-read preferences-modify preferences-regen $text_md"
echo "$text_md options logfiles logcmd date resolve speed-ip4 speed-ip6 $text_md"
echo "$text_md sockets ip ip4 ip6 network4 network6 address4 address6 $text_md"
echo "$text_md free nodes ip-forward utils treeconf cleancache treecache $text_md"
echo "$text_md log-stat web intro depends uninstall install upgrade notes $text_md"
echo "$text_md variables examples info code expert donate about version $text_md"
echo "$text_md license-lgpl-v2 license-gpl-v2 $text_md"
echo " $text_md $text_md | Program: $cmd_internal $cmd_version $text_md"
echo " $text_md $text_md | Description: $cmd_longdescription $text_md"
####
####  if expert commands
####
if [ "$allow_expert_commands" == "no" ]
then echo " $text_md $text_md | Expert: expert is dropped in preferences file $text_md"
else echo " $text_md $text_md | Expert: expert is allowed in preferences file $text_md"
fi
####
####
exit ; fi
####
####
#### :rutina-final-options:
##########     english: code: source from loop     ##########
##########     spanish: code: fuente de la rutina  ##########
#### :rutina-inicial-code:
####
####
if   [ "$first_option" == "code" ];  then
####
####
echo "$title_md [ $first_option ]  [ Show source code for each option ] "
echo "$title_md $text_info [ code ] [ show source code for options from $cmd_internal ]"
code_error="$title_md $text_info [ Usage ] [ $cmd_internal code option_choosed ]"
if [ "$second_option" == "$NULL" ]; then echo "$code_error"
salida_code="$($command_cat  $cmd_internal | $command_grep -i  rutina-inicial \
| $command_grep -i -v $command_cat  | $command_sed -s s/####\ :rutina-inicial-//g | \
sort | $command_sed -s s/://g )"
echo $salida_code
exit ; fi
value_first="$($command_cat  -n $cmd_internal | $command_grep  :rutina-inicial-$2: | \
$command_cut -d "#" -f 1 | head -1)"
value_second="$($command_cat  -n $cmd_internal | $command_grep :rutina-final-$2:  | \
$command_cut -d "#" -f 1 | head -1)"
value_count="$(("$value_second"-"$value_first+1"))"
if [ ! -n "$value_first" ];   then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_second" ];  then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_count" ];   then echo; echo "$code_error" ; exit ; fi
echo "$title_md [ code ] [ option: "$second_option" ] [ show $value_count lines ] \
[ from the "$value_first" line number to "$value_second" line number ]"
$command_cat  $cmd_internal | head -n $value_second | tail -n $value_count
####
####
exit; fi
####
####
#### :rutina-final-code:
##########    english: names-custom: list some config       ##########
##########    spanish: names-custom: lista alguna config    ##########
#### :rutina-inicial-names-custom:
####
####
if [ "$first_option" == "names-custom" ];  then
####
####
echo "$title_md [ $first_option ] [ List configs cfg ] "
echo "$title_md $text_info [ list configs files in cfg format ]"
echo "$title_md $text_info [ folder ] [ $default_directory_custom ]"
echo "$title_md"
$command_ls -1 $default_directory_custom
echo "$title_md"
echo "$title_md [ OK CFG FILES NAMES ] [ Use: $cmd_internal load-custom file ]"
####
####
exit; fi
####
####
#### :rutina-final-names-custom:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]; then
####
####
read -p '##### $text_ok ##### Press [enter] to continue now with the cli-menu ##### '
####
####
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
####
####
echo "$title_md [ $first_option ] [ freedom from innecesary ram ] [ free md ]"
case $command_tee in "$NULL")
echo "$text_md $text_fail [ Install tee command ]"; exit ;; esac
####
####
echo "$title_md $text_info Actual Memory"
free -hw 
####
####
echo "$title_md $text_info With: echo 3 over /proc/sys/vm/drop_caches"
echo "$title_md $text_info Now with New Memory ram freedom .. Actual memory now .."
echo 3 | $command_tee /proc/sys/vm/drop_caches &> /dev/null
free -hw
####
####
exit; fi
####
####
#### :rutina-final-free:
##########    english: firewall-wallcontrol: options for fwiptables firewall      ##########
##########    spanish: firewall-wallcontrol: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-wallcontrol:
####
####
if   [ "$first_option" == "firewall-wallcontrol" ]; then
####
####
echo "$title_md | firewall-wallcontrol | $cmd_internal firewall-wallcontrol | $text_md"
echo "$text_md $text_md stop . remove the rules iptables, and save it to then if continue $text_md"
echo "$text_md $text_md continue. reset and load latest rules iptables loaded $text_md"
echo "$text_md $text_md load . reset rules iptables actually $text_md"
echo "$text_md $text_md actual . show the rules iptables from actually $text_md"
echo "$text_md $text_md show . show the rules iptables from selected file $text_md"
echo "$text_md $text_md load . reset and load new rules iptables from selected file $text_md"
echo "$text_md $text_md save . save in the file selected the rules iptables actually $text_md"
echo "$text_md $text_md all-names . list filenames saved in the iptables rules $text_md"
echo "$text_md $text_md eraserules . remove all firewall rules: ipv4,ipv6,ebtables,arptables $text_md"
echo "$text_md $text_md eraserules4 . remove ipv4 firewall rules $text_md"
echo "$text_md $text_md eraserules6 . remove ipv6 firewall rules $text_md"
echo "$text_md $text_md wizard-tiny . launch a one tiny wizard to run iptables rules $text_md"
echo "$text_md $text_md wizard-mini . launch a one mini wizard to run iptables rules $text_md"
echo "$text_md $text_md wizard-full . launch a one full wizard to run iptables rules $text_md"
echo "$text_md $text_md without-connection . launch a one firewall only for localhost $text_md"
echo "$text_md $text_md input-permisive . launch a one firewall with all permisive $text_md"
echo "$text_md $text_md input-established . launch a one firewall with input related,stablished $text_md"
echo "$text_md $text_md tinyserver-tcp . launch a one firewall with server ports tcp [ with optional host clients ] $text_md"
echo "$text_md $text_md tinyserver-udp . launch a one firewall with server ports udp [ with optional host clients ] $text_md"
echo "$text_md $text_md miniserver-tcp . launch a one firewall with server ports tcp [ with optional host clients ] $text_md"
echo "$text_md $text_md miniserver-udp . launch a one firewall with server ports udp [ with optional host clients ] $text_md"
####
####
exit; fi
####
####
#### :rutina-final-firewall-wallcontrol:
##########    english: firewall-listconceptual: options for fwiptables firewall      ##########
##########    spanish: firewall-listconceptual: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-listconceptual:
####
####
if   [ "$first_option" == "firewall-listconceptual" ]; then
####
####
echo "$title_md | firewall-listconceptual | $cmd_internal firewall-listconceptual $text_md"
echo "$text_md $text_md ls4 . list filter rules ipv4 $text_md"
echo "$text_md $text_md ls6 . list filter rules ipv6 $text_md"
echo "$text_md $text_md list4 . list filter rules ipv4 $text_md"
echo "$text_md $text_md list6 . list filter rules ipv6 $text_md"
echo "$text_md $text_md status . list filter rules ipv4 , rules ipv6 $text_md"
echo "$text_md $text_md list-alltables . list all tables for rules ipv4, rules ipv6 $text_md"
echo "$text_md $text_md list-filter4 . list filter rules ipv4 $text_md"
echo "$text_md $text_md list-filter6 . list filter rules ipv6 $text_md"
echo "$text_md $text_md list-nat4 . list nat rules ipv4 $text_md"
echo "$text_md $text_md list-nat6 . list nat rules ipv6 $text_md"
echo "$text_md $text_md list-raw4 . list raw rules ipv4 $text_md"
echo "$text_md $text_md list-raw6 . list raw rules ipv6 $text_md"
echo "$text_md $text_md list-mangle4 . list mangle rules ipv4 $text_md"
echo "$text_md $text_md list-mangle6 . list mangle rules ipv6 $text_md"
echo "$text_md $text_md list-security4 . list security rules ipv4 $text_md"
echo "$text_md $text_md list-security6 . list security rules ipv6 $text_md"
echo "$text_md $text_md list-ebtables . list ebtables rules ipv4 $text_md"
echo "$text_md $text_md list-arptables . list arptables rules ipv6 $text_md"
####
####
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
####
####
echo "$title_md | firewall-listnumeral | $cmd_internal firewall-listnumeral | $text_md"
echo "$text_md $text_md lsn4 . list filter rules ipv4 with numbers $text_md"
echo "$text_md $text_md lsn6 . list filter rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn4 . list filter rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn6 . list filter rules ipv6 with numbers $text_md"
echo "$text_md $text_md statusn . list filter rules ipv4 , rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-alltables . list all tables for rules ipv4, rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-filter4 . list filter rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn-filter6 . list filter rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-nat4 . list nat rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn-nat6 . list nat rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-raw4 . list raw rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn-raw6 . list raw rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-mangle4 . list mangle rules ipv4 with numbers $text_md" 
echo "$text_md $text_md listn-mangle6 . list mangle rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-security4 . list security rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn-security6 . list security rules ipv6 with numbers $text_md"
echo "$text_md $text_md listn-ebtables . list ebtables rules ipv4 with numbers $text_md"
echo "$text_md $text_md listn-arptables . list arptables rules ipv6 with numbers $text_md"
####
####
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
####
####
echo "$title_md | firewall-wallcustom | $cmd_internal firewall-wallcustom | $text_md"
echo "$text_md $text_md new-full-custom . create new full config in english $text_md"
echo "$text_md $text_md new-mini-custom . create new mini config in english $text_md"
echo "$text_md $text_md new-tiny-custom . create new tiny config in english $text_md"
echo "$text_md $text_md nueva-completa-custom . create new full config in spanish $text_md" 
echo "$text_md $text_md nueva-mini-custom . create new full config in spanish $text_md"
echo "$text_md $text_md nueva-diminuta-custom . create new tiny config in spanish $text_md"
echo "$text_md $text_md tinyserver-tcp . all client and selected servers tcp in command $text_md"
echo "$text_md $text_md tinyserver-udp . all client and selected servers udp in command $text_md"
echo "$text_md $text_md miniserver-tcp . usual clients and selected servers tcp in command $text_md"
echo "$text_md $text_md miniserver-udp . usual clients and selected servers udp in command $text_md"
echo "$text_md $text_md clone-wallsystem . clone a static firewall predesignated $text_md"
echo "$text_md $text_md show-custom . show config-file choosed $text_md"
echo "$text_md $text_md modify-custom . modify config-file choosed $text_md"
echo "$text_md $text_md load-custom . launch a one one-file saved custom $text_md" 
echo "$text_md $text_md del-custom . delete config-file choosed $text_md"
echo "$text_md $text_md names-custom . show the names for all config-files $text_md"
####
####
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
####
####
echo "$title_md | firewall-wallsystem | $cmd_internal firewall-wallsystem | $text_md"
echo "$text_md $text_md client-basic . launch a one firewall basic client $text_md"
echo "$text_md $text_md client-web . launch a one firewall web client $text_md"
echo "$text_md $text_md client-ssh . launch a one firewall ssh client $text_md"
echo "$text_md $text_md client-telnet . launch a one firewall telnet client $text_md" 
echo "$text_md $text_md client-git . launch a one firewall git client $text_md"
echo "$text_md $text_md client-ipp . launch a one firewall ipp client $text_md"
echo "$text_md $text_md client-vnc . launch a one firewall vnc client $text_md"
echo "$text_md $text_md client-mail . launch a one firewall mail client $text_md"
echo "$text_md $text_md client-news . launch a one firewall news client $text_md"
echo "$text_md $text_md client-vpn . launch a one firewall vpn client $text_md"
echo "$text_md $text_md client-proxy . launch a one firewall proxy client $text_md"
echo "$text_md $text_md games-udp . launch a one firewall udp client $text_md"
echo "$text_md $text_md games-shooter . launch a one firewall shooter client $text_md"
echo "$text_md $text_md games-wesnoth . launch a one firewall wesnoth client $text_md"
echo "$text_md $text_md games-minetest . launch a one firewall minetest client $text_md"
echo "$text_md $text_md games-freeciv . launch a one firewall freeciv client $text_md"
echo "$text_md $text_md lan-tor . launch a one firewall only tor client $text_md"
echo "$text_md $text_md lan-vpn . launch a one firewall only vpn client $text_md"
echo "$text_md $text_md shield-ssh . launch a one firewall basic server with shield ssh $text_md"
echo "$text_md $text_md server-ssh . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-telnet . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-samba . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-vnc . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-webserver . launch a one firewall basic server $text_md" 
echo "$text_md $text_md server-print . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-lamp . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-news . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-ftp . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-mail . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-teamspeak . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-mumble . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-sql . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-asterisk . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-domain . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-proxy . launch a one firewall basic server $text_md"
echo "$text_md $text_md server-gateway . launch a one firewall nat gateway and web/ssh server $text_md"
echo "$text_md $text_md client-uid-root . launch a one firewall for only allow at user root $text_md"
echo "$text_md $text_md client-gid-users . launch a one firewall for only allow at group users $text_md"
echo "$text_md $text_md client-gid-net . launch a one firewall for only allow at group net $text_md"
####
####
exit; fi
####
####
#### :rutina-final-firewall-wallsystem:
##########    english: firewall-netsystem: options for fwiptables firewall      ##########
##########    spanish: firewall-netsystem: opciones para fwiptables firewall    ##########
#### :rutina-inicial-firewall-netsystem:
#### :rutina-inicial-easy:
####
####
if   [ "$first_option" == "firewall-netsystem" ]; then
####
####
echo "$title_md | firewall-netsystem | $cmd_internal firewall-netsystem | $text_md"
echo "$text_md $text_md preferences-read . show the preferences for fwiptables $text_md"
echo "$text_md $text_md preferences-modify . modify the preferences for fwiptables $text_md"
echo "$text_md $text_md preferences-regen . recover the initials preferences for fwiptables $text_md"
echo "$text_md $text_md preferences-example . show the examples for fwiptables preference $text_md"
echo "$text_md $text_md options . list options $text_md"
echo "$text_md $text_md info-options . list details for the options $text_md"
echo "$text_md $text_md info . details from one first option from one pattern $text_md"
echo "$text_md $text_md logfiles . show the result for the commands save with -l|-log $text_md"
echo "$text_md $text_md logcmd . list the commands launched $text_md"
echo "$text_md $text_md ip . show details from connection ipv4, ipv6 $text_md"
echo "$text_md $text_md ip4 . show ip from connection ipv4 $text_md"
echo "$text_md $text_md ip6 . show ip from connection ipv6 $text_md"
echo "$text_md $text_md address . show details from connection ipv4, ipv6 $text_md"
echo "$text_md $text_md address4 . show details from connection ipv4 $text_md"
echo "$text_md $text_md address6 . show details from connection ipv6 $text_md"
echo "$text_md $text_md speed-ip4 . calculate bandwith ipv4 $text_md"
echo "$text_md $text_md speed-ip6 . calculate bandwith ipv6 $text_md"
echo "$text_md $text_md sockets . show the sockets listening $text_md"
echo "$text_md $text_md nodes . show computers connected to lan $text_md"
echo "$text_md $text_md web . browse web page $text_md"
echo "$text_md $text_md date . update the time and date from internet $text_md"
echo "$text_md $text_md free . freedom innecesary ram $text_md"
echo "$text_md $text_md log-stat . info stat about logs $text_md"
echo "$text_md $text_md version . show version and path $text_md"
echo "$text_md $text_md notes . several notes for internet $text_md"
echo "$text_md $text_md ip-forward . list or active or desactive forward variables $text_md"
echo "$text_md $text_md depends . principal dependences $text_md"
echo "$text_md $text_md license . license $text_md"
echo "$text_md $text_md treeconf . tree from configuration $text_md"
echo "$text_md $text_md treecache . tree from cache $text_md"
echo "$text_md $text_md cleancache . clean cache program $text_md"
echo "$text_md $text_md code . show source code from one option $text_md"
echo "$text_md $text_md variables . possible variables $text_md"
echo "$text_md $text_md intro . intro $text_md"
echo "$text_md $text_md install . install fwiptables $text_md"
echo "$text_md $text_md uninstall . uninstall fwiptables $text_md"
echo "$text_md $text_md license-gpl-v2 . license gpl v2 $text_md"
echo "$text_md $text_md license-lgpl-v2 . license lgpl v2 $text_md"
echo "$text_md "
####
####
exit; fi
####
####
#### :rutina-final-easy:
#### :rutina-final-firewall-netsystem:
##########    english: options-expert: options for fwiptables firewall      ##########
##########    spanish: options-expert: opciones para fwiptables firewall    ##########
#### :rutina-inicial-options-expert:
#### :rutina-inicial-expert:
####
####
if   [ "$first_option" == "options-expert" ]; then
####
####
echo "$title_md | $cmd_internal expert | Each expert only works Without optional output $text_md "
echo "$text_md $text_md expert-browser-web . browse one link web $text_md "
echo "$text_md $text_md expert-sockets-ss . show sockets with ss $text_md "
echo "$text_md $text_md expert-sockets-netstat . show sockets with netstat $text_md "
echo "$text_md $text_md expert-sockets-lsof . show sockets with lsof $text_md "
echo "$text_md $text_md expert-show-resolve . show file resolve domain with resolv.conf $text_md "
echo "$text_md $text_md expert-show-weather . show weather with wttr.in $text_md "
echo "$text_md $text_md expert-show-geoip . show location for ip o for host with geoip $text_md "
echo "$text_md $text_md expert-show-webcert . show web certificate ssl from one web with ssl-cert $text_md "
echo "$text_md $text_md expert-show-newversion . Show version fwiptables stable/unstable with curl $text_md "
echo "$text_md $text_md expert-show-clientproxy . show proxy variables in the system stablished $text_md "
echo "$text_md $text_md expert-conf-clientproxy . File /etc/proxy.fwiptables for proxy launched with source $text_md "
echo "$text_md $text_md expert-speed-ip4 . benchmark internet speed ipv4 with 4seconds $text_md "
echo "$text_md $text_md expert-speed-ip6 . benchmark internet speed ipv6 with 4seconds $text_md "
echo "$text_md $text_md expert-speed-disk . benchmark disk speed with 100Mb $text_md "
echo "$text_md $text_md expert-speed-ram . benchmark ram speed with 100Mb $text_md "
echo "$text_md $text_md expert-speed-cpu . benchmark cpu speed with bc command aprox 5 seconds $text_md "
echo "$text_md $text_md expert-speed-glx . benchmark glx speed with mesa3D $text_md " 
echo "$text_md $text_md expert-add-whitelist4 . add white list for ip4 $text_md "
echo "$text_md $text_md expert-add-whitelist6 . add white list for ip6 $text_md "
echo "$text_md $text_md expert-upgrade-estable . Upgrade from web sourceforge fwiptables with curl $text_md "
echo "$text_md $text_md expert-upgrade-unstable . Upgrade from git sourceforge fwiptables with curl $text_md "
echo "$text_md $text_md expert-upgrade-adblock . Download blacklist to folder configuration program with curl $text_md "
echo "$text_md $text_md expert-deb . generate actual version file in deb $text_md "
echo "$text_md $text_md expert-gen-readme . generate actual version file in original with readme $text_md "
echo "$text_md $text_md expert-gen-compile . Compile fwiptables from bash with program obash $text_md "
echo "$text_md $text_md expert-gen-usernotes . take notes for yourself to remember $text_md"
echo "$text_md $text_md expert-nmap-tcp . doing scan tcp at host or range $text_md "
echo "$text_md $text_md expert-nmap-udp . doing scan udp at host or range $text_md "
echo "$text_md $text_md expert-nmap-fin . doing scan fin at host or range $text_md "
echo "$text_md $text_md expert-nmap-syn . doing scan syn at host or range $text_md "
echo "$text_md $text_md expert-nmap-ping . doing scan ping at host or range $text_md "
echo "$text_md $text_md expert-trace-tcp4 . trace route tcp to host ip4 $text_md "
echo "$text_md $text_md expert-trace-tcp6 . trace route tcp to host ip6 $text_md "
echo "$text_md $text_md expert-trace-icmp4 . trace route icmp to host ip4 $text_md " 
echo "$text_md $text_md expert-trace-icmp6 . trace route icmp to host ip6 $text_md "
echo "$text_md $text_md expert-wpa-scan . the list wifi on air $text_md "
echo "$text_md $text_md expert-wpa-list . the list nameconfig over saved wifi $text_md "
echo "$text_md $text_md expert-wpa-new . new nameconfig to create wifi config $text_md "
echo "$text_md $text_md expert-wpa-modify . one nameconfig to modify wifi config $text_md "
echo "$text_md $text_md expert-wpa-connect . one nameconfig to connect wifi config $text_md "
echo "$text_md $text_md expert-pc-halt . halt computer with halt $text_md "
echo "$text_md $text_md expert-pc-shutdown . shutdown computer with shutdown $text_md "
echo "$text_md $text_md expert-pc-reboot . reboot computer with reboot $text_md "
echo "$text_md $text_md expert-cpufreq-info . show cpu frecuence info $text_md "
echo "$text_md $text_md expert-cpupower-info . show cpu frecuence info $text_md "
echo "$text_md $text_md expert-project-web . site  downloaded web fwiptables $text_md"
echo "$text_md $text_md expert-configs-save . save configs like backup from fwiptables in tar file $text_md"
echo "$text_md $text_md expert-configs-load . load configs like backup from fwiptables in tar file $text_md"
echo "$text_md $text_md expert-myradio-install . install radio text program $text_md"
####
####
exit; fi
####
####
#### :rutina-final-expert:
#### :rutina-final-options-expert:
##########    english: info-options: options for fwiptables firewall      ##########
##########    spanish: info-options: opciones para fwiptables firewall    ##########
#### :rutina-inicial-info-options:
####
####
if   [ "$first_option" == "info-options" ]; then
####
####
echo "$title_md [ $first_option ]  [ info options ] [ info-options md]"
echo "$text_md"
$cmd_internal optional-output
$cmd_internal firewall-listconceptual
$cmd_internal firewall-listnumeral
$cmd_internal firewall-wallcontrol
$cmd_internal firewall-wallcustom
$cmd_internal firewall-wallsystem
$cmd_internal firewall-netsystem
$cmd_internal expert
####
####
exit; fi
####
####
#### :rutina-final-info-options:
##########    english: optional-output: options for fwiptables firewall      ##########
##########    spanish: optional-output: opciones para fwiptables firewall    ##########
#### :rutina-inicial-optional-output:
#### :rutina-inicial-parametters:
####
####
if   [ "$first_option" == "optional-output" ]; then
####
####
echo "$title_md | optional-output | $cmd_internal optional-ouptut | $text_md"
echo "$text_md $text_md i . output in info text $text_md"
echo "$text_md $text_md t . output in terminal text $text_md"
echo "$text_md $text_md n . output in terminal text narrowtxt (compresed spaces) $text_md"
echo "$text_md $text_md c . output in terminal cli $text_md"
echo "$text_md $text_md g . output in graphicall gui $text_md"
echo "$text_md $text_md l . output in file text log $text_md"
echo "$text_md $text_md p . output in file image pdf $text_md"
echo "$text_md $text_md s . output in silent or without output $text_md"
echo "$text_md $text_md info . output in info text $text_md"
echo "$text_md $text_md txt . output in terminal text $text_md"
echo "$text_md $text_md narrowtxt . output in terminal text with compresed spaces $text_md"
echo "$text_md $text_md cli . output in terminal cli $text_md"
echo "$text_md $text_md gui . output in graphicall gui $text_md"
echo "$text_md $text_md log . output in file text log $text_md"
echo "$text_md $text_md pdf . output in file image pdf $text_md"
echo "$text_md $text_md silent . output in silent text $text_md"
echo "$text_md $text_md cli-dialog . output in terminal cli with dialog $text_md"
echo "$text_md $text_md cli-whiptail . output in terminal cli with whiptail $text_md"
echo "$text_md $text_md gui-zenity . output in graphicall gui with zenity $text_md"
echo "$text_md $text_md gui-yad . output in graphicall gui with yad $text_md"
echo "$text_md $text_md cli-menu . output in terminal menu $text_md"
echo "$text_md $text_md cli-menu-compact . output in terminal menu $text_md"
echo "$text_md $text_md gui-menu-zenity . output in grapicall menu with zenity $text_md"
echo "$text_md $text_md gui-menu-yad . output in grapicall menu with yad $text_md"
echo "$text_md $text_md gui-shell-zenity . output in grapicall shell with zenity $text_md"
echo "$text_md $text_md gui-shell-yad . output in grapicall shell with yad $text_md"
echo "$text_md $text_md gui-roll-zenity . output in grapicall roll with zenity $text_md"
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
####
####
echo "$title_md [ $first_option ]  [ list variables firewall fwiptables] [ variables md ]"
$cmd_internal code system-variables
####
####
exit; fi
####
####
#### :rutina-final-variables:
##########    english: eraserules: Erase rules option   ##########
##########    spanish: eraserules: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules:
####
####
if [ "$first_option" == "eraserules" ];  then 
echo "$title_md [ $first_option ] [ Deleted all iptables ipv4/ipv6 rules ]"
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_ip4tableslegacy   -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip4tablesnft      -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip6tableslegacy  -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip6tablesnft     -t filter  -P INPUT    $rule_table_policy &> /dev/null
$command_ip4tableslegacy   -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip4tablesnft      -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip6tableslegacy  -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip6tablesnft     -t filter  -P FORWARD  $rule_table_policy &> /dev/null
$command_ip4tableslegacy   -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
$command_ip4tablesnft      -t filter  -P OUTPUT   $rule_table_policy &> /dev/null
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
$cmd_internal eraserules4 &> /dev/null
####
#### remove ip6
$cmd_internal eraserules6 &> /dev/null
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
####
####
echo "$title_md [ $first_option ] [ Deleted ip4 iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
rule_table_policy="ACCEPT"
$command_ip4tableslegacy   -t filter  -P INPUT    $rule_table_policy
$command_ip4tablesnft      -t filter  -P INPUT    $rule_table_policy
$command_ip4tableslegacy   -t filter  -P FORWARD  $rule_table_policy
$command_ip4tablesnft      -t filter  -P FORWARD  $rule_table_policy
$command_ip4tableslegacy   -t filter  -P OUTPUT   $rule_table_policy
$command_ip4tablesnft      -t filter  -P OUTPUT   $rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$command_ebtables -t filter -F &> /dev/null
$command_ebtables -t nat -F &> /dev/null
$command_ip4tablesnft -t filter -F &> /dev/null
$command_ip4tableslegacy -t filter -F &> /dev/null
$command_ip4tablesnft -t nat -F &> /dev/null
$command_ip4tableslegacy -t nat -F &> /dev/null
$command_ip4tablesnft -t mangle -F &> /dev/null
$command_ip4tableslegacy -t mangle -F &> /dev/null
$command_ip4tablesnft -t raw -F &> /dev/null
$command_ip4tableslegacy -t raw -F &> /dev/null
$command_ip4tablesnft -t security -F &> /dev/null
$command_ip4tableslegacy -t security -F &> /dev/null
####
####
$command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t filter -P INPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip4tablesnft -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t filter -P INPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t filter -P FORWARD ACCEPT &> /dev/null
$command_ip4tableslegacy -t filter -P OUTPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t nat -P INPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip4tableslegacy -t nat -P INPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t nat -P OUTPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t nat -P PREROUTING ACCEPT &> /dev/null
$command_ip4tableslegacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip4tablesnft -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip4tableslegacy -t mangle -P INPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t mangle -P FORWARD ACCEPT &> /dev/null
$command_ip4tableslegacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$command_ip4tableslegacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip4tableslegacy -t raw -P OUTPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t raw -P PREROUTING ACCEPT &> /dev/null
$command_ip4tablesnft -t security -P INPUT ACCEPT &> /dev/null
$command_ip4tablesnft -t security -P FORWARD ACCEPT &> /dev/null
$command_ip4tablesnft -t security -P OUTPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t security -P INPUT ACCEPT &> /dev/null
$command_ip4tableslegacy -t security -P FORWARD ACCEPT &> /dev/null
$command_ip4tableslegacy -t security -P OUTPUT ACCEPT &> /dev/null
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List all rules ] "
echo; echo; echo "$title_md LIST ARPTABLES ###" ; echo
$cmd_internal list-arptables 
echo; echo; echo "$title_md LIST EBTABLES ###" ; echo
$cmd_internal list-ebtables
echo; echo; echo "$title_md LIST FILTER IP4 TABLE ###" ; echo
$cmd_internal list-filter4
echo; echo; echo "$title_md LIST FILTER IP6 TABLE ###" ; echo
$cmd_internal list-filter6
echo; echo; echo "$title_md LIST NAT IP4 TABLE ###" ; echo
$cmd_internal list-nat4
echo; echo; echo "$title_md LIST NAT IP6 TABLE ###" ; echo
$cmd_internal list-nat6
echo; echo; echo "$title_md LIST SECURITY IP4 TABLE ###" ; echo
$cmd_internal list-security4
echo; echo; echo "$title_md LIST SECURITY IP6 TABLE ###" ; echo
$cmd_internal list-security6
echo; echo; echo "$title_md LIST RAW IP4 TABLE ###" ; echo
$cmd_internal list-raw4
echo; echo; echo "$title_md LIST RAW IP6 TABLE ###" ; echo
$cmd_internal list-raw6
echo; echo; echo "$title_md LIST MANGLE IP4 TABLE ###" ; echo
$cmd_internal list-mangle4
echo; echo; echo "$title_md LIST MANGLE IP6 TABLE ###" ; echo
$cmd_internal list-mangle6
echo 
####
####
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
####
####
echo "$title_md [ $first_option ] [ List all rules ] "
echo; echo; echo "$title_md LIST EBTABLES ###" ; echo
$cmd_internal list-ebtables
echo; echo; echo "$title_md LIST ARPTABLES ###" ; echo
$cmd_internal list-arptables
echo; echo; echo "$title_md LIST FILTER IP4 TABLE ###" ; echo
$cmd_internal listn-filter4
echo; echo; echo "$title_md LIST FILTER IP6 TABLE ###" ; echo
$cmd_internal listn-filter6
echo; echo; echo "$title_md LIST NAT IP4 TABLE ###" ; echo
$cmd_internal listn-nat4
echo; echo; echo "$title_md LIST NAT IP6 TABLE ###" ; echo
$cmd_internal listn-nat6
echo; echo; echo "$title_md LIST SECURITY IP4 TABLE ###" ; echo
$cmd_internal listn-security4
echo; echo; echo "$title_md LIST SECURITY IP6 TABLE ###" ; echo
$cmd_internal listn-security6
echo; echo; echo "$title_md LIST RAW IP4 TABLE ###" ; echo
$cmd_internal listn-raw4
echo; echo; echo "$title_md LIST RAW IP6 TABLE ###" ; echo
$cmd_internal listn-raw6
echo; echo; echo "$title_md LIST MANGLE IP4 TABLE ###" ; echo
$cmd_internal listn-mangle4
echo; echo; echo "$title_md LIST MANGLE IP6 TABLE ###" ; echo
$cmd_internal listn-mangle6
echo
####
####
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
####
####
echo "$title_md [ list4 ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_ip4tablesnft" -t filter -L INPUT 1 && \
"$command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$command_ip4tableslegacy -t filter -v -L $list_rules_conceptual
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
$command_ip4tablesnft -t filter -v -L $list_rules_conceptual
;;
esac
####
####
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
####
####
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
####
####
echo "$title_md [ list4 ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_ip4tablesnft" -t filter -L INPUT 1 && \
"$command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$title_md $text_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$title_md $text_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$command_ip4tableslegacy -t filter -v -L -n
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
$command_ip4tablesnft -t filter -v -L -n
;;
esac
####
####
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
####
####
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
$cmd_internal ls4
####
####
$cmd_internal ls6
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
$cmd_internal listn4
####
####
$cmd_internal listn6
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
####
####
echo "$title_md [ list ] [ List numerical filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$command_ip4tablesnft" -t filter -L INPUT 1 && \
"$command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
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
$command_ip4tableslegacy -t filter -v -L -n
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
$command_ip4tablesnft -t filter -v -L -n
;;
esac
####
####
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
####
####
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
$command_ip4tableslegacy -t filter -v -L -n
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
$command_ip4tablesnft -t filter -v -L -n
;;
esac
####
####
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
####
####
echo "$title_md [ $first_option ] [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md $text_ok [ With rules xtables ] \
[ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t filter -v -L $list_rules_conceptual
echo
echo "$title_md $text_ok [ With rules nftables ] \
[ iptables-nft ] [ $fromrules ]" 
echo
$command_ip4tablesnft -t filter -v -L $list_rules_conceptual
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
####
####
echo "$title_md [ $first_option ] [ List filter forward ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t filter -v -L FORWARD $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t filter -v -L FORWARD $list_rules_conceptual
####
####
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
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List nat ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t nat -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t nat -v -L $list_rules_conceptual
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List filter ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$title_md $text_info [ With rules netfilter ] [ iptables-nft ] [ $fromrules ]"  
echo
$command_ip4tableslegacy -v -L -n 
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -v -L -n
####
####
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
####
####
echo "$title_md [ $first_option ] [ List filter forward ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$title_md $text_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t filter -v -L FORWARD -n
echo
echo "$title_md $text_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t filter -v -L FORWARD -n
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List mangle ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t mangle -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t mangle -v -L $list_rules_conceptual
echo
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List raw ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t raw -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t raw -v -L $list_rules_conceptual
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List security ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip4"
echo
echo "$title_md $text_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$command_ip4tableslegacy -t security -v -L $list_rules_conceptual
echo
echo "$title_md $text_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$command_ip4tablesnft -t security -v -L $list_rules_conceptual
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ List arptables ipv4 ] "
fromrules="arptables"
echo
echo "$title_md $text_info [ arptables: filter arptables ] [ $fromrules ]"
echo
$command_arptables -L
####
####
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
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal clone-wallsystem firewall ]"
exit; fi
####
####
if [ "$first_option" == "clone-wallsystem" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
case $archivo in shield-*);;client-*);; game-*);; games-*);; server-*);;
*) echo "$title $text_fail choose a valid system firewall to clone" ; exit ;; esac
$cmd_internal code $second_option | $command_grep -E "client_|server_|config_|allow_|net_" \
&> $default_directory_custom/$archivo
####
####
if [ -s "$default_directory_custom/$archivo" ] ; then 
$command_cat  $default_directory_custom/$archivo ;
echo "$title_md $text_ok Created custom : $archivo  "
echo "$title_md $text_info Modify  : fwiptables modify-custom $archivo  "
echo "$title_md $text_info Launch  : fwiptables load-custom $archivo  "
else rm $default_directory_custom/$archivo
echo "$title_md $text_info choose one valid wallsystem to clone to custom"
echo "$title_md $text_fail config no done $archivo" ; fi
####
####
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
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal new-full-custom config-new ]"
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
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal nueva-completa-custom config-nueva ]"
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
##########    spanish: new-mini config: cea nuevas config   ##########
#### :rutina-inicial-new-mini-custom:
####
####
if [ "$first_option" == "new-mini-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal new-mini-custom config-new ]"
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
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal nueva-mini-custom config-nueva ]"
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
##########    english: new-tiny-custom: create new configs   ##########
##########    spanish: new-tiny-custom:  cea nuevas config   ##########
#### :rutina-inicial-new-tiny-custom:
####
####
if [ "$first_option" == "new-tiny-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal new-tiny-custom config-new ]"
exit; fi
####
####
if [ "$first_option" == "new-tiny-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_tinycfg_eng" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok created file $archivo"
####
####
exit; fi
####
####
#### :rutina-final-new-tiny-custom:
##########    english: nueva-diminuta-custom: create new configs   ##########
##########    spanish: nueva-diminuta-custom: crea nuevas config   ##########
#### :rutina-inicial-nueva-diminuta-custom:
####
####
if [ "$first_option" == "nueva-diminuta-custom" ] && [ "$second_option" == "$NULL" ]  ; then 
####
####
echo "$text_md $text_info [ usage: ] [ $cmd_internal nueva-diminuta-custom config-nueva ]"
exit; fi
####
####
if [ "$first_option" == "nueva-diminuta-custom" ] && [ "$second_option" != "$NULL" ] ; then 
archivo="$second_option"
cp "$default_tinycfg_spa" "$default_directory_custom/$archivo"
$favorite_text_editor $default_directory_custom/$archivo
echo " $text_ok Archivo creado $archivo"
####
####
exit; fi
####
####
#### :rutina-final-nueva-diminuta-custom:
##########    english: modify-custom: modify a one config.cfg        ##########
##########    spanish: modify-custom: modify una configuracion.cfg   ##########
#### :rutina-inicial-modify-custom:
####
####
if [ "$first_option" == "modify-custom" ]; then 
####
###
if [ ! -f "$default_directory_custom/$second_option" ] ; then
$cmd_internal names-custom
echo "$text_md $text_info [ usage: ] [ $cmd_internal modify-custom config-existent ]"
exit; fi
####
####
if [ -f "$default_directory_custom/$second_option" ] ; then
cp "$default_directory_custom/$second_option" "$directory_cache_necesary/$second_option" &> /dev/null
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
echo "$title_md $text_info [ Usage: $cmd_internal show-custom config-cfg ]" ; exit; fi
####
####
if [ -f "$default_directory_custom"/"$second_option" ] ; then 
$command_cat  $default_directory_custom/$second_option ;
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
echo "$title_md $text_info [ usage: ] [ $cmd_internal del-custom config-old ]"
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
####
####
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
####
####
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
####
####
echo "$title_md $text_info [ Reseting the firewall ]"
$cmd_internal stop &> /dev/null
$cmd_internal continue &> /dev/null
echo "$title_md $text_ok [ firewall reseted ]"
####
####
exit; fi
####
####
#### :rutina-final-reset:
##########   english: readme: show intro      ##########
##########   spanish: readme: muestra intro   ##########
#### :rutina-inicial-readme:
####
####
if  [ "$first_option" == "readme" ];  then
####
####
echo "$text_md $text_md fwiptables. Firewall With iptables."
echo "$text_md $text_md Intro content information                          $text_md"
echo "$text_md $text_md Readme: description, location, install, uninstall. $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md  [ fwiptables description ]             $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md The fwiptables is a one-file WIZARD,     $text_md"
echo "$text_md $text_md for iptables, with COMMAND-LINE,         $text_md"
echo "$text_md $text_md and CLI-MENU, and GUI-MENU,              $text_md"
echo "$text_md $text_md and GUI-ROLL, and GUI-SHELL.             $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md From one system firewall to choose one,  $text_md"
echo "$text_md $text_md with eraserules, or template custom,     $text_md"
echo "$text_md $text_md with wizards: tiny, mini, and full,      $text_md"  
echo "$text_md $text_md with added comments rules in firewall.   $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md With rules ipv4, rules ipv6, ebtables, arptables,  $text_md"
echo "$text_md $text_md with netfilter neftables, netfilter xtables,       $text_md"
echo "$text_md $text_md with tools ip, wizards for generate new rules,     $text_md"
echo "$text_md $text_md with save/load rules with files standard iptables, $text_md"
echo "$text_md $text_md with shield to ssh or other servers choosed,       $text_md"         
echo "$text_md $text_md with limit bandwidth, string word,                 $text_md"
echo "$text_md $text_md with host whitelist, host blacklist,               $text_md"
echo "$text_md $text_md with other more capabilities of firewall.          $text_md"
echo "$text_md $text_md $text_md"
echo "$title_md $text_md  [ fwiptables location ]                          $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md  File    Location:   $cmd_directory/$cmd_filename  $text_md"
echo "$text_md $text_md  Config Directory:   $directory_data_necesary      $text_md"
echo "$text_md $text_md  Cache  Directory:   $directory_cache_necesary     $text_md "
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ fwiptables install ]                      $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md  su root TYPE: su root                       $text_md"    
echo "$text_md $text_md  put bit TYPE: chmod 755 $cmd_internal       $text_md"
echo "$text_md $text_md  install TYPE: $cmd_internal install         $text_md" 
echo "$text_md $text_md $text_md"
echo "$title_md $text_md [ fwiptables uninstall ]                    $text_md"
echo "$text_md $text_md $text_md"
echo "$text_md $text_md uninstall TYPE: $cmd_internal uninstall      $text_md"
####
####
exit; fi
####
####
#### :rutina-final-readme:
##########   english: intro: show intro      ##########
##########   spanish: intro: muestra intro   ##########
#### :rutina-inicial-intro:
####
####
if  [ "$first_option" == "intro" ]; then
####
####
echo "$text_md" "$text_md" "Readme"
echo "$text_md" "$text_md" "Version"
echo "$text_md" "$text_md" "About"
echo "$text_md" "$text_md" "Notes"
echo "$text_md" "$text_md" "Compile"
echo "$text_md" "$text_md" "Depends"
echo "$text_md" "$text_md" "Examples"
echo "$text_md" "$text_md" "Options"
echo "$text_md"
$cmd_internal readme
echo "$text_md"
$cmd_internal version
echo "$text_md"
$cmd_internal about
echo "$text_md"
$cmd_internal notes
echo "$text_md"
$cmd_internal compile
echo "$text_md"
$cmd_internal depends
echo "$text_md"
$cmd_internal examples
echo "$text_md"
$cmd_internal options
####
####
exit; fi
####
####
#### :rutina-final-intro:
##########    english: ip-forward: the ipforwading option en english   ##########
##########    spanish: ip-forward: la opcion de reenvios  en ingles    ##########
#### :rutina-inicial-ip-forward:
####
####
if   [ "$first_option" == "ip-forward" ];  then
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
echo "$title_md launch: fwiptables ip-forward [ list | on | off ]"
####
####
exit ; fi
####
####
#### :rutina-final-ip-forward:
##########   english: download:   where download fwiptables    ##########
##########   spanish: download:   donde descargar fwiptables   ##########
#### :rutina-inicial-download:
####
####
if [ "$first_option" == "download" ] ; then
####
####
echo "$title_md [ $first_option ] [ $cmd_internal download ] [ download md ] "
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
####
####
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
####
####
echo "$title_md $text_info [ uninstaller ] [ uninstall md ] "
rm $cmd_directory/$cmd_filename &> /dev/null
echo "$title_md $text_ok [ deleted binary $cmd_directory/$cmd_filename ]"
####
####
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
####
####
echo "# Installing $cmd_notinstalled .. $text_md"
echo "# Waiting several seconds, while create new configuration $text_md"
####
####
####  english: copy the file to temporal folder and install
####  spanish: copia el archivo a carpeta final
#### 
#### 
#### echo "$title_md $text_info [ $cmd_filename installing.. ]"
cp $cmd_notinstalled $cmd_installed && 
chmod 755 $cmd_installed &> /dev/null &&
echo "# OK. Installed in $cmd_installed"
####
####
####  english: generate fwiptables default config and templates
####  spanish: genera fwiptables default configuracion y plantillas
####
####
$cmd_notinstalled preferences-regen &> /dev/null &&
echo "# OK. Updated preferences"
$cmd_notinstalled templates-regen &> /dev/null &&
echo "# OK. Updated templates"
####
####
####   english: Show final status from installer: program version
####   spanish: Muestra el estatus final desde el instalador: program version
####
####
$cmd_notinstalled version
#### 
####
exit; fi
####
####
#### :rutina-final-install:
##########    english: expert-gen-usernotes: generate installed respository   ##########
##########    spanish: expert-gen-usernotes: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-usernotes:
####
####
if   [ "$first_option" == "expert-gen-usernotes" ];  then
####
####
#### add, search
if [ "$$second_user_notes" != "$NULL" ]; then
if [ "$first_user_notes" == "add" ] || [ "$first_user_notes" == "a" ];
then echo "list added: $second_user_notes" ; 
echo $cmd_log_date,$second_user_notes >> $config_user_notes; exit; fi
if [ "$first_user_notes" == "search" ] || [ "$first_user_notes" == "s" ];
then echo "List searched" ; 
$command_cat $config_user_notes | $command_grep -i $second_user_notes ; exit; fi
fi
#### edit, list content, lines numbers
if [ "$first_user_notes" == "edit" ] || [ "$first_user_notes" == "e" ];
then $favorite_text_editor $config_user_notes ; exit ; fi
if [ "$first_user_notes" == "list" ] || [ "$first_user_notes" == "l" ];
then echo "List content:"; $command_cat $config_user_notes; exit; fi
if [ "$first_user_notes" == "lines" ] || [ "$first_user_notes" == "n" ];
then echo "Line numbers:" ; $command_cat $config_user_notes | $command_wc -l ; exit; fi
#### other options
echo " # Option: add|a search|s edit|e list|l number-lines|n"
echo " # info: Use without comma, and quote when spaces: to add, to del, to search"
#### 
####
exit; fi
####
####
#### :rutina-final-expert-gen-usernotes:
##########    english: expert-gen-readme: generate installed respository   ##########
##########    spanish: expert-gen-readme: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-readme:
####
####
if   [ "$first_option" == "expert-gen-readme" ];  then
####
####
echo "$title_md [ $first_option ]  [ generate actual file and readme from intro program ] "
#### create the FILE base in repository
cp $0 $default_directory_readme/$cmd_name-$cmd_version-bash &&
echo "$title_md $text_ok Created $default_directory_readme/$cmd_name-$cmd_version-bash"
#### create the README base in repository
$0 intro > $default_directory_readme/README.md &&
echo "$title_md $text_ok Created $default_directory_readme/$cmd_name-$cmd_version-README.md"
####
####
exit; fi
####
####
#### :rutina-final-expert-gen-readme:
##########    english: expert-gen-deb: generate installed respository   ##########
##########    spanish: expert-gen-deb: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-deb:
####
####
if   [ "$first_option" == "expert-gen-deb" ];  then
echo "$title_md [ $first_option ]  [ generate actual file debian ] "
#### recreate the directories
rm -R $default_directory_debian/deb/ &> /dev/null
mkdir -p $default_directory_debian/deb/usr/bin &> /dev/null
mkdir -p $default_directory_debian/deb/DEBIAN &> /dev/null
cp $0 $default_directory_debian/deb/usr/bin/$cmd_name
#### it are file modes
chown root $default_directory_debian/* -R  &> /dev/null
chmod 755 $default_directory_debian/* -R &> /dev/null
#### create the control file
echo "Package: fwiptables"      &>  $default_directory_debian/deb/DEBIAN/control
echo "Priority: optional"       &>> $default_directory_debian/deb/DEBIAN/control
echo "Section: misc"            &>> $default_directory_debian/deb/DEBIAN/control
echo "Maintainer: f-iptables"   &>> $default_directory_debian/deb/DEBIAN/control
echo "Architecture: all"        &>> $default_directory_debian/deb/DEBIAN/control
echo "Version: $cmd_version"    &>> $default_directory_debian/deb/DEBIAN/control
echo "Depends: "                &>> $default_directory_debian/deb/DEBIAN/control
echo "Description: $cmd_longdescription" &>> $default_directory_debian/deb/DEBIAN/control
#### echo " $cmd_longdescription ."  &>> $default_directory_debian/deb/DEBIAN/control
#### architecture detect, only for shell script
if [ "$cmd_format" != "Bourne-Again_shell_script," ]
then echo "$title_md the $cmd_filename is not Bourne-Again_shell_script," ; exit ; fi
#### it does the debian package noarch
rm $default_directory_debian/$cmd_name-$cmd_version-noarch.deb &> /dev/null
$command_dpkg -b $default_directory_debian/deb/ $default_directory_debian/$cmd_name-$cmd_version-noarch.deb && \
echo "$text_md $text_ok file write in \
$default_directory_debian/$cmd_name-$cmd_version-noarch.deb"   
#### delete the directory temporal
rm -R $default_directory_debian/deb/  &> /dev/null
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
####
####
echo "$title_md [ $first_option ]  [ resolve the location to one ip or host ] "
echo ; case $command_geoiplookup in "$NULL")
echo "$text_md $text_fail [ Install geoiplookup command ]" ; exit  ;; esac
case "$second_option" in "$NULL")
echo "$title_md Selecting host geoip to fast.com for default"
trazador="fast.com" ;; *) trazador="$second_option" ;; esac
echo "$title_md $text_ok [ geoiplookup -i $trazador ]"
$command_geoiplookup -i $trazador
echo 
####
####
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
####
####
echo "$title_md [ $first_option ] [ Show the list arp-scan in the lan ] "
if [ "$command_arpscan" == "$NULL" ]; then
echo "$title_md $text_fail [ install arp-scan command ]" ; exit ; fi
echo "$title_md $text_info [ local net: ip lan .. ]"
$command_ip -4 route | $command_grep -i -v default
echo "$title_md $text_info [ local scan: arp lan scan .. ]"
$command_timeout -s SIGINT -v $time_server_waiting $command_arpscan -l -x
####
####
exit; fi
####
####
#### :rutina-final-nodes:
##########    english: donate: link donate    ##########
##########    spanish: donate: link donate  ##########
#### :rutina-inicial-donate:
####
####
if   [ "$first_option" == "donate" ]; then
####
####
echo "$title_md [ $first_option ] [ donate to fwiptables project ] [ donate md ]"
echo "$text_md Not at all"
####
####
exit; fi
####
####
#### :rutina-final-donate:
##########    english:  about: acerca de   ##########
##########    spanish:  about: acerca de  ##########
#### :rutina-inicial-about:
####
####
if   [ "$first_option" == "about" ]; then
####
####
echo "$text_md $text_md File:          fwiptables"
echo "$text_md $text_md Description:   Command Fran FireWall fwiptables Generator"
echo "$text_md $text_md Author:        Francisco Garcia <fwiptables@gmx.com>"
echo "$text_md $text_md Copyright:     (c) 2020-2024 Francisco Garcia <fwiptables@gmx.com>"
echo "$text_md $text_md launch:        $cmd_internal license-lgpl-v2|license-gpl-v2"
####
####
exit; fi
####
####
#### :rutina-final-about:
##########    english: license-gpl-v3: license gpl v3   ##########
##########    spanish: license-gpl-v3: license gpl v3   ##########
#### :rutina-inicial-license-gpl-v3:
####
#### 
#### if [ "$first_option" == "license-gpl-v3" ];  then
####
####
#### echo "$title_md [ $first_option ] \
#### [ Show license from git sourceforge for $cmd_internal ] "
####
#### if [ "$command_curl" == "$NULL" ]; then
#### echo "$title_md Install curl to download/install latest version"; fi
####
#### echo "license text for $first_option downloading"
#### echo
#### echo ..................................................................
#### echo
#### $command_curl -s -L $content_license_gplv3 --stderr /dev/null
####
####
#### exit;  fi
####
####
#### :rutina-final-license-gpl-v3:
##########    english: license-gpl-v2: license gpl v2   ##########
##########    spanish: license-gpl-v2: license gpl v2   ##########
#### :rutina-inicial-license-gpl-v2:
####
####
if [ "$first_option" == "license-gpl-v2" ];  then
####
####
echo "$title_md [ $first_option ] \
[ Show license from git sourceforge for $cmd_internal ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for $first_option downloading"
echo
echo ..................................................................
echo
$command_curl -s -L $content_license_gplv2 --stderr /dev/null
####
####
exit;  fi
####
####
#### :rutina-final-license-gpl-v2:
##########    english: license-lgpl-v2: license gpl v2   ##########
##########    spanish: license-lgpl-v2: license gpl v2   ##########
#### :rutina-inicial-license-lgpl-v2:
####
####
if [ "$first_option" == "license-lgpl-v2" ];  then
####
####
echo "$title_md [ $first_option ] \
[ Show license from git sourceforge for $cmd_internal ] "
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download/install latest version"; fi
####
echo "license text for $first_option downloading"
echo
echo ..................................................................
echo
$command_curl -s -L $content_license_lgplv2 --stderr /dev/null
####
####
exit;  fi
####
####
#### :rutina-final-license-lgpl-v2:
##########    english: license-bsd-v1: license gpl v2   ##########
##########    spanish: license-bsd-v1: license gpl v2   ##########
#### :rutina-inicial-license-bsd-v1:
####
####
#### if [ "$first_option" == "license-bsd-v1" ]; then 
#### echo "$title_md [ $first_option ] \
#### [ Show license from git sourceforge for $cmd_internal ] "
####
#### if [ "$command_curl" == "$NULL" ]; then
#### echo "$title_md Install curl to download/install latest version"; fi
####
#### echo "license text for $first_option downloading"
#### echo
#### echo ..................................................................
#### echo
#### $command_curl -L $content_license_bsd --stderr /dev/null
#### exit;  fi
####
####
#### :rutina-final-license-bsd-v1:
##########    english: expert-pc-halt: power off computer   ##########
##########    spanish: expert-pc-halt: apaga el ordenador   ##########
#### :rutina-inicial-expert-pc-halt:
####
####
if   [ "$first_option" == "expert-pc-halt" ]; then
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
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
####
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to show stable latest version"; fi
####
#### actually
####
echo "$title_md Show the version for fwiptables actually installed:"
$cmd_internal version | $command_grep -E -i "version"
####
#### latest stable
####
echo "$title_md Show the version for fwiptables stable latest:"
descarga="$default_directory_logs/fwiptables"
$command_curl $web_download_sourceforge -s -L -o $descarga \
&& chmod ugo+x $descarga && $descarga version | \
$command_grep -E -i "version"
rm $descarga
####
#### latest unstable
####
echo "$title_md Show the version for fwiptables unstable latest:"
descarga="$default_directory_logs/fwiptables"
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
##########    english: expert-upgrade-estable: upgrade fwiptables    ##########
##########    spanish: expert-upgrade-estable: upgrade fwiptables    ##########
#### :rutina-inicial-expert-upgrade-estable:
####
####
if   [ "$first_option" == "expert-upgrade-estable" ] || [ "$first_option" == "upgrade" ];then
####
####
if [ "$command_curl" == "$NULL" ]; then
echo "$title_md Install curl to download and to install stable latest version"; fi
####
####
echo "$title_md Downloading fwiptables stable latest"
descarga="$directory_cache_necesary/fwiptables-stable-bash"
rm $descarga &> /dev/null
$command_curl $web_download_sourceforge -s -L -o $descarga || echo "Without internet" \
&& chmod ugo+x $descarga &> /dev/null && $descarga install
exit; fi
####
####
#### :rutina-final-expert-upgrade-estable:
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
descarga="$directory_cache_necesary/fwiptables-unstable-bash"
rm $descarga  &> /dev/null
$command_curl $git_download_sourceforge -s -L -o $descarga || echo "Without internet" \
&& chmod ugo+x $descarga &> /dev/null && $descarga install
####
####
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
####
####
echo "$text_md $text_md BASH SCRIPT WORKS fully.    $text_md"
echo "$text_md $text_md But if your desire is compiling...   $text_md"   
echo "$text_md $text_md Necesary fwiptables in source script bash $text_md"     
echo "$text_md $text_md Download and install obash from oficial web internet $text_md"      
echo "$text_md $text_md Run: obash -s -c -o ./destination.bin ./source-bash.sh $text_md"      
####
####
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
####
####
echo "$title_md [ $first_option ] \
[  optionally ] [ howto compile bash script with obash ] "
echo "$title_md Compile $cmd_internal" ; echo
if [ "$command_obash" == "$NULL" ]
then echo "$title_md install obash to compile"; exit ; fi
if [ "$command_uuid" == "$NULL" ]
then echo "$title_md install uuid to compile"; exit ; fi
if [ "$cmd_format" != "Bourne-Again_shell_script," ]
then echo "$title_md the $cmd_name is not Bourne-Again_shell_script," ; exit ; fi
obash_file_date="$default_directory_obash/$cmd_name-$cmd_version"
cp $0 $obash_file_date.bash
$command_obash -r -c -o $obash_file_date.bin $obash_file_date.bash \
&& echo "$title_md $text_ok" || echo "$title_md $text_fail"
echo ; echo "$title_md And now list:"
file -L $obash_file_date.bash
file -L $obash_file_date.bin
####
####
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
echo "$title_md [ Waiting a moment ] [ downloading blacklist to directory: $default_directory_adblock ] "
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
####
####
echo "$title_md $text_info $text_md [ $first_option ]  [ info $second_option ] [ info md ]"
echo "$title_md $text_info  Launch info search: $cmd_internal [optional-output] info [pattern-to-search]"
echo "$title_md $text_info Example info search: $cmd_internal [optional-output] info ls"
echo "$title_md $text_info    Show all options: $cmd_internal [optional-output] info-options"
if   [ "$second_option" == "$NULL" ]; then exit ; fi
if   [ "$second_option" == "info-options" ]; then $cmd_internal info-options ; exit ; fi
$cmd_internal info-options | $command_grep -i "$second_option" | $command_grep -Ev "###" 
####
####
exit ; fi
####
####
#### :rutina-final-info:
##########    english: expert-speed-glx: show frammes with mesa graphicall            ##########
##########    spanish: expert-speed-glx: muestra los fotogramas con graphicos mesa    ##########
#### :rutina-inicial-expert-speed-glx:
####
####
if   [ "$first_option" == "expert-speed-glx" ]; then
####
####
echo "$title_md [ $first_option ]  [ test gl mesa3D speed ] \
[ for default max $time_server_waiting seconds ] "
case $command_glxgears in "$NULL")
echo "$text_md $text_fail [ Install mesa utils ]"; exit ;; esac
vblank_mode=0 $command_timeout -s SIGINT -v $time_server_waiting $command_glxgears
echo 
####
####
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
####
####
echo "$title_md [ $first_option ]  [ test disk speed benchamrk ] \
[ for default max $time_server_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $command_dd in "$NULL")
echo "$text_md $text_fail [ Install dd ]"; exit ;; esac
dd if=/dev/zero of=$default_directory_benchmarkdisk/speed.img \
status=progress bs=10M count=10
rm $default_directory_benchmarkdisk/speed.img &> /dev/null
####
####
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
####
####
echo "$title_md [ $first_option ]  [ test ram speed benchamrk ] \
[ for default max $time_server_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $command_dd in "$NULL")
echo "$text_md $text_fail [ Install dd ]"; exit ;; esac
mount -t tmpfs tmpfs $default_directory_benchmarkram
dd if=/dev/zero of=$default_directory_benchmarkram/speed.img \
status=progress bs=10M count=10
rm $default_directory_benchmarkram/speed.img &> /dev/null
umount $default_directory_benchmarkram
####
####
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
####
####
echo "$header_ok [ $first_option ]  [ test cpu processor ] [ calcule pi with 2000 digits ]"
case $command_bc in "$NULL") echo "$tab $text_fail [ Install bc command ]"; exit ;; esac
echo "$duo_md $text_info [ Calculate pi with 2000 digits in only one cpu ]"
echo "$duo_md $text_info [ For example with 2ghz/cpu is 5 seconds aprox. ] "
time echo 'scale=2000; a(1)*4' | $command_bc -l | tail -0 
####
####
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
####
####
echo "$title_md [ $first_option ] \
[ update the computer time and date from internet ] "
echo
if [ "$favorite_date_command" == "$NULL" ]; then
echo "$text_md $text_fail [ Install one ntp client ]" ; fi
echo "$text_md Old date: $cmd_log_date"
echo "$text_md [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$favorite_date_command $pool0 && echo -e "\n With New date: $cmd_log_date"
####
####
exit; fi
####
####
#### :rutina-final-ntpdate-client:
##########    english: wizard: wizard-mini      ##########
##########    spanish: wizard: mini-asistente   ##########
#### :rutina-inicial-wizard:
####
####
if [ "$first_option" == "wizard" ];  then
####
####
echo
echo
echo Please use wizard-full or use wizard-mini or use wizard-tiny
echo
echo
####
####
exit; fi
####
####
#### :rutina-final-wizard:
##########    english: wizard-tiny: wizard-tiny      ##########
##########    spanish: wizard-tiny: mini-asistente   ##########
#### :rutina-inicial-wizard-tiny:
####
####
if [ "$first_option" == "wizard-tiny" ]; then
####
####
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-tiny" ; name_firewall="wizard-tiny"
$cmd_internal templates-regen
cp "$default_tinycfg_eng" "$directory_cache_necesary/$cmd_filename-$archivo"
$favorite_text_editor "$directory_cache_necesary/$cmd_filename-$archivo"
clear
$favorite_realpath_textdialog --clear --title "Run this wizard" \
--yesno "Run this wizard" 0 0 && clear \
&& cp "$directory_cache_necesary/$cmd_filename-$archivo" \
"$default_directory_custom/$archivo" && $cmd_internal loadtiny-custom $archivo || clear
####
####
exit; fi
####
####
#### :rutina-final-wizard-tiny:
##########    english: wizard-mini: wizard-mini      ##########
##########    spanish: wizard-mini: mini-asistente   ##########
#### :rutina-inicial-wizard-mini:
####
####
if [ "$first_option" == "wizard-mini" ]; then
####
####
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-mini" ; name_firewall="wizard-mini"
$cmd_internal templates-regen
cp "$default_minicfg_eng" "$directory_cache_necesary/$cmd_filename-$archivo"
$favorite_text_editor "$directory_cache_necesary/$cmd_filename-$archivo"
clear
$favorite_realpath_textdialog --clear --title "Run this wizard" \
--yesno "Run this wizard" 0 0 && clear \
&& cp "$directory_cache_necesary/$cmd_filename-$archivo" \
"$default_directory_custom/$archivo" && $cmd_internal load-custom $archivo || clear
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
if [ "$first_option" == "wizard-full" ]; then
####
####
archivo="$first_option" ; launch_rules_firewall=yes ; type_firewall="wizard-full" ; name_firewall="wizard-full"
$cmd_internal templates-regen
cp "$default_fullcfg_eng" "$directory_cache_necesary/$cmd_filename-$archivo"
$favorite_text_editor "$directory_cache_necesary/$cmd_filename-$archivo"
clear
$favorite_realpath_textdialog --clear --title "Run this wizard" --yesno \
"Run this wizard" 0 0 && clear && \
cp "$directory_cache_necesary/$cmd_filename-$archivo" "$default_directory_custom/$archivo" \
&& $cmd_internal load-custom $archivo || clear 
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
$cmd_internal names ; echo "$text_md $text_info \
[ usage: $cmd_internal load fw-to-load ] \
[ See: $cmd_internal names ]" ; exit ; fi
echo "$title_md $text_info [ loading firewall control $second_option ]"
####
####
if [ -f $default_directory_control/$second_option-nft-ipv4 ] && \
[ -f $default_directory_control/$second_option-legacy-ipv4 ] ; then 
$cmd_internal eraserules &> /dev/null
if [ -f "$default_directory_control/$second_option-ebtables" ]; then
$command_cat  $default_directory_control/$second_option-ebtables | \
$command_ebtables-restore &> /dev/null; fi
if [ -f "$default_directory_control/$second_option-arptables" ]; then
cat $default_directory_control/$second_option-arptables | \
$command_arptables-restore &> /dev/null; fi
####
#### 
$command_cat  $default_directory_control/$second_option-nft-ipv4 |  $command_ip4tablesnft-restore       
$command_cat  $default_directory_control/$second_option-legacy-ipv4 | $command_ip4tableslegacy-restore  
$command_cat  $default_directory_control/$second_option-nft-ipv6 | $command_ip6tablesnft-restore       
$command_cat  $default_directory_control/$second_option-legacy-ipv6 | $command_ip6tableslegacy-restore 
#### echo "$title_md $text_ok [ firewall loaded ] [ name: $second_option ]"
echo "$title_md $text_ok [ Launched: firewall ] [ Type: control ] [ Name: $second_option ]"
####
####
else
$cmd_internal names
echo "$text_md $text_info [ usage: $cmd_internal load fw-to-load ] [ See: $cmd_internal names ]"
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
####
####
case "$second_option" in
"$NULL") echo "$text_md $text_info [ Usage: $cmd_internal save fw-to-save ]"
exit ;;
*) archivofin="$second_option" ;; 
esac
####
####
if [ "$command_arptables" != "$NULL"  ]; then 
$command_arptables-save &> $default_directory_control/$archivofin-arptables; fi
if [ "$command_ebtables"  != "$NULL"  ]; then 
$command_ebtables-save &> $default_directory_control/$archivofin-ebtables; fi
####
####
if [ "$command_ip4tablesnft"    != "$NULL"  ]; then
$command_ip4tablesnft-save      &> $default_directory_control/$archivofin-nft-ipv4 ; fi
if [ "$command_ip6tablesnft"    != "$NULL"  ]; then
$command_ip6tablesnft-save      &> $default_directory_control/$archivofin-nft-ipv6 ; fi
if [ "$command_ip4tableslegacy" != "$NULL"  ]; then
$command_ip4tableslegacy-save   &> $default_directory_control/$archivofin-legacy-ipv4 ; fi
if [ "$command_ip6tableslegacy" != "$NULL"  ]; then
$command_ip6tableslegacy-save   &> $default_directory_control/$archivofin-legacy-ipv6 ; fi
####
####
echo "$title_md $text_ok [ firewall saved ] [ name: $archivofin ]"
####
####
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
####
####
echo "$title_md [ $first_option ]  [ show one firewall saved ] "
echo 
case "$second_option" in
"$NULL") $cmd_internal names
echo "$text_md $text_info [ Use: $cmd_internal show file-to-show ]" ; exit ;;
*) archivofin=$($command_sed 's/\///g' <<< "$second_option") ;;
esac
####
####
if [ ! -f "$default_directory_control/$archivofin-nft-ipv4" ];
then  $cmd_internal names ; exit ; fi
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
$command_cat  $default_directory_control/$archivofin-arptables
echo "$title_md $archivofin-ebtables"
$command_cat  $default_directory_control/$archivofin-ebtables
echo "$title_md $archivofin-nft-ipv4"
$command_cat  $default_directory_control/$archivofin-nft-ipv4
echo "$title_md $archivofin-legacy-ipv4"
$command_cat  $default_directory_control/$archivofin-legacy-ipv4
echo "$title_md $archivofin-nft-ipv6"
$command_cat  $default_directory_control/$archivofin-nft-ipv6
echo "$title_md archivofin-legacy-ipv6"
$command_cat  $default_directory_control/$archivofin-legacy-ipv6
echo "$title_md $text_ok [ firewall readed ] [ $archivofin ]"
echo 
####
####
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
####
####
echo "$title_md [ $first_option ]  [ show the last firewall saved ] "
echo 
$command_arptables-save          &> $default_directory_control/$cmd_filename-actual-arptables
$command_ebtables-save           &> $default_directory_control/$cmd_filename-actual-ebtables   
$command_ip4tablesnft-save       &> $default_directory_control/$cmd_filename-actual-nft-ipv4   
$command_ip4tableslegacy-save    &> $default_directory_control/$cmd_filename-actual-legacy-ipv4
$command_ip6tablesnft-save      &> $default_directory_control/$cmd_filename-actual-nft-ipv6   
$command_ip6tableslegacy-save   &> $default_directory_control/$cmd_filename-actual-legacy-ipv6
echo "$title_md arptables $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-arptables
echo "$title_md ebtables $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-ebtables
echo "$title_md nft with ipv4 $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-nft-ipv4
echo "$title_md legacy with ipv4 $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-legacy-ipv4
echo "$title_md nft with ipv6 $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-nft-ipv6
echo "$title_md legacy with ipv6 $title_md"
$command_cat  $default_directory_control/$cmd_filename-actual-legacy-ipv6
echo
echo "  $text_ok [ readed firewall actual ]"
####
####
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
####
####
echo "$title_md [ $first_option ]  [ Stop the firewall ] "
####
####
#### english: save actual fw #### spanish: guarda actual fw
####
####
$command_arptables-save &> $default_directory_control/$cmd_filename-stoped-arptables
$command_ebtables-save &> $default_directory_control/$cmd_filename-stoped-ebtables             
$command_ip4tablesnft-save &> $default_directory_control/$cmd_filename-stoped-nft-ipv4         
$command_ip4tableslegacy-save &> $default_directory_control/$cmd_filename-stoped-legacy-ipv4   
$command_ip6tablesnft-save &> $default_directory_control/$cmd_filename-stoped-nft-ipv6        
$command_ip6tableslegacy-save &> $default_directory_control/$cmd_filename-stoped-legacy-ipv6  
####
####
#### english: erase the rules #### spanish: borra las reglas
####
####
$cmd_internal eraserules &> /dev/null
echo "$title_md $text_info [ stopping firewall ]"
echo "$title_md $text_ok [ firewall stopped  ]"
####
####
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
####
####
echo "$title_md [ $first_option ]  [ Continue the stopped firewall ] "
####
####
#### english: restore last fw #### spanish: restaura el ultimo fw
####
####
$command_cat  $default_directory_control/$cmd_filename-stoped-arptables | $command_arptables-restore
$command_cat  $default_directory_control/$cmd_filename-stoped-ebtables | $command_ebtables-restore
$command_cat  $default_directory_control/$cmd_filename-stoped-nft-ipv4 | $command_ip4tablesnft-restore  
$command_cat  $default_directory_control/$cmd_filename-stoped-legacy-ipv4 | $command_ip4tableslegacy-restore  
$command_cat  $default_directory_control/$cmd_filename-stoped-nft-ipv6 | $command_ip6tablesnft-restore  
$command_cat  $default_directory_control/$cmd_filename-stoped-legacy-ipv6 | $command_ip6tableslegacy-restore  
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
####
####
echo "$title_md [ $first_option ] [ show variables cfg from english configuration ] "
$command_cat $default_fullcfg_eng
####
####
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
####
####
echo "$title_md [ $first_option ] [ show variables cfg from spanish configuration ] "
$command_cat  $default_fullcfg_spa
####
####
exit; fi
####
####
#### :rutina-final-config-spa:
##########    english: add-whitelist4: whitelist temporally ipv4    ##########
##########    spanish: add-whitelist4: lista blanca temporal ipv4   ##########
#### :rutina-inicial-add-wihtelist4
####
####
if [ "$first_option" == "add-whitelist4" ] || [ "$first_option" == "expert-add-whitelist4" ]; then
####
####
if [ "$2" == "$NULL" ]; then echo "$title_md $text_fail type host ip4 or net ip4 to be in whitelist"; exit ; fi
echo "$title_md [ Working ] ADD temporally ipv4 rules whitelist: ACCEPT to $2"
$command_ip4tablesnft    -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 1/4 with $2 || echo fail rule 1/4
$command_ip4tablesnft    -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 2/4 with $2 || echo fail rule 2/4
$command_ip4tableslegacy -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 3/4 with $2 || echo fail rule 3/4
$command_ip4tableslegacy -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 4/4 with $2 || echo fail rule 4/4
####
####
exit; fi
####
####
#### :rutina-final-add-wihtelist4
##########    english: add-whitelist6: whitelist temporally ipv6    ##########
##########    spanish: add-whitelist6: lista blanca temporal ipv6   ##########
#### :rutina-inicial-add-wihtelist6
####
####
if [ "$first_option" == "add-whitelist6" ] || [ "$first_option" == "expert-add-whitelist6" ]; then
####
####
if [ "$2" == "$NULL" ]; then echo "$title_md $text_fail type host ip6 or net ip6 to be in whitelist"; exit ; fi
echo "$title_md [ Working ] ADD temporally ipv6 rules whitelist: ACCEPT to $2"
$command_ip6tablesnft    -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 1/4 with $2 || echo fail rule 1/4
$command_ip6tablesnft    -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 2/4 with $2 || echo fail rule 2/4
$command_ip6tableslegacy -t filter -I INPUT -s $2  \
-j ACCEPT && echo ok rule 3/4 with $2 || echo fail rule 3/4
$command_ip6tableslegacy -t filter -I OUTPUT -d $2 \
-j ACCEPT && echo ok rule 4/4 with $2 || echo fail rule 4/4
####
####
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
####
####
echo "$title_md [ $first_option ]  [ test speed ipv4 with iperf ] "
echo "$title_md $cmd_internal use or iperf or iperf3"
if [ "$favorite_iperf_command" == "$NULL" ];
then echo "$title_md $text_fail install iperf";
else echo "$title_md $text_ok [ choosed iperf ]"; fi
echo "$title_md"
# echo "$title_md [ Working ] Saving firewall before speed-ip4"
$cmd_internal save before-speed-ip4
$cmd_internal add-whitelist4 $serverip_iperf_ipv4
echo "$title_md"
echo "$title_md [ Calculing speed .. ]"
echo "$title_md [ Working ] Conecting in ipv4 to $serverip_iperf_ipv4 ]"
$favorite_iperf_command -4 -t 4 -c $serverip_iperf_ipv4 -p $serverport_iperf_ipv4
echo "$title_md"
echo "$title_md [ Working ] [ Restoring firewall ]"
$cmd_internal load before-speed-ip4 
echo "$title_md [ Done ] $cmd_internal speed-ip4"
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
####
####
echo "$title_md [ $first_option ]  [ test speed ipv6 with iperf ] "
echo "$title_md $cmd_internal use or iperf or iperf3"
if [ "$favorite_iperf_command" == "$NULL" ];
then echo "$title_md $text_fail install iperf";
else echo "$title_md $text_ok [ choosed iperf ]"; fi
$cmd_internal save before-speed-ip6 
$cmd_internal add-whitelist6 $serverip_iperf_ipv6
echo "$title_md"
echo "$title_md [ Calculing speed .. ]"
echo "$title_md [ Working ] Conecting in ipv6 to $serverip_iperf_ipv4 ]"
$favorite_iperf_command -6 -t 4 -P 1 -c $serverip_iperf_ipv6 -p $serverport_iperf_ipv6 
echo "$title_md"
echo "$title_md [ Working ] [ Restoring firewall ]"
$cmd_internal load before-speed-ip6 
echo "$title_md [ Done ] $cmd_internal speed-ip6"
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
####
####
echo "$title_md [ $first_option ] [ Show whith ss: LISTEN sockets ] "
if [ "$command_ss" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install ss command ]"; exit; fi
if [ "$command_awk" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install awk command ]"; exit; fi
$command_ss -l -460  | $command_grep "\:\*" | \
$command_awk '{print "     " $1 " " $2 " " $5}' ;
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ version - date - size - downloaded last week ]"
####
####
$cmd_internal web "http://sourceforge.net/projects/f-iptables/files/" \
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
####
####
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
####
####
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
####
####
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
####
####
echo "$title_md [ $first_option ] [ Show whith lsof: sockets ] "
if [ "$command_lsof" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install lsof command ]"; exit; fi
$command_lsof -i
####
####
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
####
####
echo "$title_md [ $first_option ] [ Show whith lsof: sockets ] "
if [ "$command_lsof" == "$NULL" ]; then 
echo "$title_md $text_fail [ Install lsof command ]"; exit; fi
#### if [ "$command_awk" == "$NULL" ]; then 
#### echo "$title_md $text_fail [ Install awk command ]"; exit; fi
$command_netstat -l46
####
####
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
####
####
echo "$title_md [ $first_option ] \
[ get one web certifcate from one server with port 443]"
case "$command_openssl"  in  $NULL)
echo "$text_md $text_fail [ install openssl ]"; exit ;; esac
####
####
if [ "$second_option" == "$NULL" ]; then
echo "[ get one web certifcate ] \
[ Example: $cmd_internal webcert www.fast.com ]"; exit; fi
echo
$command_timeout -s SIGINT -v $time_server_waiting \
$command_openssl s_client -connect $second_option:443
####
####
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
####
####
echo "$title_md [ $first_option ]  [ scan with nmap tcp ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_internal $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_internal $first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-tcp 
$cmd_internal add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sT $2
$cmd_internal load before-nmap-tcp 
####
####
exit; fi
####
####
#### :rutina-final-expert-nmap-tcp:
##########    english: expert-nmap-syn: scan one net per syn         ##########
##########    spanish: expert-nmap-syn: rastrea una por peticiones   ##########
#### :rutina-inicial-expert-nmap-syn:
####
####
if   [ "$first_option" == "expert-nmap-syn" ]; then
####
####
echo "$title_md [ $first_option ]  [ scan with nmap syn ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_internal $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_internal $first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-syn
$cmd_internal add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sF $2
$cmd_internal load before-nmap-syn
echo 
####
####
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
####
####
echo "$title_md [ $first_option ]  [ scan with nmap fin ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_internal $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_internal $first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-fin 
$cmd_internal add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sT $2
$cmd_internal load before-nmap-fin
echo 
####
####
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
####
####
echo "$title_md [ $first_option ]  [ scan with nmap udp ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_internal $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_internal $first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-udp
$cmd_internal add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sU $2
$cmd_internal load before-nmap-udp
echo 
####
####
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
####
####
echo "$title_md [ $first_option ]  [ scan with nmap ping ]"
if [ "$command_nmap" == "$NULL" ];  then
echo "$title_md Please install nmap to work"; exit; fi
echo "$title_md $text_info [ Use: $cmd_internal $first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$title_md $text_fail [ Use: $cmd_internal $first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-ping
$cmd_internal add-whitelist4 $2
echo "$title_md [ Working ] [ Doing nmap to $2 ]"
$command_nmap -sn $2
$cmd_internal load before-nmap-ping
####
####
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
####
####
then echo $head_waiting_gui
####
####
case $second_option in
#### 
#### 
"new-tiny-custom")
cp "$default_tinycfg_eng" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=NEW-TINY-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option\
ANDlaunch:$cmd_internal-load-custom-$third_option ; exit
else rm "$default_directory_custom/$third_option" ; 
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"nueva-diminuta-custom")
cp "$default_tinycfg_spa" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=NUEVA-DIMINUTA-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:$cmd_internal-loadtiny-custom-$third_option ; exit
else rm $default_directory_custom/$third_option ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
####
"new-mini-custom")
cp "$default_minicfg_eng" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=NEW-MINI-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option\
ANDlaunch:$cmd_internal-load-custom-$third_option ; exit
else rm "$default_directory_custom/$third_option" ; 
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"nueva-mini-custom")
cp "$default_minicfg_spa" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=NUEVA-MINI-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:$cmd_internal-load-custom-$third_option ; exit
else rm $default_directory_custom/$third_option ; 
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"new-full-custom")
cp "$default_fullcfg_eng" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=NEW-FULL-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:-$cmd_internal-load-custom-$third_option ; exit
else rm $default_directory_custom/$third_option ; 
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled-new-file-$third_option ; exit; fi
;;
#### 
#### 
"nueva-completa-custom")
cp "$default_fullcfg_spa" "$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$third_option \
--editable --title=NUEVA-COMPLETA-CONFIG 1> "$default_directory_custom/$third_option" ;
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK-new-config-file-$third_option-\
AND-launch:$cmd_internal-load-custom-$third_option ; exit
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
"$directory_cache_necesary/$cmd_filename-$third_option"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename="$directory_cache_necesary/$cmd_filename-$third_option" \
--editable --title=MODIFY-CONFIG 1> $default_directory_custom/$third_option
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $directory_cache_necesary/$cmd_filename-$third_option \
$default_directory_custom/$third_option
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled.file-$third_option; fi
;;
####
####
"expert-wpa-new")
$cmd_internal expert-wpa-regen
cp $default_directory_wpa/defaultwpa $default_directory_wpa/wpaconfig_$third_option
$cmd_internal gui expert-wpa-modify $third_option
;;
####
####
"expert-wpa-modify")
if [ ! -f "$default_directory_wpa/wpaconfig_$third_option" ]
then $favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=file-not-found:-wpaconfig_$third_option ; exit ; fi 
cp "$default_directory_wpa/wpaconfig_$third_option 
"$directory_cache_necesary/$cmd_filename-$third_option
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$third_option \
--editable --title=MODIFY-CONFIG 1> $default_directory_wpa/wpaconfig_$third_option
if [ -s "$default_directory_wpa/wpaconfig_$third_option" ]; then  
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $directory_cache_necesary/$cmd_filename-$third_option \
$default_directory_wpa/wpaconfig_$third_option
$favorite_realpath_graphicalldialog --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=Canceled.file-wpaconfig-$third_option; fi
;;
####
####
*)$cmd_internal "$second_option" "$third_option" "$quad_option" &> "$temporal_guifinal"
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_internal \
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
####
####
then echo $head_waiting_gui
####
####
case $second_option in
#### 
####
list*)$cmd_internal txt $second_option $third_option \
$quad_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename=$temporal_guifinal --auto-scroll ;;
####
####
"wizard-tiny")
archivo=wizard-tiny
cp $default_tinycfg_eng $directory_cache_necesary/$cmd_filename-$archivo
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD TINY 1> $default_directory_custom/$archivo
if [  -s $default_directory_custom/$archivo ]; then
$cmd_internal -gui loadtiny-custom $archivo ; $cmd_internal -gui list4;
else rm $default_directory_custom/$archivo ;
$favorite_realpath_graphicalldialog --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text Ok-$archivo-canceled; fi
;;
#### 
#### 
"wizard-mini")
archivo=wizard-mini
cp $default_minicfg_eng $directory_cache_necesary/$cmd_filename-$archivo
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD MINI 1> $default_directory_custom/$archivo
if [  -s $default_directory_custom/$archivo ]; then
$cmd_internal -gui load-custom $archivo ; $cmd_internal -gui list4;
else rm $default_directory_custom/$archivo ;
$favorite_realpath_graphicalldialog --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text Ok-$archivo-canceled; fi
;;
#### 
#### 
"wizard-full")
archivo=wizard-full
cp $default_fullcfg_eng $directory_cache_necesary/$cmd_filename-$archivo
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD-FULL 1> $default_directory_custom/$archivo
if [  -s $default_directory_custom/$archivo ]; then
$cmd_internal -gui load-custom $archivo ; $cmd_internal -gui list4;
else rm $default_directory_custom/$archivo ;
$favorite_realpath_graphicalldialog  --info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
#### 
#### 
"modify-custom")
if [ ! -f "$default_directory_custom/$third_option" ] ; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=file-not-found:-$third_option ; exit ; fi 
cp $default_directory_custom/$third_option \
$directory_cache_necesary/$cmd_filename-$third_option
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--filename=$directory_cache_necesary/$cmd_filename-$third_option \
--editable --title=MODIFY-CONFIG $third_option 1> $default_directory_custom/$third_option
if [ -s "$default_directory_custom/$third_option" ]; then
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=OK.file-$third_option
else cp $directory_cache_necesary/$cmd_internal-$third_option \
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
*)$cmd_internal txt $second_option $third_option \
$quad_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_internal \
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
if [ "$favorite_realpath_graphicalldialog" == "$NULL" ]; then 
echo "$title_md there is not graphicall dialog" ; exit ; fi
####
####
$cmd_internal txt $second_option $third_option &> $temporal_guifinal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename=$temporal_guifinal --auto-scroll 
####
####
exit; fi
####
####
##########    english: gui-shell-zenity: graphic enviroment            ##########
##########    spanish: gui-shell-zenity: entorno de comandos grafico   ##########
#### :rutina-inicial-gui-shell-zenity:
####
####
if   [ "$first_option" == "gui-shell-zenity" ]
####
####
then echo $head_waiting_gui
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_internal gui-shell-zenity"
untexto="$cmd_internal gui-shell-zenity"
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
1) $cmd_internal gui-zenity options; exit ;;
$NULL) $cmd_internal gui-zenity options; exit ;;
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
"nueva-mini-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom")
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
"new-full-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom" )
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
$cmd_internal -gui-zenity new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-mini-custom $unarchivo
;;
new-tiny-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity new-tiny-custom $unarchivo
;;
nueva-diminuta-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-diminuta-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity show-custom $unarchivo
;;
wizard-full*) $cmd_internal -gui-zenity wizard-full ;;
wizard-mini*) $cmd_internal -gui-zenity wizard-mini ;;
wizard-tiny*) $cmd_internal -gui-zenity wizard-tiny ;;
preferences-modify*) 
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-zenity preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
"$NULL")  exit ;;
*) fecha_temporal="$cmd_log_date"
$cmd_internal $menugtk &> /tmp/fwiptables-$fecha_temporal
$favorite_realpath_graphicalldialog  --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=$cmd_internal-gui-shell \
--filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal
;;
esac
$cmd_internal gui-shell-zenity
####
####
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
####
####
then echo $head_waiting_gui
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_internal gui-shell-yad"
untexto="$cmd_internal gui-shell-yad"
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
1) $cmd_internal gui-yad options; exit ;;
$NULL) $cmd_internal gui-yad options; exit ;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
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
"nueva-mini-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom")
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom")
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
"new-full-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom" )
$favorite_realpath_graphicalldialog  --forms \
--width=$config_graphicall_width --height=$config_graphicall_height \
--text=$text_md-info-use-one-custom-config.cfg
;;
"modify-custom" )
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
$cmd_internal -gui-yad new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-mini-custom $unarchivo
;;
new-tiny-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad new-tiny-custom $unarchivo
;;
nueva-diminuta-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-diminuta-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad show-custom $unarchivo 
;;
wizard-full*) $cmd_internal -gui-yad wizard-full ;;
wizard-mini*) $cmd_internal -gui-yad wizard-mini ;;
wizard-tiny*) $cmd_internal -gui-yad wizard-tiny ;;
preferences-modify*)
unarchivo=$(echo $menugtk | $command_sed 's/\///g' | $command_cut -d " " -f 2)
$cmd_internal -gui-yad preferences-modify 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
*) fecha_temporal="$cmd_log_date"
$cmd_internal $menugtk &> /tmp/fwiptables-$fecha_temporal
$command_yad --text-info \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=$cmd_internal-gui-shelL-$menugtk \
--filename=/tmp/fwiptables-$fecha_temporal --auto-scroll
rm /tmp/fwiptables-$fecha_temporal ;;
esac
$cmd_internal gui-shell-yad
####
####
exit ; fi
####
####
#### :rutina-final-gui-shell-yad:
##########    english: cli-menu: Manage list rules with one text menu          ##########
##########    spanish: cli-menu: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu:
####
####
################################################################################
#### 
#### 
#### english: dialog choosed #### spanish: dialogo elegido
#### 
####
if [ "$first_option" == "cli-menu" ]; then
####
####
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001  "$text_md intro" \
002  "$text_md info-options" \
003  "$text_md firewall-listconceptual" \
004  "$text_md firewall-listnumeral" \
005  "$text_md firewall-wallcontrol" \
006  "$text_md firewall-wallcustom" \
007  "$text_md firewall-wallsystem" \
008  "$text_md firewall-netsystem"  \
3>&1 1>&2 2>&3 )"
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli intro  ;;
002) clear ; $cmd_internal cli info-options ;;
003) clear ; $cmd_internal cli-menu-listconceptual $onecli ;;
004) clear ; $cmd_internal cli-menu-listnumeral $onecli  ;;
005) clear ; $cmd_internal cli-menu-wallcontrol $onecli  ;;
006) clear ; $cmd_internal cli-menu-wallcustom  $onecli  ;;
007) clear ; $cmd_internal cli-menu-wallsystem  $onecli  ;;
008) clear ; $cmd_internal cli-menu-netsystem     $onecli  ;;
################################################################################
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
exit; fi
####
####
#### :rutina-final-cli-menu:
##########    english: cli-menu-listconceptual: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-listconceptual: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-listconceptual:
####
####
if [ "$first_option" == "cli-menu-listconceptual" ]; then
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options ] $title_md" \
003 "$title_md [ Firewall List With Conceptual ] $title_md" \
004  "$text_md ls4" \
005  "$text_md ls6"  \
006  "$text_md list-filter4" \
007  "$text_md list-filter6" \
008  "$text_md list-forward" \
009  "$text_md list-forward6" \
010  "$text_md list-nat4" \
011  "$text_md list-nat6" \
012  "$text_md list-alltables" \
013  "$text_md list-raw4" \
014  "$text_md list-raw6" \
015  "$text_md list-mangle4" \
016  "$text_md list-mangle6" \
017  "$text_md list-security4" \
018  "$text_md list-security6" \
019  "$text_md list-ebtables" \
020  "$text_md list-arptables" \
3>&1 1>&2 2>&3 )"
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal $outcli options ;;
003) clear ; $cmd_internal $outcli firewall-listconceptual ;;
004) clear ; $cmd_internal $outcli ls4 ;;
005) clear ; $cmd_internal $outcli ls6 ;;
006) clear ; $cmd_internal $outcli list-filter4 ;;
007) clear ; $cmd_internal $outcli list-filter6 ;;
008) clear ; $cmd_internal $outcli list-forward ;;
009) clear ; $cmd_internal $outcli list-forward6 ;;
010) clear ; $cmd_internal $outcli list-nat4 ;;
011) clear ; $cmd_internal $outcli list-nat6 ;;
012) clear ; $cmd_internal $outcli list-alltables ;;
013) clear ; $cmd_internal $outcli list-raw4 ;;
014) clear ; $cmd_internal $outcli list-raw6 ;;
015) clear ; $cmd_internal $outcli list-mangle4 ;; 
016) clear ; $cmd_internal $outcli list-mangle6 ;;
017) clear ; $cmd_internal $outcli list-security4 ;;
018) clear ; $cmd_internal $outcli list-security6 ;;
019) clear ; $cmd_internal $outcli list-ebtables ;;
020) clear ; $cmd_internal $outcli list-arptables ;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
exit; fi
####
####
#### :rutina-final-cli-menu-listconceptual:
##########    english: cli-menu-listnumeral: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-listnumeral: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-listnumeral:
####
####
if [ "$first_option" == "cli-menu-listnumeral" ]; then
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options     ] $title_md" \
003 "$title_md [ Firewall Numeral ] $title_md" \
004  "$text_md lsn4" \
005  "$text_md lsn6"  \
006  "$text_md listn-filter4" \
007  "$text_md listn-filter6" \
008  "$text_md listn-forward" \
009  "$text_md listn-forward6" \
010  "$text_md listn-nat4" \
011  "$text_md listn-nat6" \
012  "$text_md listn-alltables" \
013  "$text_md listn-raw4" \
014  "$text_md listn-raw6" \
015  "$text_md listn-mangle4" \
016  "$text_md listn-mangle6" \
017  "$text_md listn-security4" \
018  "$text_md listn-security6" \
019  "$text_md list-ebtables" \
020  "$text_md list-arptables" \
3>&1 1>&2 2>&3 )"
##########
##########
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal $outcli options ;;
003) clear ; $cmd_internal $outcli firewall-listnumeral ;;
004) clear ; $cmd_internal $outcli lsn4 ;;
005) clear ; $cmd_internal $outcli lsn6 ;;
006) clear ; $cmd_internal $outcli listn-filter4 ;;
007) clear ; $cmd_internal $outcli listn-filter6 ;;
008) clear ; $cmd_internal $outcli listn-forward ;;
009) clear ; $cmd_internal $outcli listn-forward6 ;;
010) clear ; $cmd_internal $outcli listn-nat4 ;;
011) clear ; $cmd_internal $outcli listn-nat6 ;;
012) clear ; $cmd_internal $outcli listn-alltables ;;
013) clear ; $cmd_internal $outcli listn-raw4 ;;
014) clear ; $cmd_internal $outcli listn-raw6 ;;
015) clear ; $cmd_internal $outcli listn-mangle4 ;; 
016) clear ; $cmd_internal $outcli listn-mangle6 ;;
017) clear ; $cmd_internal $outcli listn-security4 ;;
018) clear ; $cmd_internal $outcli listn-security6 ;;
019) clear ; $cmd_internal $outcli list-ebtables ;;
020) clear ; $cmd_internal $outcli list-arptables ;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
exit; fi
####
####
#### :rutina-final-cli-menu-listnumeral:
##########    english: cli-menu-wallcontrol: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallcontrol: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallcontrol:
####
####
if [ "$first_option" == "cli-menu-wallcontrol" ]; then
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options     ] $title_md" \
003 "$title_md [ Firewall Control ] $title_md" \
004  "$text_md stop" \
005  "$text_md continue" \
006  "$text_md reset" \
007  "$text_md names"  \
008  "$text_md show" \
009  "$text_md save" \
010  "$text_md load" \
011  "$text_md actual" \
012  "$text_md eraserules" \
013  "$text_md wizard-tiny" \
014  "$text_md wizard-mini" \
015  "$text_md wizard-full" \
016  "$text_md without-connection" \
017  "$text_md input-permisive" \
018  "$text_md input-established" \
019  "$text_md eraserules4" \
020  "$text_md eraserules6" \
021  "$text_md eraserules" \
3>&1 1>&2 2>&3 )"
##########
##########
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
################################################################################
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal $outcli options ;;
003) clear ; $cmd_internal $outcli firewall-wallcontrol ;;
004) clear ; $cmd_internal $outcli stop ;;
005) clear ; $cmd_internal $outcli continue ;;
006) clear ; $cmd_internal $outcli reset ;;
007) clear ; $cmd_internal $outcli names ;;
008) clear ; $cmd_internal txt names ; echo "$title_md"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_internal show $nombrecillo ;; 
009)archivo="$($favorite_realpath_textdialog --stdout \
--title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ;  echo "$title_md saved $archivo" ; $cmd_internal save $archivo ;;
010) clear ; $cmd_internal names ; echo "$title_md"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_internal load $nombrecillo ;;
011) clear ; $cmd_internal $outcli actual ;;
012) clear ; $cmd_internal $outcli eraserules ; $cmd_internal cli list4   ;;
013) clear ; $cmd_internal $outcli wizard-tiny ; $cmd_internal cli list4  ;;
014) clear ; $cmd_internal $outcli wizard-mini ; $cmd_internal cli list4  ;;
015) clear ; $cmd_internal $outcli wizard-full ; $cmd_internal cli list4  ;;
016) clear ; $cmd_internal $outcli without-connection ; $cmd_internal cli list4  ;;
017) clear ; $cmd_internal $outcli input-permisive ; $cmd_internal cli list4   ;;
018) clear ; $cmd_internal $outcli input-established ; $cmd_internal cli list4   ;;
019) clear ; $cmd_internal $outcli eraserules4 ; $cmd_internal cli list4   ;;
020) clear ; $cmd_internal $outcli eraserules6 ; $cmd_internal cli list6   ;;
021) clear ; $cmd_internal $outcli eraserules ; $cmd_internal cli status   ;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
exit; fi
####
####
#### :rutina-final-cli-menu-wallcontrol:
##########    english: cli-menu-wallsystem: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallsystem: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallsystem:
####
####
if [ "$first_option" == "cli-menu-wallsystem" ]; then
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options        ] $title_md" \
003 "$title_md [ Firewall Wallsystem ] $title_md" \
007  "$text_md client-basic" \
008  "$text_md client-web" \
009  "$text_md client-ssh" \
010  "$text_md client-telnet" \
011  "$text_md client-git" \
012  "$text_md games-shooter" \
013  "$text_md game-wesnoth" \
014  "$text_md game-minetest" \
015  "$text_md game-freeciv" \
016  "$text_md game-widelands" \
017  "$text_md client-web" \
018  "$text_md client-vnc" \
019  "$text_md client-tor" \
020  "$text_md client-vpn" \
021  "$text_md client-torrent" \
022  "$text_md lan-tor" \
023  "$text_md lan-vpn" \
024  "$text_md shield-ssh" \
025  "$text_md server-ssh" \
026  "$text_md server-web" \
027  "$text_md server-vnc" \
028  "$text_md server-print" \
029  "$text_md server-samba" \
030  "$text_md server-lamp" \
031  "$text_md server-mail" \
032  "$text_md server-ftp" \
033  "$text_md server-news" \
034  "$text_md server-teamspeak" \
035  "$text_md server-mumble" \
036  "$text_md server-sql" \
037  "$text_md server-asterisk" \
3>&1 1>&2 2>&3 )"
##########
##########
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
################################################################################
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal cli options ;;
003) clear ; $cmd_internal cli firewall-wallsystem ;;
007) clear ; $cmd_internal txt client-basic ; $cmd_internal cli list4    ;;
008) clear ; $cmd_internal txt client-web ; $cmd_internal cli list4    ;;
009) clear ; $cmd_internal txt client-ssh ; $cmd_internal cli list4    ;;
010) clear ; $cmd_internal txt client-telnet ; $cmd_internal cli list4    ;;
011) clear ; $cmd_internal txt client-git ; $cmd_internal cli list4    ;;
012) clear ; $cmd_internal txt games-shooter ; $cmd_internal cli list4   ;; 
013) clear ; $cmd_internal txt game-wesnoth ; $cmd_internal cli list4    ;;
014) clear ; $cmd_internal txt game-minetest ; $cmd_internal cli list4   ;;
015) clear ; $cmd_internal txt game-freeciv ; $cmd_internal cli list4    ;;
016) clear ; $cmd_internal txt game-widelands ; $cmd_internal cli list4  ;;
017) clear ; $cmd_internal txt client-web ; $cmd_internal cli list4      ;;
018) clear ; $cmd_internal txt client-vnc ; $cmd_internal cli list4      ;;
019) clear ; $cmd_internal txt client-tor ; $cmd_internal cli list4      ;;
020) clear ; $cmd_internal txt client-vpn ; $cmd_internal cli list4      ;;
021) clear ; $cmd_internal txt client-torrent ; $cmd_internal cli list4  ;;
022) clear ; $cmd_internal txt lan-tor ; $cmd_internal cli list4         ;;
023) clear ; $cmd_internal txt lan-vpn ; $cmd_internal cli list4         ;; 
024) clear ; $cmd_internal txt shield-ssh ; $cmd_internal cli list4      ;; 
025) clear ; $cmd_internal txt server-ssh ; $cmd_internal cli list4      ;;
026) clear ; $cmd_internal txt server-web ; $cmd_internal cli list4      ;;
027) clear ; $cmd_internal txt server-vnc ; $cmd_internal cli list4      ;;
028) clear ; $cmd_internal txt server-print ; $cmd_internal cli list4    ;;
029) clear ; $cmd_internal txt server-samba ; $cmd_internal cli list4    ;;
030) clear ; $cmd_internal txt server-lamp ; $cmd_internal cli list4     ;;
031) clear ; $cmd_internal txt server-mail ; $cmd_internal cli list4     ;;
032) clear ; $cmd_internal txt server-ftp ; $cmd_internal cli list4      ;;
033) clear ; $cmd_internal txt server-news ; $cmd_internal cli list4     ;;
034) clear ; $cmd_internal txt server-teamspeak ; $cmd_internal cli list4  ;;
035) clear ; $cmd_internal txt server-mumble ; $cmd_internal cli list4   ;;
036) clear ; $cmd_internal txt server-sql ; $cmd_internal cli list4      ;;
037) clear ; $cmd_internal txt server-asterisk ; $cmd_internal cli list4 ;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
exit; fi
####
####
#### :rutina-final-cli-menu-wallsystem:
##########    english: cli-menu-wallcustom: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallcustom: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallcustom:
####
####
if [ "$first_option" == "cli-menu-wallcustom" ]; then
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options        ] $title_md" \
003 "$title_md [ Firewall Wallcustom ] $title_md" \
004  "$text_md load-custom" \
005  "$text_md clone-wallsystem" \
006  "$text_md new-full-custom" \
007  "$text_md nueva-completa-custom" \
008  "$text_md new-mini-custom" \
009  "$text_md nueva-mini-custom" \
010  "$text_md new-tiny-custom" \
011  "$text_md nueva-diminuta-custom" \
012  "$text_md show-custom" \
013  "$text_md modify-custom" \
014  "$text_md del-custom" \
015  "$text_md names-custom" \
3>&1 1>&2 2>&3 )"
##########
##########
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
################################################################################
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal $outcli options ;;
003) clear ; $cmd_internal $outcli firewall-wallsystem ;;
004) clear ; $cmd_internal txt names-custom
read -p "Input the custom name to load # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal load-custom $archivo ;;
005) clear ; read -p "Input the systemfw name to clone # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal clone-wallsystem $archivo ;;
006) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-full-custom $archivo ;;
007) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-completa-custom $archivo ;;
008) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-mini-custom $archivo ;;
009) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-mini-custom $archivo ;;
010) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-tiny-custom $archivo ;;
011) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-diminuta-custom $archivo ;;
012) clear ; read -p "Input the custom to show config # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal show-custom $archivo ;;
013) clear ; $cmd_internal names-custom
read -p "Input the custom name to modify # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal modify-custom $archivo ;;
014) clear ; $cmd_internal names-custom
read -p "Input the custom name to delete # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal del-custom $archivo ;;
015) clear ; $cmd_internal txt names-custom ;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
####
####
exit; fi
####
####
#### :rutina-final-cli-menu-wallcustom:
##########    english: cli-menu-netsystem: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-netsystem: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-netsystem:
####
####
if [ "$first_option" == "cli-menu-netsystem" ]; then
####
####
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$title_md $text_md [ principal menu ] $text_md $title_md" \
002 "$title_md [ Info Options     ] $title_md" \
003 "$title_md [ firewall netsystem ] $title_md" \
011  "$text_md preferences-read" \
012  "$text_md preferences-modify" \
013  "$text_md preferences-regen" \
014  "$text_md logfiles" \
015  "$text_md logcmd" \
016  "$text_md ip4" \
017  "$text_md ip6" \
018  "$text_md speed-ip4" \
019  "$text_md speed-ip6" \
020  "$text_md sockets" \
021  "$text_md notes" \
022  "$text_md license" \
025  "$text_md depends" \
026  "$text_md info" \
027  "$text_md version" \
028  "$text_md options" \
030  "$text_md info-options" \
031  "$text_md nodes" \
032  "$text_md date" \
033  "$text_md free" \
034  "$text_md expert" \
035  "$text_md treeconf" \
036  "$text_md commands" \
037  "$text_md variables" \
038  "$text_md intro" \
039  "$text_md download" \
040  "$text_md install" \
3>&1 1>&2 2>&3 )"
##########
##########
onecli="$(basename "$favorite_realpath_textdialog")"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $onecli ;;
002) clear ; $cmd_internal $outcli options ;;
003) clear ; $cmd_internal $outcli firewall-listnumeral ;;
011) clear ; $cmd_internal $outcli preferences-read ;;
012) clear ; $cmd_internal $outcli preferences-modify ;;
013) clear ; $cmd_internal $outcli preferences-regen ;;
014) clear ; $cmd_internal $outcli txt logfiles ;;
015) clear ; $cmd_internal $outcli txt logcmd ;;
016) clear ; $cmd_internal $outcli ip4 ;;
017) clear ; $cmd_internal $outcli ip6 ;;
018) clear ; $cmd_internal $outcli speed-ip4 ;;
019) clear ; $cmd_internal $outcli speed-ip6 ;;
020) clear ; $cmd_internal $outcli sockets ;;
021) clear ; $cmd_internal $outcli notes ;;
022) clear ; $cmd_internal $outcli license ;;
### 0713) clear ; $cmd_internal cli about ;;
### 0714) clear ; $cmd_internal cli examples ;;
025) clear ; $cmd_internal $outcli depends ;;
026) clear ; $cmd_internal $outcli info ;;
027) clear ; $cmd_internal $outcli version ;;
028) clear ; $cmd_internal $outcli options ;;
### 0719) clear ; $cmd_internal cli clasic-options ;;
030) clear ; $cmd_internal $outcli info-options ;;
031) clear ; $cmd_internal $outcli nodes ;;
032) clear ; $cmd_internal $outcli date ;;
033) clear ; $cmd_internal $outcli free ;;
034) clear ; $cmd_internal $outcli expert ;;
035) clear ; $cmd_internal $outcli treeconf ;;
036) clear ; $cmd_internal $outcli commands ;;
037) clear ; $cmd_internal $outcli variables ;;
038) clear ; $cmd_internal $outcli intro ;;
039) clear ; $cmd_internal $outcli download;;
040) clear ; $cmd_internal $outcli install;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
####
####
exit; fi
####
####
#### :rutina-final-cli-menu-netsystem:
##########    english: cli-menu-compact: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-compact: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-compact:
####
####
if [ "$first_option" == "cli-menu-compact" ]; then
####
####
if [ "$favorite_realpath_textdialog" == "$NULL" ]; then
echo "$title_md $text_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
favorite_basename_textdialog="$(basename) $2"
favorite_realpath_textdialog="$(realpath) $2" ; fi
##########
##########
menuprincipal="$($favorite_realpath_textdialog --clear --notags \
--title "$first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
0110 "$title_md [ intro ] $title_md $title_md" \
0120 "$title_md [ info-options ] $title_md $title_md" \
0200 "$title_md [ firewall-listconceptual ] $title_md" \
0201  "$text_md list4" \
0202  "$text_md list6"  \
0203  "$text_md list-filter4" \
0204  "$text_md list-filter6" \
0205  "$text_md list-forward" \
0206  "$text_md list-forward6" \
0207  "$text_md list-nat4" \
0208  "$text_md list-nat6" \
0209  "$text_md list-alltables" \
0214  "$text_md list-raw4" \
0215  "$text_md list-raw6" \
0216  "$text_md list-mangle4" \
0217  "$text_md list-mangle6" \
0218  "$text_md list-security4" \
0219  "$text_md list-security6" \
0220  "$text_md list-ebtables" \
0221  "$text_md list-arptables" \
0300 "$title_md [ firewall-listnumeral ] $title_md" \
0301  "$text_md listn4" \
0302  "$text_md listn6" \
0303  "$text_md listn-filter4" \
0304  "$text_md listn-filter6" \
0305  "$text_md listn-forward" \
0306  "$text_md listn-forward6" \
0307  "$text_md listn-nat4" \
0308  "$text_md listn-nat6" \
0309  "$text_md listn-alltables" \
0314  "$text_md listn-raw4" \
0315  "$text_md listn-raw6" \
0316  "$text_md listn-mangle4" \
0317  "$text_md listn-mangle6" \
0318  "$text_md listn-security4" \
0319  "$text_md listn-security6" \
0320  "$text_md listn-ebtables" \
0321  "$text_md listn-arptables" \
0400 "$title_md [ firewall-control ] $title_md" \
0401  "$text_md stop" \
0402  "$text_md continue" \
0403  "$text_md reset" \
0404  "$text_md names"  \
0405  "$text_md show" \
0406  "$text_md save" \
0407  "$text_md load" \
0408  "$text_md actual" \
0409  "$text_md eraserules" \
0410  "$text_md wizard-tiny" \
0411  "$text_md wizard-mini" \
0412  "$text_md wizard-full" \
0413  "$text_md without-connection" \
0414  "$text_md input-permisive" \
0415  "$text_md input-established" \
0416  "$text_md eraserules4" \
0417  "$text_md eraserules6" \
0418  "$text_md eraserules" \
0500 "$title_md [ firewall-wallsystem ] $title_md" \
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
0600 "$title_md [ firewall-wallcustom ] $title_md" \
0606  "$text_md load-custom" \
0607  "$text_md clone-wallsystem" \
0611  "$text_md new-full-custom" \
0612  "$text_md nueva-completa-custom" \
0613  "$text_md new-mini-custom" \
0614  "$text_md nueva-mini-custom" \
0615  "$text_md new-tiny-custom" \
0616  "$text_md nueva-diminuta-custom" \
0617  "$text_md show-custom" \
0618  "$text_md modify-custom" \
0619  "$text_md del-custom" \
0620  "$text_md names-custom" \
0621  "$text_md templates-regen" \
0700 "$title_md [ firewall-netsystem ] $title_md" \
0701  "$text_md preferences-read" \
0702  "$text_md preferences-modify" \
0703  "$text_md preferences-regen" \
0704  "$text_md logfiles" \
0705  "$text_md logcmd" \
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
0718  "$text_md options" \
0720  "$text_md options" \
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
0110) clear ; $cmd_internal cli intro  ;;
0120) clear ; $cmd_internal cli info-options ;;
0200) clear ; $cmd_internal cli firewall-listconceptual ;;
0300) clear ; $cmd_internal cli firewall-listnumeral ;;
0400) clear ; $cmd_internal cli firewall-wallcontrol ;;
0500) clear ; $cmd_internal cli firewall-wallsystem ;;
0600) clear ; $cmd_internal cli firewall-wallcustom ;;
0700) clear ; $cmd_internal cli firewall-netsystem ;;
################################################################################
0201) clear ; $cmd_internal $outcli list4 ;;
0202) clear ; $cmd_internal $outcli list6 ;;
0203) clear ; $cmd_internal $outcli list-filter4 ;;
0204) clear ; $cmd_internal $outcli list-filter6 ;;
0205) clear ; $cmd_internal $outcli list-forward ;;
0206) clear ; $cmd_internal $outcli list-forward6 ;;
0207) clear ; $cmd_internal $outcli list-nat4 ;;
0208) clear ; $cmd_internal $outcli list-nat6 ;;
0209) clear ; $cmd_internal $outcli list-alltables ;;
0214) clear ; $cmd_internal $outcli list-raw4 ;;
0215) clear ; $cmd_internal $outcli list-raw6 ;;
0216) clear ; $cmd_internal $outcli list-mangle4 ;; 
0217) clear ; $cmd_internal $outcli list-mangle6 ;;
0218) clear ; $cmd_internal $outcli list-security4 ;;
0219) clear ; $cmd_internal $outcli list-security6 ;;
0220) clear ; $cmd_internal $outcli list-ebtables ;;
0221) clear ; $cmd_internal $outcli list-arptables ;;
################################################################################
0301) clear ; $cmd_internal $outcli listn4 ;;
0302) clear ; $cmd_internal $outcli listn6 ;;
0303) clear ; $cmd_internal $outcli listn-filter4 ;;
0304) clear ; $cmd_internal $outcli listn-filter6 ;;
0305) clear ; $cmd_internal $outcli listn-forward ;;
0306) clear ; $cmd_internal $outcli listn-forward6 ;;
0307) clear ; $cmd_internal $outcli listn-nat4 ;;
0308) clear ; $cmd_internal $outcli listn-nat6 ;;
0309) clear ; $cmd_internal $outcli listn-alltables ;;
0314) clear ; $cmd_internal $outcli listn-raw4 ;;
0315) clear ; $cmd_internal $outcli listn-raw6 ;;
0316) clear ; $cmd_internal $outcli listn-mangle4 ;; 
0317) clear ; $cmd_internal $outcli listn-mangle6 ;;
0318) clear ; $cmd_internal $outcli listn-security4 ;;
0319) clear ; $cmd_internal $outcli listn-security6 ;;
0320) clear ; $cmd_internal $outcli list-ebtables ;;
0321) clear ; $cmd_internal $outcli list-arptables ;;
################################################################################
0401) clear ; $cmd_internal $outcli stop ;;
0402) clear ; $cmd_internal $outcli continue ;;
0403) clear ; $cmd_internal $outcli reset ;;
0404) clear ; $cmd_internal $outcli names ;;
0405) clear ; $cmd_internal txt names ; echo "$title_md"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_internal show $nombrecillo ;; 
0406)archivo="$($favorite_realpath_textdialog --stdout \
--title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $command_sed s/\\///g)
clear ;  echo "$title_md saved $archivo" ; $cmd_internal save $archivo ;;
0407) clear ; $cmd_internal names ; echo "$title_md"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $command_sed s/\\///g)
$cmd_internal load $nombrecillo ;;
0408) clear ; $cmd_internal $outcli actual ;;
0409) clear ; $cmd_internal $outcli eraserules ; $cmd_internal cli list4   ;;
0410) clear ; $cmd_internal txt wizard-tiny ; $cmd_internal cli list4  ;;
0411) clear ; $cmd_internal txt wizard-mini ; $cmd_internal cli list4  ;;
0412) clear ; $cmd_internal txt wizard-full ; $cmd_internal cli list4  ;;
0413) clear ; $cmd_internal $outcli without-connection ; $cmd_internal cli list4  ;;
0414) clear ; $cmd_internal $outcli input-permisive ; $cmd_internal cli list4   ;;
0415) clear ; $cmd_internal $outcli input-established ; $cmd_internal cli list4   ;;
0416) clear ; $cmd_internal $outcli eraserules4 ; $cmd_internal cli list4   ;;
0417) clear ; $cmd_internal $outcli eraserules6 ; $cmd_internal cli list6   ;;
0418) clear ; $cmd_internal $outcli eraserules ; $cmd_internal cli status   ;;
################################################################################
0507) clear ; $cmd_internal $outcli client-basic ; $cmd_internal cli list4    ;;
0508) clear ; $cmd_internal $outcli client-web ; $cmd_internal cli list4    ;;
0509) clear ; $cmd_internal $outcli client-ssh ; $cmd_internal cli list4    ;;
0510) clear ; $cmd_internal $outcli client-telnet ; $cmd_internal cli list4    ;;
0511) clear ; $cmd_internal $outcli client-git ; $cmd_internal cli list4    ;;
0512) clear ; $cmd_internal $outcli games-shooter ; $cmd_internal cli list4   ;; 
0513) clear ; $cmd_internal $outcli game-wesnoth ; $cmd_internal cli list4    ;;
0514) clear ; $cmd_internal $outcli game-minetest ; $cmd_internal cli list4   ;;
0515) clear ; $cmd_internal $outcli game-freeciv ; $cmd_internal cli list4    ;;
0516) clear ; $cmd_internal $outcli game-widelands ; $cmd_internal cli list4  ;;
0517) clear ; $cmd_internal $outcli client-web ; $cmd_internal cli list4      ;;
0518) clear ; $cmd_internal $outcli client-vnc ; $cmd_internal cli list4      ;;
0519) clear ; $cmd_internal $outcli client-tor ; $cmd_internal cli list4      ;;
0520) clear ; $cmd_internal $outcli client-vpn ; $cmd_internal cli list4      ;;
0521) clear ; $cmd_internal $outcli client-torrent ; $cmd_internal cli list4  ;;
0522) clear ; $cmd_internal $outcli lan-tor ; $cmd_internal cli list4         ;;
0523) clear ; $cmd_internal $outcli lan-vpn ; $cmd_internal cli list4         ;; 
0524) clear ; $cmd_internal $outcli shield-ssh ; $cmd_internal cli list4      ;; 
0525) clear ; $cmd_internal $outcli server-ssh ; $cmd_internal cli list4      ;;
0526) clear ; $cmd_internal $outcli server-web ; $cmd_internal cli list4      ;;
0527) clear ; $cmd_internal $outcli server-vnc ; $cmd_internal cli list4      ;;
0528) clear ; $cmd_internal $outcli server-print ; $cmd_internal cli list4    ;;
0529) clear ; $cmd_internal $outcli server-samba ; $cmd_internal cli list4    ;;
0530) clear ; $cmd_internal $outcli server-lamp ; $cmd_internal cli list4     ;;
0531) clear ; $cmd_internal $outcli server-mail ; $cmd_internal cli list4     ;;
0532) clear ; $cmd_internal $outcli server-ftp ; $cmd_internal cli list4      ;;
0533) clear ; $cmd_internal $outcli server-news ; $cmd_internal cli list4     ;;
0534) clear ; $cmd_internal $outcli server-teamspeak ; $cmd_internal cli list4  ;;
0535) clear ; $cmd_internal $outcli server-mumble ; $cmd_internal cli list4   ;;
0536) clear ; $cmd_internal $outcli server-sql ; $cmd_internal cli list4      ;;
0537) clear ; $cmd_internal $outcli server-asterisk ; $cmd_internal cli list4 ;;
################################################################################
0606) clear ; $cmd_internal txt names-custom
read -p "Input the custom name to load # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal load-custom $archivo ;;
0607) clear ; read -p "Input the systemfw name to clone # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal clone-wallsystem $archivo ;;
0611) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-full-custom $archivo ;;
0612) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-completa-custom $archivo ;;
0613) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-mini-custom $archivo ;;
0614) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-mini-custom $archivo ;;
0615) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal new-tiny-custom $archivo ;;
0616) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal nueva-diminuta-custom $archivo ;;
0617) clear ; read -p "Input the custom to show config # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal show-custom $archivo ;;
0618) clear ; $cmd_internal names-custom
read -p "Input the custom name to modify # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal modify-custom $archivo ;;
0619) clear ; $cmd_internal names-custom
read -p "Input the custom name to delete # " archivo
archivo=$(echo $archivo | $command_sed s/\\///g)
$cmd_internal del-custom $archivo ;;
0620) clear ; $cmd_internal txt names-custom ;;
0621) clear ; $cmd_internal txt templates-regen ;;
################################################################################
0701) clear ; $cmd_internal $outcli preferences-read ;;
0702) clear ; $cmd_internal txt preferences-modify ;;
0703) clear ; $cmd_internal $outcli preferences-regen ;;
0704) clear ; $cmd_internal txt logfiles ;;
0705) clear ; $cmd_internal txt logcmd ;;
0706) clear ; $cmd_internal $outcli ip4 ;;
0707) clear ; $cmd_internal $outcli ip6 ;;
0708) clear ; $cmd_internal $outcli speed-ip4 ;;
0709) clear ; $cmd_internal $outcli speed-ip6 ;;
0710) clear ; $cmd_internal $outcli sockets ;;
0711) clear ; $cmd_internal $outcli notes ;;
0712) clear ; $cmd_internal $outcli license ;;
### 0713) clear ; $cmd_internal cli about ;;
### 0714) clear ; $cmd_internal cli examples ;;
0715) clear ; $cmd_internal $outcli depends ;;
0716) clear ; $cmd_internal $outcli info ;;
0717) clear ; $cmd_internal $outcli version ;;
0718) clear ; $cmd_internal $outcli options ;;
### 0719) clear ; $cmd_internal cli clasic-options ;;
0720) clear ; $cmd_internal $outcli info-options ;;
0721) clear ; $cmd_internal $outcli nodes ;;
0722) clear ; $cmd_internal $outcli date ;;
0723) clear ; $cmd_internal $outcli free ;;
0724) clear ; $cmd_internal $outcli expert ;;
0725) clear ; $cmd_internal $outcli treeconf ;;
0726) clear ; $cmd_internal $outcli commands ;;
0727) clear ; $cmd_internal $outcli variables ;;
0728) clear ; $cmd_internal $outcli intro ;;
0729) clear ; $cmd_internal $outcli download;;
0730) clear ; $cmd_internal $outcli install;;
################################################################################
*) clear ; $favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
$cmd_internal text-pause
$cmd_internal cli-menu-compact
####
####
exit; fi
####
####
#### :rutina-final-cli-menu-compact:
##########    english: text-pause: do pause     ##########
##########    spanish: text-pause: hace pausa   ##########
#### :rutina-inicial-text-pause:
####
####
if [ "$first_option" == "text-pause" ]
####
####
then read -p '$title_md $text_ok $title_md Press [enter] \
to continue now with the cli-menu $title_md'
####
####
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
####
####
then $favorite_realpath_graphicalldialog --forms \
--text="wait a moment, usually 1 minute max."
####
####
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
####
####
then echo $head_waiting_gui ;
if [ "$command_zenity" == "$NULL" ] ;
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="Info|Firewall-List-With-Conceptual|\
Firewall-List-With-Numeral|firewall-wallcontrol|firewall-wallcustom|\
firewall-wallsystem|firewall-netsystem"
selection_menu="$($command_zenity --forms \
--text=gui-roll \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
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
$cmd_internal gui-zenity info ; exit ;;
####
####
Firewall-List-With-Conceptual)
$cmd_internal gui-roll-zenity-firewall-listconceptual ; exit ;;
Firewall-List-With-Numeral)
$cmd_internal gui-roll-zenity-firewall-listnumeral ; exit ;;
firewall-wallcontrol)
$cmd_internal gui-roll-zenity-firewall-wallcontrol ; exit ;;
firewall-wallcustom)
$cmd_internal gui-roll-zenity-firewall-wallcustom ; exit ;;
firewall-wallsystem)
$cmd_internal gui-roll-zenity-firewall-wallsystem ; exit ;;
firewall-netsystem)
$cmd_internal gui-roll-zenity-firewall-netsystem ; exit ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity:
##########    english: gui-roll-zenity-firewall-wallcontrol: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-wallcontrol: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-wallcontrol:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-wallcontrol" ]
####
####
then echo $head_waiting_gui ;
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
|stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|wizard-tiny|wizard-mini|wizard-full|\
without-connection|input-permisive|input-established|\
tinyserver-tcp|tinyserver-udp|miniserver-tcp|miniserver-udp"
selection_menu="$($command_zenity --forms \
--text=gui-roll-firewall-wallcontrol \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
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
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-wallcontrol ;;
stop)$cmd_internal -gui-zenity stop
$cmd_internal -gui-zenity list4;;
continue)$cmd_internal -gui-zenity continue
$cmd_internal -gui-zenity list4;;
reset)$cmd_internal -gui-zenity reset
$cmd_internal -gui-zenity list4;;
names)$cmd_internal -gui-zenity names ;;
show)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Show-Firewall --entry-text=cfg-to-show)" ; 
$cmd_internal -gui-zenity show $archivo ;;
save)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall --entry-text=cfg-to-save)" ; 
$cmd_internal -gui-zenity save $archivo ;;
load)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Load-Firewall --entry-text=cfg-to-load)" ;
$cmd_internal -gui-zenity load $archivo
$cmd_internal -gui-zenity list4;;
actual)$cmd_internal -gui-zenity actual ;;
eraserules4)$cmd_internal -gui-zenity eraserules ; $cmd_internal gui list4;;
eraserules6)$cmd_internal -gui-zenity eraserules ; $cmd_internal gui list6;;
eraserules)$cmd_internal -gui-zenity eraserules ; $cmd_internal gui list4;;
wizard-full)$cmd_internal -gui-zenity wizard-full ; $cmd_internal gui list4;;
wizard-mini)$cmd_internal -gui-zenity wizard-mini ; $cmd_internal gui list4;;
wizard-tiny)$cmd_internal -gui-zenity wizard-tiny ; $cmd_internal gui list4;;
without-connection)$cmd_internal -gui-zenity without-connection ; $cmd_internal gui list4;;
input-permisive)$cmd_internal -gui-zenity input-permisive ; $cmd_internal gui list4;;
input-established)$cmd_internal -gui-zenity input-established ; $cmd_internal gui list4;;
tinyserver-tcp)serverports="$(zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                         ;
$cmd_internal gui-zenity tinyserver-tcp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
tinyserver-udp)serverports="$(zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                         ;
$cmd_internal gui-zenity tinyserver-udp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
miniserver-tcp)serverports="$(zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                         ;
$cmd_internal gui-zenity miniserver-tcp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
miniserver-udp)serverports="$(zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                         ;
$cmd_internal gui-zenity miniserver-udp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-wallcontrol:
##########    english: gui-roll-zenity-firewall-listconceptual: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-listconceptual: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-listconceptual:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-listconceptual" ]
####
####
then echo $head_waiting_gui ;
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
--title=Gui-roll-With-$cmd_internal-$cmd_version \
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
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-listconceptual ;;
ls4)$cmd_internal -gui-zenity ls4 ;;
ls6)$cmd_internal -gui-zenity ls6 ;;
list-alltables)$cmd_internal -gui-zenity list-alltables ;;
list-filter4)$cmd_internal -gui-zenity list-filter4 ;;
list-filter6)$cmd_internal -gui-zenity list-filter6 ;;
list-nat4)$cmd_internal -gui-zenity list-nat4 ;;
list-nat6)$cmd_internal -gui-zenity list-nat6 ;;
list-mangle4)$cmd_internal -gui-zenity list-mangle4 ;;
list-mangle6)$cmd_internal -gui-zenity list-mangle6 ;;
list-raw4)$cmd_internal -gui-zenity list-raw4 ;;
list-raw6)$cmd_internal -gui-zenity list-raw6 ;;
list-security4)$cmd_internal -gui-zenity list-security4 ;;
list-security6)$cmd_internal -gui-zenity list-security6 ;;
list-ebtables)$cmd_internal -gui-zenity list-ebtables ;;
list-arptables)$cmd_internal -gui-zenity list-arptables ;;
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
then echo $head_waiting_gui ;
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
--title=Gui-roll-With-$cmd_internal-$cmd_version \
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
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-listnumeral ;;
lsn4)$cmd_internal -gui-zenity lsn4 ;;
lsn6)$cmd_internal -gui-zenity lsn6 ;;
listn-alltables)$cmd_internal -gui-zenity listn-alltables ;;
listn-filter4)$cmd_internal -gui-zenity listn-filter4 ;;
listn-filter6)$cmd_internal -gui-zenity listn-filter6 ;;
listn-nat4)$cmd_internal -gui-zenity listn-nat4 ;;
listn-nat6)$cmd_internal -gui-zenity listn-nat6 ;;
listn-mangle4)$cmd_internal -gui-zenity listn-mangle4 ;;
listn-mangle6)$cmd_internal -gui-zenity listn-mangle6 ;;
listn-raw4)$cmd_internal -gui-zenity listn-raw4 ;;
listn-raw6)$cmd_internal -gui-zenity listn-raw6 ;;
listn-security4)$cmd_internal -gui-zenity listn-security4 ;;
listn-security6)$cmd_internal -gui-zenity listn-security6 ;;
list-ebtables)$cmd_internal -gui-zenity list-ebtables ;;
list-arptables)$cmd_internal -gui-zenity list-arptables ;;
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
then echo $head_waiting_gui ;
if [ "$command_zenity" == "$NULL" ]
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|load-custom|\
clone-wallsystem|new-full-custom|nueva-completa-custom|\
new-mini-custom|nueva-mini-custom|new-tiny-custom|nueva-diminuta-custom|\
names-custom|show-custom|modify-custom|del-custom|templates-regen"
selection_menu="$($command_zenity --forms \
--text=gui-roll-firewall-wallcustom \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-wallcustom ;;
load-custom)archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Launch-Custom --entry-text=cfg_to_launch)" ; 
$cmd_internal -gui-zenity load-custom $archivo ; $cmd_internal gui list4;;
clone-wallsystem)archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Clone-firewall-static --entry-text=firewall_static_to_clone)" ; 
$cmd_internal -gui-zenity clone-wallsystem $archivo ; $cmd_internal gui list4;;
new-full-custom)
archivo="$($command_zenity  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_internal -gui-zenity new-full-custom $archivo ;;
nueva-completa-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-completa-custom $archivo ;;
new-mini-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-mini-custom \
--entry-text=Input_file_name_to_new_mini_configuration)" ;
$cmd_internal -gui-zenity new-mini-custom $archivo ;;
nueva-mini-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-mini-custom $archivo ;;
new-tiny-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-tiny-custom \
--entry-text=Input_file_name_to_new_mini_configuration)" ;
$cmd_internal -gui-zenity new-tiny-custom $archivo ;;
nueva-diminuta-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-diminuta-custom $archivo ;;
names-custom)
$cmd_internal -gui-zenity names-custom ;;
show-custom)
archivo="$($command_zenity --entry \ 
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Show-custom \
--entry-text=cfg-to-show)" ;
$cmd_internal -gui-zenity show-custom $archivo ;;
modify-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=modify-custom --entry-text=cfg-to-modify)" ;
$cmd_internal -gui-zenity modify-custom $archivo ;;
del-custom)
archivo="$($command_zenity --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=del-custom --entry-text=cfg-to-delete)" ;
$cmd_internal -gui-zenity del-custom $archivo ;;
templates-regen)$cmd_internal -gui-zenity templates-regen ;;
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
####
####
then echo $head_waiting_gui ;
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
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$first_option \
--combo-values=$menu)"
#### 
#### 
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal gui-zenity firewall-wallsystem ;;
client-basic)$cmd_internal gui-zenity client-basic     ;
$cmd_internal gui-zenity list4 ;;
client-web)$cmd_internal gui-zenity client-web         ;
$cmd_internal gui-zenity list4 ;;
client-ssh)$cmd_internal gui-zenity client-ssh         ;
$cmd_internal gui-zenity list4 ;;
client-telnet)$cmd_internal gui-zenity client-telnet   ;
$cmd_internal gui-zenity list4 ;;
client-ipp)$cmd_internal gui-zenity client-ipp         ;
$cmd_internal gui-zenity list4 ;;
client-irc)$cmd_internal gui-zenity client-irc         ;
$cmd_internal gui-zenity list4 ;;
client-mail)$cmd_internal gui-zenity client-mail       ;
$cmd_internal gui-zenity list4 ;;
client-news)$cmd_internal gui-zenity client-news       ;
$cmd_internal gui-zenity list4 ;;
client-ftp)$cmd_internal gui-zenity client-ftp         ;
$cmd_internal gui-zenity list4 ;;
client-git)$cmd_internal gui-zenity client-git         ;
$cmd_internal gui-zenity list4 ;;
client-vnc)$cmd_internal gui-zenity client-vnc         ;
$cmd_internal gui-zenity list4 ;;
client-torrent)$cmd_internal gui-zenity client-torrent ;
$cmd_internal gui-zenity list4 ;;
client-vpn)$cmd_internal gui-zenity client-vpn         ;
$cmd_internal gui-zenity list4 ;;
client-tor)$cmd_internal gui-zenity client-tor         ;
$cmd_internal gui-zenity list4 ;;
games-shooter)$cmd_internal gui-zenity games-shooter   ;
$cmd_internal gui-zenity list4 ;;
game-wesnoth)$cmd_internal gui-zenity game-wesnoth     ;
$cmd_internal gui-zenity list4 ;;
game-minetest)$cmd_internal gui-zenity game-minetest   ;
$cmd_internal gui-zenity list4 ;;
game-freeciv)$cmd_internal gui-zenity game-freeciv     ;
$cmd_internal gui-zenity list4 ;;
game-widelands)$cmd_internal gui-zenity game-widelands ;
$cmd_internal gui-zenity list4 ;;
lan-tor)$cmd_internal gui-zenity lan-tor               ;
$cmd_internal gui-zenity list4 ;;
lan-vpn)$cmd_internal gui-zenity lan-vpn               ;
$cmd_internal gui-zenity list4 ;;
server-ssh)$cmd_internal gui-zenity server-ssh         ;
$cmd_internal gui-zenity list4 ;;
server-web)$cmd_internal gui-zenity server-web         ;
$cmd_internal gui-zenity list4 ;;
server-proxy)$cmd_internal gui-zenity server-proxy     ;
$cmd_internal gui-zenity list4 ;;
server-vnc)$cmd_internal gui-zenity server-vnc         ;
$cmd_internal gui-zenity list4 ;;
server-samba)$cmd_internal gui-zenity server-samba     ;
$cmd_internal gui-zenity list4 ;;
server-news)$cmd_internal gui-zenity server-news       ;
$cmd_internal gui-zenity list4 ;;
server-mail)$cmd_internal gui-zenity server-mail       ;
$cmd_internal gui-zenity list4 ;;
server-ftp)$cmd_internal gui-zenity server-ftp         ;
$cmd_internal gui-zenity list4 ;;
server-print)$cmd_internal gui-zenity server-print     ;
$cmd_internal gui-zenity list4 ;;
server-lamp)$cmd_internal gui-zenity server-lamp       ;
$cmd_internal gui-zenity list4 ;;
server-teamspeak)$cmd_internal gui-zenity server-teamspeak ;
$cmd_internal gui-zenity list4 ;;
server-mumble)$cmd_internal gui-zenity server-mumble       ;
$cmd_internal gui-zenity list4 ;;
server-sql)$cmd_internal gui-zenity server-sql             ;
$cmd_internal gui-zenity list4 ;;
server-asterisk)$cmd_internal gui-zenity server-asterisk   ;
$cmd_internal gui-zenity list4 ;;
server-domain)$cmd_internal gui-zenity server-domain       ;
$cmd_internal gui-zenity list4 ;;
esac
####
####
exit ; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-wallsystem:
##########    english: gui-roll-zenity-firewall-netsystem: gui with roll  ##########
##########    spanish: gui-roll-zenity-firewall-netsystem: gui con roll   ##########
#### :rutina-inicial-gui-roll-zenity-firewall-netsystem:
####
####
if [ "$first_option" == "gui-roll-zenity-firewall-netsystem" ] ;
####
####
then echo $head_waiting_gui ;
if [ "$command_zenity" == "$NULL" ] ;
then echo $message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|\
options|info-options|expert|\
address4|address6|network4|network6||sockets|\
logfiles|logcmd|ip4|ip6|notes|speed-ip4|speed-ip6|\
nodes|date|free|version|treeconf|treecache|cleancache|\
depends|utils|about|variables|examples|intro|install|upgrade|\
license-lgpl-v2|license-gpl-v2"
####
####
selection="$($command_zenity --forms \
--text=$first_option \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$first_option \
--combo-values=$gui_menu)"
####
####
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-netsystem ;;
preferences-read)$cmd_internal -gui-zenity preferences-read ;;
preferences-modify)$cmd_internal -gui-zenity preferences-modify ;;
preferences-regen)$cmd_internal -gui-zenity preferences-regen ;;
preferences-example)$cmd_internal -gui-zenity preferences-example ;;
options)$cmd_internal -gui-zenity options ;;
info-options)$cmd_internal -gui-zenity info-options ;;
expert)$cmd_internal -gui-zenity expert ;;
logfiles) $cmd_internal -gui-zenity logfiles ;; 
logcmd) $cmd_internal -gui-zenity logcmd ;;
ip4)$cmd_internal -gui-zenity ip4 ;;
ip6)$cmd_internal -gui-zenity ip6 ;;
notes)$cmd_internal -gui-zenity notes ;;
speed-ip4)$cmd_internal -gui-zenity speed-ip4 ;;
speed-ip6)$cmd_internal -gui-zenity speed-ip6 ;;
sockets)$cmd_internal -gui-zenity sockets ;;
nodes) $cmd_internal -gui-zenity nodes ;;
date) $cmd_internal -gui-zenity date ;;
free) $cmd_internal -gui-zenity free ;;
version) $cmd_internal -gui-zenity version ;;
treeconf)$cmd_internal -gui-zenity treeconf ;;
treecache)$cmd_internal -gui-zenity treecache ;;
cleancache) $cmd_internal -gui-zenity cleancache ;;
depends)$cmd_internal -gui-zenity depends ;;
address4)$cmd_internal gui-$second_option address4 ;;
address6)$cmd_internal gui-$second_option address6 ;;
network4)$cmd_internal gui-$second_option network4 ;;
network6)$cmd_internal gui-$second_option network6 ;;
install)$cmd_internal -gui-zenity install ;;
upgrade)$cmd_internal -gui-zenity upgrade ;;
license-lgpl-v2) $cmd_internal -gui-zenity license-lgpl-v2 ;;
license-gpl-v2) $cmd_internal -gui-zenity license-gpl-v2 ;;
examples)$cmd_internal -gui-zenity examples ;;
intro) $cmd_internal -gui-zenity intro ;;
variables) $cmd_internal -gui-zenity variables ;;
utils) $cmd_internal -gui-zenity utils ;;
about) $cmd_internal -gui-zenity about ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-roll-zenity-firewall-netsystem:
##########    english: gui-menu: gui menu general: gui con menu  ##########
##########    spanish: gui-menu: gui menu general: gui con menu  ##########
#### :rutina-inicial-gui-menu:
####
####
if [ "$first_option" == "gui-menu" ] ;
####
####
then echo $head_waiting_gui ;
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="Firewall-listconceptual|Firewall-listnumeral|firewall-wallcontrol|\
Firewall-wallcustom|Firewall-wallsystem|firewall-netsystem|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width \
--height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
Firewall-listconceptual*)
$cmd_internal gui-menu-firewall-listconceptual $second_option ;;
Firewall-listnumeral*)
$cmd_internal gui-menu-firewall-listnumeral $second_option ;;
firewall-wallcontrol*)
$cmd_internal gui-menu-firewall-wallcontrol $second_option ;;
Firewall-wallcustom*)
$cmd_internal gui-menu-firewall-wallcustom $second_option ;;
Firewall-wallsystem*)
$cmd_internal gui-menu-firewall-wallsystem $second_option ;;
firewall-netsystem*)
$cmd_internal gui-menu-firewall-netsystem $second_option ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu:
##########    english: gui-menu-firewall-wallcontrol: gui with menu   ##########
##########    spanish: gui-menu-firewall-wallcontrol: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-wallcontrol:
####
####
if   [ "$first_option" == "gui-menu-firewall-wallcontrol" ]
then echo $head_waiting_gui ;
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|\
without-connection|input-permisive|input-established|\
wizard-tiny|wizard-mini|wizard-full|\
tinyserver-tcp|tinyserver-udp|miniserver-tcp|miniserver-udp|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option  ;;
gui-info-menu*)$cmd_internal gui-$second_option firewall-wallcontrol ;;
stop*)$cmd_internal gui-$second_option stop ;
$cmd_internal gui-$second_option list4 ;;
continue*)$cmd_internal gui-$second_option continue ;
$cmd_internal gui-$second_option list4 ;;
reset*)$cmd_internal gui-$second_option reset ;
$cmd_internal gui-$second_option list4 ;;
names*)$cmd_internal gui-$second_option names ;;
show*)archivo="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-show)" 
$cmd_internal gui-$second_option $archivo ;;
save*)archivo="$($second_option--entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-save)" 
$cmd_internal gui-$second_option save $archivo ;;
load*)archivo="$($favorite_realpath_graphicalldialog  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-load)" 
$cmd_internal gui-$second_option load $archivo ;
$cmd_internal gui-$second_option list4 ;;
actual*)$cmd_internal gui-$second_option actual ;;
eraserules4*)$cmd_internal gui-$second_option eraserules4 ;;
eraserules6*)$cmd_internal gui-$second_option eraserules6 ;;
eraserules*)$cmd_internal gui-$second_option eraserules ;;
wizard-full*)$cmd_internal gui-$second_option wizard-full ;
$cmd_internal gui-$second_option list4 ;;
wizard-mini*)$cmd_internal gui-$second_option wizard-mini ;
$cmd_internal gui-$second_option list4 ;;
wizard-tiny*)$cmd_internal gui-$second_option wizard-tiny ;
$cmd_internal gui-$second_option list4 ;;
without-connection*)$cmd_internal gui-$second_option without-connection ;
$cmd_internal gui-$second_option list4 ;;
input-permisive*)$cmd_internal gui-$second_option input-permisive ;
$cmd_internal gui-$second_option list4 ;;
input-established*)$cmd_internal gui-$second_option input-established ;
$cmd_internal gui-$second_option list4 ;;
tinyserver-tcp*)serverports="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                                 ;
$cmd_internal gui-$second_option tinyserver-tcp $serverports    ; 
$cmd_internal gui-$second_option list4                         ;;
tinyserver-udp*)serverports="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                                 ;
$cmd_internal gui-$second_option tinyserver-udp $serverports    ; 
$cmd_internal gui-$second_option list4                         ;;
miniserver-tcp*)serverports="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                                 ;
$cmd_internal gui-$second_option miniserver-tcp $serverports    ; 
$cmd_internal gui-$second_option list4                         ;;
miniserver-udp*)serverports="$($favorite_basename_graphicalldialog --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                                 ;
$cmd_internal gui-$second_option miniserver-udp $serverports    ; 
$cmd_internal gui-$second_option list4                         ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-wallcontrol:
##########    english: gui-menu-firewall-listconceptual: gui with menu   ##########
##########    spanish: gui-menu-firewall-listconceptual: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-listconceptual:
####
####
if   [ "$first_option" == "gui-menu-firewall-listconceptual" ]
####
####
then echo $head_waiting_gui ;
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
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option ;;
gui-info-menu*)$cmd_internal gui-$second_option firewall-listconceptual ;;
ls4*)$cmd_internal gui-$second_option ls4 ;;
ls6*)$cmd_internal gui-$second_option ls6 ;;
list-alltables*)$cmd_internal gui-$second_option list-alltables ;;
list-filter4*)$cmd_internal gui-$second_option list-filter4 ;;
list-filter6*)$cmd_internal gui-$second_option list-filter6 ;;
list-nat4*)$cmd_internal gui-$second_option list-nat4 ;;
list-nat6*)$cmd_internal gui-$second_option list-nat6 ;;
list-mangle4*)$cmd_internal gui-$second_option list-mangle4 ;;
list-mangle6*)$cmd_internal gui-$second_option list-mangle6 ;;
list-raw4*)$cmd_internal gui-$second_option list-raw4 ;;
list-raw6*)$cmd_internal gui-$second_option list-raw6 ;;
list-security4*)$cmd_internal gui-$second_option list-security4 ;;
list-security6*)$cmd_internal gui-$second_option list-security6 ;;
list-ebtables*)$cmd_internal gui-$second_option list-ebtables ;;
list-arptables*)$cmd_internal gui-$second_option list-arptables ;;
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
####
####
then echo $head_waiting_gui ;
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
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option ;;
gui-info-menu*)$cmd_internal gui-$second_option firewall-listnumeral ;;
lsn4*)$cmd_internal gui-$second_option lsn4 ;;
lsn6*)$cmd_internal gui-$second_option lsn6 ;;
listn-alltables*)$cmd_internal gui-$second_option listn-alltables ;;
listn-filter4*)$cmd_internal gui-$second_option listn-filter4 ;;
listn-filter6*)$cmd_internal gui-$second_option listn-filter6 ;;
listn-nat4*)$cmd_internal gui-$second_option listn-nat4 ;;
listn-nat6*)$cmd_internal gui-$second_option listn-nat6 ;;
listn-mangle4*)$cmd_internal gui-$second_option listn-mangle4 ;;
listn-mangle6*)$cmd_internal gui-$second_option listn-mangle6 ;;
listn-raw4*)$cmd_internal gui-$second_option listn-raw4 ;;
listn-raw6*)$cmd_internal gui-$second_option listn-raw6 ;;
listn-security4*)$cmd_internal gui-$second_option listn-security4 ;;
listn-security6*)$cmd_internal gui-$second_option listn-security6 ;;
list-ebtables*)$cmd_internal gui-$second_option list-ebtables ;;
list-arptables*)$cmd_internal gui-$second_option list-arptables ;;
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
####
####
then echo $head_waiting_gui ;
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
load-custom|clone-wallsystem|\
new-full-custom|nueva-completa-custom|\
new-mini-custom|nueva-mini-custom|\
new-tiny-custom|nueva-diminuta-custom|\
names-custom|show-custom|modify-custom|\
del-custom|templates-regen"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option ;;
gui-info-menu*) $cmd_internal gui-$second_option firewall-wallcustom ;;
load-custom*)archivo="$($second_option  --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Launch-Custom \
--entry-text=cfg-to-launch)" ; 
$cmd_internal gui-$second_option load-custom $archivo ;
$cmd_internal gui-$second_option list4 ;;
clone-wallsystem*)archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=Clone-static \
--entry-text=static-firewall-to-clone-config)" ; 
$cmd_internal gui-$second_option clone-wallsystem $archivo ;
$cmd_internal gui-$second_option list4;;
new-full-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_internal -gui-$second_option new-full-custom $archivo ;;
nueva-completa-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" 
$cmd_internal gui-$second_option nueva-completa-custom $archivo ;;
new-mini-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height --entry \
--title=new-mini-custom \
--entry-text=Input_file_ name_ to_ new_ mini_configuration)" ;
$cmd_internal gui-$second_option new-mini-custom $archivo ;;
nueva-mini-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal gui-$second_option nueva-mini-custom $archivo ;;
new-tiny-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height --entry \
--title=new-tiny-custom \
--entry-text=Input_file_ name_ to_ new_ mini_configuration)" ;
$cmd_internal gui-$second_option new-tiny-custom $archivo ;;
nueva-diminuta-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=nueva-diminuta-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal gui-$second_option nueva-diminuta-custom $archivo ;;
names-custom*) $cmd_internal gui-menu-$second_option names-custom ;;
show-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=show-custom \
--entry-text=cfg-to-show)" ;
$cmd_internal gui-$second_option show-custom $archivo ;;
modify-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=modify-custom \
--entry-text=cfg-to-modify)" ;
$cmd_internal gui-$second_option modify-custom $archivo ;;
del-custom*) archivo="$($second_option --entry \
--width=$config_graphicall_width --height=$config_graphicall_height \
--title=del-custom \
--entry-text=cfg-to-delete)";
$cmd_internal gui-$second_option del-custom $archivo ;;
templates-regen*)$cmd_internal gui-$second_option  templates-regen ;;
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
then echo $head_waiting_gui ;
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
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option ;;
gui-info-menu*)$cmd_internal gui-$second_option firewall-wallsystem ;;
client-basic*)$cmd_internal gui-$second_option client-basic ;
$cmd_internal gui-$second_option list4 ;;
client-web*)$cmd_internal gui-$second_option client-web ;
$cmd_internal gui-$second_option list4 ;;
client-ssh*)$cmd_internal gui-$second_option client-ssh ;
$cmd_internal gui-$second_option list4 ;;
client-telnet*)$cmd_internal gui-$second_option client-telnet ;
$cmd_internal gui-$second_option list4 ;;
client-ipp*)$cmd_internal gui-$second_option client-ipp ;
$cmd_internal gui-$second_option list4 ;;
client-irc*)$cmd_internal gui-$second_option client-irc ;
$cmd_internal gui-$second_option list4 ;;
client-mail*)$cmd_internal gui-$second_option client-mail ;
$cmd_internal gui-$second_option list4 ;;
client-news*)$cmd_internal gui-$second_option client-news ;
$cmd_internal gui-$second_option list4 ;;
client-ftp*)$cmd_internal gui-$second_option client-ftp ;
$cmd_internal gui-$second_option list4 ;;
client-git*)$cmd_internal gui-$second_option client-git ;
$cmd_internal gui-$second_option list4 ;;
client-vnc*)$cmd_internal gui-$second_option client-vnc ;
$cmd_internal gui-$second_option list4 ;;
client-torrent*)$cmd_internal gui-$second_option client-torrent ;
$cmd_internal gui-$second_option list4 ;;
client-vpn*)$cmd_internal gui-$second_option client-vpn ;
$cmd_internal gui-$second_option list4 ;;
client-tor*)$cmd_internal gui-$second_option client-tor ;
$cmd_internal gui-$second_option list4 ;;
games-shooter*)$cmd_internal gui-$second_option games-shooter ;
$cmd_internal gui-$second_option list4 ;;
game-wesnoth*)$cmd_internal gui-$second_option game-wesnoth ; 
$cmd_internal gui-$second_option list4 ;;
game-minetest*)$cmd_internal gui-$second_option game-minetest ;
$cmd_internal gui-$second_option list4 ;;
game-freeciv*)$cmd_internal gui-$second_option game-freeciv ;
$cmd_internal gui-$second_option list4;;
game-widelands*)$cmd_internal gui-$second_option game-widelands ;
$cmd_internal gui-$second_option list4 ;;
lan-tor*)$cmd_internal gui-$second_option lan-tor ;
$cmd_internal gui-$second_option list4 ;;
lan-vpn*)$cmd_internal gui-$second_option lan-vpn ;
$cmd_internal gui-$second_option list4 ;;
shield-ssh*)$cmd_internal gui-$second_option shield-ssh ;
 $cmd_internal gui-$second_option list4 ;;
server-ssh*)$cmd_internal gui-$second_option server-ssh ;
$cmd_internal gui-$second_option list4 ;;
server-web*)$cmd_internal gui-$second_option server-web ;
 $cmd_internal gui-$second_option list4 ;;
server-vnc*)$cmd_internal gui-$second_option server-vnc ;
$cmd_internal gui-$second_option list4 ;;
server-samba*)$cmd_internal gui-$second_option server-samba ;
$cmd_internal gui-$second_option list4 ;;
server-news*)$cmd_internal gui-$second_option server-news ;
$cmd_internal gui-$second_option list4 ;;
server-mail*)$cmd_internal gui-$second_option server-mail ;
$cmd_internal gui-$second_option list4 ;;
server-ftp*)$cmd_internal gui-$second_option server-ftp ;
$cmd_internal gui-$second_option list4 ;;
server-print*)$cmd_internal gui-$second_option server-print ;
$cmd_internal gui-$second_option list4 ;;
server-lamp*)$cmd_internal gui-$second_option server-lamp ;
$cmd_internal gui-$second_option list4 ;;
server-teamspeak*)$cmd_internal gui-$second_option server-teamspeak ;
$cmd_internal gui-$second_option list4 ;;
server-mumble*)$cmd_internal gui-$second_option server-mumble ;
$cmd_internal gui-$second_option list4 ;;
server-sql*)$cmd_internal gui-$second_option server-sql ;
$cmd_internal gui-$second_option list4 ;;
server-asterisk*)$cmd_internal gui-$second_option server-asterisk ;
$cmd_internal gui-$second_option list4 ;;
server-domain*)$cmd_internal gui-$second_option server-domain ;
$cmd_internal gui-$second_option list4 ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-wallsystem:
##########    english: gui-menu-firewall-netsystem: gui with menu   ##########
##########    spanish: gui-menu-firewall-netsystem: gui con menu    ##########
#### :rutina-inicial-gui-menu-firewall-netsystem:
####
####
if [ "$first_option" == "gui-menu-firewall-netsystem" ]
then echo $head_waiting_gui ;
if [ "$second_option" == "zenity" ] || [ "$second_option" == "yad" ]; then
echo ; else second_option="$favorite_basename_graphicalldialog" ; echo ; fi
echo "$title_md The used gui in $first_option is $second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-modify|preferences-regen|preferences-example|\
options|clasic-options|info-options|expert|download|intro|\
ip4|ip6|speed-ip4|speed-ip6|notes|treeconf|treecache|cleancache|\
license-lgpl-v2|license-gpl-v2|\
address4|address6|network4|network6||sockets|\
install|upgrade|examples|depends|variables|utils|about"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($second_option \
--width=$config_graphicall_width --height=$config_graphicall_height \
--column=$first_option \
--text=$first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
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
gui-principal-menu*) $cmd_internal gui-menu-$second_option ;;
gui-info-menu*)$cmd_internal gui-$second_option firewall-netsystem ;;
preferences-read*)$cmd_internal gui-$second_option preferences-read ;;
preferences-modify*)$cmd_internal gui-$second_option preferences-modify ;;
preferences-regen*)$cmd_internal gui-$second_option preferences-regen ;;
preferences-example*)$cmd_internal gui-$second_option preferences-example ;;
options*)$cmd_internal gui-$second_option options ;;
clasic-options*)$cmd_internal gui-$second_option clasic-options ;;
info-options*)$cmd_internal gui-$second_option info-options ;;
expert*)$cmd_internal gui-$second_option expert ;;
intro*)$cmd_internal gui-$second_option intro ;;
download*)$cmd_internal gui-$second_option download ;;
ip4*)$cmd_internal gui-$second_option ip4 ;;
ip6*)$cmd_internal gui-$second_option ip6 ;;
speed-ip4*)$cmd_internal gui-$second_option speed-ip4 ;;
speed-ip6*)$cmd_internal gui-$second_option speed-ip6 ;;
sockets*)$cmd_internal gui-$second_option sockets ;;
treeconf*)$cmd_internal gui-$second_option treeconf ;;
treecache*)$cmd_internal gui-$second_option treecache ;;
cleancache*)$cmd_internal gui-$second_option cleancache ;;
examples*)$cmd_internal gui-$second_option examples ;;
depends*)$cmd_internal gui-$second_option depends ;;
install*)$cmd_internal -gui-zenity install ;;
upgrade*)$cmd_internal -gui-zenity upgrade ;;
notes*)$cmd_internal gui-$second_option notes ;;
address4*)$cmd_internal gui-$second_option address4 ;;
address6*)$cmd_internal gui-$second_option address6 ;;
network4*)$cmd_internal gui-$second_option network4 ;;
network6*)$cmd_internal gui-$second_option network6 ;;
license-lgpl-v2*)$cmd_internal gui-$second_option license-lgpl-v2 ;;
license-gpl-v2*)$cmd_internal gui-$second_option license-gpl-v2 ;;
variables*) $cmd_internal gui-$second_option variables ;;
utils*) $cmd_internal gui-$second_option commands ;;
about*) $cmd_internal gui-$second_option about ;;
esac
####
####
exit; fi
####
####
#### :rutina-final-gui-menu-firewall-netsystem:
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
####
####
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
then  $cmd_internal names-custom ; exit; fi
####
####
fi
####
####
#### :rutina-final-load-custom:
##########   english: loadtiny-custom: firewall      ##########
##########   spanish: loadtiny-custom: cortafuegos   ##########
#### :rutina-inicial-loadtiny-custom:
####
####
if [ "$first_option" == "loadtiny-custom" ]
####
####
then echo "$title_md $text_info [ loading firewall wallcustom $second_option ]"
launch_rules_firewall="yes" ;
type_firewall="tinycustom" ;
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
then  $cmd_internal names-custom ; exit; fi
####
####
fi
####
####
#### :rutina-final-loadtiny-custom:
##########   english: tinyserver-tcp: firewall      ##########
##########   spanish: tinyserver-tcp: cortafuegos   ##########
#### :rutina-inicial-tinyserver-tcp:
####
####
if [ "$first_option" == "tinyserver-tcp" ]
####
####
then echo "$title_md $text_info [ loading firewall wallcustom $fist_option ]"
launch_rules_firewall="yes" ;
type_firewall="wallcontrol" ;
name_firewall="tinyserver-tcp" ;
first_option="loadtiny-custom" ;
####
####
server_port_tcp="$2"
server_port_udp=""
####
####
if [ "$third_option" != "$NULL" ] ;
then 
config_ipv4_netserver="$3" 
config_ipv6_netserver="$3"
fi
####
####
if [ "$second_option" != "$NULL" ]; then
echo "$title_md $text_info [ Server with ports tcp $2 for host $3 ]"
echo "$title_md $text_info [ Suggest: list rules with list numeral ]"
else
echo "$text_info Introducction: Put the ports tcp servers"
echo "$text_info Introducction: The tinyserver-udp configured like client for all protocols."
echo "$text_info Example_1: $cmd_internal tinyserver-tcp 20:22,80"
echo "$text_info Example_2: $cmd_internal tinyserver-tcp 20:22,80 12.168.0.0/24"
echo "$text_fail fwiptables $first_option no loaded"
exit ; fi
####
####
fi
####
####
#### :rutina-final-tinyserver-tcp:
##########   english: tinyserver-udp: firewall      ##########
##########   spanish: tinyserver-udp: cortafuegos   ##########
#### :rutina-inicial-tinyserver-udp:
####
####
if [ "$first_option" == "tinyserver-udp" ]
####
####
then echo "$title_md $text_info [ loading firewall wallcustom $fist_option ]"
launch_rules_firewall="yes" ;
type_firewall="wallcontrol" ;
name_firewall="tinyserver-udp" ;
first_option="loadtiny-custom" ;
####
####
server_port_udp="$2"
server_port_tcp=""
####
####
if [ "$third_option" != "$NULL" ] ;
then
config_ipv4_netserver="$3"
config_ipv6_netserver="$3"
fi
####
####
if [ "$second_option" != "$NULL" ]; then
echo "$title_md $text_info [ Server with ports udp $2 for host $3 ]"
echo "$title_md $text_info [ Suggest: list rules with list numeral ]"
else
echo "$text_info Introducction: Put the ports udp servers"
echo "$text_info Introducction: The tinyserver-udp configured like client for all protocols."
echo "$text_info Example_1: $cmd_internal tinyserver-udp 20:22,80"
echo "$text_info Example_2: $cmd_internal tinyserver-udp 20:22,80 192.168.0.0/24"
echo "$text_fail fwiptables $first_option no loaded"
exit; fi
####
####
fi
####
####
#### :rutina-final-tinyserver-udp:
##########   english: miniserver-tcp: firewall      ##########
##########   spanish: miniserver-tcp: cortafuegos   ##########
#### :rutina-inicial-miniserver-tcp:
####
####
if [ "$first_option" == "miniserver-tcp" ]
####
####
then echo "$title_md $text_info [ loading firewall wallcustom $fist_option ]"
launch_rules_firewall="yes" ;
type_firewall="wallcontrol"    ; 
name_firewall="miniserver-tcp" ;
####
####
server_port_tcp="$2" ;
server_port_udp="" ;
client_port_tcp="$miniclient_port_tcp"
client_port_udp="$miniclient_port_udp"
####
####
if [ "$third_option" != "$NULL" ] ;
then config_ipv4_netserver="$3" 
config_ipv6_netserver="$3" ; fi
####
####
if [ "$second_option" != "$NULL" ]; then
echo "$title_md $text_info [ Server with ports tcp $2 for host $3 ]"
echo "$title_md $text_info [ Suggest: list rules with list numeral ]"
else
echo "$text_info Introducction: Put the ports tcp servers"
echo "$text_info Introducction: to client ports: see preferences-modify (miniclient ports)"
echo "$text_info Example_1: $cmd_internal miniserver-tcp 20:22,80"
echo "$text_info Example_2: $cmd_internal miniserver-tcp 20:22,80 192.168.0.0/24"
echo "$text_fail fwiptables $first_option no loaded"
exit ; fi
####
####
fi
####
####
#### :rutina-final-miniserver-tcp:
##########   english: miniserver-udp: firewall      ##########
##########   spanish: miniserver-udp: cortafuegos   ##########
#### :rutina-inicial-miniserver-udp:
####
####
if [ "$first_option" == "miniserver-udp" ]
####
####
then echo "$title_md $text_info [ loading firewall wallcustom $fist_option ]"
launch_rules_firewall="yes" ;
type_firewall="wallcontrol"    ; 
name_firewall="miniserver-udp" ;
####
####
server_port_tcp="" ;
server_port_udp="$2" ;
client_port_tcp="$miniclient_port_tcp"
client_port_udp="$miniclient_port_udp"
####
####
if [ "$third_option" != "$NULL" ] ;
then config_ipv4_netserver="$3" 
config_ipv6_netserver="$3" ; fi
####
####
if [ "$second_option" != "$NULL" ]; then
echo "$title_md $text_info [ Server with ports udp $2 for host $3 ]"
echo "$title_md $text_info [ Suggest: list rules with list numeral ]"
else
echo "$text_info Introducction: Put the ports udp servers"
echo "$text_info Introducction: to client ports: see preferences-modify (miniclient ports)"
echo "$text_info Example_1: $cmd_internal mioniserver-udp 20:22,80"
echo "$text_info Example_2: $cmd_internal mioniserver-udp 20:22,80 192.168.0.0/24"
echo "$text_fail fwiptables $first_option no loaded"
exit ; fi
####
####
fi
####
####
#### :rutina-final-miniserver-udp:
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
echo "$title_md $text_info [ loading firewall wallcontrol without-connection ]" ;
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
####
####
echo "$title_md $text_info [ loading firewall wallcontrol input-permisive ]" ;
launch_rules_firewall="yes" ;
type_firewall="input-permisive" ;
name_firewall="$first_option";
####
####
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
####
####
echo "$title_md $text_info [ loading firewall wallcontrol input-established ]" ;
launch_rules_firewall="yes" ;
type_firewall="input-established" ;
name_firewall="$first_option";
####
####
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
if [ "$launch_rules_firewall" != "yes" ] ; then
####
####
echo "### $text_fail [ Fail Option: $first_option ] [ List Option: options ]"
first_option="options" ; $cmd_internal $first_option ; 
####
####
exit ; fi
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
if [ "$type_firewall" == "input-permisive" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft  $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_ip4tablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4   $command_ip4tablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft  $allow_use_ipv4 $command_ip4tablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A FORWARD \
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
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A FORWARD \
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
$allow_use_legacy $command_ip4tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
$allow_use_legacy $command_ip4tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
if [ "$type_firewall" == "input-established" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft   $allow_use_ipv4 $command_ip4tablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
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
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
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
#### english: allow all output ipv6
#### spanish: permite toda salida ipv6
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$allow_use_legacy $command_ip4tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
$allow_use_legacy $command_ip4tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: legacy ipv4 127.0.0.1 acepta
####
####
$allow_use_legacy $command_ip4tableslegacy -A INPUT  \
-s $config_ip4_localhost -d $config_ip4_localhost   -j ACCEPT \
-m comment --comment host-localhost  &> /dev/null
$allow_use_legacy $command_ip4tableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip4tableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: nft ipv4 127.0.0.1 acepta
####
####
$allow_use_nft $command_ip4tablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip4tablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip4tablesnft -A FORWARD \
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
$allow_use_legacy $command_ip4tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$allow_use_nft $command_ip4tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
###################################################################
###################################################################
####                                                                                            ###############
#### Launching rules . tinycustom                                                               ###############
####                                                                                            ###############
###################################################################
###################################################################
####
####                                                                  ###############
########################################     english: ipv4 iptables tinycustom:
########################################     spanish: ipv4 iptables tinycustom
#### :rutina-inicial-code-tinycustom:
####
####
#### legacy ip4
####
####
if [ "$first_option" == "loadtiny-custom" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### LOCALHOST IS ALLOWED
####
####
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT  \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft   $allow_use_ipv4 $command_ip4tablesnft -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A FORWARD \
-s $config_ip6_localhost -d $config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
####################################### english: THE REST
####################################### spanish: EL RESTO
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_legacy $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
########################################     english: ipv6 iptables input-permisive:
########################################     spanish: ipv6 iptables todo permisivo
####
####
#### english: legacy ipv6 accept related,established
#### spanish: legacy ipv6 acepta relatado,establecido
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A INPUT   \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
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
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$allow_use_legacy $allow_use_ipv6 $command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$allow_use_nft $allow_use_ipv6 $command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$allow_use_legacy $command_ip4tableslegacy \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy \
-A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
-A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
$allow_use_legacy $command_ip4tableslegacy \
-A FORWARD -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft \
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
#### :rutina-final-code-tinycustom:
###################################################################
###################################################################
####                                                                                            
#### sane rules . load-custom                                                                   
####                                                                                            
###################################################################
###################################################################
##############################       english: overwrite system varibles with the config cfg
##############################       spanish: sobreescribe las variables con la config cfg
####
####
if [ "$first_option" == "load-custom" ]
####
####
then if [ -f $default_directory_custom/$second_option ]
then source $default_directory_custom/$second_option &> /dev/null
else echo "$text_md $text_fail [ Config file not found ]"
####
####
exit ; fi ; fi
####
####
##############################      english: selective state of intput/oputut          
##############################      spanish: estado selectivo de entrada/salida        
####
####
if [ "$allow_input_state" != "$NULL" ]  ; then  config_input_state=""  ; fi
if [ "$allow_output_state" != "$NULL" ] ; then  config_output_state="" ; fi 
####
####
if [ "$allow_input_state" == "$NULL" ]
then 
connect_input_state="$config_input_state"
config_input_state="-m state --state $connect_input_state"
fi
####
####
if [ "$allow_output_state" == "$NULL" ]
then 
connect_output_state="$config_output_state"
config_output_state="-m state --state $connect_output_state"
fi
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
then config_uid_gid="" ; fi
if [ "$allow_output_gid" == "$NULL" ]
then config_uid_gid="" ; fi
####
####
###################################################################
###################################################################
####                                                                                            ###############
#### Launching rules . load-custom                                                              ###############
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
$cmd_internal eraserules &> /dev/null
####
####
######################### english: ebtables mac rules
######################### spanish: ebtables mac rules
####
####
if [ "$allow_mac_whitelist" == "$NULL" ] ; then
####
$command_ebtables -A INPUT  -s $config_mac_whitelist -j ACCEPT  &> /dev/null
$command_ebtables -A OUTPUT -d $config_mac_whitelist -j ACCEPT  &> /dev/null
####
fi
####
####
if [ "$allow_mac_blacklist" == "$NULL" ] ; then
####
$command_ebtables -A INPUT  -s ! $config_mac_whitelist -j ACCEPT  &> /dev/null
$command_ebtables -A OUTPUT -d ! $config_mac_whitelist -j ACCEPT  &> /dev/null
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
$allow_use_legacy $command_ip4tableslegacy -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_legacy $command_ip4tableslegacy -A OUTPUT \
-s $config_ip4_localhost -d $config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_nft $command_ip4tablesnft -A INPUT \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip4tablesnft -A OUTPUT -s \
$config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$allow_use_legacy $command_ip4tableslegacy -A FORWARD \
-s $config_ip4_localhost -d $config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$allow_use_nft $command_ip4tablesnft -A FORWARD \
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
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A OUTPUT -d $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_ip4tablesnft \
-A INPUT -s $one_blacklist -j $config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_ip4tablesnft \
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
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_ip4tablesnft \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_ip4tablesnft \
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
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy $command_ip4tableslegacy \
-A  OUTPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $command_ip4tablesnft \
-A  INPUT -m string --string $string_close \
--algo $config_string_algoritmo \
-j $config_close_deny &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  $command_ip4tablesnft \
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
####
$allow_use_ipv4 $allow_use_legacy \
$command_ip4tableslegacy  -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_legacy \
$command_ip4tableslegacy  -A  OUTPUT \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  \
$command_ip4tablesnft     -A  INPUT  \
-m string --string $string_allow \
--algo $config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft  \
$command_ip4tablesnft     -A  OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A INPUT \
-p tcp -m multiport --dports $config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft  $allow_use_ipv4  $command_ip4tablesnft -A INPUT \
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
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $config_shield_maxtries -j $config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_ip4tablesnft -A INPUT \
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
$command_ip4tableslegacy -A  INPUT \
-m hashlimit --hashlimit-above   "$config_input_bandwidth"kb/sec \
--hashlimit-name maxinputlegacy  -j $config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_bandwidth \
$command_ip4tablesnft -A INPUT \
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
$command_ip4tableslegacy -A OUTPUT \
-m hashlimit --hashlimit-above  "$config_output_bandwidth"kb/sec \
--hashlimit-mode dstip --hashlimit-name maxoutputlegacy -j $config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null

####
####
$allow_use_ipv4 $allow_use_nft $allow_output_bandwidth \
$command_ip4tablesnft -A OUTPUT \
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
$command_ip4tableslegacy -A INPUT -m connlimit --connlimit-above \
$config_input_maxconnect   -j $config_close_deny  \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_input_maxconnect \
$command_ip4tablesnft   -A INPUT -m connlimit --connlimit-above \
$config_input_maxconnect       -j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$allow_output_maxconnect" == "$NULL" ]; then
####
$allow_use_ipv4 $allow_use_legacy $allow_output_maxconnect \
$command_ip4tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect \
-j $config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$allow_use_ipv4 $allow_use_nft $allow_output_maxconnect \
$command_ip4tablesnft  -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $client_port_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p udp -m multiport $config_input_state --sports $client_port_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $client_port_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $client_port_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport $config_output_state --dports $one_udp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$allow_use_nft $allow_use_ipv4     $command_ip4tablesnft -A INPUT \
-p udp -m multiport $config_input_state --sports $one_udp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport $config_output_state --dports $one_tcp \
-d $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$allow_use_nft $allow_use_ipv4     $command_ip4tablesnft -A INPUT \
-p tcp -m multiport $config_input_state --sports $one_tcp \
-s $config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$allow_use_nft $allow_use_ipv4     $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_legacy  $allow_use_ipv4  $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_ip4tablesnft    -A INPUT  \
-p tcp  -m multiport --dports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_ip4tablesnft    -A INPUT  \
-p udp  -m multiport --dports $logserver_port_udp \
-j $config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$allow_use_nft     $allow_use_ipv4  $command_ip4tablesnft    -A OUTPUT \
-p tcp -m multiport --sports $logserver_port_tcp \
-j $config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$allow_use_nft     $allow_use_ipv4  $command_ip4tablesnft    -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $server_port_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $server_port_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $server_port_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $server_port_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_legacy  $allow_use_ipv4 $command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $one_udp -s $config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$allow_use_nft $allow_use_ipv4 $command_ip4tablesnft -A OUTPUT \
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
$command_ip4tableslegacy -A INPUT  \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping \
$command_ip4tableslegacy -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp resquest" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $config_uid_gid \
$command_ip4tableslegacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols \
$command_ip4tableslegacy -A INPUT \
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
$command_ip4tableslegacy   -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_legacy  $allow_use_ipv4 $allow_input_ping \
$command_ip4tableslegacy -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_output_uid \
$command_ip4tableslegacy   -A OUTPUT \
-m owner --gid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_legacy  $allow_use_ipv4 $allow_output_gid \
$command_ip4tableslegacy   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_legacy  $allow_use_ipv4 $allow_others_protocols \
$command_ip4tableslegacy -A OUTPUT \
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
$command_ip4tablesnft -A INPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping \
$command_ip4tablesnft -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $config_uid_gid \
$command_ip4tablesnft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols \
$command_ip4tablesnft -A INPUT \
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
$command_ip4tablesnft -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$allow_use_nft $allow_use_ipv4 $allow_input_ping \
$command_ip4tablesnft -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $config_output_uid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_output_uid \
$command_ip4tablesnft   -A OUTPUT \
-m owner --uid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $config_output_gid | $command_sed 's/,/ /g') ;
do $allow_use_nft $allow_use_ipv4 $allow_output_gid \
$command_ip4tablesnft   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $config_others_protocols | $command_sed 's/,/ /g')
do $allow_use_nft $allow_use_ipv4 $allow_others_protocols \
$command_ip4tablesnft -A OUTPUT \
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
$command_ip4tablesnft -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
$allow_use_legacy $allow_use_ipv4 $allow_gateway_ip4 \
$command_ip4tableslegacy -t nat \
-A POSTROUTING -j MASQUERADE -s $config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
####
####
$allow_use_nft $allow_use_ipv4 \
$allow_gateway_ip4 $command_ip4tablesnft -t nat \
-A PREROUTING -j ACCEPT -d $config_gateway_ip4 \
-m comment --comment "ip gateway"  &>/dev/null
$allow_use_legacy $allow_use_ipv4 \
$allow_gateway_ip4 $command_ip4tableslegacy -t nat \
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
$command_ip4tablesnft -t nat \
-A PREROUTING -j DNAT --to-destination $config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
$allow_use_legacy $allow_use_ipv4    $allow_dmz_ip4 \
$command_ip4tableslegacy -t nat \
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
$allow_use_legacy $allow_forward_ip4 $command_ip4tableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter legacy rules forward
$allow_use_legacy $allow_forward_ip6 $command_ip6tableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv4 filter nft rules forward
$allow_use_nft $allow_forward_ip4 $command_ip4tablesnft \
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
$command_ip4tablesnft -t filter -A INPUT   -j $config_system_log \
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
$command_ip4tableslegacy  -t filter -A INPUT  -j $config_system_log \
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
$command_ip4tablesnft -t filter -A OUTPUT  -j $config_system_log \
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
$command_ip4tableslegacy  -t filter -A OUTPUT  -j $config_system_log \
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
$allow_use_legacy $command_ip4tableslegacy -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_legacy $command_ip4tableslegacy -A FORWARD -j $config_close_deny \
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
$allow_use_nft $command_ip4tablesnft -A INPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft -A OUTPUT -j $config_close_deny \
-m comment --comment close-rule &> /dev/null
$allow_use_nft $command_ip4tablesnft -A FORWARD -j $config_close_deny \
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
$command_ip4tablesnft -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -F INPUT  &> /dev/null
####
####
#### english: legacy INPUT deleted
#### spanish: legacy INPUT borradas
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_ip4tableslegacy -t filter -F INPUT  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -F INPUT  &> /dev/null
####
####
#### english: nft INPUT 127.0.0.1 accept
#### spanish: nft INPUT ::1 acepta
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$command_ip4tablesnft -t filter -A INPUT \
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
$command_ip4tableslegacy -t filter -A INPUT \
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
$allow_input_maxconnect  $command_ip4tableslegacy -A INPUT \
-m connlimit --connlimit-above $config_input_maxconnect \
-j $config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$allow_input_maxconnect $command_ip4tablesnft   -A INPUT \
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
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft $command_ip4tablesnft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_nft $command_ip6tablesnft -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_legacy \
$command_ip4tableslegacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
$launch_custom $allow_input_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A INPUT \
$config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
####
####
####
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$launch_custom $allow_input_all $allow_use_ipv4 $allow_use_nft \
$allow_use_ipv4 $command_ip4tablesnft -t filter -A INPUT \
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
$command_ip4tableslegacy -t filter -A INPUT \
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
$allow_use_nft $command_ip4tablesnft -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_nft $command_ip6tablesnft -t filter -F OUTPUT  &> /dev/null
####
####
#### english: legacy OUTPUT deleted
#### spanish: legacy OUTPUT borradas
####
####
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_legacy $command_ip4tableslegacy -t filter -F OUTPUT  &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 \
$allow_use_legacy $command_ip6tableslegacy -t filter -F OUTPUT  &> /dev/null
####
####
#### english: nft OUTPUT 127.0.0.1 accept
#### spanish: nft OUTPUT ::1 acepta
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_nft \
$command_ip4tablesnft -t filter -A OUTPUT \
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
 $command_ip4tableslegacy -t filter -A OUTPUT \
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
$allow_use_legacy $allow_output_maxconnect  $command_ip4tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $config_output_maxconnect  -j $config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv4 \
$allow_use_nft $allow_output_maxconnect $command_ip4tablesnft   -A OUTPUT \
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
$command_ip4tablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_nft \
$command_ip6tablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$launch_custom $allow_output_all $allow_use_ipv4 $allow_use_legacy \
$command_ip4tableslegacy -t filter  -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
$launch_custom $allow_output_all $allow_use_ipv6 $allow_use_legacy \
$command_ip6tableslegacy -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
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
$command_ip4tablesnft -t filter -A OUTPUT  -j $config_close_deny \
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
$command_ip4tableslegacy  -t filter -A OUTPUT  -j $config_close_deny \
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
