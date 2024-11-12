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
echo "### $txt_text_fail [ fwiptables needs root to work ]"
echo "### $txt_text_info [ Try with root user ]" ; echo
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
cmd_notinstalled="$0"                                         # when is not installed
cmd_installed="$cmd_directory/$cmd_filename"                  # when is installed
#### internal cycle command firewall
cmd_internal="$cmd_installed"                                 # choose which internal
if [ -f "$cmd_installed" ]
then cmd_internal="$cmd_installed"
else cmd_internal="$cmd_notinstalled"
fi
#### The number version firewall
cmd_year="24"                                                 # Number year version
cmd_month="11"                                                # Number mouth version
cmd_letter="G-dev"                                            # Number letter version
cmd_version="$cmd_year-$cmd_month-$cmd_letter"                # Final date version
cmd_released="Year 20$cmd_year / Month $cmd_month"            # Source date version
#### The data version firewall
cmd_developer="Francisco Garcia"                              # Actual developer
cmd_contact="fwiptables@gmx.com"                              # Actual contact
cmd_shortdescription="FireWall With iptables"                 # Description short
cmd_longdescription="iptables templates in one script"        # Description long
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
cmd_archive_date="$(date +YEAR-%Y-MONTH-%m)"                  # archive date year_month_
cmd_get_date="$(date +DAY_%Y-%m-%d_HOUR_%H-%M-%S)"            # how format date
cmd_logcmd_date="$cmd_get_date"                               # format pdf date
cmd_usernotes_date="$cmd_get_date"                            # format usernotes date
cmd_cache_date="CACHE_$cmd_get_date-_OPT_"                    # format cache date
cmd_log_date="LOG_$cmd_get_date-_OPT_"                        # format opt date
cmd_pdf_date="PDF_$cmd_get_date-_OPT_"                        # format opt date
cmd_var_date="DEV_$cmd_get_date-_OPT_"                        # format opt var
#### usual options
cmd_zero_dir="$(pwd)"                                         # directory actual
cmd_zero_option="$cmd_internal"                               # default option
#### options variable without "/"  
cmd_command_sed="$($cmd_where sed)"                           # prepare options
cmd_first_option="$(echo $1 | $cmd_command_sed s/\\///g -)"   # first option
cmd_second_option="$(echo $2 | $cmd_command_sed s/\\///g -)"  # second option
cmd_third_option="$(echo $3 | $cmd_command_sed s/\\///g -)"   # third option
cmd_quad_option="$(echo $4 | $cmd_command_sed s/\\///g -)"    # quad option
cmd_list_option="### $cmd_name $1 $2 $3 $4"                   # option label
#### variable without "/", without spaces
cmd_guided_full="$(echo $1-$2-$3-$4 | \
$cmd_command_sed s/\ /\-/g - | $cmd_command_sed s/\\///g -)"  # all options
####
####
##########     english name, description and version    ##########
##########     spanish: nombre, descripcion y version   ##########
#### :rutina-inicial-web-official:
####
####
cmd_web_license_gplv2=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-GPL.txt?format=raw"
cmd_web_license_lgplv2=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/LICENSE-LGPL.txt?format=raw"
cmd_web_homepage_sourceforge=\
"https://sourceforge.net/projects/f-iptables/" ;
cmd_web_homepage_github=\
"https://github.com/fwiptables/fwiptables" ;
cmd_web_hompage_devuan=\
"https://git.devuan.org/fwiptables/fwiptables" ;
cmd_web_download_sourceforge=\
"https://sourceforge.net/projects/f-iptables/files/latest/download" ;
cmd_web_download_github=\
"https://github.com/fwiptables/fwiptables/releases" ;
cmd_web_download_devuan=\
"https://git.devuan.org/fwiptables/fwiptables/releases" ;
cmd_web_gitlist_sourceforge=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/" ;
cmd_web_git_sourceforge=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/iversion.sh?format=raw" ;
cmd_web_download_myradio=\
"https://sourceforge.net/p/f-iptables/code/ci/main/tree/myradio-bash?format=raw" ;
cmd_web_blacklist_fademind=\
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts" ;
cmd_web_blacklist_mvps=\
"http://winhelp2002.mvps.org/hosts.txt" ;
cmd_web_blacklist_adaway=\
"https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt" ;
cmd_web_blacklist_stevenblack=\
"https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ;
####
####
#### :rutina-final-web-official:
##########   english: search programs: programs path           ##########
##########   spanish: busca los programas: ruta de programas   ##########
#### :rutina-inicial-possible-commands:
####
####
cmd_command_arp="$($cmd_where arp)"
cmd_command_arpscan="$($cmd_where arp-scan)"
cmd_command_arptables="$($cmd_where arptables)"
cmd_command_awk="$($cmd_where awk)"
cmd_command_bash="$($cmd_where bash)"
cmd_command_bc="$($cmd_where bc)"
cmd_command_cat="$($cmd_where cat)"
cmd_command_convert="$($cmd_where convert)"
cmd_command_cpufreqinfo="$($cmd_where cpufreq-info)"
cmd_command_cpupower="$($cmd_where cpupower)"
cmd_command_curl="$($cmd_where curl)"
cmd_command_cut="$($cmd_where cut)"
cmd_command_date="$($cmd_where date)"
cmd_command_dd="$($cmd_where dd)"
cmd_command_dhclient="$($cmd_where dhclient)"
cmd_command_dhclientscript="$($cmd_where dhclient-script)"
cmd_command_dhcpcd="$($cmd_where dhcpcd)"
cmd_command_dialog="$($cmd_where dialog)"
cmd_command_dig="$($cmd_where dig)"
cmd_command_dpkg="$($cmd_where dpkg)"
cmd_command_ebtables="$($cmd_where ebtables)"
cmd_command_editor="$($cmd_where editor)"
cmd_command_egrep="$($cmd_where egrep)"
cmd_command_elinks="$($cmd_where elinks)"
cmd_command_file="$($cmd_where file)"
cmd_command_find="$($cmd_where find)"
cmd_command_geoiplookup="$($cmd_where geoiplookup)"
cmd_command_glxgears="$($cmd_where glxgears)"
cmd_command_gpg="$($cmd_where gpg)"
cmd_command_grep="$($cmd_where grep)"
cmd_command_halt="$($cmd_where halt)"
cmd_command_host="$($cmd_where host)"
cmd_command_id="$($cmd_where id)"
cmd_command_ifconfig="$($cmd_where ifconfig)"
cmd_command_init="$($cmd_where init)"
cmd_command_ip="$($cmd_where ip)"
cmd_command_ip4tableslegacy="$($cmd_where iptables-legacy)"
cmd_command_ip4tablesnft="$($cmd_where iptables-nft)"
cmd_command_ip6tableslegacy="$($cmd_where ip6tables-legacy)"
cmd_command_ip6tablesnft="$($cmd_where ip6tables-nft)"
cmd_command_iperf="$($cmd_where iperf)"
cmd_command_iperf3="$($cmd_where iperf3)"
cmd_command_iw="$($cmd_where iw)"
cmd_command_links="$($cmd_where links)"
cmd_command_links2="$($cmd_where links2)"
cmd_command_logname="$($cmd_where logname)"
cmd_command_lpinfo="$($cmd_where lpinfo)"
cmd_command_lpstat="$($cmd_where lpstat)"
cmd_command_ls="$($cmd_where ls) -1 -R"
cmd_command_lsblk="$($cmd_where lsblk)"
cmd_command_lscpu="$($cmd_where lscpu)"
cmd_command_lsgpu="$($cmd_where lsgpu)"
cmd_command_lshw="$($cmd_where lshw)"
cmd_command_lsof="$($cmd_where lsof)"
cmd_command_lspci="$($cmd_where lspci)"
cmd_command_lsusb="$($cmd_where lsusb)"
cmd_command_lynx="$($cmd_where lynx)"
cmd_command_m2r="$($cmd_where m2r)"
cmd_command_md5sum="$($cmd_where md5sum)"
cmd_command_mdp="$($cmd_where mdp)"
cmd_command_mkdir="$($cmd_where mkdir)"
cmd_command_mpg123="$($cmd_where mpg123)"
cmd_command_mpg123="$($cmd_where mpg123)"
cmd_command_mpg321="$($cmd_where mpg321)"
cmd_command_mpg321="$($cmd_where mpg321)"
cmd_command_nano="$($cmd_where nano)"
cmd_command_netstat="$($cmd_where netstat)"
cmd_command_netstatnat="$($cmd_where netstat-nat)"
cmd_command_nmap="$($cmd_where nmap)"
cmd_command_ntpdate="$($cmd_where ntpdate)"
cmd_command_obash="$($cmd_where obash)"
cmd_command_openssl="$($cmd_where openssl)"
cmd_command_pico="$($cmd_where pico)"
cmd_command_ping="$($cmd_where ping)"
cmd_command_poweroff="$($cmd_where poweroff)"
cmd_command_rdate="$($cmd_where rdate)"
cmd_command_readlink="$($cmd_where readlink)"
cmd_command_reboot="$($cmd_where reboot)"
cmd_command_resolveip="$($cmd_where resolveip)"
cmd_command_route="$($cmd_where route)"
cmd_command_sed="$($cmd_where sed)"
cmd_command_shutdown="$($cmd_where shutdown)"
cmd_command_sleep="$($cmd_where sleep)"
cmd_command_sntp="$($cmd_where sntp) -S"
cmd_command_sort="$($cmd_where sort)"
cmd_command_ss="$($cmd_where ss)"
cmd_command_sudo="$($cmd_where sudo)"
cmd_command_sysctl="$($cmd_where sysctl)"
cmd_command_systemctl="$($cmd_where systemctl)"
cmd_command_tar="$($cmd_where tar)"
cmd_command_tcpdump="$($cmd_where tcpdump)"
cmd_command_tee="$($cmd_where tee)"
cmd_command_timeout="$($cmd_where timeout)"
cmd_command_torify="$($cmd_where torify)"
cmd_command_tracepath="$($cmd_where tracepath)"
cmd_command_traceroute="$($cmd_where traceroute)"
cmd_command_tree="$($cmd_where tree)"
cmd_command_txt2html="$($cmd_where txt2html)"
cmd_command_uname="$($cmd_where uname)"
cmd_command_uuid="$($cmd_where uuid)"
cmd_command_vi="$($cmd_where vi)"
cmd_command_vim="$($cmd_where vim)"
cmd_command_vlc="$($cmd_where vlc) -I dummy -d"
cmd_command_w3m="$($cmd_where w3m)"
cmd_command_wget="$($cmd_where wget)"
cmd_command_whiptail="$($cmd_where whiptail)"
cmd_command_wpapassphrase="$($cmd_where wpa_passphrase)"
cmd_command_wpasupplicant="$($cmd_where wpa_supplicant)"
cmd_command_xhost="$($cmd_where xhost)"
cmd_command_xrandr="$($cmd_where xrandr)"
cmd_command_yad="$($cmd_where yad)"
cmd_command_zenity="$($cmd_where zenity)"
cmd_command_zgrep="$($cmd_where zgrep)"
cmd_command_wc="$($cmd_where wc)"
####
####
#### :rutina-final-possible-commands:
##########  english: variables: variables to declare     ##########
##########  spanish: variables: variables para declarar  ##########
#### :rutina-inicial-variables-system:
####
####
####
####
cfg_allow_close_log="no"      
cfg_allow_dmz_ip4="no"    
cfg_allow_dmz_ip6="no"    
cfg_allow_expert_commands=""
cfg_allow_forward_ip4="no"    
cfg_allow_forward_ip6="no"    
cfg_allow_gateway_ip4="no"    
cfg_allow_gateway_ip6="no"    
cfg_allow_input_all="no"    
cfg_allow_input_bandwidth="no"    
cfg_allow_input_maxconnect="no"    
cfg_allow_input_ping="no"     
cfg_allow_input_state="no"    
cfg_allow_launchrules_firewall="no"
cfg_allow_mac_blacklist="no"    
cfg_allow_mac_whitelist="no"    
cfg_allow_net_blacklist="no"    
cfg_allow_net_whitelist="no"     
cfg_allow_others_protocols="no"     
cfg_allow_output_all="no"     
cfg_allow_output_bandwidth="no"     
cfg_allow_output_gid="no"     
cfg_allow_output_maxconnect="no"     
cfg_allow_output_ping="no"     
cfg_allow_output_state="no"     
cfg_allow_output_uid="no"     
cfg_allow_save_logcmd=""          
cfg_allow_separate_rules=""        
cfg_allow_shield_maxtries="no"    
cfg_allow_show_option="no"  
cfg_allow_show_time="no"
cfg_allow_string_allowed="no"   
cfg_allow_string_dropped="no"     
cfg_allow_system_ulog="no"   
cfg_allow_use_ipv4=""                         
cfg_allow_use_ipv6=""                         
cfg_allow_use_legacy=""                       
cfg_allow_use_nft="no"                        
cfg_client_mini_port_tcp="ssh,http,https"     
cfg_client_mini_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     
cfg_client_port_tcp="ssh,http,https"     
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https"     
cfg_config_close_deny="DROP"
cfg_config_dmz_ip4=""     
cfg_config_dmz_ip6=""
cfg_config_uid_gid="no"
cfg_config_gateway_ip4="0/0"    
cfg_config_gateway_ip6="::/0"    
cfg_config_graphicall_height="550"
cfg_config_graphicall_width="750"
cfg_config_input_bandwidth="12512"     
cfg_config_input_maxconnect="72"     
cfg_config_input_state="related,established"     
cfg_config_ip4_localhost="127.0.0.1"    
cfg_config_ip6_localhost="::1"    
cfg_config_ipv4_netclient="0/0"     
cfg_config_ipv4_netserver="0/0"     
cfg_config_ipv6_netclient="::/0"     
cfg_config_ipv6_netserver="::/0"   
cfg_config_listrules_conceptual=""   
cfg_config_mac_blacklist=""     
cfg_config_mac_whitelist=""     
cfg_config_net_blacklist="yandex.com,baidu.com,google.com"     
cfg_config_net_whitelist="deb.debian.org"     
cfg_config_others_protocols="icmp,igmp"     
cfg_config_output_bandwidth="512"     
cfg_config_output_gid="root"     
cfg_config_output_maxconnect="72"     
cfg_config_output_state="related,established"     
cfg_config_output_uid="root"     
cfg_config_shield_maxtries="10"  
cfg_config_shield_maxtries="12"     
cfg_config_shield_port="22"
cfg_config_shield_port="22" 
cfg_config_show_variables="no"
cfg_config_show_time="### date $($cmd_command_date)"
cfg_config_string_algoritmo="kpm"
cfg_config_string_allowed="one-string-that-like-how-a-passord,sourceforge.net"  
cfg_config_string_denied=".fb.com,.facebook.com,xxx.html" 
cfg_config_without_firstoption="options"
cfg_favorite_date_command=""
cfg_favorite_out_cli=""
cfg_favorite_realpath_graphicalldialog=""
cfg_favorite_realpath_textdialog=""
cfg_favorite_text_browser=""
cfg_favorite_text_editor=""        
cfg_server_ipdiscover_ipv4="http://httpbin.org/ip"
cfg_server_ipdiscover_ipv6="http://httpbin.org/ip"
cfg_server_ip_iperf_ipv4="ping.online.net"       
cfg_server_ip_iperf_ipv6="ping6.online.net"      
cfg_server_log_port_tcp="no"     
cfg_server_log_port_udp="no"     
cfg_server_port_iperf_ipv4="5200"                
cfg_server_port_iperf_ipv6="5200"
cfg_server_port_tcp=""     
cfg_server_port_udp=""     
cfg_server_radio_online="https://www.tdtchannels.com/lists/radio.m3u8"
cfg_server_time_waiting="12s"  
####
####
#### :rutina-final-variables-system:
##########  english: variables-header: variables to declare in header      ##########
##########  spanish: variables-header: variables para declarar en cabecera ##########
#### :rutina-inicial-variables-header:
####
####
#### text 
txt_text_md="  "
txt_text_title="### "
txt_text_ok="<  ok  >"
txt_text_info="< info >"
txt_text_fail="< fail >"
txt_text_file="< file >"
txt_text_done="< done >"
txt_text_folder="<folder>"
txt_text_md_md="$txt_text_md $txt_text_md"
txt_text_md_ok="$txt_text_md $txt_text_ok"
txt_text_md_info="$txt_text_md $txt_text_info"
txt_text_md_done="$txt_text_md $txt_text_done"
txt_text_md_folder="$txt_text_md $txt_text_folder"
txt_text_md_file="$txt_text_md $txt_text_file"
txt_text_md_fail="$txt_text_md $txt_text_fail"
txt_text_title_md="$txt_text_title $txt_text_md"
txt_text_title_ok="$txt_text_title $txt_text_ok"
txt_text_title_info="$txt_text_title $txt_text_info"
txt_text_title_fail="$txt_text_title $txt_text_fail"
txt_text_title_file="$txt_text_title $txt_text_file"
txt_text_title_done="$txt_text_title $txt_text_done"
txt_text_title_folder="$txt_text_title $txt_text_folder"
txt_text_ok_md="$txt_text_ok $txt_text_md"
txt_text_title_md="$txt_txt_title $txt_text_md"
txt_text_info_md="$txt_text_info $txt_text_md"
txt_text_fail_md="$txt_text_fail $txt_text_md"
txt_text_file_md="$txt_text_file $txt_text_md"
txt_text_done_md="$txt_text_done $txt_text_md"
txt_text_folder_md="$txt_text_folder $txt_text_md"
#### head 
txt_head_waiting_all=" [ Wait several seconds.. ]  [ press control-c to cancel ] "
txt_head_waiting_txt="$txt_text_title_info [ txt ] $txt_head_waiting_all "
txt_head_waiting_narrow="$txt_text_title_info [ narrow ] $txt_head_waiting_all "
txt_head_waiting_cli="$txt_text_title_info [ cli ] $txt_head_waiting_all "
txt_head_waiting_gui="$txt_text_title_info [ gui ] $txt_head_waiting_all "
txt_head_waiting_log="$txt_text_title_info [ log ] $txt_head_waiting_all "
txt_head_waiting_pdf="$txt_text_title_info [ pdf ] $txt_head_waiting_all "
#### message 
txt_message_without_support="[ Without support for output cli for this option ]"
txt_message_without_narrow="$txt_text_title_fail [ narrow ] $txt_message_without_support"
txt_message_without_txt="$txt_text_title_fail [ txt ] $txt_message_without_support"
txt_message_without_cli="$txt_text_title_fail [ cli ] $txt_message_without_support"
txt_message_without_gui="$txt_text_title_fail [ gui ] $txt_message_without_support"
txt_message_without_info="$txt_text_title_fail [ log ] $txt_message_without_support"
txt_message_without_null="$txt_text_title_fail [ null ] $txt_message_without_support"
txt_message_without_pdf="$txt_text_title_fail [ pdf ] $txt_message_without_support"
txt_message_without_climenu="$txt_text_title_fail [ install or dialog or wiptail]"
txt_message_without_guimenu="$txt_text_title_fail [ install or zenity or yad ]"
txt_message_without_guiroll="$txt_text_title_fail [ install zenity ]"
####
####
#### :rutina-final-variables-header:
##########   english: necesary programs: programs path           ##########
##########   spanish: necesarios programas: ruta de programas    ##########
#### :rutina-inicial-necesary-commands:
####
####
#### system emulate command tree with command ls
if [ "$cmd_command_tree" == "$NULL" ]; then cmd_command_tree="$cmd_command_ls"; fi
####
####
#### system requisite utils
for txt_requisite in $(echo $cmd_requisite_program | sed 's/,/ /g') ; do 
if [ "$($cmd_where $txt_requisite)" == "$NULL" ]; then
echo "### program $txt_requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_program"
exit; fi ; done
####
####
#### system requisite firewall4
for txt_requisite in $(echo $cmd_requisite_firewall4 | sed 's/,/ /g') ; do 
if [ "$($cmd_where $txt_requisite)" == "$NULL" ]; then
echo "### program $txt_requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_firewall4"
exit; fi ; done
####
####
#### system requisite firewall6
for txt_requisite in $(echo $cmd_requisite_firewall6 | sed 's/,/ /g') ; do 
if [ "$($cmd_where $txt_requisite)" == "$NULL" ]; then
echo "### program $txt_requisite is necesary to work $cmd_internal"
echo "### the requiste are $cmd_requisite_firewall6"
exit; fi ; done
####
####
#### :rutina-final-necesary-commands:
##########  english: files:    files and folders from fwiptables          ##########
##########  spanish: archivos: archivos y carpetas desde fwiptables       ##########
#### :rutina-inicial-config-folders:
####
####
#### #### Prepare directory data/cache: $HOME root
####
####
#### $HOME usuall
if [ "$(echo $HOME)" != "$NULL" ] 
then cmd_default_root_home="$(echo $HOME)"  ; fi
####
####
#### if try again with sudo to get $HOME when before null
if [ "$cmd_default_root_home" == "$NULL" ] && \
[ "$cmd_command_sudo" != "$NULL" ] && \
[ "$($cmd_command_sudo echo $HOME)" != "$NULL" ]
then cmd_default_root_home="$(echo $HOME)"  ; fi
####
####
#### $HOME no way, then go to /root
if [ "$cmd_default_root_home" == "$NULL" ]
then cmd_default_root_home="/root"          ; fi
####
####
#### Prepare directory cache: OR run OR /root/.cache/$cmd_filename
####
####
cmd_default_cache_run="/run/$cmd_name"                               ### ununsed
cmd_default_cache_home="$cmd_default_root_home/.cache/$cmd_name"     ### used
####
####
#### #### variables tree and .cache ####
####
####
#### cache 
cmd_default_cache_basenecesary="$cmd_default_cache_home"
cmd_default_cache_necesary="$cmd_default_cache_home/$cmd_archive_date"
####
####
#### config
cmd_default_directory_necesary="$cmd_default_root_home/.config/$cmd_name"
####
####
#### config
cmd_default_directory_template="$cmd_default_directory_necesary/fwiptables-templates"
cmd_default_directory_control="$cmd_default_directory_necesary/fwiptables-control"
cmd_default_directory_custom="$cmd_default_directory_necesary/fwiptables-custom"
cmd_default_directory_preferences="$cmd_default_directory_necesary/fwiptables-preferences"
cmd_default_directory_baselogcmd="$cmd_default_directory_necesary/fwiptables-logcmd"
cmd_default_directory_baselogs="$cmd_default_directory_necesary/fwiptables-log"
cmd_default_directory_basepdf="$cmd_default_directory_necesary/fwiptables-pdf"
cmd_default_directory_var="$cmd_default_directory_necesary/fwiptables-var/$cmd_var_date"
cmd_default_directory_logs="$cmd_default_directory_necesary/fwiptables-log/$cmd_log_date"
cmd_default_directory_pdf="$cmd_default_directory_necesary/fwiptables-pdf/$cmd_pdf_date"
cmd_default_directory_logcmd="$cmd_default_directory_necesary/fwiptables-logcmd/$cmd_logcmd_date"
cmd_default_directory_wpa="$cmd_default_directory_necesary/fwiptables-wpa"
cmd_default_directory_benchmarkram="$cmd_default_directory_necesary/fwiptables-benchmarkram"
cmd_default_directory_benchmarkdisk="$cmd_default_directory_necesary/fwiptables-benchmarkdisk"
cmd_default_directory_radio="$cmd_default_directory_necesary/fwiptables-radio"
cmd_default_directory_proxy="$cmd_default_directory_necesary/fwiptables-proxy"
cmd_default_directory_adblock="$cmd_default_directory_necesary/fwiptables-adblock"
cmd_default_directory_obash="$cmd_default_directory_necesary/fwiptables-obash"
cmd_default_directory_debian="$cmd_default_directory_necesary/fwiptables-debian"
cmd_default_directory_readme="$cmd_default_directory_necesary/fwiptables-readme"
####
####
#### :rutina-final-config-folders:
##########   english: if sane config directory                       ##########
##########   spanish: comprobar sanos directorios de configuracion   ##########
#### :rutina-inicial-sane-folders:
####
####
#### sane cache root
####
####
if [ ! -d "$cmd_default_cache_necesary" ]; then
$cmd_command_mkdir -p $cmd_default_cache_necesary &> /dev/null ; fi
####
####
#### sane data root
####
####
if [ ! -d "$default_cmd_default_directory_necesary" ]; then
$cmd_command_mkdir -p $default_cmd_default_directory_necesary &> /dev/null ; fi
####
####
#### sane default log
####
####
if [ ! -f "$cmd_file_default_logcmd" ]
then touch $cmd_file_default_logcmd &> /dev/null  ; fi
####
####
#### sane data tree
####
####
if [ ! -d "$cmd_default_directory_control" ]; then 
$cmd_command_mkdir -p "$cmd_default_directory_control" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_template" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_template" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_custom" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_custom" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_preferences" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_preferences" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_logcmd" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_logcmd" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_logs" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_logs" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_wpa" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_wpa" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_pdf" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_pdf" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_var" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_var" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_benchmarkram" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_benchmarkram" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_benchmarkdisk" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_benchmarkdisk" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_radio" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_radio" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_proxy" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_proxy" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_adblock" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_adblock" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_obash" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_obash" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_debian" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_debian" &> /dev/null ; fi
if [ ! -d "$cmd_default_directory_readme" ]; then
$cmd_command_mkdir -p "$cmd_default_directory_readme" &> /dev/null ; fi
####
####
#### :rutina-final-sane-folders:
##########   english: if sane config directory                       ##########
##########   spanish: comprobar sanos directorios de configuracion   ##########
#### :rutina-inicial-configs-files:
####
####
#### config templates cfg
cmd_default_tinycfg_eng=\
"$cmd_default_directory_template/default-tiny-english.cfg"
cmd_default_tinycfg_spa=\
"$cmd_default_directory_template/default-tiny-spanish.cfg"
cmd_default_minicfg_eng=\
"$cmd_default_directory_template/default-mini-english.cfg"
cmd_default_minicfg_spa=\
"$cmd_default_directory_template/default-mini-spanish.cfg"
cmd_default_fullcfg_eng=\
"$cmd_default_directory_template/default-full-english.cfg"
cmd_default_fullcfg_spa=\
"$cmd_default_directory_template/default-full-spanish.cfg"
####
####
#### config files default
cmd_file_default_preferences=\
"$cmd_default_directory_preferences/default-preferences-$cmd_version.conf"
cmd_file_default_alias=\
"$cmd_default_directory_preferences/default-alias-$cmd_version.conf"
cmd_file_default_logcmd=\
"$cmd_default_directory_logcmd/default-logcmd-$cmd_version-$cmd_archive_date.log"
cmd_file_default_usernotes=\
"$cmd_default_directory_preferences/default-usernotes-all-versions.txt"
####
#### config output files
cmd_file_output_pdf=\
"$cmd_default_directory_pdf/$cmd_pdf_date-$cmd_guided_full.pdf"
cmd_file_output_log=\
"$cmd_default_directory_logs/$cmd_log_date-$cmd_guided_full.log"
cmd_file_output_cache=\
"$cmd_default_cache_necesary/$cmd_cache_date-$cmd_guided_full.txt"
cmd_file_output_var=\
"$cmd_default_directory_var/$cmd_var_date-$cmd_guided_full.txt"
####
####
#### config file adblock
cmd_file_blacklist_fademind=\
"$cmd_default_directory_adblock/hosts.blacklist_fademind.txt"
cmd_file_blacklist_mvps=\
"$cmd_default_directory_adblock/hosts.blacklist_mvps.txt"
cmd_file_blacklist_adaway=\
"$cmd_default_directory_adblock/hosts.blacklist_adaway.txt"
cmd_file_blacklist_stevenblack=\
"$cmd_default_directory_adblock/hosts.blacklist_stevenblack.txt"
####
####
#### :rutina-final-config-files:
##########   english: profile y support X11 for root       ##########
##########   spanish: profile y soporte de X11 for root    ##########
#### :rutina-inicial-xhost:
####
####
#### allow root launch gui graphical in X11 with xhost
####
####
if [ "$(logname)" != "$NULL" ] && [ "$(id -u)" == 0 ]; then
####
####
if [ "$cmd_command_sudo" != "$NULL" ]; then
$cmd_command_sudo -u "$(logname)" $cmd_command_xhost +SI:localuser:root &> /dev/null
else $cmd_command_sudo -u 0 $cmd_command_xhost +SI:localuser:root &> /dev/null
fi
####
####
fi
####
####
#### :rutina-final-xhost:
##########                english: Update variables             ##########
##########                spanish: Actualiza variables          ##########
#### :rutina-inicial-variables-updated:
####
####
#### load preferences
if [ ! -f "$cmd_file_default_preferences" ]; then touch $cmd_file_default_preferences ; fi
if [ -f "$cmd_file_default_preferences" ]; then source $cmd_file_default_preferences ; fi
####
####
#### prepare alias
if [ ! -f "$cmd_file_default_alias" ]; then touch $cmd_file_default_alias ; fi
cfg_option_with_alias="$($cmd_command_cat $cmd_file_default_alias \
| $cmd_command_grep ^#$cmd_first_option= | cut -c 2- -)"
cfg_option_alias_origen="$(echo  $cfg_option_with_alias | $cmd_command_cut -d "=" -f 1 -)"
cfg_option_alias_destino="$(echo $cfg_option_with_alias | $cmd_command_cut -d "=" -f 2 -)"
####
####
#### load alias
if [ "$cfg_option_with_alias" != "$NULL" ] && [ "$cfg_option_alias_origen" != "$cfg_option_alias_destino" ]
then echo "### < alias > from $cfg_option_alias_origen to $cfg_option_alias_destino"
$cmd_internal $cfg_option_alias_destino $2 $3 $4
exit; fi 
####
####
#### configure without option
if [ "$cfg_config_without_firstoption" = "$NULL" ] ; then cfg_config_without_firstoption="options" ; fi
####
####
#### Without first option and it is options
if [ "$cmd_first_option" = "$NULL" ] && [ "$cfg_config_without_firstoption" == "options" ]; then
cmd_first_option="$cfg_config_without_firstoption" ; fi
####
####
#### Without first option and it is not options show one message
if [ "$cmd_first_option" = "$NULL" ] && [ "$cfg_config_without_firstoption" != "options" ]; then
echo "### $txt_text_info [ Default Option: $cfg_config_without_firstoption ] [ List Options: options ]"
cmd_first_option="$cfg_config_without_firstoption" ; fi
####
####
#### label option
#### if [ "$cfg_allow_show_option" == "" ] ; then echo "$cmd_list_option" ; fi
echo "$cmd_list_option"
####
####
#### label time
if [ "$cfg_allow_show_time" == "" ] ; then echo "$cfg_config_show_time" ; fi
####
####
#### configure expert
if [ "$cfg_allow_expert_commands" == "no" ]; then
case "$cmd_first_option" in 
exper*) echo "$txt_text_title See in preferences allow_expert_commands to active it option"
exit ;; esac
case "$cmd_second_option" in
exper*) echo "$txt_text_title See in preferences allow_expert_commands to active it option"
exit ;; esac ; fi
####
####
#### :rutina-final-variables-updated:
##########      english: search favorite iperf: favorite iperf command        ##########
##########      spanish: busca preferida fecha: favorita comando de iperf     ##########
#### :rutina-inicial-favorite-iperf:
####
####
#### choose iperf3 and the iperf to speed ip
if [ "$cfg_favorite_iperf_command" == "$NULL" ]; then
####
####
if [ "$cmd_command_iperf3"    != "$NULL" ]; then
cfg_favorite_iperf_command="$cmd_command_iperf3" ; fi
if [ "$cmd_command_iperf"   != "$NULL" ]; then
cfg_favorite_iperf_command="$cmd_command_iperf" ; fi
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
if [ "$cfg_favorite_date_command" == "$NULL" ]; then
####
####
if [ "$cmd_command_rdate"   != "$NULL" ]; then
cfg_favorite_date_command="$cmd_command_rdate -4 -a -n"  ; fi
if [ "$cmd_command_sntp"    != "$NULL" ]; then
cfg_favorite_date_command="$cmd_command_sntp"            ; fi
if [ "$cmd_command_ntpdate" != "$NULL" ]; then
cfg_favorite_date_command="$cmd_command_ntpdate"         ; fi
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
if [ "$cfg_favorite_text_editor" == "$NULL" ]; then
####
####
if [ "$cmd_command_vi"  != "$NULL" ]  ; then    
cfg_favorite_text_editor="$cmd_command_vi"      ; fi
if [ "$cmd_command_vim"  != "$NULL" ]  ; then   
cfg_favorite_text_editor="$cmd_command_vim"     ; fi
if [ "$cmd_command_pico" != "$NULL" ] ; then  
cfg_favorite_text_editor="$cmd_command_pico"    ; fi
if [ "$cmd_command_editor" != "$NULL" ] ; then  
cfg_favorite_text_editor="$cmd_command_editor"  ; fi
if [ "$cmd_command_nano"  != "$NULL" ] ; then   
cfg_favorite_text_editor="$cmd_command_nano"    ; fi
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
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
####
####
if [ "$cmd_command_dialog"  != "$NULL" ]  ; then  
cfg_favorite_realpath_textdialog="$cmd_command_dialog"
cfg_favorite_basename_textdialog="$(basename $cmd_command_dialog)"
fi
####
####
if [ "$cmd_command_whiptail" != "$NULL" ] ; then  
cfg_favorite_realpath_textdialog="$cmd_command_whiptail"
cfg_favorite_basename_textdialog="$(basename $cmd_command_whiptail)"
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
if [ "$cfg_favorite_realpath_graphicalldialog" == "$NULL" ]; then
####
####
if [ "$cmd_command_zenity"  != "$NULL" ] ; then  
cfg_favorite_realpath_graphicalldialog="$cmd_command_zenity"
cfg_favorite_basename_graphicalldialog="$(basename $cmd_command_zenity)"
fi
####
####
if [ "$cmd_command_yad"     != "$NULL" ] ; then  
cfg_favorite_realpath_graphicalldialog="$cmd_command_yad"
cfg_favorite_basename_graphicalldialog="$(basename $cmd_command_yad)"
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
if [ "$cfg_favorite_text_browser" == "$NULL" ]; then
####
####
if [ "$cmd_command_lynx"   != "$NULL" ] ; then  
cfg_favorite_text_browser="$cmd_command_lynx"    ; fi
if [ "$cmd_command_links"  != "$NULL" ] ; then  
cfg_favorite_text_browser="$cmd_command_links"   ; fi
if [ "$cmd_command_links2" != "$NULL" ] ; then  
cfg_favorite_text_browser="$cmd_command_links2"  ; fi
if [ "$cmd_command_elinks" != "$NULL" ] ; then  
cfg_favorite_text_browser="$cmd_command_elinks"  ; fi
if [ "$cmd_command_w3m" != "$NULL" ] ; then  
cfg_favorite_text_browser="$cmd_command_w3m"  ; fi
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
if [ "$cfg_favorite_dhcp_command" == "$NULL" ]; then
####
####
if [ "$cmd_command_dhcpcd"  != "$NULL" ]         ; then
cfg_favorite_dhcp_command="$cmd_command_dhcpcd"           ; fi
if [ "$cmd_command_dhclientscript" != "$NULL" ] ; then  
cfg_favorite_dhcp_command="$cmd_command_dhclientscript"  ; fi
if [ "$cmd_command_dhclient"   != "$NULL" ] ;      then  
cfg_favorite_dhcp_command="$cmd_command_dhclient"         ; fi
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
if [ "$cfg_favorite_date_command" == "$NULL" ]; then
####
####
if [ "$cmd_command_rdate"   != "$NULL" ]; then  
cfg_favorite_date_command="$cmd_command_rdate -4 -a -n"  ; fi
if [ "$cmd_command_sntp"    != "$NULL" ]; then  
cfg_favorite_date_command="$cmd_command_sntp"            ; fi
if [ "$cmd_command_ntpdate" != "$NULL" ]; then  
cfg_favorite_date_command="$cmd_command_ntpdate"         ; fi
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
if [ "$cfg_favorite_text_music" == "$NULL" ]; then
####
####
if [ "$cmd_command_vlc" != "$NULL" ]; then  
cfg_favorite_text_music="$cmd_command_vlc"      ; fi
####
####
fi
####
####
#### :rutina-final-favorite-music:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-system-list:
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
case "$cmd_first_option" in
list-*) cfg_config_listrules_conceptual="" ;;
listn-filter4) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-filter4" ;;
listn-filter6) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-filter6" ;;
listn-nat4)  cfg_config_listrules_conceptual="no" ; cmd_first_option="list-nat4" ;;
listn-nat6)  cfg_config_listrules_conceptual="no" ; cmd_first_option="list-nat6" ;;
listn-raw4)  cfg_config_listrules_conceptual="no" ; cmd_first_option="list-raw4" ;;
listn-raw6)  cfg_config_listrules_conceptual="no" ; cmd_first_option="list-raw6" ;;
listn-security4) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-security4" ;;
listn-security6) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-security6" ;;
listn-mangle4) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-mangle4" ;;
listn-mangle6) cfg_config_listrules_conceptual="no" ; cmd_first_option="list-mangle6" ;;
esac
####
####
case "$cfg_config_listrules_conceptual" in
"$NULL") cfg_config_listrules_conceptual="" ;;
*) cfg_config_listrules_conceptual=" -n"  ;; esac
####
####
#### :rutina-final-alias-system-list:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-system-output:
####
####
#### english:  alias alias simple for output gui, -txt or -cli or -gui and more
####
####
case "$cmd_first_option" in
"tui-menu") cmd_first_option="cli-menu" ;;
"-tui-menu") cmd_first_option="cli-menu" ;;
"--tui-menu") cmd_first_option="cli-menu" ;;
"-cli-menu") cmd_first_option="cli-menu" ;;
"--cli-menu") cmd_first_option="cli-menu" ;;
"-gui-menu") cmd_first_option="gui-menu" ;;
"--gui-menu") cmd_first_option="gui-menu" ;;
"gui-roll") cmd_first_option="gui-roll-zenity" ;;
"-gui-roll") cmd_first_option="gui-roll-zenity" ;;
"--gui-roll") cmd_first_option="gui-roll-zenity" ;;
"gui-rock") cmd_first_option="gui-roll-zenity" ;;
"-gui-rock") cmd_first_option="gui-roll-zenity" ;;
"--gui-rock") cmd_first_option="gui-roll-zenity" ;;
esac
####
####
case "$cmd_first_option" in
"-info") cmd_first_option="info" ;;
"--info") cmd_first_option="info" ;;
"--narrowtxt") cmd_first_option="narrowtxt" ;;
"-narrowtxt") cmd_first_option="narrowtxt" ;;
"--text") cmd_first_option="txt" ;;
"-text") cmd_first_option="txt" ;;
"--tui") cmd_first_option="cli" ;;
"-tui") cmd_first_option="cli" ;;
"--txt") cmd_first_option="txt" ;;
"-txt") cmd_first_option="txt" ;;
"--cli") cmd_first_option="cli" ;;
"-cli") cmd_first_option="cli" ;;
"--gui") cmd_first_option="gui" ;;
"-gui") cmd_first_option="gui" ;;
"silent") cmd_first_option="silent" ;;
"-silent") cmd_first_option="silent" ;;
"--silent") cmd_first_option="silent" ;;
"-pdf") cmd_first_option="pdf" ;;
"--pdf") cmd_first_option="pdf" ;;
"-dev") cmd_first_option="dev" ;;
"--dev") cmd_first_option="dev" ;;
"i") cmd_first_option="info" ;;
"n") cmd_first_option="narrowtxt" ;;
"t") cmd_first_option="txt" ;;
"c") cmd_first_option="cli" ;;
"g") cmd_first_option="gui" ;;
"l") cmd_first_option="log" ;;
"s") cmd_first_option="silent" ;;
"p") cmd_first_option="pdf" ;;
"d") cmd_first_option="dev" ;;
"-i") cmd_first_option="info" ;;
"-n") cmd_first_option="narrowtxt" ;;
"-t") cmd_first_option="txt" ;;
"-c") cmd_first_option="cli" ;;
"-g") cmd_first_option="gui" ;;
"-l") cmd_first_option="log" ;;
"-s") cmd_first_option="silent" ;;
"-p") cmd_first_option="pdf" ;;
"-d") cmd_first_option="dev" ;;
esac
####
####
case "$cmd_first_option" in
"-gui-menu-zenity") cmd_first_option="gui-menu-zenity" ;;
"--gui-menu-zenity") cmd_first_option="gui-menu-zenity" ;;
"-gui-menu-yad") cmd_first_option="gui-menu-yad" ;;
"--gui-menu-yad") cmd_first_option="gui-menu-yad" ;;
"-gui-roll-zenity") cmd_first_option="gui-roll-zenity" ;;
"--gui-roll-zenity") cmd_first_option="gui-roll-zenity" ;;
"-gui-roll-yad") cmd_first_option="gui-roll-yad" ;;
"--gui-roll-yad") cmd_first_option="gui-roll-yad" ;;
"-gui-shell-zenity") cmd_first_option="gui-shell-zenity" ;;
"--gui-shell-zenity") cmd_first_option="gui-shell-zenity" ;;
"-gui-shell-yad") cmd_first_option="gui-shell-yad" ;;
"--gui-shell-yad") cmd_first_option="gui-shell-yad" ;;
"--cli-dialog") cmd_first_option="cli-dialog" ;;
"-cli-dialog") cmd_first_option="cli-dialog" ;;
"--cli-whiptail") cmd_first_option="cli-whiptail" ;;
"-cli-whiptail") cmd_first_option="cli-whiptail" ;;
"--gui-zenity") cmd_first_option="gui-zenity" ;;
"-gui-zenity") cmd_first_option="gui-zenity" ;;
"--gui-yad") cmd_first_option="gui-yad" ;;
"-gui-yad") cmd_first_option="gui-yad" ;;
esac
####
####
#### :rutina-final-alias-system-output:
##########    english: ALIAS  simple y firewall y campus       ##########
##########    spanish: ALIAS  simple y cortafuegos y campo     ##########
#### :rutina-inicial-alias-system-interface:
####
####
case "$cmd_first_option" in
"cli")
cfg_favorite_basename_textdialog="$(basename $cfg_favorite_realpath_textdialog)" ;
cmd_first_option="cli"
;;
"gui")
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui"
;;
"cli-menu")
cfg_favorite_basename_textdialog="$(basename $cfg_favorite_realpath_textdialog)" ;
cmd_first_option="cli-menu"
;;
"cli-menu-dialog")
cfg_favorite_realpath_textdialog="$cmd_command_dialog" ; 
cfg_favorite_basename_textdialog="$(basename $cmd_command_dialog)" ;
cmd_first_option="cli-menu"
;;
"cli-menu-whiptail")
cfg_favorite_realpath_textdialog="$cmd_command_whiptail" ; 
cfg_favorite_basename_textdialog="$(basename $cmd_command_whiptail)" ;
cmd_first_option="cli-menu"
;;
"cli-menu-compact-dialog")
cfg_favorite_realpath_textdialog="$cmd_command_dialog" ; 
cfg_favorite_basename_textdialog="$(basename $cmd_command_dialog)" ;
cmd_first_option="cli-menu-compact"
;;
"cli-menu-compact-whiptail")
cfg_favorite_realpath_textdialog="$cmd_command_whiptail" ; 
cfg_favorite_basename_textdialog="$(basename $cmd_command_whiptail)" ;
cmd_first_option="cli-menu-compact"
;;
"cli-dialog")
cfg_favorite_realpath_textdialog="$cmd_command_dialog" ; 
cfg_favorite_basename_textdialog="$(basename $cfg_favorite_realpath_textdialog)" ;
cmd_first_option="cli"
;;
"cli-whiptail")
cfg_favorite_realpath_textdialog="$cmd_command_whiptail" ;
cfg_favorite_basename_textdialog="$(basename $cfg_favorite_realpath_textdialog)" ; 
cmd_first_option="cli"
;;
"gui-menu")
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-menu" 
cmd_second_option="$cfg_favorite_basename_graphicalldialog"
;;
"gui-shell")
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-shell-$cfg_favorite_basename_graphicalldialog"
;;
"gui-zenity")
cfg_favorite_realpath_graphicalldialog="$cmd_command_zenity" ; 
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ; 
cmd_first_option="gui"
;;
"gui-yad")
cfg_favorite_realpath_graphicalldialog="$cmd_command_yad" ; 
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ; 
cmd_first_option="gui"
;;
"gui-menu-zenity")
cfg_favorite_realpath_graphicalldialog="$cmd_command_zenity" ;
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-menu" 
cmd_second_option="$cfg_favorite_basename_graphicalldialog"
;;
"gui-menu-yad")
cfg_favorite_realpath_graphicalldialog="$cmd_command_yad" ; 
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-menu"
cmd_second_option="$cfg_favorite_basename_graphicalldialog"
;;
"gui-roll")
cfg_favorite_realpath_graphicalldialog="$cmd_command_zenity" ;
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-roll" 
cmd_second_option="$cfg_favorite_basename_graphicalldialog"
;;
"gui-roll-zenity")
cfg_favorite_realpath_graphicalldialog="$cmd_command_zenity" ;
cfg_favorite_basename_graphicalldialog="$(basename $cfg_favorite_realpath_graphicalldialog)" ;
cmd_first_option="gui-roll-zenity" 
cmd_second_option="$cfg_favorite_basename_graphicalldialog"
;;
####
####
esac
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
####
####
#### :rutina-final-alias-system-interface:
##########    ALIAS CONFIG
##########    ALIAS CONFIG
#### :rutina-inicial-drop-warning:
####
####
#### supress error messages
case $cmd_first_option in 
"ls4") $cmd_internal list4   &> $cmd_file_output_cache
$cmd_command_cat $cmd_file_output_cache | $cmd_command_grep -E -v Warning: ; exit ;;
"ls6") $cmd_internal list6   &> $cmd_file_output_cache
$cmd_command_cat $cmd_file_output_cache | $cmd_command_grep -E -v Warning: ; exit ;;
"lsn4") $cmd_internal listn4 &> $cmd_file_output_cache
$cmd_command_cat $cmd_file_output_cache | $cmd_command_grep -E -v Warning: ; exit ;;
"lsn6") $cmd_internal listn6 &> $cmd_file_output_cache
$cmd_command_cat $cmd_file_output_cache | $cmd_command_grep -E -v Warning: ; exit ;;
esac ; 
####
####
#### :rutina-final-drop-warning:
##########    ALIAS ESQUIVE CONFIG
##########    ALIAS ESQUIVE CONFIG
#### :rutina-inicial-alias-esquive:
####
####
#### english:  alias esquive templates
####
####
case "$cmd_first_option" in
"wizard-full"|"wizard-mini"|"new-mini-custom"|"wizard-tiny"|\
"new-full-custom"|"new-tiny-custom"|"new-mini-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom") 
$cmd_internal templates-regen &> /dev/null ;; esac
####
####
case "$cmd_second_option" in
"wizard-full"|"wizard-mini"|"new-mini-custom"|"wizard-tiny"|\
"new-full-custom"|"new-tiny-custom"|"new-mini-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom") 
$cmd_internal templates-regen &> /dev/null ;; esac
####
####
if [ "$cmd_first_option" == "txt" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom") $cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option ;
exit ;; esac ; fi
####
####
if [ "$cmd_first_option" == "narrowtxt" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom") $cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option ;
exit ;; esac ; fi
####
####
if [ "$cmd_first_option" == "cli" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom") $cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option ;
exit ;; esac ; fi
####
####
if [ "$cmd_first_option" == "gui" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional-output." ; exit ;;
esac ; fi
####
####
if [ "$cmd_first_option" == "log" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom")
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in log optional-output." ;
exit ;; esac ; fi
####
####
if [ "$cmd_first_option" == "pdf" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom") 
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in pdf optional-output." ;
exit ;; esac ; fi
####
####
if [ "$cmd_first_option" == "silent" ]; then 
case "$cmd_second_option" in
expert-*) echo "the commands expert works only wihtout optional output." ; exit ;;
"$NULL"|"wizard-full"|"wizard-mini"|"new-mini-custom"|"new-full-custom"|\
"wizard-tiny"|"new-tiny-custom"|"nueva-diminuta-custom"|\
"nueva-mini-custom"|"nueva-completa-custom"|"preferences-edit"|"alias-edit"|\
"modify-custom")
echo "the commands NULL|new*|nueva*|modify*|wizard* works does not work in silent optional-output." ;
exit ;; esac ; fi
####
####
#### :rutina-final-alias-esquive:
##########    ALIAS CONFIG NARROW
##########    ALIAS CONFIG NARROW
#### :rutina-inicial-alias-narrowtxt:
####
####
#### output narrow:      General text without warnings version list narrow
####
####
if [ "$cmd_first_option" == "narrowtxt" ] ;then echo "$txt_head_waiting_narrow"
####
####
case $cmd_second_option in 
ls*|list*) $cmd_internal $cmd_second_option | \
$cmd_command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' | \
$cmd_command_grep -E -v Warning: 
exit ;;
*) $cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option | \
$cmd_command_awk '{ print $1 " " $2 " " $3 " " $4 " " \
$5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " \
$13 " " $14 " " $15 " " $16 " " $17 " " $18 \
" " $19 " " $20 " " $21 " " $22 " " $23 " " $24 }' | \
$cmd_command_grep -E -v Warning: 
exit ;;
esac
####
####
exit ; fi
####
####
#### :rutina-final-alias-narrowtxt:
##########    ALIAS CONFIG TXT
##########    ALIAS CONFIG TXT
#### :rutina-inicial-alias-txt:
####
####
#### output txt:      General text without warnings version list normal
####
####
if [ "$cmd_first_option" == "txt" ]; then echo "$txt_head_waiting_txt"
####
####
case $cmd_second_option in 
####
####
ls*|list*) $cmd_internal $cmd_second_option $cmd_third_option | \
$cmd_command_grep -E -v Warning: ; exit ;;
*) $cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option ;
exit ;; 
####
####
esac ; fi
####
####
#### :rutina-final-alias-text:
##########    ALIAS CONFIG CLI
##########    ALIAS CONFIG CLI
#### :rutina-inicial-alias-cli:
####
####
#### output cli:
####
####
if [ "$cmd_first_option" == "cli" ] ; then echo "$txt_head_waiting_cli"
####
####
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then 
echo "$txt_text_md $txt_text_info Please install or dialog or whiptail to work with cli"
exit; fi
####
####
#### --clear --notags
case $cmd_second_option in 
ls*|list*) $cfg_favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_internal txt $cmd_second_option)" 0 0 ; exit ;;
*) $cfg_favorite_basename_textdialog --clear --notags \
--title "Cli Menu With $cmd_version" \
--msgbox "$($cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option)" 0 0 ; exit ;;
esac ; fi
####
####
#### :rutina-final-alias-cli:
##########    ALIAS CONFIG LOG
##########    ALIAS CONFIG LOG
#### :rutina-inicial-alias-log:
####
####
#### output log
####
####
if [ "$cmd_first_option" == "log" ]
####
####
then echo "$txt_head_waiting_log"
$cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option &> $cmd_file_output_log
echo "$txt_text_title_file [$cmd_file_output_log]"
####
####
exit ; fi
####
####
#### :rutina-final-alias-log:
##########    ALIAS CONFIG PDF
##########    ALIAS CONFIG PDF
#### :rutina-inicial-alias-pdf:
####
####
if [ "$cmd_first_option" == "pdf" ]
####
####
then case $cmd_command_convert in "$NULL") 
echo "$txt_text_title install imagemagick to print pdf to $cmd_default_directory_pdf" ; exit ;; esac
#### allow print to PDF policy
echo "$txt_head_waiting_pdf"
sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-*/policy.xml &> /dev/null
#### send print to home output fwiptables.pdf
$cmd_internal $cmd_second_option $cmd_third_option $cmd_quad_option | \
$cmd_command_convert -page A3 text:- $cmd_file_output_pdf
echo "$txt_text_title_file [$cmd_file_output_pdf]"
####
####
exit ; fi
####
####
#### :rutina-final-alias-pdf:
##########    ALIAS CONFIG SILENT
##########    ALIAS CONFIG SILENT
#### :rutina-inicial-alias-silent:
####
####
if [ "$cmd_first_option" == "silent" ]
####
####
then $cmd_internal "$cmd_second_option" "$cmd_third_option" "$cmd_quad_option" &> /dev/null
####
####
exit ; fi
####
####
#### :rutina-final-alias-silent:
##########    ALIAS CONFIG DEV
##########    ALIAS CONFIG DEV
#### :rutina-inicial-alias-dev:
####
####
if [ "$cmd_first_option" == "dev" ]; then
####
####
cfg_config_show_variables="yes"
cmd_first_option="$cmd_second_option"
cmd_second_option="$cmd_third_option"
cmd_quad_option="$cmd_quad_option"
####
####
fi
####
####
#### :rutina-final-alias-silent:
##########     english: allow-logcmd:       ##########
##########     spanish: autoguardado        ##########
#### :rutina-inicial-allow-logcmd:
####
####
if [ "$cfg_allow_save_logcmd" != "no" ]
####
####
then txt_head_format_logcmd="date: $cmd_logcmd_date path: $cmd_internal \
ver: $cmd_version opt: $cmd_guided_full"
####
echo $txt_head_format_logcmd >> $cmd_file_default_logcmd
####
####
fi
####
####
#### :rutina-final-allow-logcmd:
##########   english: tree-log: list log   ##########
##########   spanish: tree-log: lista log  ##########
#### :rutina-inicial-list-tree-log:
####
####
if [ "$cmd_first_option" == "tree-log" ] ; then
####
####
$cmd_command_tree $cmd_default_directory_baselogs
echo 
echo "### ### [ folder: ] [ $cmd_default_directory_baselogs ]"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-list-tree-log:
##########   english: tree-pdf: list pdf   ##########
##########   spanish: tree-pdf: lista pdf  ##########
#### :rutina-inicial-list-tree-pdf:
####
####
if [ "$cmd_first_option" == "tree-pdf" ] ; then
####
####
$cmd_command_tree $cmd_default_directory_basepdf
echo 
echo "### ### [ folder: ] [ $cmd_default_directory_basepdf ]"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-list-tree-pdf:
##########    english: cat-logcmd: Read log  fwiptables-logcmd   ##########
##########    spanish: cat-logcmd: Lee  log  fwiptables-logcmd   ##########
#### :rutina-inicial-cat-logcmd:
####
####
if [ "$cmd_first_option" == "cat-logcmd" ] ; then
####
####
if [ ! -f $cmd_file_default_logcmd ]; then touch $cmd_file_default_logcmd ; fi
echo "$txt_text_title_md list all month"
$cmd_command_tree $cmd_default_directory_baselogcmd
echo "$txt_text_title $cmd_file_default_logcmd"
$cmd_command_cat   "$cmd_file_default_logcmd" | tail -50
echo
echo "$txt_text_title_info latest 50 lines from this file"
echo "$txt_text_title_info [$cmd_file_default_logcmd]"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-cat-logcmd:
##########    english: log-stat: Read stats log fwiptables-logcmd    ##########
##########    spanish: log-stat: show stats log  fwiptables-logcmd   ##########
#### :rutina-inicial-log-stat:
####
####
if [ "$cmd_first_option" == "log-stat" ] ; then
####
####
if [ "$cmd_command_wc" == "$NULL" ] ; then
echo "$txt_text_info Please install wc command"; exit; fi
####
####
cfg_conteo="$($cmd_command_cat $cmd_file_default_logcmd | $cmd_command_wc -l)"
echo "$txt_text_md $cfg_conteo Commands launched. Commands log with allowed logcmd"
echo "$txt_text_md file: $cmd_file_default_logcmd"
####
####
cfg_conteo="$($cmd_command_ls -1 $cmd_default_directory_logs | $cmd_command_wc -l)"
echo "$txt_text_md $cfg_conteo Commands output. Commands log with output log"
echo "$txt_text_md folder: $cmd_default_directory_logs"
####
####
cfg_conteo="$($cmd_command_ls -1 $cmd_default_directory_pdf | $cmd_command_wc -l)"
echo "$txt_text_md $cfg_conteo Commands output. Command log with output pdf"
echo "$txt_text_md folder: $cmd_default_directory_pdf"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "version" ]; then
####
####
echo "$txt_text_md_md     Detail Firewall: Detail Version            $txt_text_md"
####
####
if [ "$(echo $XDG_SESSION_TYPE)" != "$NULL" ]; then
echo "$txt_text_md_md         Session XDG: $XDG_SESSION_TYPE         $txt_text_md"
fi
####
####
echo "$txt_text_md_md       Name Firewall: $cmd_name                 $txt_text_md"
echo "$txt_text_md_md    Version Firewall: $cmd_version              $txt_text_md"
echo "$txt_text_md_md   Released Firewall: $cmd_released             $txt_text_md"
echo "$txt_text_md_md     Source Firewall: $cmd_notinstalled         $txt_text_md"
echo "$txt_text_md_md   Internal Firewall: $cmd_internal             $txt_text_md"
echo "$txt_text_md_md   Short Description: $cmd_shortdescription     $txt_text_md"
echo "$txt_text_md_md    Long Description: $cmd_longdescription      $txt_text_md"
echo "$txt_text_md_md      Data Directory: $cmd_default_directory_necesary  $txt_text_md"
echo "$txt_text_md_md     Cache Directory: $cmd_default_cache_basenecesary $txt_text_md"
echo "$txt_text_md_md      Finder Program: $cmd_where                $txt_text_md"
echo "$txt_text_md_md   Requisite Program: $cmd_requisite_program    $txt_text_md"
echo "$txt_text_md_md Requisite Firewall4: $cmd_requisite_firewall4  $txt_text_md"
echo "$txt_text_md_md Requisite Firewall6: $cmd_requisite_firewall6  $txt_text_md"
echo "$txt_text_md_md      Automatic Edit: $cfg_favorite_text_editor     $txt_text_md"
echo "$txt_text_md_md       Automatic cli: $cfg_favorite_realpath_textdialog       $txt_text_md"
echo "$txt_text_md_md       Automatic gui: $cfg_favorite_realpath_graphicalldialog $txt_text_md"
echo "$txt_text_md_md       Automatic pdf: $cmd_command_convert      $txt_text_md"
echo "$txt_text_md_md     Configured PATH: $cmd_path                 $txt_text_md"
echo "$txt_text_md_md         File Format: $cmd_format               $txt_text_md"
echo "$txt_text_md_md    Developer Actual: $cmd_developer            $txt_text_md"
echo "$txt_text_md_md        Email Report: $cmd_contact              $txt_text_md"
echo "$txt_text_md_md     License Program: $cmd_license              $txt_text_md"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-version:
##########    english: expert-cpufreq-info: info cpu frequence                 ##########
##########    spanish: expert-cpufreq-info: informacion de frecuencia de cpu   ##########
#### :rutina-inicial-expert-cpufreq:
####
####
if [ "$cmd_first_option" == "expert-cpufreq-info" ] ; then
####
####
echo "$txt_text_title_info [ show cpu frequence info ]"
if [ "$cmd_command_cpufreqinfo" == "$NULL" ]; then
echo "$txt_text_title please install cpufreq-info"; fi
$cmd_command_cpufreqinfo
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-cpupower-info" ] ; then
####
####
echo "$txt_text_title_info [ show cpu frequence info ]"
if [ "$cmd_command_cpupower" == "$NULL" ]; then
echo "$txt_text_title please install cpupower"; fi
$cmd_command_cpupower -c all frequency-info
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-configs-save" ] ; then
####
####
echo "$txt_text_title_info [ save backups confiurations to choosed filename ]"
if [ "$cmd_command_tar" == "$NULL" ]; then
echo "$txt_text_title Please install tar command"; exit ; fi
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title Please choose the backup file to save"; exit; fi
####
####
tar vcf $2.tar -C $cmd_default_directory_necesary . && \
echo "$txt_text_ok in-file-saved: $2.tar from-folder-saved: $cmd_default_directory_necesary" || \
echo "$txt_text_fail bad"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-configs-load" ] ; then
####
####
echo "$txt_text_title_info [ load backups confiurations from choosed filename ]"
if [ "$cmd_command_tar" == "$NULL" ]; then
echo "$txt_text_title Please install tar command"; exit ; fi
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title Please choose the backup file to load"; exit; fi
####
####
tar vxf $2 -C $cmd_default_directory_necesary . && \
echo "$txt_text_ok from-file-loaded: $2 in-folder-loaded: $cmd_default_directory_necesary" || \
echo "$txt_text_fail bad"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-wpa-scan" ]; then
####
####
echo "$txt_text_title_info  [ Show SSID from net wifi ] "
if   [ "$cmd_command_iw" == "$NULL" ]; then 
echo "$txt_text_title_info [ Please, Install iw to work ]" ; exit ; fi
for a in $($cmd_command_cat  /proc/net/dev | $cmd_command_grep -i  : | cut -d ":" -f 1)
do $cmd_command_ifconfig $a up
$cmd_command_iw $a scan | $cmd_command_grep -E -i "on $a|ssid" ; done
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-new" ] 
then $cmd_first_option="expert-txtwpa-new"; fi
####
####
if [ "$cmd_first_option" == "expert-txtwpa-new" ]; then
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_second_option" == "$NULL" ]; then 
echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
$cmd_internal expert-wpa-regen
cp $cmd_default_directory_wpa/defaultwpa $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
editor $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
exit; fi
####
####
if [ "$cmd_first_option" == "expert-guiwpa-new" ]; then
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_second_option" == "$NULL" ]; then 
echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
$cmd_internal expert-wpa-regen
cp $cmd_default_directory_wpa/defaultwpa $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
editor $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-modify" ]
then $cmd_first_option="expert-txtwpa-modify"; fi
####
####
if [ "$cmd_first_option" == "expert-txtwpa-modify" ]; then
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_second_option" == "$NULL" ]; then 
echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
editor $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
exit; fi
####
####
if [ "$cmd_first_option" == "expert-guiwpa-modify" ]; then
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; exit; fi
if [ "$cmd_second_option" == "$NULL" ]; then 
echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
editor $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-list" ]
####
####
then ls -1 "$cmd_default_directory_wpa" | cut -d "_" -f 2-
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
if [ "$cmd_first_option" == "expert-wpa-show" ]; then
####
####
if [ "$cmd_second_option" == "$NULL" ]
then $cmd_internal expert-wpa-list
echo "$txt_text_title_info use: $cmd_first_option nameconfig" ; exit ; fi
if [ -f "$cmd_default_directory_wpa/wpaconfig_$cmd_second_option" ]; then
echo "$txt_text_title $txt_text_title $txt_text_title $txt_text_title wpa config_:"
$cmd_command_cat  "$cmd_default_directory_wpa/wpaconfig_$cmd_second_option"
echo "$txt_text_title $txt_text_title $txt_text_title $txt_text_title wpa connect_:"
$cmd_command_cat  "$cmd_default_directory_wpa/wpaconnect_$cmd_second_option"
else echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-connect" ]; then
####
####
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"
exit; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"
exit; fi
if [ "$cmd_second_option" == "$NULL" ]
then echo "$txt_text_title_fail use: $cmd_first_option nameconfig"
exit ; fi
####
####
if [ -f "$cmd_default_directory_wpa/wpaconfig_$cmd_second_option" ]
then source $cmd_default_directory_wpa/wpaconfig_$cmd_second_option
####
####
$cmd_command_wpapassphrase $wifi_wpa_ssid $wifi_wpa_password \
&> $cmd_default_directory_wpa/wpaconnect_$cmd_second_option
$cmd_command_wpasupplicant -D $wifi_wpa_driver -i $wifi_wpa_device -c \
"$cmd_default_directory_wpa/wpaconnect_$cmd_second_option" &
$cmd_command_ifconfig $wifi_wpa_device:1 $wifi_wpa_ip
if [ "$(command -v $wifi_wpa_dhcp)" == "$NULL" ]
then echo "$txt_text_title_fail $wifi_wpa_dhcp not found"; exit; fi
else echo "$txt_text_title_fail use: $cmd_first_option nameconfig"; exit ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-regen" ]; then
####
####
if [ "$cmd_command_wpapassphrase" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; fi
if [ "$cmd_command_wpasupplicant" == "$NULL" ]
then echo "$txt_text_title_fail Install wpa_passphrase"; fi
$cmd_internal expert-wpa-example &> $cmd_default_directory_wpa/defaultwpa
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "expert-wpa-example" ]; then
####
####
echo "$txt_text_title data necesary to get wifi access"
echo "wifi_wpa_driver=nl80211"
echo "$txt_text_title wifi driver:     nl80211 or wext"
echo "wifi_wpa_device=wlan0"
echo "$txt_text_title wifi device:     type wifi device"
echo "wifi_wpa_ssid=none"
echo "$txt_text_title wifi net:        type name for wireless net"
echo "wifi_wpa_password=none"
echo "$txt_text_title wifi password:   type password to wireless"
echo "wifi_wpa_dhcp="
echo "$txt_text_title wifi ip dinamic: if program for dhcp"
echo "wifi_wpa_ip="
echo "$txt_text_title wifi ip static:  if choose one static ip for this net"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-wpaexample:
##########    ALIAS CONFIG REGEN alias-regen:
##########    ALIAS CONFIG REGEN alias-regen:
#### :rutina-inicial-alias-regen:
####
####
if [ "$cmd_first_option" == "alias-regen" ] ; then 
####
####
$cmd_internal alias-example | \
grep -iv " alias-example" &> $cmd_file_default_alias
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-alias-regen:
##########    ALIAS CONFIG alias: alias-read:
##########    ALIAS CONFIG alias: alias-read:
#### :rutina-inicial-alias-read:
####
####
if [ "$cmd_first_option" == "alias" ] || [ "$cmd_first_option" == "alias-read" ] ; then 
####
####
$cmd_command_cat $cmd_file_default_alias
####
####
exit; fi
####
####
#### :rutina-final-alias-read:
##########    ALIAS CONFIG EXAMPLE alias-example:
##########    ALIAS CONFIG EXAMPLE alias-example:
#### :rutina-inicial-alias-example:
####
####
if [ "$cmd_first_option" == "alias-example" ] ; then 
####
####
echo "####  program: $cmd_internal $cmd_version"
echo "####  file: $cmd_file_default_alias"
echo "####  All lines have to be commenteds"
echo "#output=optional-output"
echo "#control=firewall-wallcontrol"
echo "#listconceptual=firewall-listconceptual"
echo "#listnumeral=firewall-listnumeral"
echo "#wallcustom=firewall-wallcustom"
echo "#wallsystem=firewall-wallsystem"
echo "#netsystem=firewall-netsystem"
echo "#easy=firewall-netsystem"
echo "#examples=options-examples"
echo "#ntpdate-client=date"
echo "#list-allrules=list-alltables"
echo "#preferences-modify=preferences-edit"
echo "#alias-modify=alias-edit"
echo "#logcmd=cat-logcmd"
echo "#autolog=cat-logcmd"
echo "#ver=version"
echo "#all-names=names"
echo "#address4=info-ip4"
echo "#address6=info-ip6"
echo "#ram-free=free"
echo "#free-ram=free"
echo "#ram=free"
echo "#nodes=info-nodes"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-alias-example:
##########    english: alias-edit: modify preferences   ##########
##########    spanish: alias-edit: modify preferences   ##########
#### :rutina-inicial-alias-edit:
####
####
if [ "$cmd_first_option" == "alias-edit" ]; then 
####
####
$cfg_favorite_text_editor $cmd_file_default_alias
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-alias-edit:
##########    english: preferences-edit: modify preferences   ##########
##########    spanish: preferences-edit: modify preferences   ##########
#### :rutina-inicial-preferences-edit:
####
####
if [ "$cmd_first_option" == "preferences-edit" ]; then 
####
####
$cfg_favorite_text_editor $cmd_file_default_preferences
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-preferences-edit:
##########    english: preferences-read: modify  preferences         ##########
##########    spanish: preferences-read: modifica preferencias       ##########
#### :rutina-inicial-preferences-read:
####
####
if [ "$cmd_first_option" == "preferences-read" ]; then
####
####
$cmd_command_cat  $cmd_file_default_preferences
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "preferences-regen" ] ; then
####
####
$cmd_internal preferences-example | \
grep -iv " preferences-example " &> $cmd_file_default_preferences
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "preferences-example" ] ; then
####
####
echo "####  program: $cmd_internal $cmd_version"
echo "####  file: $cmd_file_default_preferences"
echo "$txt_text_title"
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default option when not option are there"
echo "cfg_config_without_firstoption=options                    ## read below"
echo "$txt_text_title type: void or one valid option required to works"
echo "$txt_text_title example1:options example2:list4 example3:ip4"
echo "$txt_text_title example4:speed-ip4 example5:sockets example6:gui-roll"
echo "$txt_text_title example7:gui-menu-yad example8:gui-shell-yad"
echo "$txt_text_title" 
echo "$txt_text_title $txt_text_title Allow expert commands for default" 
echo "cfg_allow_expert_commands=                          ## or void for yes or no"
echo "$txt_text_title" 
echo "$txt_text_title $txt_text_title default firewall"
echo "cfg_allow_use_legacy=no                             ## or void for yes or no"
echo "cfg_allow_use_nft=                                  ## or void for yes or no"
echo "cfg_allow_use_ipv4=                                 ## or void for yes or no"
echo "cfg_allow_use_ipv6=                                 ## or void for yes or no"
echo "$txt_text_title"
echo "cfg_allow_separate_rules=                           ## or void for yes or no"
echo "cfg_allow_close_log=no                              ## or void for yes or no"
echo "cfg_config_system_log=LOG                           ## or LOG or ULOG"
echo "cfg_config_close_deny=DROP                          ## or DROP or REJECT"
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default string"
echo "cfg_config_string_algoritmo=kmp                     ## or kmp or bm"
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default logcmd"
echo "cfg_allow_save_logcmd=                              ## or void for yes or no"
echo "$txt_text_title $txt_text_title header time"
echo "cfg_allow_show_time=no                              ## or void for yes or no"
echo "$txt_text_title"  
echo "$txt_text_title $txt_text_title mini client ports from side client: for miniserver tcp/udp"  
echo "cfg_client_mini_port_tcp=ssh,http,https"
echo "cfg_client_mini_port_udp=domain,domain-s,bootpc,bootps,ntp,https"
echo "$txt_text_title"  
echo "$txt_text_title $txt_text_title default programs"
echo "cfg_favorite_iperf_command=                         ## or void for automatic or specify command"
echo "cfg_favorite_text_editor=                           ## or void for automatic or specify command"
echo "cfg_favorite_text_music=                            ## or void for automatic or specify command"
echo "cfg_favorite_text_browser=                          ## or void for automatic or specify command"
echo "cfg_favorite_date_command=                          ## or void for automatic or specify command"
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default text-cli and graphicall-gui"
echo "cfg_favorite_realpath_textdialog=                   ## or void for automatic or specify command"
echo "cfg_favorite_realpath_graphicalldialog=             ## or void for automatic or specify command"
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default discover ip and speed ip"
echo "cfg_server_ipdiscover_ipv4=https://ifconfig.co/ip   ## default http://ifconfig.co/ip"
echo "cfg_server_ipdiscover_ipv6=https://ifconfig.co/ip   ## default http://ifconfig.co/ip"
echo "cfg_server_ip_iperf_ipv4=ping.online.net             ## default ping.online.net"
echo "cfg_server_port_iperf_ipv4=5200                      ## default 5200"
echo "cfg_server_ip_iperf_ipv6=ping6.online.net            ## default ping6.online.net"
echo "cfg_server_port_iperf_ipv6=5200                      ## default 5200"
echo "cfg_server_radio_online=https://www.tdtchannels.com/lists/radio.m3u8" 
echo "$txt_text_title"
echo "$txt_text_title $txt_text_title default graphicall dimension"
echo "cfg_config_graphicall_width=800                     ## default width 800"
echo "cfg_config_graphicall_height=600                    ## default height 600"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-preferences-example:
##########    english: resolve : get net info               ##########
##########    spanish: resolve : da informacion de la red   ##########
#### :rutina-inicial-resolve:
####
####
if [ "$cmd_first_option" == "resolve" ]; then
####
####
echo "$txt_text_title_info $txt_text_title [ Domain resolve ] [ nameserver and search ] $txt_text_title"
if [ -f /etc/resolv.conf ]
then echo "$txt_text_md_md Content from file: /etc/resolv.conf"
$cmd_command_cat  /etc/resolv.conf                     ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$txt_text_md_md File: /etc/resolv.conf.head"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$txt_text_md_md File: /etc/resolv.conf.body"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$txt_text_md_md File: /etc/resolv.conf.tail"; fi
if [ -d /etc/resolvconf ]
then echo "$txt_text_md_md Directory: /etc/resolvconf" ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-resolve:
##########    english: route : get net info               ##########
##########    spanish: route : da informacion de la red   ##########
#### :rutina-inicial-route:
####
####
if [ "$cmd_first_option" == "route" ]; then
####
####
$cmd_internal route4
$cmd_internal route6
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-network:
##########    english: route4 : get net info               ##########
##########    spanish: route4 : da informacion de la red   ##########
#### :rutina-inicial-route4:
####
####
if [ "$cmd_first_option" == "route4" ]; then
####
####
#### route table
echo "$txt_text_title_info ### [ Network Route ] [ Route ipv4 ] ###"
if [ "$cmd_command_ip" == "$NULL" ] ; then echo "$txt_text_md $txt_text_info [ install ip command ]"
else $cmd_command_ip -4 route   ; fi
####
####
exit; fi 
####
####
#### :rutina-final-route4:
##########    english: route6 : get net info               ##########
##########    spanish: route6 : da informacion de la red   ##########
#### :rutina-inicial-route6:
####
####
if [ "$cmd_first_option" == "route6" ]; then
####
####
#### route table
echo "$txt_text_title_info ### [ Network Route ] [ Route ipv6 ] ###"
if [ "$cmd_command_ip" == "$NULL" ]; then echo "$txt_text_md $txt_text_info [ install ip command ]"
else $cmd_command_ip -6 route   ; fi
####
####
exit; fi
####
####
#### :rutina-final-route6:
##########    english: ip : get net info               ##########
##########    spanish: ip : da informacion de la red   ##########
#### :rutina-inicial-ip:
####
####
if [ "$cmd_first_option" == "ip" ]; then
####
####
$cmd_internal ip4
$cmd_internal ip6
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-ip:
##########    english: address : get net info               ##########
##########    spanish: address : da informacion de la red   ##########
#### :rutina-inicial-address:
####
####
if [ "$cmd_first_option" == "address" ]; then
####
####
$cmd_internal info-ip4
$cmd_internal info-ip6
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-address:
##########    english: ip4 : get net info               ##########
##########    spanish: ip4 : da informacion de la red   ##########
#### :rutina-inicial-ip4:
####
####
if [ "$cmd_first_option" == "ip4" ]; then
####
####
echo "$txt_text_title_info ### [ Private ip ] [ Address ipv4 ] ###"
if [ "$cmd_command_ip" == "$NULL" ]
then echo "$txt_text_title_info [ install ip command ]"
else  $cmd_command_ip -4 address | grep -i "inet "; fi
####
####
echo "$txt_text_title_info ### [ Public ip ] [ Address ipv4 ] ###"
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title_info [ install curl command ]" ;
else cfg_public_ip4="$($cmd_command_curl -k -s -4 $cfg_server_ipdiscover_ipv4 -w '\n'| head -1)"
if [ "$cfg_public_ip4" == "<!DOCTYPE html>" ] || [ "$cfg_public_ip4" == "" ] ;
then echo "fail: public ip hidden for dns server" ;
else echo "$txt_text_md   $cfg_public_ip4"; fi ; fi
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
if [ "$cmd_first_option" == "ip6" ]; then
####
####
echo "$txt_text_title_info ### [ Private ip ] [ Address ipv6 ] ###"
if [ "$cmd_command_ip" == "$NULL" ]
then echo "$txt_text_title_info [ install ip command ]"
else  $cmd_command_ip -6 address | grep -i "inet6 " ; fi
####
####
echo "$txt_text_title_info ### [ Public ip ] [ Address ipv6 ] ###"
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title_info [ install curl command ]" ;
else cfg_public_ip6="$($cmd_command_curl -k -s -6 $cfg_server_ipdiscover_ipv4 -w '\n'| head -1)"
if [ "$cfg_public_ip4" == "<!DOCTYPE html>" ] || [ "$cfg_public_ip4" == "" ] ;
then echo "fail: public ip hidden for dns server" ;
else echo "$txt_text_md   $cfg_public_ip6"; fi; fi
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
if   [ "$cmd_first_option" == "sockets" ]; then
####
####
echo "$txt_text_title_info [ Show whith ss: LISTEN sockets ] "
if [ "$cmd_command_ss" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install ss command ]"; exit; fi
if [ "$cmd_command_awk" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install awk command ]"; exit; fi
$cmd_command_ss -l -460  | $cmd_command_grep "\:\*" | \
$cmd_command_awk '{print "     " $1 " " $2 " " $5}'
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-sockets:
##########    english: info-ip4 : get net info               ##########
##########    spanish: info-ip4 : da informacion de la red   ##########
#### :rutina-inicial-info-ip4:
####
####
if [ "$cmd_first_option" == "info-ip4" ]; then
####
####
echo "$txt_text_title_info  [ show info about net address ip4 ]"
$cmd_internal route4
$cmd_internal ip4
$cmd_internal resolve
$cmd_internal sockets
####
####
exit; fi
####
####
#### :rutina-final-info-ip4:
##########    english: info-ip6 : get net info               ##########
##########    spanish: info-ip6 : da informacion de la red   ##########
#### :rutina-inicial-info-ip6:
####
####
if [ "$cmd_first_option" == "info-ip6" ]; then
####
####
echo "$txt_text_title_info  [ show info about net address ip6 ]"
$cmd_internal route6
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
#### :rutina-final-info-ip6:
##########    english: expert-conf-clientproxy: get net info               ##########
##########    spanish: expert-conf-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-confclientproxy
####
####
if [ "$cmd_first_option" == "expert-conf-clientproxy" ]; then 
if [ "$cmd_second_option" == "$NULL" ] ; then cfg_second_option="without-proxy" ; fi
####
####
echo "$txt_text_title File generated by fwiptables \
expert-conf-clientproxy user:pass@ip:port" \
&> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "$txt_text_title This filename is \
$cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x all_proxy=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x ftp_proxy=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x http_proxy=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x https_proxy=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x ALL_PROXY=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x FTP_PROXY=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x HTTP_PROXY=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo "declare -x HTTPS_PROXY=$2" \
&>> $cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option
echo
###
###
if [ -f "$cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option" ]
then $cmd_command_cat  \
"$cmd_default_directory_proxy/fwiptables-proxy-$cmd_second_option" ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-confclientproxy
##########    english: expert-show-clientproxy: get net info               ##########
##########    spanish: expert-show-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-showclientproxy
####
####
if [ "$cmd_first_option" == "expert-show-clientproxy" ]; then echo
####
####
echo "$txt_text_title_info ### [ Proxy tunnel ] [ Address proxy ] ###"
echo "$txt_text_title [ Necesary:  ] WHITHOUT script shell and WHITHOUT exit command ]"
echo "$txt_text_title [ Editable:  ] declare -x HTTPS_PROXY=https://127.0.0.1:8080"
echo "$txt_text_title [ configure: ] $cmd_internal expert-conf-clientproxy user:pass@ip:port"
####
####
cfg_listado_proxy="$(export | grep -i \_PROXY | wc -l)"
if [ "$cfg_listado_proxy" -eq "0" ]; then
echo "$txt_text_title [ Actually: ] Without proxy in export variables"
else export | grep -i "_PROXY" ; fi
echo
####
####
if [ ! -f "$cmd_default_directory_proxy/$cmd_second_option" ] ; then
echo "$txt_text_title Show file with: expert-show-clientproxy [second_option]" ;
echo "$txt_text_title Choose above one to second-option"; 
ls $cmd_default_directory_proxy/ ; exit ; fi
####
####
if [ -f "$cmd_default_directory_proxy/$cmd_second_option" ] ; then
echo ; $cmd_command_cat  "$cmd_default_directory_proxy/$cmd_second_option" ; exit ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-showclientproxy
##########    english: expert-active-clientproxy: get net info               ##########
##########    spanish: expert-active-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactiveclientproxy
####
####
if [ "$cmd_first_option" == "expert-active-clientproxy" ]; then echo
####
####
echo "$txt_text_title there is before "
declare -x | grep -i \_PROXY
####
####
if [ -f "$cmd_default_directory_proxy/$cmd_second_option" ]     ; 
then source $cmd_default_directory_proxy/$cmd_second_option     ;
else echo "$txt_text_title Choose above one to second-option" ;
ls $cmd_default_directory_proxy/                            ;
fi
####
####
echo "$txt_text_title there is after "
declare -x | grep -i \_PROXY
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-activeclientproxy
##########    english: expert-deactive-clientproxy: get net info               ##########
##########    spanish: expert-deactive-clientproxy: da informacion de la red   ##########
#### :rutina-inicial-expert-deactiveclientproxy
####
####
if [ "$cmd_first_option" == "expert-deactive-clientproxy" ]; then echo
####
####
echo "$txt_text_title there is before "
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
echo "$txt_text_title there is after "
declare -x | grep -i \_PROXY
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-deactiveclientproxy
##########    english: expert-show-resolve : get net info               ##########
##########    spanish: expert-show-resolve : da informacion de la red   ##########
#### :rutina-inicial-expert-showresolve
####
####
if [ "$cmd_first_option" == "expert-show-resolve" ]; then echo
####
####
echo "$txt_text_title_info ### [ Domain resolve ] [ nameserver and search ] ###"
if [ -f /etc/resolv.conf ]
then echo "$txt_text_title [ yes file ]      [ /etc/resolv.conf ]"
$cmd_command_cat  /etc/resolv.conf | $cmd_command_grep -E "nameserver|search"      ; fi
if [ -f /etc/resolv.conf.head ]
then echo "$txt_text_title [ yes file ]      [ /etc/resolv.conf.head ]"; fi
if [ -f /etc/resolv.conf.body ]
then echo "$txt_text_title [ yes file ]      [ /etc/resolv.conf.body ]"; fi
if [ -f /etc/resolv.conf.tail ]
then echo "$txt_text_title [ yes file ]      [ /etc/resolv.conf.tail ]"; fi
if [ -d /etc/resolvconf ]
then echo "$txt_text_title [ yes directory ] [ /etc/resolvconf ]"      ; fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-trace-tcp4" ]; then
####
####
echo "$txt_text_title_info  [ trace ip or host with tcp ipv4 ]"
case $cmd_command_tracepath in "$NULL")
echo "$txt_text_title_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title use: $cmd_internal $cmd_first_option host"; exit; fi
$cmd_internal save before-trace-tcp4 
$cmd_internal eraserules4
echo "$duo_md $txt_text_ok [ tracepath -4 $2 ] "
$cmd_command_tracepath -4 $2
$cmd_internal load before-trace-tcp4
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-trace-tcp6" ]; then
####
####
echo "$txt_text_title_info  [ trace ip or host with tcp ipv6 ]"
case $cmd_command_tracepath in "$NULL")
echo "$txt_text_title_fail [ Install tracepath command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title use: $cmd_internal $cmd_first_option host"; exit; fi
$cmd_internal save before-trace-ip6 
$cmd_internal eraserules6
echo "$duo_md $txt_text_ok [ tracepath -6 $2 ] "
$cmd_command_tracepath -6 $2
$cmd_internal load before-trace-ip6
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-trace-icmp4" ]; then
####
####
echo "$txt_text_title_info  [ trace ip or host with icmp ipv4 ]"
case $cmd_command_traceroute in "$NULL")
echo "$txt_text_title_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title use: $cmd_internal $cmd_first_option host"; exit ; fi
$cmd_internal save before-trace-icmp4 
$cmd_internal eraserules4
echo "$duo_md $txt_text_ok [ traceroute -4 $2 ] "
$cmd_command_traceroute -4 $2
$cmd_internal load before-trace-icmp4
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-trace-icmp6" ]; then
####
####
echo "$txt_text_title_info  [ trace ip or host with icmp ipv6 ]"
case $cmd_command_traceroute in "$NULL")
echo "$txt_text_title_fail [ Install traceroute command ]" ; exit ;;  esac
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title use: $cmd_internal $cmd_first_option host"; exit ; fi
$cmd_internal save before-trace-icmp6 
$cmd_internal eraserules6
echo "$duo_md $txt_text_ok [ traceroute -6 $2 ] "
$cmd_command_traceroute -6 $2
$cmd_internal load before-trace-icmp6
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if   [ "$cmd_first_option" == "expert-myradio-install" ]; then
####
####
echo "$txt_text_title_info  [ myradio download ] [ expert-myradio-install md]"
echo "$txt_text_title Downloading myradio stable latest in $cmd_default_directory_radio/myradio-bash"
$cmd_command_curl $cmd_web_download_myradio -s -L \
-o $cmd_default_directory_radio/myradio-bash || echo "Without internet" || exit \
&& chmod ugo+x $cmd_default_directory_radio/myradio-bash &> /dev/null
cp $cmd_default_directory_radio/myradio-bash /usr/bin/myradio-bash && \
echo "$txt_text_title installed myradio-bash in /usr/bin/myradio-bash"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
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
if [ "$cmd_first_option" == "utils" ]; then
####
####
echo "$txt_text_title_info [ List for posible utils programs ] [ utils md ] "
list_utils_possible="$($cmd_internal code possible-commands | \
$cmd_command_grep -E '^cmd_command_' | $cmd_command_cut -d '=' -f 1 | \
$cmd_command_sed 's/cmd_command_/ /g' )"
echo $list_utils_possible
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-utils:
##########    english: depends: depends            ##########
##########    spanish: depends: dependencias  ##########
#### :rutina-inicial-depends:
####
####
if [ "$cmd_first_option" == "depends" ]; then
####
####
echo "$txt_text_title_md [ Configuration files ] $txt_text_md"
echo "$txt_text_md_md Directory  data:         $cmd_default_directory_necesary $txt_text_md"
echo "$txt_text_md_md Directory cache:         $cmd_default_cache_basenecesary $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ Log files ]           $txt_text_md"
echo "$txt_text_md_md Folder log:              $cmd_default_directory_baselogs $txt_text_md"
echo "$txt_text_md_md Folder pdf:              $cmd_default_directory_basepdf $txt_text_md"
echo "$txt_text_md_md Folder logcmd:           $cmd_default_directory_baselogcmd $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ Preferences files ]   $txt_text_md"
echo "$txt_text_md_md preferences:             $cmd_file_default_preferences"
echo "$txt_text_md_md alias:                   $cmd_file_default_alias"             
echo "$txt_text_md_md usernotes:               $cmd_file_default_usernotes"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ optional output ]     $txt_text_md"
echo "$txt_text_md_md dialog cli:              $cmd_command_dialog $txt_text_md"
echo "$txt_text_md_md whiptail cli             $cmd_command_whiptail $txt_text_md"
echo "$txt_text_md_md zenity gui:              $cmd_command_zenity $txt_text_md"
echo "$txt_text_md_md yad gui:                 $cmd_command_yad $txt_text_md"
echo "$txt_text_md_md convert pdf:             $cmd_command_convert $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ Automatic iptables ]  $txt_text_md"
echo "$txt_text_md_md iptables legacy:         $cmd_command_ip4tableslegacy $txt_text_md"
echo "$txt_text_md_md iptables nft:            $cmd_command_ip4tablesnft $txt_text_md"
echo "$txt_text_md_md ip6tables legacy:        $cmd_command_ip6tableslegacy $txt_text_md"
echo "$txt_text_md_md ip6tables nft:           $cmd_command_ip6tablesnft $txt_text_md"
echo "$txt_text_md_md arptables:               $cmd_command_arptables $txt_text_md"
echo "$txt_text_md_md ebtables:                $cmd_command_ebtables $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ Automatic favorites ] $txt_text_md"
echo "$txt_text_md_md Automatic txt:           $cmd_command_bash $txt_text_md"
echo "$txt_text_md_md Automatic cli:           $cfg_favorite_realpath_textdialog $txt_text_md"
echo "$txt_text_md_md Automatic gui:           $cfg_favorite_realpath_graphicalldialog $txt_text_md"
echo "$txt_text_md_md Automatic pdf:           $cmd_command_convert $txt_text_md"
echo "$txt_text_md_md Automatic editor:        $cfg_favorite_text_editor $txt_text_md"
echo "$txt_text_md_md Automatic browser:       $cfg_favorite_text_browser $txt_text_md"
echo "$txt_text_md_md Automatic date:          $cfg_favorite_date_command $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ Necesary utils ]      $txt_text_md"
echo "$txt_text_md_md iptables nft:            $cmd_command_ip4tablesnft $txt_text_md"
echo "$txt_text_md_md iptables legacy:         $cmd_command_ip4tableslegacy $txt_text_md"
echo "$txt_text_md_md iptables nft:            $cmd_command_ip6tablesnft $txt_text_md"
echo "$txt_text_md_md iptables legacy:         $cmd_command_ip6tableslegacy $txt_text_md"
echo "$txt_text_md_md   id command:            $cmd_command_id $txt_text_md"
echo "$txt_text_md_md  awk command:            $cmd_command_awk $txt_text_md"
echo "$txt_text_md_md  cat command:            $cmd_command_cat $txt_text_md"
echo "$txt_text_md_md  cut command:            $cmd_command_cut $txt_text_md"
echo "$txt_text_md_md date command:            $cmd_command_date $txt_text_md"
echo "$txt_text_md_md file command:            $cmd_command_file $txt_text_md"
echo "$txt_text_md_md  sed command:            $cmd_command_sed $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md Found all posible utils: fwiptables utils $txt_text_md"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-depends:
##########    english: options-examples: some example    ##########
##########    spanish: options-examples: algun ejemplo   ##########
#### :rutina-inicial-options-examples:
####
####
if [ "$cmd_first_option" == "options-examples" ]; then
####
####
echo "$txt_text_title_md [ One example with input-established ]            $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"  
echo "$txt_text_md_md  Launch: input-stablished                            $txt_text_md"
echo "$txt_text_md_md  $cmd_internal input-stablished                      $txt_text_md"  
echo "$txt_text_md_md  Explain: Client for all ports without servers ports $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"  
echo "$txt_text_title_md [ Several examples with tiny server ]             $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"  
echo "$txt_text_md_md  Launch: wizard tiny                                 $txt_text_md"
echo "$txt_text_md_md  $cmd_internal wizard-tiny                           $txt_text_md"  
echo "$txt_text_md_md  Launch: tinyserver-tcp ports                        $txt_text_md"
echo "$txt_text_md_md  $cmd_internal tinyserver-tcp 21:25,80               $txt_text_md"  
echo "$txt_text_md_md  Launch: tinyserver-udp ports                        $txt_text_md"
echo "$txt_text_md_md  $cmd_internal tinyserver-udp 67:68,443              $txt_text_md"  
echo "$txt_text_md_md  Explain: Client for all ports                       $txt_text_md"
echo "$txt_text_md_md  $txt_text_md" 
echo "$txt_text_title_md [ Several examples with mini server ]             $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_md_md  Launch: wizard mini                                 $txt_text_md"
echo "$txt_text_md_md  $cmd_internal wizard-mini                           $txt_text_md"  
echo "$txt_text_md_md  Explain: Wizard firewall for clients and servers    $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_md_md  Launch: miniserver-tcp ports                        $txt_text_md"
echo "$txt_text_md_md  $cmd_internal miniserver-tcp 21:25,80               $txt_text_md"  
echo "$txt_text_md_md  Launch: miniserver-udp ports                        $txt_text_md"
echo "$txt_text_md_md  $cmd_internal miniserver-udp 67:68,443              $txt_text_md"  
echo "$txt_text_md_md  Explain: Read miniserver in preferences file        $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_title_md [ Example with add-whitelist4 ]                   $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"  
echo "$txt_text_md_md  Launch: add-whitelist4                              $txt_text_md"
echo "$txt_text_md_md  $cmd_internal add-whitelist4 192.168.0.2,sf.net     $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_title_md [ Without optional output ]     $txt_text_md"  
echo "$txt_text_md_md  $txt_text_md"  
echo "$txt_text_md_md  Explain: depends                  $txt_text_md"
echo "$txt_text_md_md  $cmd_internal depends             $txt_text_md"  
echo "$txt_text_md_md  Explain: List firewall saved      $txt_text_md"
echo "$txt_text_md_md  $cmd_internal names               $txt_text_md"  
echo "$txt_text_md_md  Explain: List configs saved       $txt_text_md"
echo "$txt_text_md_md  $cmd_internal names-custom        $txt_text_md"  
echo "$txt_text_md_md  Explain: Get info speed ipv4      $txt_text_md"
echo "$txt_text_md_md  $cmd_internal speed-ip4           $txt_text_md"  
echo "$txt_text_md_md  Explain: Show listen sockets      $txt_text_md"
echo "$txt_text_md_md  $cmd_internal sockets             $txt_text_md"  
echo "$txt_text_md_md  Explain: List last options        $txt_text_md"
echo "$txt_text_md_md  $cmd_internal logcmd              $txt_text_md"   
echo "$txt_text_md_md  Explain: modify default variables $txt_text_md"
echo "$txt_text_md_md  $cmd_internal preferences-edit    $txt_text_md"  
echo "$txt_text_md_md"
echo "$txt_text_title_md [ With optional output ]        $txt_text_md"  
echo "$txt_text_md_md  $txt_text_md"
echo "$txt_text_md_md  Example with info"        
echo "$txt_text_md_md  $cmd_internal info list           $txt_text_md"  
echo "$txt_text_md_md  Example with expert"      
echo "$txt_text_md_md  $cmd_internal txt expert          $txt_text_md"  
echo "$txt_text_md_md  Example with code ip4"    
echo "$txt_text_md_md  $cmd_internal cli code ip4        $txt_text_md"  
echo "$txt_text_md_md  Example with list rules"  
echo "$txt_text_md_md  $cmd_internal cli lsn4            $txt_text_md"  
echo "$txt_text_md_md  Example with info-nodes"       
echo "$txt_text_md_md  $cmd_internal gui info-nodes           $txt_text_md"  
echo "$txt_text_md_md  Example with web browser "
echo "$txt_text_md_md  $cmd_internal gui web kernel.org  $txt_text_md"  
echo "$txt_text_md_md  $txt_text_md "
echo "$txt_text_md_md  Launch client web firewall in silent   "
echo "$txt_text_md_md  $cmd_internal silent client-web   $txt_text_md"  
echo "$txt_text_md_md  List iptables rules with output txt    "
echo "$txt_text_md_md  $cmd_internal txt ls4             $txt_text_md"  
echo "$txt_text_md_md  List firewall with output cli whiptail "
echo "$txt_text_md_md  $cmd_internal cli-wiptail names   $txt_text_md"  
echo "$txt_text_md_md  List sockets ip with output gui yad    "
echo "$txt_text_md_md  $cmd_internal gui-yad sockets     $txt_text_md"  
echo "$txt_text_md_md  All options in text menu               "
echo "$txt_text_md_md  $cmd_internal cli-menu            $txt_text_md"  
echo "$txt_text_md_md  All options in window menu             "
echo "$txt_text_md_md  $cmd_internal gui-menu-yad        $txt_text_md"  
echo "$txt_text_md_md  All options in window roll             "
echo "$txt_text_md_md  $cmd_internal gui-roll-zenity     $txt_text_md"  
echo "$txt_text_md_md  All options in window shell             "
echo "$txt_text_md_md  $cmd_internal gui-shell-yad       $txt_text_md"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-inicial-options-examples:
##########    english: weather: show the weather with wttr.in     ##########
##########    spanish: el tiempo: muestra el tiempo con wttr.in   ##########
#### :rutina-inicial-expert-showweather:
####
####
if   [ "$cmd_first_option" == "expert-show-weather" ]; then
####
####
case $cmd_command_curl in "$NULL") 
echo "$txt_text_title_fail [ Install a curl ]"; exit ;; esac
$cmd_command_curl -s wttr.in/?3n?T
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-expert-showweather:
##########    english: tree-conf: tree configs in fwiptables     ##########
##########    spanish: tree-conf: arbol de conf en fwiptables    ##########
#### :rutina-inicial-tree-conf:
####
####
if   [ "$cmd_first_option" == "tree-conf" ];  then
####
####
if   [ "$cmd_command_tree" == "$NULL" ] ; then 
echo "$txt_text_title_fail please install tree command" ; exit ; fi
####
####
$cmd_command_tree $cmd_default_directory_necesary
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-tree-conf:
##########    english: tree-cache: tree configs in fwiptables     ##########
##########    spanish: tree-cache: arbol de conf en fwiptables    ##########
#### :rutina-inicial-tree-cache:
####
####
if   [ "$cmd_first_option" == "tree-cache" ]; then
####
####
if   [ "$cmd_command_tree" == "$NULL" ] ; then 
echo "$txt_text_title_fail please install tree command" ; exit ; fi
####
####
$cmd_command_tree $cmd_default_cache_basenecesary
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-tree-cache:
##########    english: clean-cache: clean cache        ##########
##########    spanish: clean-cache: limpia la cache    ##########
#### :rutina-inicial-clean-cache:
####
####
if   [ "$cmd_first_option" == "clean-cache" ]; then
####
####
echo "$txt_text_title_ok clean cache: $cmd_default_cache_basenecesary"
rm -R $cmd_default_cache_basenecesary/* &> /dev/null
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-clean-cache:
##########    english: notes: notes to configure iptables      ##########
##########    spanish: notes: notas para configurar iptables   ##########
#### :rutina-inicial-notes:
####
####
if [ "$cmd_first_option" == "notes" ]; then
####
####
echo "$txt_text_md                     Iptables firewall manage commands $txt_text_md" 
echo "$txt_text_md      Legacy or nft: whith one of them is sufficent $txt_text_md"   
echo "$txt_text_md    iptables-legacy: support for xtables ipv4 $txt_text_md"    
echo "$txt_text_md       iptables-nft: support for nftables ipv4 $txt_text_md" 
echo "$txt_text_md   ip6tables-legacy: support for xtables ipv6 $txt_text_md"    
echo "$txt_text_md      ip6tables-nft: support for nftables ipv6 $txt_text_md"
echo "$txt_text_md                     Firewall recomendation with full client $txt_text_md" 
echo "$txt_text_md    Client prefered: input-established $txt_text_md" 
echo "$txt_text_md    Server prefered: tinyserver-tcp tcp-ports-server $txt_text_md" 
echo "$txt_text_md                     Some options and sub-otions $txt_text_md" 
echo "$txt_text_md    shield maxtries: limit against attack per bruteforce $txt_text_md"   
echo "$txt_text_md          Blacklist: excepcionals hosts dropped in firewall $txt_text_md"   
echo "$txt_text_md          whitelist: excepcionals hosts allowed in firewall $txt_text_md" 
echo "$txt_text_md         tinyserver: client in all allowed, and servers manually $txt_text_md"
echo "$txt_text_md         miniserver: normal ports in client, and servers manually $txt_text_md"
echo "$txt_text_md  input-established: the computer is only client $txt_text_md"   
echo "$txt_text_md     output uid/gid: User and/or group with conection allowed $txt_text_md"   
echo "$txt_text_md                     Necesary Ports perhaps if use it $txt_text_md"  
echo "$txt_text_md                ntp: Port necesary to update the time and date $txt_text_md"   
echo "$txt_text_md             bootpc: Port necesary to dhcp and get ip $txt_text_md"   
echo "$txt_text_md             domain: This port is necesary to domain resolver $txt_text_md"   
echo "$txt_text_md              https: This port is necesary for udp named web html5$txt_text_md"   
echo "$txt_text_md          ipv6-icmp: Necesary protocol in ipv6 $txt_text_md"   
echo "$txt_text_md         ipv4 ports: ipv6 works too with old ipv4 ports $txt_text_md"
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
##########   english: templates-regen: templates-regen template wizard files       ##########
##########   spanish: templates-regen: templates-regenera template wizard archivos ##########
#### :rutina-inicial-templates-regen:
####
####
if [ "$cmd_first_option" == "templates-regen" ]; then
####
####
$cmd_internal template-tiny-es &> $cmd_default_tinycfg_spa
$cmd_internal template-tiny-en &> $cmd_default_tinycfg_eng
$cmd_internal template-mini-es &> $cmd_default_minicfg_spa
$cmd_internal template-mini-en &> $cmd_default_minicfg_eng
$cmd_internal template-full-es &> $cmd_default_fullcfg_spa
$cmd_internal template-full-en &> $cmd_default_fullcfg_eng
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
if [ "$cmd_first_option" == "template-tiny-es" ]; then
####
####
echo "$txt_text_title"
echo "$txt_text_title Tiny firewall esta permitido como *cliente* para todos los protocolos y puertos"
echo "$txt_text_title"
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title el iptables firewall netfilter, elige uno o dos "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title lanza xtables, vacio para si, o escribe no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title lanza nftables, vacio para si, o escribe no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title procolo ip, modificar con vacio o no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv4 o no para no "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv6 o no para no "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title puertos tcp para servidor "
echo "cfg_server_port_udp= "
echo "$txt_text_title puertos udp para servidor "
echo "$txt_text_title REGLAS GENERALES $txt_text_title "
echo "$txt_text_title Regla general en tabla "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title"
echo "$txt_text_title Tiny firewall esta permitido como *cliente* para todos los protocolos y puertos"
echo "$txt_text_title"
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
if [ "$cmd_first_option" == "template-tiny-en" ]; then
####
####
echo "$txt_text_title"
echo "$txt_text_title Tiny firewall is allowed like *client* for all protocols and ports"
echo "$txt_text_title"
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title The iptables firewall netfilter, choose one or both  "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title xtables, void for yes, or no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title neftables, void for yes, or no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title procol ip, void for yes, or no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title void for yes, or no "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title void for yes, or no "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title server ports, add with , or ranges with :"
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title tcp port to server"
echo "cfg_server_port_udp= "
echo "$txt_text_title udp port to server"
echo "$txt_text_title GENERAL RULES $txt_text_title "
echo "$txt_text_title General rules in table "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title"
echo "$txt_text_title Tiny firewall is allowed like *client* for all protocols and ports"
echo "$txt_text_title"
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
if [ "$cmd_first_option" == "template-mini-es" ]; then
####
####
echo "$txt_text_title $cmd_shortdescription from $cmd_internal version $cmd_version $txt_text_title "
echo "$txt_text_title BEGIN NECESARY $txt_text_title "
echo "$txt_text_title INICIO .......... Opciones Necesarias .......... .......... $txt_text_title "
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title el iptables firewall netfilter, elige uno o dos "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title lanza xtables, vacio para si, o escribe no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title lanza nftables, vacio para si, o escribe no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title procolo ip, modificar con vacio o no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv4 o no para no "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv6 o no para no "
echo "$txt_text_title CLIENT PORTS $txt_text_title "
echo "$txt_text_title puertos Cliente, añadir con ',' y poner rangos con : "
echo "cfg_client_port_tcp=http,https,http-alt,ssh "
echo "$txt_text_title puertos tcp para ser cliente "
echo "cfg_client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$txt_text_title puertos udp para ser cliente "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title puertos tcp para servidor "
echo "cfg_server_port_udp= "
echo "$txt_text_title puertos udp para servidor "
echo "$txt_text_title LOG TO SERVER PORTS $txt_text_title "
echo "$txt_text_title usar ULOG or LOG "
echo "cfg_config_system_log=LOG"
echo "$txt_text_title logear para puertos de Servidor, añadir con ',' y poner rangos con : "
echo "cfg_server_log_port_tcp= "
echo "$txt_text_title puertos tcp para logear servidor "
echo "cfg_server_log_port_udp= "
echo "$txt_text_title puertos udp para logear servidor "
echo "$txt_text_title ALLOW MAXTRIES SHIELD $txt_text_title )"
echo "$txt_text_title Pone un escudo para los peuertos de nueva conexion, con maximo ip cada hora "
echo "cfg_allow_shield_maxtries=no "
echo "$txt_text_title vacio para permitir un escudo con los intentos maximos de logins por ip cada hora o no "
echo "cfg_config_shield_maxtries=12 "
echo "$txt_text_title escudo con los maximos intentos de logeo a nuestro servidor por ip a cada hora "
echo "cfg_config_shield_port=22 "
echo "$txt_text_title escudo cambiando puerto de intentos ssh o varios puertos separados por comas"
echo "$txt_text_title GENERAL RULES $txt_text_title "
echo "$txt_text_title Regla general en tabla "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title Vacio para separar reglas por cada puerto o no "
echo "cfg_allow_close_log=no"
echo "$txt_text_title Vacio para guardar logs antes de cerrar o no"
echo "cfg_config_close_deny=DROP "
echo "$txt_text_title Elige cerrar denegacion con o DROP or REJECT "
echo "$txt_text_title END NECESARY $txt_text_title "
echo "$txt_text_title FINAL .......... Opciones Necesarias .......... .......... $txt_text_title "
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
if [ "$cmd_first_option" == "template-full-es" ]; then
####
####
#### english: basic options in configurations file cfg
#### spanish: basicas opciones in configuracion de archivo cfg
####
####
echo "$txt_text_title $cmd_shortdescription from $cmd_internal version $cmd_version $txt_text_title "
echo "$txt_text_title BEGIN NECESARY $txt_text_title "
echo "$txt_text_title INICIO .......... Opciones Necesarias .......... .......... $txt_text_title "
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title el iptables firewall netfilter, elige uno o dos "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title lanza xtables, vacio para si, o escribe no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title lanza nftables, vacio para si, o escribe no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title procolo ip, modificar con vacio o no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv4 o no para no "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title varcio para ejecutar el firewall con ipv6 o no para no "
echo "$txt_text_title CLIENT PORTS $txt_text_title "
echo "$txt_text_title puertos Cliente, añadir con ',' y poner rangos con : "
echo "cfg_client_port_tcp=http,https,http-alt,ssh "
echo "$txt_text_title puertos tcp para ser cliente "
echo "cfg_client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$txt_text_title puertos udp para ser cliente "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title Puertos Servidor, añadir con ',' y poner rangos con  :"
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title puertos tcp para servidor "
echo "cfg_server_port_udp= "
echo "$txt_text_title puertos udp para servidor "
echo "$txt_text_title LOG TO SERVER PORTS $txt_text_title "
echo "$txt_text_title usar ULOG or LOG "
echo "cfg_config_system_log=LOG"
echo "$txt_text_title logear para puertos de Servidor, añadir con ',' y poner rangos con : "
echo "cfg_server_log_port_tcp= "
echo "$txt_text_title puertos tcp para logear servidor "
echo "cfg_server_log_port_udp= "
echo "$txt_text_title puertos udp para logear servidor "
echo "$txt_text_title ALLOW MAXTRIES SHIELD $txt_text_title )"
echo "$txt_text_title Pone un escudo para los peuertos de nueva conexion, con maximo ip cada hora "
echo "cfg_allow_shield_maxtries=no "
echo "$txt_text_title vacio para permitir un escudo con los intentos maximos de logins por ip cada hora o no "
echo "cfg_config_shield_maxtries=12 "
echo "$txt_text_title escudo con los maximos intentos de logeo a nuestro servidor por ip a cada hora "
echo "cfg_config_shield_port=22 "
echo "$txt_text_title escudo cambiando puerto de intentos ssh o varios puertos separados por comas"
echo "$txt_text_title GENERAL RULES $txt_text_title "
echo "$txt_text_title Regla general en tabla "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title Vacio para separar reglas por cada puerto o no "
echo "cfg_allow_close_log=no"
echo "$txt_text_title Vacio para guardar logs antes de cerrar o no"
echo "cfg_config_close_deny=DROP "
echo "$txt_text_title Elige cerrar denegacion con o DROP or REJECT "
echo "$txt_text_title END NECESARY $txt_text_title "
echo "$txt_text_title FINAL .......... Opciones Necesarias .......... .......... $txt_text_title "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$txt_text_title BEGIN OPTIONAL $txt_text_title "
echo "$txt_text_title INICIO .......... Opciones opcionales .......... .......... $txt_text_title "
echo "$txt_text_title choose void or no $txt_text_title "
echo "$txt_text_title Permitir Otras Opciones, modificar con vacio o no "
echo "cfg_allow_string_dropped=no "
echo "$txt_text_title vacio para denegar cadena de cabecera, o no para no "
echo "cfg_allow_string_allowed=no "
echo "$txt_text_title vacio para permitir cadena, o no para no "
echo "cfg_allow_mac_whitelist=no "
echo "$txt_text_title vacio para permitir DIRECCION-MAC excepcionales o no "
echo "cfg_allow_mac_blacklist=no "
echo "$txt_text_title vacio para denegar DIRECCION-MAC excepcionales o no "
echo "cfg_allow_net_whitelist=no "
echo "$txt_text_title vacio para permitir HOST/IP excepcionales o no"
echo "cfg_allow_net_blacklist=no "
echo "$txt_text_title vacio para denegar HOST/IP excepcionales o no "
echo "cfg_allow_input_bandwidth=no "
echo "$txt_text_title vacio para limitar ancho de banda de entrada para todas las fuentes en kbits/sec o no "
echo "cfg_allow_output_bandwidth=no "
echo "$txt_text_title vacio limitar ancho de banda de salida en kbits/sec por cada destino o no "
echo "cfg_allow_input_maxconnect=no "
echo "$txt_text_title vacio para limitar numero de conexiones simultaneas de entrada o no "
echo "cfg_allow_output_maxconnect=no "
echo "$txt_text_title vacio para limitar numero de conexiones simultaneas de salida o no "
echo "cfg_allow_input_ping=no "
echo "$txt_text_title vacio para permitir RECIVIR PING o no "
echo "cfg_allow_output_ping=no "
echo "$txt_text_title vacio para permitir ENVIAR PING o no "
echo "cfg_allow_forward_ip4=no "
echo "$txt_text_title vacio para reenvios ip4, o no para no "
echo "cfg_allow_forward_ip6=no "
echo "$txt_text_title vacio para permitir reenvio ip6, o no "
echo "cfg_allow_gateway_ip4=no "
echo "$txt_text_title vacio para permitir gateway ip4  a otras redes, o no "
echo "cfg_allow_gateway_ip6=no "
echo "$txt_text_title vacio para hacer gateway ip6 a otras redes o no "
echo "cfg_allow_dmz_ip4=no "
echo "$txt_text_title vacio para permitir dmz ip4  a una host local, o no "
echo "cfg_allow_dmz_ip6=no "
echo "$txt_text_title vacio para hacer dmz ip6 a una host local o no "
echo "cfg_allow_input_all=no "
echo "$txt_text_title vacio, reglas para permitir toda entrada o no "
echo "cfg_allow_output_all=no "
echo "$txt_text_title vacio, reglas para permitir toda salida o no "
echo "cfg_allow_input_state=no "
echo "$txt_text_title Estado de entrada selectivo con vacio o no "
echo "cfg_allow_output_state=no "
echo "$txt_text_title Estado de salida selectivo con vacio o no "
echo "cfg_allow_output_uid=no"
echo "$txt_text_title vacio permite salida de paquetes de un USUARIO excepcional o no "
echo "cfg_allow_output_gid=no"
echo "$txt_text_title vacio permite salida de paquetes de un GRUPO excepcional o no "
echo "cfg_allow_others_protocols=no "
echo "$txt_text_title vacio para permitir otro PROTOCOLO-IP excepcional o no "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$txt_text_title Begin Variables $txt_text_title.......... .......... $txt_text_title.......... "
echo "$txt_text_title Rellena Variables "
echo "$txt_text_title Options "
echo "$txt_text_title Otras Opciones, añadir con , y poner rangos con : "
echo "cfg_config_string_denied=.fb.com,.facebook.com,xxx.html "
echo "$txt_text_title bloquea conexion con cadena de cabecera, si hay varios, seperados por comas "
echo "cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net "
echo "$txt_text_title permite conexion con cadena de cabecera, si hay varios, seperados por comas "
echo "cfg_config_mac_whitelist=d4:12:43:01:36:2e "
echo "$txt_text_title permitir estos MAC-ADDRESS excepcionales "
echo "cfg_config_mac_blacklist=d4:12:43:01:36:2e "
echo "$txt_text_title deniega estos MAC-ADDRESS excepcionales "
echo "cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org "
echo "$txt_text_title permitir estos HOST/IP excepcionales "
echo "cfg_config_net_blacklist=facebook.com,www.facebook.com "
echo "$txt_text_title deniega estos HOST/IP excepcionales "
echo "cfg_config_input_bandwidth=12512 "
echo "$txt_text_title maximo entrada de ancho de banda en kbit/sec para todos "
echo "cfg_config_output_bandwidth=512 "
echo "$txt_text_title maximo salida de ancho de banda en kbits/sec para cada ip "
echo "cfg_config_input_maxconnect=72 "
echo "$txt_text_title maximo numero de conexiones simultaneas de entrada "
echo "cfg_config_output_maxconnect=72 "
echo "$txt_text_title maximo numero de conexiones simultaneas de salida "
echo "cfg_config_gateway_ip4=0/0"
echo "$txt_text_title servidor puerta de enlace para tu red. Ejemplo: 192.168.0.0/24"
echo "cfg_config_gateway_ip6=::/0"
echo "$txt_text_title server gateway for lan example: ::1"
echo "cfg_config_dmz_ip4=192.168.1.7 "
echo "$txt_text_title servidor ip lan para otras redes esternas, nat prerouting "
echo "cfg_config_dmz_ip6=d4:12:43:01:36:2e "
echo "$txt_text_title servidor ip lan para otras redes esternas, nat prerouting "
echo "cfg_config_input_state=new,related,established "
echo "$txt_text_title modificar con vacio o new,related,established,untracked,invalid "
echo "cfg_config_output_state=new,related,established "
echo "$txt_text_title modificar con vacio o new,related,established,untracked,invalid "
echo "cfg_config_output_uid=root "
echo "$txt_text_title permite salida de paquetes de este USUARIO excepcional "
echo "cfg_config_output_gid=root "
echo "$txt_text_title permite salida de paquetes de este GRUPO excepcional "
echo "cfg_config_others_protocols=icmp,igmp "
echo "$txt_text_title permitir otros protocolos desde /etc/protocols "
echo "$txt_text_title NET CLIENT AND NET SERVER $txt_text_title "
echo "$txt_text_title Red para conectar como cliente o server "
echo "cfg_config_ipv4_netclient=0/0 "
echo "$txt_text_title la red cual cliente ipv4, todos es 0/0 "
echo "cfg_config_ipv4_netserver=0/0 "
echo "$txt_text_title la red cual servidor ipv4, todos es 0/0 "
echo "cfg_config_ipv6_netclient=::/0 "
echo "$txt_text_title la red cual cliente ipv6, todos es ::/0 "
echo "cfg_config_ipv6_netserver=::/0 "
echo "$txt_text_title la red cual servidor ipv6, todos es ::/0 "
echo "$txt_text_title $txt_text_title "
echo "$txt_text_title FINAL .......... Opciones opcionales .......... .......... $txt_text_title "
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
if [ "$cmd_first_option" == "template-mini-en" ]; then
####
####
echo "$txt_text_title $cmd_shortdescription from $cmd_internal version $cmd_version $txt_text_title "
echo "$txt_text_title BEGIN NECESARY $txt_text_title "
echo "$txt_text_title  .......... BEGIN Necesary options .......... .......... $txt_text_title "
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title the iptables firewall netfilter, choose one or two "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title launch xtables, void to yes or type no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title launch nftables, void to yes or type no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title ip protocol, modify with void or no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title void to config firewall with ipv4 or no to dont configure ipv4 "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title void to config firewall with ipv6 or no to dont configure ipv6 "
echo "$txt_text_title CLIENT PORTS $txt_text_title "
echo "$txt_text_title Client ports, add with ',' and join ranges with  : "
echo "cfg_client_port_tcp=http,https,http-alt,ssh "
echo "$txt_text_title tcp ports for client "
echo "cfg_client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$txt_text_title udp ports for client "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title Server ports, add with ',' and join ranges with : "
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title tcp ports for server "
echo "cfg_server_port_udp= "
echo "$txt_text_title udp ports for server "
echo "$txt_text_title LOG TO SERVER PORTS $txt_text_title "
echo "$txt_text_title or ULOG or LOG "
echo "cfg_config_system_log=LOG"
echo "$txt_text_title Log to server ports, add with ',' and join ranges with : "
echo "cfg_server_log_port_tcp= "
echo "$txt_text_title the tcp ports to log server "
echo "cfg_server_log_port_udp= "
echo "$txt_text_title the udp ports to log server "
echo "$txt_text_title ALLOW MAXTRIES SHIELD $txt_text_title "
echo "$txt_text_title Put one shield for ports to new connecting, with max ip to each hour "
echo "cfg_allow_shield_maxtries=no "
echo "$txt_text_title void to allow one shield with max tries login in ssh for ip to each hour or no "
echo "cfg_config_shield_maxtries=12 "
echo "$txt_text_title modify shield with number max of tries to log in us ssh server for ip at each hour "
echo "cfg_config_shield_port=22 "
echo "$txt_text_title modify shield ssh chaging maxtries port ssh o several ports with comma separate "
echo "$txt_text_title GENERAL RULES $txt_text_title "
echo "$txt_text_title General rules in table "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title Void to separate the rules for each port or no "
echo "cfg_allow_close_log=no"
echo "$txt_text_title Void to log save before close rule or no"
echo "cfg_config_close_deny=DROP "
echo "$txt_text_title choose close deny with or DROP or REJECT "
echo "$txt_text_title END NECESARY $txt_text_title "
echo "$txt_text_title .......... END Necesary options .......... .......... $txt_text_title "
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
if [ "$cmd_first_option" == "template-full-en" ]; then
####
####
echo "$txt_text_title $cmd_shortdescription from $cmd_internal version $cmd_version $txt_text_title "
echo "$txt_text_title BEGIN NECESARY $txt_text_title "
echo "$txt_text_title  .......... BEGIN Necesary options .......... .......... $txt_text_title "
echo "$txt_text_title NETFILTER $txt_text_title "
echo "$txt_text_title the iptables firewall netfilter, choose one or two "
echo "cfg_allow_use_legacy=no "
echo "$txt_text_title launch xtables, void to yes or type no "
echo "cfg_allow_use_nft= "
echo "$txt_text_title launch nftables, void to yes or type no "
echo "$txt_text_title PROTOCOL IP $txt_text_title "
echo "$txt_text_title ip protocol, modify with void or no "
echo "cfg_allow_use_ipv4= "
echo "$txt_text_title void to config firewall with ipv4 or no to dont configure ipv4 "
echo "cfg_allow_use_ipv6= "
echo "$txt_text_title void to config firewall with ipv6 or no to dont configure ipv6 "
echo "$txt_text_title CLIENT PORTS $txt_text_title "
echo "$txt_text_title Client ports, add with ',' and join ranges with  : "
echo "cfg_client_port_tcp=http,https,http-alt,ssh "
echo "$txt_text_title tcp ports for client "
echo "cfg_client_port_udp=domain,domain-s,bootpc,bootps,ntp,https "
echo "$txt_text_title udp ports for client "
echo "$txt_text_title SERVER PORTS $txt_text_title "
echo "$txt_text_title Server ports, add with ',' and join ranges with : "
echo "cfg_server_port_tcp=ssh "
echo "$txt_text_title tcp ports for server "
echo "cfg_server_port_udp= "
echo "$txt_text_title udp ports for server "
echo "$txt_text_title LOG TO SERVER PORTS $txt_text_title "
echo "$txt_text_title or ULOG or LOG "
echo "cfg_config_system_log=LOG"
echo "$txt_text_title Log to server ports, add with ',' and join ranges with : "
echo "cfg_server_log_port_tcp= "
echo "$txt_text_title the tcp ports to log server "
echo "cfg_server_log_port_udp= "
echo "$txt_text_title the udp ports to log server "
echo "$txt_text_title ALLOW MAXTRIES SHIELD $txt_text_title "
echo "$txt_text_title Put one shield for ports to new connecting, with max ip to each hour "
echo "cfg_allow_shield_maxtries=no "
echo "$txt_text_title void to allow one shield with max tries login in ssh for ip to each hour or no "
echo "cfg_config_shield_maxtries=12 "
echo "$txt_text_title modify shield with number max of tries to log in us ssh server for ip at each hour "
echo "cfg_config_shield_port=22 "
echo "$txt_text_title modify shield ssh chaging maxtries port ssh o several ports with comma separate "
echo "$txt_text_title GENERAL RULES $txt_text_title "
echo "$txt_text_title General rules in table "
echo "cfg_allow_separate_rules= "
echo "$txt_text_title Void to separate the rules for each port or no "
echo "cfg_allow_close_log=no"
echo "$txt_text_title Void to log save before close rule or no"
echo "cfg_config_close_deny=DROP "
echo "$txt_text_title choose close deny with or DROP or REJECT "
echo "$txt_text_title END NECESARY $txt_text_title "
echo "$txt_text_title .......... END Necesary options .......... .......... $txt_text_title "
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$txt_text_title BEGIN OPTIONAL $txt_text_title "
echo "$txt_text_title .......... BEGIN Optional options .......... .......... $txt_text_title "
echo "$txt_text_title choose void or no $txt_text_title "
echo "$txt_text_title Allow Other Options,  modify with void, or no "
echo "cfg_allow_string_dropped=no "
echo "$txt_text_title void to if drop string, or no to no "
echo "cfg_allow_string_allowed=no "
echo "$txt_text_title void to if allow string, or no to no "
echo "cfg_allow_mac_whitelist=no "
echo "$txt_text_title void to allow some exceptional MAC-ADDRESS or no "
echo "cfg_allow_mac_blacklist=no "
echo "$txt_text_title void to drop some excepcional MAC-ADDRESS or no "
echo "cfg_allow_net_whitelist=no "
echo "$txt_text_title void to allow some exceptional HOST/IP or no "
echo "cfg_allow_net_blacklist=no "
echo "$txt_text_title void to drop some excepcional HOST/IP or no "
echo "cfg_allow_input_bandwidth=no "
echo "$txt_text_title void to limit bandwidth input in kbits/sec for all sources or no "
echo "cfg_allow_output_bandwidth=no "
echo "$txt_text_title void to limit bandwidth output in kbits/sec for each destination or no "
echo "cfg_allow_input_maxconnect=no "
echo "$txt_text_title void to limit max number for input simultaneous connections or no "
echo "cfg_allow_output_maxconnect=no "
echo "$txt_text_title void to limit max number for output simultaneous connections or no "
echo "cfg_allow_input_ping=no "
echo "$txt_text_title void to allow RECIVE PING or no "
echo "cfg_allow_output_ping=no "
echo "$txt_text_title void to allow SEND PING or no "
echo "cfg_allow_forward_ip4=no "
echo "$txt_text_title void to yes to forward ip4, or no to no "
echo "cfg_allow_forward_ip6=no "
echo "$txt_text_title void to allow ip forward ip6 or no "
echo "cfg_allow_gateway_ip4=no "
echo "$txt_text_title void to allow gateway ip4 to others nets or no "
echo "cfg_allow_gateway_ip6=no "
echo "$txt_text_title void to allow gateway ip6 to other nets or no "
echo "cfg_allow_dmz_ip4=no "
echo "$txt_text_title void to allow dmz ip4 to one host local or no "
echo "cfg_allow_dmz_ip6=no "
echo "$txt_text_title void to allow dmz ip6 to one host local or no "
echo "cfg_allow_input_all=no "
echo "$txt_text_title void when the rules are to allow input to all or no "
echo "cfg_allow_output_all=no "
echo "$txt_text_title void when the rules are to allow output to all or no "
echo "cfg_allow_input_state=no "
echo "$txt_text_title Selective Input state with void or no "
echo "cfg_allow_output_state=no "
echo "$txt_text_title Selective Output state with void or no "
echo "cfg_allow_output_uid=no "
echo "$txt_text_title void to allow excepcional USER or no "
echo "cfg_allow_output_gid=no "
echo "$txt_text_title void to allow excepcional GROUP or no "
echo "cfg_allow_others_protocols=no "
echo "$txt_text_title void to allow other POTOCOL-IP excepcional or no"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
echo "$txt_text_title Begin Variables $txt_text_title.......... .......... $txt_text_title.......... "
echo "$txt_text_title Fill Variables "
echo "$txt_text_title Options "
echo "$txt_text_title Other Options, add with , and join ranges with : "
echo "cfg_config_string_denied=.fb.com,.facebook.com,xxx.html "
echo "$txt_text_title drop connection with header string, if several, comma separate "
echo "cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net "
echo "$txt_text_title allow connection with header string, if several, comma separate "
echo "cfg_config_input_bandwidth=12512 "
echo "$txt_text_title max input bandwidth in kbits/sec for all "
echo "cfg_config_output_bandwidth=512 "
echo "$txt_text_title max output bandwidh in kbits/sec for each ip "
echo "cfg_config_input_maxconnect=72 "
echo "$txt_text_title max number for input simultaneous connections "
echo "cfg_config_output_maxconnect=72 "
echo "$txt_text_title max number for output simultaneous connections "
echo "cfg_config_mac_whitelist=d4:12:43:01:36:2e "
echo "$txt_text_title allow this excepcitonal MAC-ADRESS "
echo "cfg_config_mac_blacklist=d4:12:43:01:36:2e "
echo "$txt_text_title drop this excepcional MAC-ADDRESS "
echo "cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org "
echo "$txt_text_title allow this excepcitonal HOST/IP "
echo "cfg_config_net_blacklist=facebook.com,www.facebook.com "
echo "$txt_text_title drop this excepcional HOST/IP )"
echo "cfg_config_gateway_ip4=0/0"
echo "$txt_text_title server gateway for lan example: 192.168.0.0/24"
echo "cfg_config_gateway_ip6=::/0"
echo "$txt_text_title server gateway for lan example: ::1"
echo "cfg_config_dmz_ip4=192.168.1.7 "
echo "$txt_text_title ip server ip lan to other external nets, nat prerouting "
echo "cfg_config_dmz_ip6=d4:12:43:01:36:2e "
echo "$txt_text_title ip server ip lan to other external nets, nat prerouting "
echo "cfg_config_input_state=new,related,established "
echo "$txt_text_title void for all or new,related,established,untracked,invalid "
echo "cfg_config_output_state=new,related,established "
echo "$txt_text_title void for all or new,related,established,untracked,invalid "
echo "cfg_config_output_uid=root "
echo "$txt_text_title allow out packages excepcional from this USER excepcional "
echo "cfg_config_output_gid=root "
echo "$txt_text_title allow out packages excepcional from this GROUP excepcional "
echo "cfg_config_others_protocols=icmp,igmp "
echo "$txt_text_title allow others protocols from /etc/protocolos "
echo "$txt_text_title NET CLIENT AND NET SERVER $txt_text_title "
echo "$txt_text_title Net to connect likes client or server "
echo "cfg_config_ipv4_netclient=0/0 "
echo "$txt_text_title the net to client ipv4, all is 0/0 "
echo "cfg_config_ipv4_netserver=0/0 "
echo "$txt_text_title the net to server ipv4, all is 0/0 "
echo "cfg_config_ipv6_netclient=::/0 "
echo "$txt_text_title the net to client ipv6, all is ::/0 "
echo "cfg_config_ipv6_netserver=::/0 "
echo "$txt_text_title the net to server ipv6, all is ::/0 "
echo "$txt_text_title $txt_text_title "
echo "$txt_text_title .......... END Optional options .......... .......... $txt_text_title"
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
if [ "$cmd_first_option" == "autosave" ] && [ "$cfg_allow_autosave" == "$NULL" ]; then 
####
####
echo "$txt_text_title [ autosave ] [ firewall saved ] [ autosave-fwiptables ]" ;
$cmd_internal save autosave-fwiptables &> /dev/null
####
####
exit; fi
####
####
#### :rutina-final-autosave:
##########    english: options: wellcome with semi help    ##########
##########    spanish: options: bienvenida con semi ayuda  ##########
#### :rutina-inicial-options:
####
####
if [ "$cmd_first_option" == "options" ]; then 
####
####
echo "$txt_text_md $cmd_internal [optional-output] first_option [second_option] $txt_text_md"
echo "$txt_text_title    <optional-output> $txt_text_md"
echo "$txt_text_md [ t|txt n|narrowtxt l|log c|cli g|gui p|pdf s|silent i|info d|dev ] $txt_text_md"
echo "$txt_text_md [ cli-dialog cli-whiptail cli-menu cli-menu-compact ] $txt_text_md"
echo "$txt_text_md [ cli-menu-dialog cli-menu-compact-dialog  ] $txt_text_md"
echo "$txt_text_md [ cli-menu-whiptail cli-menu-compact-whiptail ] $txt_text_md"
echo "$txt_text_md [ gui-zenity gui-yad gui-menu gui-menu-zenity gui-menu-yad ] $txt_text_md"
echo "$txt_text_md [ gui-roll-zenity gui-shell gui-shell-zenity gui-shell-yad ] $txt_text_md"
echo "$txt_text_title    <firewall-listconceptual> $txt_text_md"
echo "$txt_text_md ls4 ls6 status list-filter4 list-filter6 list-nat4 list-nat6 $txt_text_md"
echo "$txt_text_md list-raw4 list-raw6 list-mangle4 list-mangle6 list-security4 $txt_text_md"
echo "$txt_text_md list-security6 list-ebtables list-arptables list-alltables $txt_text_md"
echo "$txt_text_title    <firewall-listnumeral> $txt_text_md"
echo "$txt_text_md lsn4 lsn6 statusn listn-filter4 listn-filter6 listn-nat4 $txt_text_md"
echo "$txt_text_md listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6 $txt_text_md"
echo "$txt_text_md listn-security4 listn-security6 listn-alltables $txt_text_md"
echo "$txt_text_title    <firewall-wallcontrol> $txt_text_md"
echo "$txt_text_md stop continue reset show save load names actual eraserules $txt_text_md"
echo "$txt_text_md eraserules4 eraserules6 without-connection input-permisive $txt_text_md"
echo "$txt_text_md input-established wizard-tiny wizard-mini wizard-full $txt_text_md"
echo "$txt_text_md tinyserver-tcp tinyserver-udp miniserver-tcp miniserver-udp $txt_text_md"
echo "$txt_text_md add-whitelist4 add-whitelist6 add-blacklist4 add-blacklist6 $txt_text_md" 
echo "$txt_text_title    <firewall-wallcustom> $txt_text_md"
echo "$txt_text_md new-full-custom nueva-completa-custom new-mini-custom $txt_text_md"
echo "$txt_text_md nueva-mini-custom new-tiny-custom nueva-diminuta-custom $txt_text_md"
echo "$txt_text_md clone-wallsystem load-custom loadtiny-custom $txt_text_md"
echo "$txt_text_md show-custom modify-custom del-custom names-custom $txt_text_md"
echo "$txt_text_title    <firewall-wallsystem> $txt_text_md"
echo "$txt_text_md client-basic client-web client-ssh client-telnet client-ipp $txt_text_md"
echo "$txt_text_md client-irc client-git client-vnc client-news client-vpn $txt_text_md"
echo "$txt_text_md client-torrent client-vpn client-ftp client-proxy client-mail $txt_text_md"
echo "$txt_text_md client-tor game-widelands games-udp games-shooter game-wesnoth $txt_text_md"
echo "$txt_text_md game-minetest game-freeciv lan-tor lan-vpn shield-ssh server-ssh $txt_text_md"
echo "$txt_text_md server-telnet server-irc server-vnc server-print server-webserver $txt_text_md"
echo "$txt_text_md server-lamp server-news server-ftp server-mail server-teamspeak $txt_text_md"
echo "$txt_text_md server-mumble server-gateway server-sql server-samba server-proxy $txt_text_md"
echo "$txt_text_md server-asterisk client-uid-root client-gid-users client-gid-net  $txt_text_md"
echo "$txt_text_title    <firewall-netsystem> $txt_text_md"
echo "$txt_text_md preferences-edit alias-edit options info-options usernotes$txt_text_md"
echo "$txt_text_md cat-logcmd tree-pdf tree-log tree-conf tree-cache clean-cache $txt_text_md"
echo "$txt_text_md ip4 ip6 route4 route6 info-ip4 info-ip6 info-nodes sockets $txt_text_md"
echo "$txt_text_md lsof free ip-forward utils date resolve speed-ip4 speed-ip6 $txt_text_md"
echo "$txt_text_md log-stat web intro depends uninstall install upgrade notes $txt_text_md"
echo "$txt_text_md variables examples info code expert donate about version $txt_text_md"
echo "$txt_text_md license-lgpl-v2 license-gpl-v2 $txt_text_md"
####
####  if expert commands
####
if [ "$cfg_allow_expert_commands" == "no" ]
then echo "$txt_text_md_md $txt_text_info \
$cmd_name $cmd_version with expert deactived $txt_text_md"
else echo "$txt_text_md_md $txt_text_info \
$cmd_name $cmd_version with expert actived $txt_text_md"
fi
####
####
if [ "$cfg_config_show_variables"="yes" ]; then
$cmd_internal variables &> $cmd_file_output_var
echo "$txt_text_title_file [$cmd_file_output_var]"
fi
####
####
exit; fi
####
####
#### :rutina-final-options:
##########     english: code: source from loop     ##########
##########     spanish: code: fuente de la rutina  ##########
#### :rutina-inicial-code:
####
####
if   [ "$cmd_first_option" == "code" ];  then
####
####
echo "$txt_text_title_info  [ Show source code for each option ] "
echo "$txt_text_title_info [ code ] [ show source code for options from $cmd_internal ]"
code_error="$txt_text_title_info [ Usage ] [ $cmd_internal code option_choosed ]"
if [ "$cmd_second_option" == "$NULL" ]; then echo "$code_error"
salida_code="$($cmd_command_cat  $cmd_internal | $cmd_command_grep -i  rutina-inicial \
| $cmd_command_grep -i -v $cmd_command_cat  | $cmd_command_sed -s s/####\ :rutina-inicial-//g | \
sort | $cmd_command_sed -s s/://g )"
echo $salida_code
exit ; fi
value_first="$($cmd_command_cat  -n $cmd_internal | $cmd_command_grep  :rutina-inicial-$2: | \
$cmd_command_cut -d "#" -f 1 | head -1)"
value_second="$($cmd_command_cat  -n $cmd_internal | $cmd_command_grep :rutina-final-$2:  | \
$cmd_command_cut -d "#" -f 1 | head -1)"
value_count="$(("$value_second"-"$value_first+1"))"
if [ ! -n "$value_first" ];   then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_second" ];  then echo; echo "$code_error" ; exit ; fi
if [ ! -n "$value_count" ];   then echo; echo "$code_error" ; exit ; fi
echo "$txt_text_title [ code ] [ option: "$cmd_second_option" ] [ show $value_count lines ] \
[ from the "$value_first" line number to "$value_second" line number ]"
$cmd_command_cat  $cmd_internal | head -n $value_second | tail -n $value_count
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
if [ "$cmd_first_option" == "names-custom" ];  then
####
####
echo "$txt_text_title_info [ List configs cfg ] "
echo "$txt_text_title_info [ list configs files in cfg format ]"
echo "$txt_text_title_info [ folder ] [ $cmd_default_directory_custom ]"
echo "$txt_text_title"
$cmd_command_tree $cmd_default_directory_custom
echo "$txt_text_title"
echo "$txt_text_title [ OK CFG FILES NAMES ] [ Use: $cmd_internal load-custom file ]"
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
if [ "$cmd_first_option" == "text-pause" ]; then
####
####
read -p '##### ok ##### Press [enter] to continue now with the cli-menu ##### '
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
if   [ "$cmd_first_option" == "free" ]; then
####
####
echo "$txt_text_title_info [ freedom from innecesary ram ] [ free md ]"
case $cmd_command_tee in "$NULL")
echo "$txt_text_md $txt_text_fail [ Install tee command ]"; exit ;; esac
####
####
echo "$txt_text_title_info Actual Memory"
free -hw 
####
####
echo "$txt_text_title_info With: echo 3 over /proc/sys/vm/drop_caches"
echo "$txt_text_title_info Now with New Memory ram freedom .. Actual memory now .."
echo 3 | $cmd_command_tee /proc/sys/vm/drop_caches &> /dev/null
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
if   [ "$cmd_first_option" == "firewall-wallcontrol" ]; then
####
####
echo "$txt_text_title | firewall-wallcontrol | $cmd_internal firewall-wallcontrol | $txt_text_md"
echo "$txt_text_md_md stop . remove the rules iptables, and save it to then if continue $txt_text_md"
echo "$txt_text_md_md continue. reset and load latest rules iptables loaded $txt_text_md"
echo "$txt_text_md_md load . reset rules iptables actually $txt_text_md"
echo "$txt_text_md_md actual . show the rules iptables from actually $txt_text_md"
echo "$txt_text_md_md show . show the rules iptables from selected file $txt_text_md"
echo "$txt_text_md_md load . reset and load new rules iptables from selected file $txt_text_md"
echo "$txt_text_md_md save . save in the file selected the rules iptables actually $txt_text_md"
echo "$txt_text_md_md all-names . list filenames saved in the iptables rules $txt_text_md"
echo "$txt_text_md_md eraserules . remove all firewall rules: ipv4,ipv6,ebtables,arptables $txt_text_md"
echo "$txt_text_md_md eraserules4 . remove ipv4 firewall rules $txt_text_md"
echo "$txt_text_md_md eraserules6 . remove ipv6 firewall rules $txt_text_md"
echo "$txt_text_md_md wizard-tiny . launch a one tiny wizard to run iptables rules $txt_text_md"
echo "$txt_text_md_md wizard-mini . launch a one mini wizard to run iptables rules $txt_text_md"
echo "$txt_text_md_md wizard-full . launch a one full wizard to run iptables rules $txt_text_md"
echo "$txt_text_md_md without-connection . launch a one firewall only for localhost $txt_text_md"
echo "$txt_text_md_md input-permisive . launch a one firewall with all permisive $txt_text_md"
echo "$txt_text_md_md input-established . launch a one firewall with input related,stablished $txt_text_md"
echo "$txt_text_md_md tinyserver-tcp . launch a one firewall with server ports tcp [ with optional host clients ] $txt_text_md"
echo "$txt_text_md_md tinyserver-udp . launch a one firewall with server ports udp [ with optional host clients ] $txt_text_md"
echo "$txt_text_md_md miniserver-tcp . launch a one firewall with server ports tcp [ with optional host clients ] $txt_text_md"
echo "$txt_text_md_md miniserver-udp . launch a one firewall with server ports udp [ with optional host clients ] $txt_text_md"
echo "$txt_text_md_md add-whitelist4 . add host ip4 to allowed, at several comma seperated $txt_text_md"
echo "$txt_text_md_md add-whitelist6 . add host ip6 to allowed, at several comma seperated $txt_text_md"
echo "$txt_text_md_md add-blacklist4 . add host ip4 to droped, at several comma seperated $txt_text_md"
echo "$txt_text_md_md add-blacklist6 . add host ip6 to droped, at several comma seperated $txt_text_md"
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
if   [ "$cmd_first_option" == "firewall-listconceptual" ]; then
####
####
echo "$txt_text_title | firewall-listconceptual | $cmd_internal firewall-listconceptual $txt_text_md"
echo "$txt_text_md_md ls4 . list filter rules ipv4 $txt_text_md"
echo "$txt_text_md_md ls6 . list filter rules ipv6 $txt_text_md"
echo "$txt_text_md_md list4 . list filter rules ipv4 $txt_text_md"
echo "$txt_text_md_md list6 . list filter rules ipv6 $txt_text_md"
echo "$txt_text_md_md status . list filter rules ipv4 , rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-alltables . list all tables for rules ipv4, rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-filter4 . list filter rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-filter6 . list filter rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-nat4 . list nat rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-nat6 . list nat rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-raw4 . list raw rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-raw6 . list raw rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-mangle4 . list mangle rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-mangle6 . list mangle rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-security4 . list security rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-security6 . list security rules ipv6 $txt_text_md"
echo "$txt_text_md_md list-ebtables . list ebtables rules ipv4 $txt_text_md"
echo "$txt_text_md_md list-arptables . list arptables rules ipv6 $txt_text_md"
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
if   [ "$cmd_first_option" == "firewall-listnumeral" ]; then
####
####
echo "$txt_text_title | firewall-listnumeral | $cmd_internal firewall-listnumeral | $txt_text_md"
echo "$txt_text_md_md lsn4 . list filter rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md lsn6 . list filter rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn4 . list filter rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn6 . list filter rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md statusn . list filter rules ipv4 , rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-alltables . list all tables for rules ipv4, rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-filter4 . list filter rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn-filter6 . list filter rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-nat4 . list nat rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn-nat6 . list nat rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-raw4 . list raw rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn-raw6 . list raw rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-mangle4 . list mangle rules ipv4 with numbers $txt_text_md" 
echo "$txt_text_md_md listn-mangle6 . list mangle rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-security4 . list security rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn-security6 . list security rules ipv6 with numbers $txt_text_md"
echo "$txt_text_md_md listn-ebtables . list ebtables rules ipv4 with numbers $txt_text_md"
echo "$txt_text_md_md listn-arptables . list arptables rules ipv6 with numbers $txt_text_md"
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
if   [ "$cmd_first_option" == "firewall-wallcustom" ]; then
####
####
echo "$txt_text_title | firewall-wallcustom | $cmd_internal firewall-wallcustom | $txt_text_md"
echo "$txt_text_md_md new-full-custom . create new full config in english $txt_text_md"
echo "$txt_text_md_md new-mini-custom . create new mini config in english $txt_text_md"
echo "$txt_text_md_md new-tiny-custom . create new tiny config in english $txt_text_md"
echo "$txt_text_md_md nueva-completa-custom . create new full config in spanish $txt_text_md" 
echo "$txt_text_md_md nueva-mini-custom . create new full config in spanish $txt_text_md"
echo "$txt_text_md_md nueva-diminuta-custom . create new tiny config in spanish $txt_text_md"
echo "$txt_text_md_md tinyserver-tcp . all client and selected servers tcp in command $txt_text_md"
echo "$txt_text_md_md tinyserver-udp . all client and selected servers udp in command $txt_text_md"
echo "$txt_text_md_md miniserver-tcp . usual clients and selected servers tcp in command $txt_text_md"
echo "$txt_text_md_md miniserver-udp . usual clients and selected servers udp in command $txt_text_md"
echo "$txt_text_md_md clone-wallsystem . clone a static firewall predesignated $txt_text_md"
echo "$txt_text_md_md show-custom . show config-file choosed $txt_text_md"
echo "$txt_text_md_md modify-custom . modify config-file choosed $txt_text_md"
echo "$txt_text_md_md load-custom . launch a one one-file saved custom $txt_text_md" 
echo "$txt_text_md_md del-custom . delete config-file choosed $txt_text_md"
echo "$txt_text_md_md names-custom . show the names for all config-files $txt_text_md"
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
if   [ "$cmd_first_option" == "firewall-wallsystem" ]; then
####
####
echo "$txt_text_title | firewall-wallsystem | $cmd_internal firewall-wallsystem | $txt_text_md"
echo "$txt_text_md_md client-basic . launch a one firewall basic client $txt_text_md"
echo "$txt_text_md_md client-web . launch a one firewall web client $txt_text_md"
echo "$txt_text_md_md client-ssh . launch a one firewall ssh client $txt_text_md"
echo "$txt_text_md_md client-telnet . launch a one firewall telnet client $txt_text_md" 
echo "$txt_text_md_md client-git . launch a one firewall git client $txt_text_md"
echo "$txt_text_md_md client-ipp . launch a one firewall ipp client $txt_text_md"
echo "$txt_text_md_md client-vnc . launch a one firewall vnc client $txt_text_md"
echo "$txt_text_md_md client-mail . launch a one firewall mail client $txt_text_md"
echo "$txt_text_md_md client-news . launch a one firewall news client $txt_text_md"
echo "$txt_text_md_md client-vpn . launch a one firewall vpn client $txt_text_md"
echo "$txt_text_md_md client-proxy . launch a one firewall proxy client $txt_text_md"
echo "$txt_text_md_md games-udp . launch a one firewall udp client $txt_text_md"
echo "$txt_text_md_md games-shooter . launch a one firewall shooter client $txt_text_md"
echo "$txt_text_md_md games-wesnoth . launch a one firewall wesnoth client $txt_text_md"
echo "$txt_text_md_md games-minetest . launch a one firewall minetest client $txt_text_md"
echo "$txt_text_md_md games-freeciv . launch a one firewall freeciv client $txt_text_md"
echo "$txt_text_md_md lan-tor . launch a one firewall only tor client $txt_text_md"
echo "$txt_text_md_md lan-vpn . launch a one firewall only vpn client $txt_text_md"
echo "$txt_text_md_md shield-ssh . launch a one firewall basic server with shield ssh $txt_text_md"
echo "$txt_text_md_md server-ssh . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-telnet . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-samba . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-vnc . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-webserver . launch a one firewall basic server $txt_text_md" 
echo "$txt_text_md_md server-print . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-lamp . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-news . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-ftp . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-mail . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-teamspeak . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-mumble . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-sql . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-asterisk . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-domain . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-proxy . launch a one firewall basic server $txt_text_md"
echo "$txt_text_md_md server-gateway . launch a one firewall nat gateway and web/ssh server $txt_text_md"
echo "$txt_text_md_md client-uid-root . launch a one firewall for only allow at user root $txt_text_md"
echo "$txt_text_md_md client-gid-users . launch a one firewall for only allow at group users $txt_text_md"
echo "$txt_text_md_md client-gid-net . launch a one firewall for only allow at group net $txt_text_md"
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
if   [ "$cmd_first_option" == "firewall-netsystem" ]; then
####
####
echo "$txt_text_title | firewall-netsystem | $cmd_internal firewall-netsystem | $txt_text_md"
echo "$txt_text_md_md preferences-read . show the preferences $txt_text_md"
echo "$txt_text_md_md preferences-edit . modify the preferences $txt_text_md"
echo "$txt_text_md_md preferences-regen . recover the initials preferences $txt_text_md"
echo "$txt_text_md_md alias-read . read alias in first option $txt_text_md"
echo "$txt_text_md_md alias-edit . configure alias in first option $txt_text_md"
echo "$txt_text_md_md alias-regen . recover initials alias in first option $txt_text_md"
echo "$txt_text_md_md options . list options $txt_text_md"
echo "$txt_text_md_md info-options . list details for all options $txt_text_md"
echo "$txt_text_md_md info . details from one first option from one pattern $txt_text_md"
echo "$txt_text_md_md tree-log . show the result for the commands save with -l|-log $txt_text_md"
echo "$txt_text_md_md cat-logcmd . list the commands launched $txt_text_md"
echo "$txt_text_md_md ip . show details from connection ipv4, ipv6 $txt_text_md"
echo "$txt_text_md_md ip4 . show ip address from connection ipv4 $txt_text_md"
echo "$txt_text_md_md ip6 . show ip address from connection ipv6 $txt_text_md"
echo "$txt_text_md_md ip4 . show ip route from connection ipv4 $txt_text_md"
echo "$txt_text_md_md ip6 . show ip route from connection ipv6 $txt_text_md"
echo "$txt_text_md_md info-ip4 . show details from connection ipv4 $txt_text_md"
echo "$txt_text_md_md info-ip6 . show details from connection ipv6 $txt_text_md"
echo "$txt_text_md_md address . show details from connection ipv4, ipv6 $txt_text_md"
echo "$txt_text_md_md speed-ip4 . calculate bandwith ipv4 $txt_text_md"
echo "$txt_text_md_md speed-ip6 . calculate bandwith ipv6 $txt_text_md"
echo "$txt_text_md_md sockets . show the sockets listening $txt_text_md"
echo "$txt_text_md_md info-nodes . show computers connected to lan $txt_text_md"
echo "$txt_text_md_md web . browse web page $txt_text_md"
echo "$txt_text_md_md date . update the time and date from internet $txt_text_md"
echo "$txt_text_md_md free . freedom innecesary ram $txt_text_md"
echo "$txt_text_md_md log-stat . info stat about logs $txt_text_md"
echo "$txt_text_md_md version . show version and path $txt_text_md"
echo "$txt_text_md_md notes . several notes for internet $txt_text_md"
echo "$txt_text_md_md ip-forward . list or active or desactive forward variables $txt_text_md"
echo "$txt_text_md_md depends . principal dependences $txt_text_md"
echo "$txt_text_md_md license . license $txt_text_md"
echo "$txt_text_md_md cat-cmdlog . tree from cmdlog folder $txt_text_md"
echo "$txt_text_md_md tree-pdf . tree from pdf folder $txt_text_md"
echo "$txt_text_md_md tree-log . tree from logs folder $txt_text_md"
echo "$txt_text_md_md tree-conf . tree from all configuration $txt_text_md"
echo "$txt_text_md_md tree-cache . tree from all cache $txt_text_md"
echo "$txt_text_md_md clean-cache . clean cache program $txt_text_md"
echo "$txt_text_md_md code . show source code from one option $txt_text_md"
echo "$txt_text_md_md variables . possible variables $txt_text_md"
echo "$txt_text_md_md intro . intro $txt_text_md"
echo "$txt_text_md_md install . install fwiptables $txt_text_md"
echo "$txt_text_md_md uninstall . uninstall fwiptables $txt_text_md"
echo "$txt_text_md_md license-gpl-v2 . license gpl v2 $txt_text_md"
echo "$txt_text_md_md license-lgpl-v2 . license lgpl v2 $txt_text_md"
echo "$txt_text_md "
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
if [ "$cmd_first_option" == "expert" ] || \
[ "$cmd_first_option" == "options-expert" ]; then
####
####
echo "$txt_text_title | $cmd_internal expert | Each expert only works Without optional output $txt_text_md "
echo "$txt_text_md_md expert-browser-web . browse one link web $txt_text_md "
echo "$txt_text_md_md expert-sockets-ss . show sockets with ss $txt_text_md "
echo "$txt_text_md_md expert-sockets-netstat . show sockets with netstat $txt_text_md "
echo "$txt_text_md_md expert-sockets-lsof . show sockets with lsof $txt_text_md "
echo "$txt_text_md_md expert-show-resolve . show file resolve domain with resolv.conf $txt_text_md "
echo "$txt_text_md_md expert-show-weather . show weather with wttr.in $txt_text_md "
echo "$txt_text_md_md expert-show-geoip . show location for ip o for host with geoip $txt_text_md "
echo "$txt_text_md_md expert-show-webcert . show web certificate ssl from one web with ssl-cert $txt_text_md "
echo "$txt_text_md_md expert-show-newversion . Show version fwiptables stable/unstable with curl $txt_text_md "
echo "$txt_text_md_md expert-show-clientproxy . show proxy variables in the system stablished $txt_text_md "
echo "$txt_text_md_md expert-conf-clientproxy . File /etc/proxy.fwiptables for proxy launched with source $txt_text_md "
echo "$txt_text_md_md expert-speed-ip4 . benchmark internet speed ipv4 with 4seconds $txt_text_md "
echo "$txt_text_md_md expert-speed-ip6 . benchmark internet speed ipv6 with 4seconds $txt_text_md "
echo "$txt_text_md_md expert-speed-disk . benchmark disk speed with 100Mb $txt_text_md "
echo "$txt_text_md_md expert-speed-ram . benchmark ram speed with 100Mb $txt_text_md "
echo "$txt_text_md_md expert-speed-cpu . benchmark cpu speed with bc command aprox 5 seconds $txt_text_md "
echo "$txt_text_md_md expert-speed-glx . benchmark glx speed with mesa3D $txt_text_md " 
echo "$txt_text_md_md expert-add-whitelist4 . add white host for ip4 $txt_text_md "
echo "$txt_text_md_md expert-add-whitelist6 . add white host for ip6 $txt_text_md "
echo "$txt_text_md_md expert-add-blacklist4 . add drop host for ip4 $txt_text_md "
echo "$txt_text_md_md expert-add-blacklist6 . add drop host for ip6 $txt_text_md "
echo "$txt_text_md_md expert-upgrade-estable . Upgrade from web sourceforge fwiptables with curl $txt_text_md "
echo "$txt_text_md_md expert-upgrade-unstable . Upgrade from git sourceforge fwiptables with curl $txt_text_md "
echo "$txt_text_md_md expert-upgrade-adblock . Download blacklist to folder configuration program with curl $txt_text_md "
echo "$txt_text_md_md expert-deb . generate actual version file in deb $txt_text_md "
echo "$txt_text_md_md expert-gen-readme . generate actual version file in original with readme $txt_text_md "
echo "$txt_text_md_md expert-gen-compile . Compile fwiptables from bash with program obash $txt_text_md "
echo "$txt_text_md_md expert-alias-modify . modify alias for $cmd_name $txt_text_md"
echo "$txt_text_md_md expert-nmap-tcp . doing scan tcp at host or range $txt_text_md "
echo "$txt_text_md_md expert-nmap-udp . doing scan udp at host or range $txt_text_md "
echo "$txt_text_md_md expert-nmap-fin . doing scan fin at host or range $txt_text_md "
echo "$txt_text_md_md expert-nmap-syn . doing scan syn at host or range $txt_text_md "
echo "$txt_text_md_md expert-nmap-ping . doing scan ping at host or range $txt_text_md "
echo "$txt_text_md_md expert-trace-tcp4 . trace route tcp to host ip4 $txt_text_md "
echo "$txt_text_md_md expert-trace-tcp6 . trace route tcp to host ip6 $txt_text_md "
echo "$txt_text_md_md expert-trace-icmp4 . trace route icmp to host ip4 $txt_text_md " 
echo "$txt_text_md_md expert-trace-icmp6 . trace route icmp to host ip6 $txt_text_md "
echo "$txt_text_md_md expert-wpa-scan . the list wifi on air $txt_text_md "
echo "$txt_text_md_md expert-wpa-list . the list nameconfig over saved wifi $txt_text_md "
echo "$txt_text_md_md expert-wpa-new . new nameconfig to create wifi config $txt_text_md "
echo "$txt_text_md_md expert-wpa-modify . one nameconfig to modify wifi config $txt_text_md "
echo "$txt_text_md_md expert-wpa-connect . one nameconfig to connect wifi config $txt_text_md "
echo "$txt_text_md_md expert-pc-halt . halt computer with halt $txt_text_md "
echo "$txt_text_md_md expert-pc-shutdown . shutdown computer with shutdown $txt_text_md "
echo "$txt_text_md_md expert-pc-reboot . reboot computer with reboot $txt_text_md "
echo "$txt_text_md_md expert-cpufreq-info . show cpu frecuence info $txt_text_md "
echo "$txt_text_md_md expert-cpupower-info . show cpu frecuence info $txt_text_md "
echo "$txt_text_md_md expert-project-web . site  downloaded web fwiptables $txt_text_md"
echo "$txt_text_md_md expert-configs-save . save configs like backup from fwiptables in tar file $txt_text_md"
echo "$txt_text_md_md expert-configs-load . load configs like backup from fwiptables in tar file $txt_text_md"
echo "$txt_text_md_md expert-myradio-install . install radio text program $txt_text_md"
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
if   [ "$cmd_first_option" == "info-options" ]; then
####
####
echo "$txt_text_title_info  [ info options ] [ info-options md]"
echo "$txt_text_md"
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
if   [ "$cmd_first_option" == "optional-output" ]; then
####
####
echo "$txt_text_title | optional-output | $cmd_internal optional-ouptut | $txt_text_md"
echo "$txt_text_md_md i . output in info text $txt_text_md"
echo "$txt_text_md_md t . output in terminal text $txt_text_md"
echo "$txt_text_md_md n . output in terminal text narrowtxt (compresed spaces) $txt_text_md"
echo "$txt_text_md_md c . output in terminal cli $txt_text_md"
echo "$txt_text_md_md g . output in graphicall gui $txt_text_md"
echo "$txt_text_md_md l . output in file text log $txt_text_md"
echo "$txt_text_md_md p . output in file image pdf $txt_text_md"
echo "$txt_text_md_md s . output in silent or without output $txt_text_md"
echo "$txt_text_md_md info . output in info text $txt_text_md"
echo "$txt_text_md_md txt . output in terminal text $txt_text_md"
echo "$txt_text_md_md narrowtxt . output in terminal text with compresed spaces $txt_text_md"
echo "$txt_text_md_md cli . output in terminal cli $txt_text_md"
echo "$txt_text_md_md gui . output in graphicall gui $txt_text_md"
echo "$txt_text_md_md log . output in file text log $txt_text_md"
echo "$txt_text_md_md pdf . output in file image pdf $txt_text_md"
echo "$txt_text_md_md silent . output in silent text $txt_text_md"
echo "$txt_text_md_md cli-dialog . output in terminal cli with dialog $txt_text_md"
echo "$txt_text_md_md cli-whiptail . output in terminal cli with whiptail $txt_text_md"
echo "$txt_text_md_md gui-zenity . output in graphicall gui with zenity $txt_text_md"
echo "$txt_text_md_md gui-yad . output in graphicall gui with yad $txt_text_md"
echo "$txt_text_md_md cli-menu . output in terminal menu $txt_text_md"
echo "$txt_text_md_md cli-menu-compact . output in terminal menu $txt_text_md"
echo "$txt_text_md_md gui-menu-zenity . output in grapicall menu with zenity $txt_text_md"
echo "$txt_text_md_md gui-menu-yad . output in grapicall menu with yad $txt_text_md"
echo "$txt_text_md_md gui-shell-zenity . output in grapicall shell with zenity $txt_text_md"
echo "$txt_text_md_md gui-shell-yad . output in grapicall shell with yad $txt_text_md"
echo "$txt_text_md_md gui-roll-zenity . output in grapicall roll with zenity $txt_text_md"
exit; fi
####
####
#### :rutina-final-parametters:
#### :rutina-final-optional-output:
##########    english: eraserules: Erase rules option   ##########
##########    spanish: eraserules: Opcion borra reglas  ##########
#### :rutina-inicial-eraserules:
####
####
if [ "$cmd_first_option" == "eraserules" ];  then 
echo "$txt_text_title_info [ Deleting all iptables ipv4/ipv6 rules ]"
####
####
#### english: table policy 
#### spanish: table policy
####
####
cfg_rule_table_policy="ACCEPT"
$cmd_command_ip4tableslegacy   -t filter  -P INPUT    $cfg_rule_table_policy &> /dev/null
$cmd_command_ip4tablesnft      -t filter  -P INPUT    $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tableslegacy  -t filter  -P INPUT    $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tablesnft     -t filter  -P INPUT    $cfg_rule_table_policy &> /dev/null
$cmd_command_ip4tableslegacy   -t filter  -P FORWARD  $cfg_rule_table_policy &> /dev/null
$cmd_command_ip4tablesnft      -t filter  -P FORWARD  $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tableslegacy  -t filter  -P FORWARD  $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tablesnft     -t filter  -P FORWARD  $cfg_rule_table_policy &> /dev/null
$cmd_command_ip4tableslegacy   -t filter  -P OUTPUT   $cfg_rule_table_policy &> /dev/null
$cmd_command_ip4tablesnft      -t filter  -P OUTPUT   $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tableslegacy  -t filter  -P OUTPUT   $cfg_rule_table_policy &> /dev/null
$cmd_command_ip6tablesnft     -t filter  -P OUTPUT   $cfg_rule_table_policy &> /dev/null
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
#### remove ebtables
cfg_rule_table_policy="ACCEPT"
$cmd_command_ebtables -t filter -P INPUT     $cfg_rule_table_policy  &> /dev/null
$cmd_command_ebtables -t filter -P FORWARD   $cfg_rule_table_policy &> /dev/null 
$cmd_command_ebtables -t filter -P OUTPUT    $cfg_rule_table_policy &> /dev/null
$cmd_command_ebtables -t nat -P PREROUTING   $cfg_rule_table_policy &> /dev/null
$cmd_command_ebtables -t nat -P OUTPUT       $cfg_rule_table_policy  &> /dev/null
$cmd_command_ebtables -t nat -P POSTROUTING  $cfg_rule_table_policy &> /dev/null
####
####
$cmd_command_ebtables -t filter -F &> /dev/null
$cmd_command_ebtables -t nat -F    &> /dev/null
####
#### remove arptables
$cmd_command_arptables -F  &> /dev/null
####
#### remove ip4
$cmd_internal eraserules4 &> /dev/null
####
#### remove ip6
$cmd_internal eraserules6 &> /dev/null
####
####
echo "$txt_text_title_ok eraserules done"
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
if [ "$cmd_first_option" == "eraserules4" ]; then  
####
####
echo "$txt_text_title_info [ Deleting ip4 iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
cfg_rule_table_policy="ACCEPT"
$cmd_command_ip4tableslegacy   -t filter  -P INPUT    $cfg_rule_table_policy
$cmd_command_ip4tablesnft      -t filter  -P INPUT    $cfg_rule_table_policy
$cmd_command_ip4tableslegacy   -t filter  -P FORWARD  $cfg_rule_table_policy
$cmd_command_ip4tablesnft      -t filter  -P FORWARD  $cfg_rule_table_policy
$cmd_command_ip4tableslegacy   -t filter  -P OUTPUT   $cfg_rule_table_policy
$cmd_command_ip4tablesnft      -t filter  -P OUTPUT   $cfg_rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$cmd_command_ebtables -t filter -F &> /dev/null
$cmd_command_ebtables -t nat -F &> /dev/null
$cmd_command_ip4tablesnft -t filter -F &> /dev/null
$cmd_command_ip4tableslegacy -t filter -F &> /dev/null
$cmd_command_ip4tablesnft -t nat -F &> /dev/null
$cmd_command_ip4tableslegacy -t nat -F &> /dev/null
$cmd_command_ip4tablesnft -t mangle -F &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -F &> /dev/null
$cmd_command_ip4tablesnft -t raw -F &> /dev/null
$cmd_command_ip4tableslegacy -t raw -F &> /dev/null
$cmd_command_ip4tablesnft -t security -F &> /dev/null
$cmd_command_ip4tableslegacy -t security -F &> /dev/null
####
####
$cmd_command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$cmd_command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$cmd_command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$cmd_command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t filter -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t filter -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t filter -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t filter -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t nat -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t nat -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t nat -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t nat -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t mangle -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t mangle -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t mangle -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t mangle -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t raw -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t raw -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t raw -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t raw -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t security -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t security -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tablesnft -t security -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t security -P INPUT ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t security -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip4tableslegacy -t security -P OUTPUT ACCEPT &> /dev/null
####
####
echo "$txt_text_title_ok eraserules4 done"
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
if [ "$cmd_first_option" == "eraserules6" ]; then  
####
####
echo "$txt_text_title_info [ Deleting ip6 iptables rules ] "
####
####
#### english: table policy 
#### spanish: table policy
####
####
cfg_rule_table_policy="ACCEPT"
$cmd_command_ip6tableslegacy   -t filter  -P INPUT    $cfg_rule_table_policy
$cmd_command_ip6tablesnft      -t filter  -P INPUT    $cfg_rule_table_policy
$cmd_command_ip6tableslegacy   -t filter  -P FORWARD  $cfg_rule_table_policy
$cmd_command_ip6tablesnft      -t filter  -P FORWARD  $cfg_rule_table_policy
$cmd_command_ip6tableslegacy   -t filter  -P OUTPUT   $cfg_rule_table_policy
$cmd_command_ip6tablesnft      -t filter  -P OUTPUT   $cfg_rule_table_policy
####
####
#### english: erase the rules
#### spanish: borra las reglas
####
####
$cmd_command_ip6tablesnft -t filter -F &> /dev/null
$cmd_command_ip6tableslegacy -t filter -F &> /dev/null
$cmd_command_ip6tablesnft -t nat -F &> /dev/null
$cmd_command_ip6tableslegacy -t nat -F &> /dev/null
$cmd_command_ip6tablesnft -t mangle -F &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -F &> /dev/null
$cmd_command_ip6tablesnft -t raw -F &> /dev/null
$cmd_command_ip6tableslegacy -t raw -F &> /dev/null
$cmd_command_ip6tablesnft -t security -F &> /dev/null
$cmd_command_ip6tableslegacy -t security -F &> /dev/null
####
####
$cmd_command_ebtables -t filter -P INPUT ACCEPT  &> /dev/null
$cmd_command_ebtables -t filter -P FORWARD ACCEPT &> /dev/null 
$cmd_command_ebtables -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ebtables -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ebtables -t nat -P OUTPUT ACCEPT  &> /dev/null
$cmd_command_ebtables -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t filter -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t filter -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t filter -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t filter -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t filter -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t nat -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t nat -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t nat -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t nat -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t nat -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t nat -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t mangle -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t mangle -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t mangle -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t mangle -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t mangle -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t mangle -P POSTROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t raw -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t raw -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t raw -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t raw -P PREROUTING ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t security -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t security -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tablesnft -t security -P OUTPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t security -P INPUT ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t security -P FORWARD ACCEPT &> /dev/null
$cmd_command_ip6tableslegacy -t security -P OUTPUT ACCEPT &> /dev/null
####
####
echo "$txt_text_title_ok eraserules6 done"
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
if [ "$cmd_first_option" == "list-alltables" ]; then
####
####
echo "$txt_text_title_info [ List all rules ] "
echo; echo; echo "$txt_text_title LIST ARPTABLES ###" ; echo
$cmd_internal list-arptables 
echo; echo; echo "$txt_text_title LIST EBTABLES ###" ; echo
$cmd_internal list-ebtables
echo; echo; echo "$txt_text_title LIST FILTER IP4 TABLE ###" ; echo
$cmd_internal list-filter4
echo; echo; echo "$txt_text_title LIST FILTER IP6 TABLE ###" ; echo
$cmd_internal list-filter6
echo; echo; echo "$txt_text_title LIST NAT IP4 TABLE ###" ; echo
$cmd_internal list-nat4
echo; echo; echo "$txt_text_title LIST NAT IP6 TABLE ###" ; echo
$cmd_internal list-nat6
echo; echo; echo "$txt_text_title LIST SECURITY IP4 TABLE ###" ; echo
$cmd_internal list-security4
echo; echo; echo "$txt_text_title LIST SECURITY IP6 TABLE ###" ; echo
$cmd_internal list-security6
echo; echo; echo "$txt_text_title LIST RAW IP4 TABLE ###" ; echo
$cmd_internal list-raw4
echo; echo; echo "$txt_text_title LIST RAW IP6 TABLE ###" ; echo
$cmd_internal list-raw6
echo; echo; echo "$txt_text_title LIST MANGLE IP4 TABLE ###" ; echo
$cmd_internal list-mangle4
echo; echo; echo "$txt_text_title LIST MANGLE IP6 TABLE ###" ; echo
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
if [ "$cmd_first_option" == "listn-alltables" ]; then 
####
####
echo "$txt_text_title_info [ List all rules ] "
echo; echo; echo "$txt_text_title LIST EBTABLES ###" ; echo
$cmd_internal list-ebtables
echo; echo; echo "$txt_text_title LIST ARPTABLES ###" ; echo
$cmd_internal list-arptables
echo; echo; echo "$txt_text_title LIST FILTER IP4 TABLE ###" ; echo
$cmd_internal listn-filter4
echo; echo; echo "$txt_text_title LIST FILTER IP6 TABLE ###" ; echo
$cmd_internal listn-filter6
echo; echo; echo "$txt_text_title LIST NAT IP4 TABLE ###" ; echo
$cmd_internal listn-nat4
echo; echo; echo "$txt_text_title LIST NAT IP6 TABLE ###" ; echo
$cmd_internal listn-nat6
echo; echo; echo "$txt_text_title LIST SECURITY IP4 TABLE ###" ; echo
$cmd_internal listn-security4
echo; echo; echo "$txt_text_title LIST SECURITY IP6 TABLE ###" ; echo
$cmd_internal listn-security6
echo; echo; echo "$txt_text_title LIST RAW IP4 TABLE ###" ; echo
$cmd_internal listn-raw4
echo; echo; echo "$txt_text_title LIST RAW IP6 TABLE ###" ; echo
$cmd_internal listn-raw6
echo; echo; echo "$txt_text_title LIST MANGLE IP4 TABLE ###" ; echo
$cmd_internal listn-mangle4
echo; echo; echo "$txt_text_title LIST MANGLE IP6 TABLE ###" ; echo
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
if [ "$cmd_first_option" == "list4" ]; then 
####
####
echo "$txt_text_title_info [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$cmd_command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$cmd_command_ip4tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$txt_text_title_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L $cfg_config_listrules_conceptual
;;
esac
echo "$txt_text_md"
case $nftcuatro in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip4tablesnft -t filter -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list6" ]; then  
####
####
echo "$txt_text_title_info [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$cmd_command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip6tableslegacy" -t filter -L OUTPUT 1 )
nftseis=$("$cmd_command_ip6tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip6tablesnft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$txt_text_title_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip6tableslegacy -v -L $cfg_config_listrules_conceptual
;;
esac
echo $txt_text_md
case $nftseis in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip6tablesnft -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "listn4" ]; then  
####
####
echo "$txt_text_title_info [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$cmd_command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$cmd_command_ip4tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-ip4"
echo
case $legacycuatro in
"$NULL") echo "$txt_text_title_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L -n
;;
esac
echo "$txt_text_md"
case $nftcuatro in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip4tablesnft -t filter -v -L -n
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
if [ "$cmd_first_option" == "listn6" ]; then  
####
####
echo "$txt_text_title_info [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacyseis=$("$cmd_command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip6tableslegacy" -t filter -L OUTPUT 1 )
nftseis=$("$cmd_command_ip6tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip6tablesnft" -t filter -L OUTPUT 1 )
fromrules="filter-ip6"
echo
case $legacyseis in
"$NULL") echo "$txt_text_title_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip6tableslegacy -v -L -n
;;
esac
echo $txt_text_md
case $nftseis in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip6tablesnft -v -L -n
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
if [ "$cmd_first_option" == "status" ]; then
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
if [ "$cmd_first_option" == "statusn" ]; then
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
if [ "$cmd_first_option" == "listnum" ]; then 
####
####
echo "$txt_text_title_info [ List numerical filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$cmd_command_ip4tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip4tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$cmd_command_ip4tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip4tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip4"
echo
case $legacycuatro in
"$NULL")
echo "$txt_text_title_info [ Without rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] [ iptables-legacy ] \
[ $fromrules ] [ listing rules .. ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L -n
;;
esac
echo "$txt_text_md"
case $nftcuatro in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] [ iptables-nft ] \
[ $fromrules ] [ listing rules .. ]" 
echo
$cmd_command_ip4tablesnft -t filter -v -L -n
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
if [ "$cmd_first_option" == "listnum6" ]; then 
####
####
echo "$txt_text_title_info [ List numerical filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
legacycuatro=$("$cmd_command_ip6tableslegacy" -t filter -L INPUT 1 && \
"$cmd_command_ip6tableslegacy" -t filter -L OUTPUT 1 ) &> /dev/null
nftcuatro=$("$cmd_command_ip6tablesnft" -t filter -L INPUT 1 && \
"$cmd_command_ip6tablesnft" -t filter -L OUTPUT 1 ) &> /dev/null
fromrules="filter-numerical-ip6"
echo
case $legacycuatro in
"$NULL") echo "$txt_text_title_info [ Without rules xtables ] \
[ iptables-legacy ] [ $fromrules ] [ no list ]" ;;
*)
echo "$txt_text_title_ok [ With rules xtables ] \
[ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L -n
;;
esac
echo "$txt_text_md"
case $nftcuatro in
"$NULL") echo "$txt_text_title_info [ Without rules nftables ] \
[ iptables-nft ] [ $fromrules ] [ listing rules .. ]" ;;
*)
echo "$txt_text_title_ok [ With rules nftables ] \
[ iptables-nft ] [ $fromrules ]" 
echo
$cmd_command_ip4tablesnft -t filter -v -L -n
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
if [ "$cmd_first_option" == "list-filter4" ]; then 
####
####
echo "$txt_text_title_info [ List filter ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$txt_text_title_ok [ With rules xtables ] \
[ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_ok [ With rules nftables ] \
[ iptables-nft ] [ $fromrules ]" 
echo
$cmd_command_ip4tablesnft -t filter -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-forward" ]; then 
####
####
echo "$txt_text_title_info [ List filter forward ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L FORWARD $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t filter -v -L FORWARD $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-filter6" ]; then 
####
####
echo "$txt_text_title_info [ List filter ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$cmd_command_ip6tableslegacy -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]" 
echo
$cmd_command_ip6tablesnft -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-forward6" ]; then 
####
####
echo "$txt_text_title_info [ List filter forward ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t filter -v -L FORWARD $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t filter -v -L FORWARD $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-nat4" ]; then 
####
####
echo "$txt_text_title_info [ List nat ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip4"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t nat -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t nat -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-nat6" ]; then 
####
####
echo "$txt_text_title_info [ List nat ipv6] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="nat-ip6"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t nat -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t nat -v -L $cfg_config_listrules_conceptual 
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
if [ "$cmd_first_option" == "listnum-filter4" ]; then 
####
####
echo "$txt_text_title_info [ List filter ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip4"
echo
echo "$txt_text_title_info [ With rules netfilter ] [ iptables-nft ] [ $fromrules ]"  
echo
$cmd_command_ip4tableslegacy -v -L -n 
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -v -L -n
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
if [ "$cmd_first_option" == "list-forwardnum" ]; then 
####
####
echo "$txt_text_title_info [ List filter forward ipv4 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip4"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t filter -v -L FORWARD -n
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t filter -v -L FORWARD -n
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
if [ "$cmd_first_option" == "listnum-filter6" ]; then 
####
####
echo "$txt_text_title_info [ List filter ipv6 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-ip6"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$cmd_command_ip6tableslegacy -v -L -n
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]" 
echo
$cmd_command_ip6tablesnft -v -L -n
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
if [ "$cmd_first_option" == "list-forwardnum6" ]; then 
####
####
echo "$txt_text_title_info [ List filter forward ipv6 in numerical ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="filter-forward-ip6"
echo
echo "$txt_text_title_info [ With rules xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t filter -v -L FORWARD -n
echo
echo "$txt_text_title_info [ With rules nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t filter -v -L FORWARD -n
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
if [ "$cmd_first_option" == "list-mangle4" ]; then 
####
####
echo "$txt_text_title_info [ List mangle ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip4"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t mangle -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t mangle -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-mangle6" ]; then 
####
####
echo "$txt_text_title_info [ List mangle ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="mangle-ip6"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t mangle -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t mangle -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-raw4" ]; then 
####
####
echo "$txt_text_title_info [ List raw ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip4"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t raw -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t raw -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-raw6" ]; then 
####
####
echo "$txt_text_title_info [ List raw ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="raw-ip6"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t raw -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t raw -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-security4" ]; then 
####
####
echo "$txt_text_title_info [ List security ipv4 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip4"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip4tableslegacy -t security -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip4tablesnft -t security -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-security6" ]; then 
####
####
echo "$txt_text_title_info [ List security ipv6 ] \
[ it is only sufficent or with legacy or with nft ] "
fromrules="security-ip6"
echo
echo "$txt_text_title_info [ The xtables ] [ iptables-legacy ] [ $fromrules ]"
echo
$cmd_command_ip6tableslegacy -t security -v -L $cfg_config_listrules_conceptual
echo
echo "$txt_text_title_info [ The nftables ] [ iptables-nft ] [ $fromrules ]"
echo
$cmd_command_ip6tablesnft -t security -v -L $cfg_config_listrules_conceptual
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
if [ "$cmd_first_option" == "list-ebtables" ]; then 
####
####
echo "$txt_text_title_info [ List ebtables ] "
fromrules="ebtables"
echo
echo "$txt_text_title_info [ ebtables: filter ethernet ] [ $fromrules ]"
echo
$cmd_command_ebtables -L -t filter
echo
echo "$txt_text_title_info [ ebtables: nat ethernet ] [ $fromrules ]"
echo
$cmd_command_ebtables -L -t nat
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
if [ "$cmd_first_option" == "list-arptables" ]; then 
####
####
echo "$txt_text_title_info [ List arptables ipv4 ] "
fromrules="arptables"
echo
echo "$txt_text_title_info [ arptables: filter arptables ] [ $fromrules ]"
echo
$cmd_command_arptables -L
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
if [ "$cmd_first_option" == "clone-wallsystem" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal clone-wallsystem firewall ]"
exit; fi
####
####
if [ "$cmd_first_option" == "clone-wallsystem" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
case $archivo in shield-*);;client-*);; game-*);; games-*);; server-*);;
*) echo "$title $txt_text_fail choose a valid system firewall to clone" ; exit ;; esac
$cmd_internal code $cmd_second_option | $cmd_command_grep "cfg_" \
&> $cmd_default_directory_custom/$archivo
####
####
if [ -s "$cmd_default_directory_custom/$archivo" ] ; then 
$cmd_command_cat  $cmd_default_directory_custom/$archivo ;
echo "$txt_text_title_ok Created custom : $archivo  "
echo "$txt_text_title_info Modify  : fwiptables modify-custom $archivo  "
echo "$txt_text_title_info Launch  : fwiptables load-custom $archivo  "
else rm $cmd_default_directory_custom/$archivo
echo "$txt_text_title_info choose one valid wallsystem to clone to custom"
echo "$txt_text_title_fail config no done $archivo" ; fi
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
if [ "$cmd_first_option" == "new-full-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal new-full-custom config-new ]"
exit; fi
####
####
if [ "$cmd_first_option" == "new-full-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_fullcfg_eng" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok created file $archivo"
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
if [ "$cmd_first_option" == "nueva-completa-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal nueva-completa-custom config-nueva ]"
exit; fi
####
####
if [ "$cmd_first_option" == "nueva-completa-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_fullcfg_spa" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok created file $archivo"
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
if [ "$cmd_first_option" == "new-mini-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal new-mini-custom config-new ]"
exit; fi
####
####
if [ "$cmd_first_option" == "new-mini-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_minicfg_eng" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok created file $archivo"
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
if [ "$cmd_first_option" == "nueva-mini-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal nueva-mini-custom config-nueva ]"
exit; fi
####
####
if [ "$cmd_first_option" == "nueva-mini-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_minicfg_spa" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok created file $archivo"
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
if [ "$cmd_first_option" == "new-tiny-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal new-tiny-custom config-new ]"
exit; fi
####
####
if [ "$cmd_first_option" == "new-tiny-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_tinycfg_eng" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok created file $archivo"
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
if [ "$cmd_first_option" == "nueva-diminuta-custom" ] && [ "$cmd_second_option" == "$NULL" ]  ; then 
####
####
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal nueva-diminuta-custom config-nueva ]"
exit; fi
####
####
if [ "$cmd_first_option" == "nueva-diminuta-custom" ] && [ "$cmd_second_option" != "$NULL" ] ; then 
archivo="$cmd_second_option"
cp "$cmd_default_tinycfg_spa" "$cmd_default_directory_custom/$archivo"
$cfg_favorite_text_editor $cmd_default_directory_custom/$archivo
echo " $txt_text_ok Archivo creado $archivo"
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
if [ "$cmd_first_option" == "modify-custom" ]; then 
####
###
if [ ! -f "$cmd_default_directory_custom/$cmd_second_option" ] ; then
$cmd_internal names-custom
echo "$txt_text_md $txt_text_info [ usage: ] [ $cmd_internal modify-custom config ]"
exit; fi
####
####
if [ -f "$cmd_default_directory_custom/$cmd_second_option" ] ; then
cp "$cmd_default_directory_custom/$cmd_second_option" "$cmd_default_cache_necesary/$cmd_second_option" &> /dev/null
$cfg_favorite_text_editor "$cmd_default_directory_custom/$cmd_second_option"
echo "$txt_text_title_ok [ load-custom file $cmd_second_option ]"
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
if [ "$cmd_first_option" == "show-custom" ] ; then 
####
####
if [ ! -f "$cmd_default_directory_custom"/"$cmd_second_option" ] ; then 
echo "$txt_text_title_info [ Usage: $cmd_internal show-custom config-cfg ]" ; exit; fi
####
####
if [ -f "$cmd_default_directory_custom"/"$cmd_second_option" ] ; then 
$cmd_command_cat  $cmd_default_directory_custom/$cmd_second_option ;
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
if [ "$cmd_first_option" == "del-custom" ]; then 
####
####
if [ ! -f $cmd_default_directory_custom/$cmd_second_option ] ; then
echo "$txt_text_title_info [ usage: ] [ $cmd_internal del-custom config-old ]"
exit ; fi
####
####
if [ -f $cmd_default_directory_custom/$cmd_second_option ] ; then
rm $cmd_default_directory_custom/$cmd_second_option
echo "$cmd_default_directory_custom/$cmd_second_option Deleted"
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
if [ "$cmd_first_option" == "names" ]; then 
####
####
echo "$txt_text_title_info [ list configs files saved in standard format ]"
echo "$txt_text_title $folder [ $cmd_default_directory_control ]"
echo 
echo "$txt_text_title_info [ Listing firewall names ]"
$cmd_command_tree $cmd_default_directory_control | $cmd_command_sed s/\-legacy\-ipv6//g | \
$cmd_command_sed s/\-nft\-ipv6//g | \
$cmd_command_sed s/\-legacy\-ipv4//g | $cmd_command_sed s/\-nft\-ipv4//g | \
$cmd_command_sed s/\-arptables//g | $cmd_command_sed s/\-ebtables//g 
echo
echo "$txt_text_title_ok [ Listed firewall names ]"
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
if [ "$cmd_first_option" == "reset" ]; then 
####
####
echo "$txt_text_title_info [ Reseting the firewall, stop-and-continue ]"
$cmd_internal stop &> /dev/null
$cmd_internal continue &> /dev/null
echo "$txt_text_title_ok [ firewall reseted ]"
####
####
exit; fi
####
####
#### :rutina-final-reset:
##########    english: changes: developer changes       ##########
##########    spanish: changes: cambios de desarrollo   ##########
#### :rutina-inicial-changes:
####
####
if [ "$cmd_first_option" == "changes" ]; then 
####
####
echo "$txt_text_md_md \
[ changes in 24-11-F ]"
echo "$txt_text_md_md \
info-net: changed names option | variables: simplify"
echo "$txt_text_md_md \
cli-menu and cli-menu-compact: changes, updated, fixed"
echo "$txt_text_md_md \
[ changes in 24-11-E ]" 
echo "$txt_text_md_md \
changes: dev-changes now is changes and new format util $txt_text_md" 
echo "$txt_text_md_md \
add-whitelist: add-whitelist moved to firewall-wallcontrol $txt_text_md" 
echo "$txt_text_md_md \
expert: fixed in expert option $txt_text_md" 
echo "$txt_text_md_md \
[ changes in 24-11-D ]" 
echo "$txt_text_md_md \
whitelist: better in whitelist options now comments $txt_text_md" 
echo "$txt_text_md_md \
whitelist: better in whitelist options now only in the used tables $txt_text_md"
echo "$txt_text_md_md \
variables: Changes in all enviroment name to cfg_ | txt_ | cmd_ $txt_text_md"
echo "$txt_text_md_md \
custom files: no retro compability from 24-11-D $txt_text_md"
####
####
exit; fi
####
####
#### :rutina-final-changes:
##########   english: readme: show intro      ##########
##########   spanish: readme: muestra intro   ##########
#### :rutina-inicial-readme:
####
####
if  [ "$cmd_first_option" == "readme" ];  then
####
####
echo "$txt_text_md_md fwiptables. Firewall With iptables."
echo "$txt_text_md_md Intro content information                          $txt_text_md"
echo "$txt_text_md_md Readme: description, location, install, uninstall. $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md  [ fwiptables description ]             $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md The fwiptables is a one-file WIZARD,     $txt_text_md"
echo "$txt_text_md_md for iptables, with COMMAND-LINE,         $txt_text_md"
echo "$txt_text_md_md and CLI-MENU, and GUI-MENU,              $txt_text_md"
echo "$txt_text_md_md and GUI-ROLL, and GUI-SHELL.             $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md From one system firewall to choose one,  $txt_text_md"
echo "$txt_text_md_md with eraserules, or template custom,     $txt_text_md"
echo "$txt_text_md_md with wizards: tiny, mini, and full,      $txt_text_md"  
echo "$txt_text_md_md with added comments rules in firewall.   $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md With rules ipv4, rules ipv6, ebtables, arptables,  $txt_text_md"
echo "$txt_text_md_md with netfilter neftables, netfilter xtables,       $txt_text_md"
echo "$txt_text_md_md with tools ip, wizards for generate new rules,     $txt_text_md"
echo "$txt_text_md_md with save/load rules with files standard iptables, $txt_text_md"
echo "$txt_text_md_md with shield to ssh or other servers choosed,       $txt_text_md"         
echo "$txt_text_md_md with limit bandwidth, string word,                 $txt_text_md"
echo "$txt_text_md_md with host whitelist, host blacklist,               $txt_text_md"
echo "$txt_text_md_md with other more capabilities of firewall.          $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md  [ fwiptables location ]                          $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md  File    Location:   $cmd_directory/$cmd_filename  $txt_text_md"
echo "$txt_text_md_md  Config Directory:   $cmd_default_directory_necesary      $txt_text_md"
echo "$txt_text_md_md  Cache  Directory:   $cmd_default_cache_basenecesary $txt_text_md "
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ fwiptables install ]                      $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md  su root TYPE: su root                       $txt_text_md"    
echo "$txt_text_md_md  put bit TYPE: chmod 755 $cmd_internal       $txt_text_md"
echo "$txt_text_md_md  install TYPE: $cmd_internal install         $txt_text_md" 
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_title_md [ fwiptables uninstall ]                    $txt_text_md"
echo "$txt_text_md_md $txt_text_md"
echo "$txt_text_md_md uninstall TYPE: $cmd_internal uninstall      $txt_text_md"
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
if  [ "$cmd_first_option" == "intro" ]; then
####
####
echo "$txt_text_md"
echo "$txt_text_md" "$txt_text_md" "Changes"
echo "$txt_text_md" "$txt_text_md" "Readme"
echo "$txt_text_md" "$txt_text_md" "Version"
echo "$txt_text_md" "$txt_text_md" "About"
echo "$txt_text_md" "$txt_text_md" "Notes"
echo "$txt_text_md" "$txt_text_md" "Compile"
echo "$txt_text_md" "$txt_text_md" "Depends"
echo "$txt_text_md" "$txt_text_md" "Examples"
echo "$txt_text_md" "$txt_text_md" "Options"
echo "$txt_text_md"
$cmd_internal changes
echo "$txt_text_md"
$cmd_internal readme
echo "$txt_text_md"
$cmd_internal version
echo "$txt_text_md"
$cmd_internal about
echo "$txt_text_md"
$cmd_internal notes
echo "$txt_text_md"
$cmd_internal compile
echo "$txt_text_md"
$cmd_internal depends
echo "$txt_text_md"
$cmd_internal examples
echo "$txt_text_md"
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
if   [ "$cmd_first_option" == "ip-forward" ];  then
####
####
if   [ "$cmd_second_option" == "$NULL" ]; then
echo "$txt_text_title [ $cmd_first_option ]"
echo "$txt_text_title launch: fwiptables ip-forward [ list | on | off ]" ; exit ; fi
####
####
if   [ "$cmd_second_option" == "list" ]; then
echo "$txt_text_title_info  [ Show ip forwading in kernel ] "
echo "$txt_text_title [ Actived 1 or deactived 0 ] [ ipforwading with sysctl ]"
$cmd_command_sysctl -a | $cmd_command_grep -i  forwarding ; exit ; fi
####
####
if   [ "$cmd_second_option" == "on" ]; then
echo "$txt_text_title_info  [ Activating.. ip forwading in kernel ]"
for a in $($cmd_command_sysctl -a | $cmd_command_grep -i  forwarding | $cmd_command_cut -d " " -f 1)
do $cmd_command_sysctl -w $a=1 ; done ; exit ; fi
####
####
if   [ "$cmd_second_option" == "off" ]; then
echo "$header_ok $txt_text_info  [ Deactivating.. ip forwading in kernel ]"
for a in $($cmd_command_sysctl -a | $cmd_command_grep -i  forwarding | $cmd_command_cut -d " " -f 1)
do $cmd_command_sysctl -w $a=0 ; done ; exit; fi
####
####
echo "$txt_text_title launch: fwiptables ip-forward [ list | on | off ]"
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
if [ "$cmd_first_option" == "download" ] ; then
####
####
echo "$txt_text_title_info [ $cmd_internal download ] [ download md ] "
echo
echo "$txt_text_title the last version from fwiptables. Firewall With iptables"
echo
echo "$txt_text_title [ Link ] [ Download web link from sourceforge.com ] "
echo "$cmd_web_download_sourceforge"
echo
echo "$txt_text_title [ Link ] [ Download web link from github.com ] "
echo "$cmd_web_download_github"
echo 
echo "$txt_text_title [ Link ] [ Download web link from git.devuan.org ] "
echo "$cmd_web_download_devuan"
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
if [ "$cmd_first_option" == "uninstall" ] ; then
####
####
echo "$txt_text_title_info [ uninstaller ] [ uninstall md ] "
rm $cmd_directory/$cmd_filename &> /dev/null
echo "$txt_text_title_ok [ deleted binary $cmd_installed ]"
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
if [ "$cmd_first_option" == "install" ]; then
####
####
#### message
echo "$txt_text_title Waiting several seconds, while create new configuration"
#### 
#### 
####  copy
cp $cmd_notinstalled $cmd_installed && 
chmod 755 $cmd_installed &> /dev/null &&
echo "$txt_text_md_ok Installed $cmd_name $txt_text_md_file [$cmd_installed] \
<version>  [$cmd_version]" ||
echo "$txt_text_md_fail Not installed"
####
####
#### preferences-regen
$cmd_notinstalled preferences-regen &> /dev/null &&
echo "$txt_text_md_ok Updated preferences $txt_text_file" &&
echo "$txt_text_md [$cmd_file_default_preferences]" ||
echo "$txt_text_md_fail Not update preferences"
####
####
#### alias-regen
$cmd_notinstalled alias-regen &> /dev/null &&
echo "$txt_text_md_ok Updated alias $txt_text_file" &&
echo "$txt_text_md [$cmd_file_default_alias]" ||
echo "$txt_text_md_fail Not update alias"
####
####
#### templates-regen
$cmd_notinstalled templates-regen &> /dev/null &&
echo "$txt_text_md_ok Updated templates $txt_text_folder" &&
echo "$txt_text_md [$cmd_default_directory_template]" || 
echo "$txt_text_md_fail Not update templates"
####
####
#### fonts
echo "$txt_text_md_info Source install: $cmd_notinstalled"
echo "$txt_text_md_info Final  install: $cmd_installed"
####
####
#### comprobe
if [ -f "$cmd_installed" ]
then echo "$txt_text_md_ok Installed $cmd_name"
else echo "$txt_text_md_fail Not installed $cmd_name"
fi
#### 
####
exit; fi
####
####
#### :rutina-final-install:
##########    english: usernotes: take notes   ##########
##########    spanish: usernotes: toma notas   ##########
#### :rutina-inicial-usernotes:
####
####
if [ "$cmd_first_option" == "usernotes" ] ;  then
####
####
#### add
if [ "$cmd_second_option" == "add" ]
then echo "$cmd_usernotes_date,$cmd_third_option," >> $cmd_file_default_usernotes
echo "Content added: $cmd_third_option," ; exit; fi
#### search
if [ "$cmd_second_option" == "search" ] ; then echo "List searched" ; 
$cmd_command_cat $cmd_file_default_usernotes | $cmd_command_grep -i $cmd_third_option ; exit; fi
#### list
if [ "$cmd_second_option" == "list" ] ; then echo "List content:"; 
$cmd_command_cat $cmd_file_default_usernotes; exit; fi
#### lines
if [ "$cmd_second_option" == "lines" ] ; then echo "Lines numbers:"
$cmd_command_cat $cmd_file_default_usernotes | $cmd_command_wc -l ; exit; fi
#### info
echo " # Option: add|search|list|lines"
echo " # $txt_text_info Use without comma, and quote when spaces: to add, to search"
echo " # $txt_text_file [$cmd_file_default_usernotes]"
#### 
####
exit; fi
####
####
#### :rutina-final-usernotes:
##########    english: expert-gen-readme: generate installed respository   ##########
##########    spanish: expert-gen-readme: genera instalado respositorio    ##########
#### :rutina-inicial-expert-gen-readme:
####
####
if   [ "$cmd_first_option" == "expert-gen-readme" ];  then
####
####
#### text introduction
echo "$txt_text_title_info  [ generate actual file and readme from intro program ] "
#### create file
cp $0 $cmd_default_directory_readme/$cmd_name-$cmd_version-bash &&
echo "$txt_text_title_ok Created $cmd_default_directory_readme/$cmd_name-$cmd_version-bash"
#### create readme
$0 intro > $cmd_default_directory_readme/README.md &&
echo "$txt_text_title_ok Created $cmd_default_directory_readme/$cmd_name-$cmd_version-README.md"
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
if   [ "$cmd_first_option" == "expert-gen-deb" ];  then
echo "$txt_text_title_info  [ generate actual file debian ] "
#### recreate the directories
rm -R $cmd_default_directory_debian/deb/ &> /dev/null
mkdir -p $cmd_default_directory_debian/deb/usr/bin &> /dev/null
mkdir -p $cmd_default_directory_debian/deb/DEBIAN &> /dev/null
cp $0 $cmd_default_directory_debian/deb/usr/bin/$cmd_name
#### it are file modes
chown root $cmd_default_directory_debian/* -R  &> /dev/null
chmod 755 $cmd_default_directory_debian/* -R &> /dev/null
#### create the control file
echo "Package: fwiptables"      &>  $cmd_default_directory_debian/deb/DEBIAN/control
echo "Priority: optional"       &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Section: misc"            &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Maintainer: f-iptables"   &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Architecture: all"        &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Version: $cmd_version"    &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Depends: "                &>> $cmd_default_directory_debian/deb/DEBIAN/control
echo "Description: $cmd_longdescription" &>> $cmd_default_directory_debian/deb/DEBIAN/control
#### echo " $cmd_longdescription ."  &>> $cmd_default_directory_debian/deb/DEBIAN/control
#### architecture detect, only for shell script
if [ "$cmd_format" != "Bourne-Again_shell_script," ]
then echo "$txt_text_title the $cmd_filename is not Bourne-Again_shell_script," ; exit ; fi
#### it does the debian package noarch
rm $cmd_default_directory_debian/$cmd_name-$cmd_version-noarch.deb &> /dev/null
$cmd_command_dpkg -b $cmd_default_directory_debian/deb/ $cmd_default_directory_debian/$cmd_name-$cmd_version-noarch.deb && \
echo "$txt_text_md $txt_text_ok file write in \
$cmd_default_directory_debian/$cmd_name-$cmd_version-noarch.deb"   
#### delete the directory temporal
rm -R $cmd_default_directory_debian/deb/  &> /dev/null
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
if   [ "$cmd_first_option" == "expert-show-geoip" ]; then
####
####
echo "$txt_text_title_info  [ resolve the location to one ip or host ] "
echo ; case $cmd_command_geoiplookup in "$NULL")
echo "$txt_text_md $txt_text_fail [ Install geoiplookup command ]" ; exit  ;; esac
case "$cmd_second_option" in "$NULL")
echo "$txt_text_title Selecting host geoip to fast.com for default"
trazador="fast.com" ;; *) trazador="$cmd_second_option" ;; esac
echo "$txt_text_title_ok [ geoiplookup -i $trazador ]"
$cmd_command_geoiplookup -i $trazador
echo 
####
####
exit; fi
####
####
#### :rutina-final-expert-show-geoip:
##########    english: info-nodes: listen at dump from conexiones arp    ##########
##########    spanish: info-nodes: escucha al volcado de conexiones arp  ##########
#### :rutina-inicial-info-nodes:
####
####
if   [ "$cmd_first_option" == "info-nodes" ]; then
####
####
echo "$txt_text_title_info [ Show the list arp-scan in the lan ] "
if [ "$cmd_command_arpscan" == "$NULL" ]; then
echo "$txt_text_title_fail [ install arp-scan command ]" ; exit ; fi
echo "$txt_text_title_info [ local net: ip lan .. ]"
$cmd_command_ip -4 route | $cmd_command_grep -i -v default
echo "$txt_text_title_info [ local scan: arp lan scan .. ]"
$cmd_command_timeout -s SIGINT -v $cfg_server_time_waiting $cmd_command_arpscan -l -x
####
####
exit; fi
####
####
#### :rutina-final-info-nodes:
##########    english: donate: link donate    ##########
##########    spanish: donate: link donate  ##########
#### :rutina-inicial-donate:
####
####
if   [ "$cmd_first_option" == "donate" ]; then
####
####
echo "$txt_text_title_info [ donate to fwiptables project ] [ donate md ]"
echo "$txt_text_md Not at all"
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
if   [ "$cmd_first_option" == "about" ]; then
####
####
echo "$txt_text_md_md File:          fwiptables"
echo "$txt_text_md_md Description:   Command Fran FireWall fwiptables Generator"
echo "$txt_text_md_md Author:        Francisco Garcia <fwiptables@gmx.com>"
echo "$txt_text_md_md Copyright:     (c) 2020-2024 Francisco Garcia <fwiptables@gmx.com>"
echo "$txt_text_md_md launch:        $cmd_internal license-lgpl-v2|license-gpl-v2"
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
#### if [ "$cmd_first_option" == "license-gpl-v3" ];  then
####
####
#### echo "$txt_text_title_info \
#### [ Show license from git sourceforge for $cmd_internal ] "
####
#### if [ "$cmd_command_curl" == "$NULL" ]; then
#### echo "$txt_text_title Install curl to download/install latest version"; fi
####
#### echo "license text for $cmd_first_option downloading"
#### echo
#### echo ..................................................................
#### echo
#### $cmd_command_curl -s -L $cmd_web_license_gplv3 --stderr /dev/null
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
if [ "$cmd_first_option" == "license-gpl-v2" ];  then
####
####
echo "$txt_text_title_info \
[ Show license from git sourceforge for $cmd_internal ] "
####
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title Install curl to download/install latest version"; fi
####
echo "license text for $cmd_first_option downloading"
echo
echo ..................................................................
echo
$cmd_command_curl -s -L $cmd_web_license_gplv2 --stderr /dev/null
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
if [ "$cmd_first_option" == "license-lgpl-v2" ];  then
####
####
echo "$txt_text_title_info \
[ Show license from git sourceforge for $cmd_internal ] "
####
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title Install curl to download/install latest version"; fi
####
echo "license text for $cmd_first_option downloading"
echo
echo ..................................................................
echo
$cmd_command_curl -s -L $cmd_web_license_lgplv2 --stderr /dev/null
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
#### if [ "$cmd_first_option" == "license-bsd-v1" ]; then 
#### echo "$txt_text_title_info \
#### [ Show license from git sourceforge for $cmd_internal ] "
####
#### if [ "$cmd_command_curl" == "$NULL" ]; then
#### echo "$txt_text_title Install curl to download/install latest version"; fi
####
#### echo "license text for $cmd_first_option downloading"
#### echo
#### echo ..................................................................
#### echo
#### $cmd_command_curl -L $content_license_bsd --stderr /dev/null
#### exit;  fi
####
####
#### :rutina-final-license-bsd-v1:
##########    english: expert-pc-halt: power off computer   ##########
##########    spanish: expert-pc-halt: apaga el ordenador   ##########
#### :rutina-inicial-expert-pc-halt:
####
####
if   [ "$cmd_first_option" == "expert-pc-halt" ]; then
####
####
echo "$txt_text_title_info [ power off computer ] [ control-c to cancel ]"
echo "Halt to power off computer ... in 15 seconds"
$cmd_command_sleep 5
echo "Halt to power off computer ... in 10 seconds"
$cmd_command_sleep 5
echo "Halt to power off computer ... in 05 seconds"
$cmd_command_sleep 5
####
####
if [ $cmd_command_poweroff != "$NULL" ]; then $cmd_command_poweroff & exit ; fi
if [ $cmd_command_init != "$NULL" ]; then $cmd_command_init 6 & exit ; fi
if [ $cmd_command_systemctl != "$NULL" ]; then $cmd_command_systemctl poweroff -i & exit ; fi
$cmd_command_halt & $cmd_command_init 0 & $cmd_command_systemctl halt -i
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
if   [ "$cmd_first_option" == "expert-pc-poweroff" ]; then
####
####
echo "$txt_text_title_info [ power off computer ] [ control-c to cancel ]"
echo "Halt to power off computer ... in 15 seconds"
$cmd_command_sleep 5
echo "Halt to power off computer ... in 10 seconds"
$cmd_command_sleep 5
echo "Halt to power off computer ... in 05 seconds"
$cmd_command_sleep 5
####
####
if [ $cmd_command_poweroff != "$NULL" ]; then $cmd_command_poweroff & exit ; fi
if [ $cmd_command_init != "$NULL" ]; then $cmd_command_init 6 & exit ; fi
if [ $cmd_command_systemctl != "$NULL" ]; then $cmd_command_systemctl poweroff -i & exit ; fi
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
if   [ "$cmd_first_option" == "expert-pc-shutdown" ]; then
####
####
echo "$txt_text_title_info [ power off computer ] [ control-c to cancel ]"
echo "Halt to shutdown computer ... in 15 seconds"
$cmd_command_sleep 5
echo "Halt to shutdown computer ... in 10 seconds"
$cmd_command_sleep 5
echo "Halt to shutodwn computer ... in 05 seconds"
$cmd_command_sleep 5
####
####
if [ $cmd_command_shutdown != "$NULL" ]; then $cmd_command_shutdown -h now & exit ; fi
if [ $cmd_command_init != "$NULL" ]; then $cmd_command_init 0 & exit ; fi
if [ $cmd_command_systemctl != "$NULL" ]; then $cmd_command_systemctl poweroff -i & exit ; fi
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
if   [ "$cmd_first_option" == "expert-pc-reboot" ]; then
####
####
echo "$txt_text_title_info [ reboot computer ] [ control-c to cancel ]"
echo "Halt to reboot computer ... in 15 seconds"
$cmd_command_sleep 5
echo "Halt to reboot computer ... in 10 seconds"
$cmd_command_sleep 5
echo "Halt to reboot computer ... in 05 seconds"
$cmd_command_sleep 5
####
####
if [ $cmd_command_reboot != "$NULL" ]; then $cmd_command_reboot &  exit ; fi
if [ $cmd_command_init != "$NULL" ]; then $cmd_command_init 6 &  exit ; fi
if [ $cmd_command_systemctl != "$NULL" ]; then $cmd_command_systemctl reboot -i &  exit ; fi
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
if   [ "$cmd_first_option" == "expert-show-newversion" ]; then
####
####
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title Install curl to show stable latest version"; fi
####
#### actually
####
echo "$txt_text_title Show the version for fwiptables actually installed:"
$cmd_internal version | $cmd_command_grep -E -i "version"
####
#### latest stable
####
echo "$txt_text_title Show the version for fwiptables stable latest:"
descarga="$cmd_default_cache_basenecesary/$cmd_get_date-fwiptables-latest"
$cmd_command_curl $cmd_web_download_sourceforge -s -L -o $descarga \
&& chmod ugo+x $descarga && $descarga version | \
$cmd_command_grep -E -i "version"
rm $descarga
####
#### latest unstable
####
echo "$txt_text_title Show the version for fwiptables unstable latest:"
descarga="$cmd_default_cache_basenecesary/$cmd_get_date-fwiptables-stable"
$cmd_command_curl $cmd_web_git_sourceforge -s -L -o $descarga \
&& chmod ugo+x $descarga && $descarga version | \
$cmd_command_grep -E -i "version"
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
if   [ "$cmd_first_option" == "expert-upgrade-estable" ] || [ "$cmd_first_option" == "upgrade" ];then
####
####
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title Install curl to download and to install stable latest version"; fi
####
####
echo "$txt_text_title Downloading fwiptables stable latest"
descarga="$cmd_default_cache_basenecesary/$cmd_get_date-fwiptables-latest"
rm $descarga &> /dev/null
$cmd_command_curl $cmd_web_download_sourceforge -s -L -o $descarga || echo "Without internet" \
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
if   [ "$cmd_first_option" == "expert-upgrade-unstable" ]; then
####
####
if [ "$cmd_command_curl" == "$NULL" ]; then
echo "$txt_text_title Install curl to download and to install unstable latest version"; fi
####
####
echo "$txt_text_title Downloading fwiptables development latest"
descarga="$cmd_default_cache_basenecesary/$cmd_get_date-fwiptables-unstable"
rm $descarga  &> /dev/null
$cmd_command_curl $cmd_web_git_sourceforge -s -L -o $descarga || echo "Without internet" \
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
if   [ "$cmd_first_option" == "compile" ]; then
####
####
echo "$txt_text_md_md BASH SCRIPT WORKS fully.    $txt_text_md"
echo "$txt_text_md_md But if your desire is compiling...   $txt_text_md"   
echo "$txt_text_md_md Necesary fwiptables in source script bash $txt_text_md"     
echo "$txt_text_md_md Download and install obash from oficial web internet $txt_text_md"      
echo "$txt_text_md_md Run: obash -s -c -o ./destination.bin ./source-bash.sh $txt_text_md"      
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
if   [ "$cmd_first_option" == "expert-gen-compile" ]; then
####
####
echo "$txt_text_title_info \
[  optionally ] [ howto compile bash script with obash ] "
echo "$txt_text_title Compile $cmd_internal" ; echo
if [ "$cmd_command_obash" == "$NULL" ]
then echo "$txt_text_title install obash to compile"; exit ; fi
if [ "$cmd_command_uuid" == "$NULL" ]
then echo "$txt_text_title install uuid to compile"; exit ; fi
if [ "$cmd_format" != "Bourne-Again_shell_script," ]
then echo "$txt_text_title the $cmd_name is not Bourne-Again_shell_script," ; exit ; fi
obash_file_update="$cmd_default_directory_obash/$cmd_name-$cmd_version"
cp $0 $obash_file_update.bash
$cmd_command_obash -r -c -o $obash_file_update.bin $obash_file_update.bash \
&& echo "$txt_text_title_ok" || echo "$txt_text_title_fail"
echo ; echo "$txt_text_title And now list:"
file -L $obash_file_update.bash
file -L $obash_file_update.bin
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
if   [ "$cmd_first_option" == "expert-upgrade-adblock" ]; then
####
####
echo "$txt_text_title_info [ blacklist files / adblock files / hosts deny files ]"
echo "$txt_text_title_info [ Waiting a moment ]"
echo "$txt_text_title [ Step 1/4 ] [ downloading hosts fademind to $cmd_file_blacklist_fademind ]"
$cmd_command_curl $cmd_web_blacklist_fademind -s -L -o $cmd_file_blacklist_fademind
echo "$txt_text_title [ Step 2/4 ] [ downloading hosts mvps to $cmd_file_blacklist_mvps ]"
$cmd_command_curl $cmd_web_blacklist_mvps -s -L -o $cmd_file_blacklist_mvps
echo "$txt_text_title [ Step 3/4 ] [ downloading hosts adaway to $cmd_file_blacklist_adaway ]"
$cmd_command_curl $cmd_web_blacklist_adaway -s -L -o $cmd_file_blacklist_adaway
echo "$txt_text_title [ Step 4/4 ] [ downloading hosts stevenblack to $cmd_file_blacklist_stevenblack ]"
$cmd_command_curl $cmd_web_blacklist_stevenblack -s -L -o $cmd_file_blacklist_stevenblack
echo "$txt_text_title_folder [ $cmd_default_directory_adblock ] "
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
if   [ "$cmd_first_option" == "info" ]; then
####
####
echo "$txt_text_title_info $txt_text_md $txt_text_info  [ info $cmd_second_option ] [ info md ]"
echo "$txt_text_title_info  Launch info search: $cmd_internal \
[optional-output] info [pattern-to-search]"
echo "$txt_text_title_info Example info search: $cmd_internal \
[optional-output] info ls"
echo "$txt_text_title_info    Show all options: $cmd_internal \
[optional-output] info-options"
if   [ "$cmd_second_option" == "$NULL" ]; then exit ; fi
if   [ "$cmd_second_option" == "info-options" ]; then $cmd_internal info-options ; exit ; fi
echo "$txt_text_title_info  Waiting to info with: $cmd_second_option"
$cmd_internal info-options | $cmd_command_grep -i "$cmd_second_option" | $cmd_command_grep -Ev "###" 
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
if   [ "$cmd_first_option" == "expert-speed-glx" ]; then
####
####
echo "$txt_text_title_info  [ test gl mesa3D speed ] \
[ for default max $cfg_server_time_waiting seconds ] "
case $cmd_command_glxgears in "$NULL")
echo "$txt_text_md $txt_text_fail [ Install mesa utils ]"; exit ;; esac
vblank_mode=0 $cmd_command_timeout -s SIGINT -v $cfg_server_time_waiting $cmd_command_glxgears
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
if   [ "$cmd_first_option" == "expert-speed-disk" ]; then
####
####
echo "$txt_text_title_info  [ test disk speed benchamrk ] \
[ for default max $cfg_server_time_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $cmd_command_dd in "$NULL")
echo "$txt_text_md $txt_text_fail [ Install dd ]"; exit ;; esac
dd if=/dev/zero of=$cmd_default_directory_benchmarkdisk/speed.img \
status=progress bs=10M count=10
rm $cmd_default_directory_benchmarkdisk/speed.img &> /dev/null
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
if   [ "$cmd_first_option" == "expert-speed-ram" ]; then
####
####
echo "$txt_text_title_info  [ test ram speed benchamrk ] \
[ for default max $cfg_server_time_waiting seconds ] [ 100Mb will be used to benchmark, while]"
case $cmd_command_dd in "$NULL")
echo "$txt_text_md $txt_text_fail [ Install dd ]"; exit ;; esac
mount -t tmpfs tmpfs $cmd_default_directory_benchmarkram
dd if=/dev/zero of=$cmd_default_directory_benchmarkram/speed.img \
status=progress bs=10M count=10
rm $cmd_default_directory_benchmarkram/speed.img &> /dev/null
umount $cmd_default_directory_benchmarkram
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
if   [ "$cmd_first_option" == "expert-speed-cpu" ]; then
####
####
echo "$header_ok $txt_text_info  [ test cpu processor ] [ calcule pi with 2000 digits ]"
case $cmd_command_bc in "$NULL") echo "$tab $txt_text_fail [ Install bc command ]"; exit ;; esac
echo "$duo_md $txt_text_info [ Calculate pi with 2000 digits in only one cpu ]"
echo "$duo_md $txt_text_info [ For example with 2ghz/cpu is 5 seconds aprox. ] "
time echo 'scale=2000; a(1)*4' | $cmd_command_bc -l | tail -0 
####
####
exit; fi
####
####
#### :rutina-final-expert-speed-cpu:
##########    english: date: update the date and time    ##########
##########    spanish: date: actualiza la fecha y hora   ##########
#### :rutina-inicial-date:
####
####
if [ "$cmd_first_option" == "date" ]; then
####
####
echo "$txt_text_title_info \
[ update the computer time and date from internet ] "
if [ "$cfg_favorite_date_command" == "$NULL" ]; then
echo "$txt_text_md $txt_text_fail [ Install one ntp client ]" ; fi
echo "$txt_text_md Old date: $($cmd_command_date)"
echo "$txt_text_md [ Updating the time and the date .. ]"
pool0="0.debian.pool.ntp.org"
pool1="1.debian.pool.ntp.org"
pool2="2.debian.pool.ntp.org"
pool3="3.debian.pool.ntp.org"
$cfg_favorite_date_command $pool0 && 
echo "$txt_text_md New date: $($cmd_command_date)" ||
echo "$txt_text_md $txt_text_fail No connection to get date"
####
####
exit; fi
####
####
#### :rutina-final-date:
##########    english: wizard: wizard-mini      ##########
##########    spanish: wizard: mini-asistente   ##########
#### :rutina-inicial-wizard:
####
####
if [ "$cmd_first_option" == "wizard" ];  then
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
if [ "$cmd_first_option" == "wizard-tiny" ]; then
####
####
archivo="$cmd_first_option" ; cfg_allow_launchrules_firewall=yes ; cfg_type_firewall="wizard-tiny" ; cfg_name_firewall="wizard-tiny"
$cmd_internal templates-regen
cp "$cmd_default_tinycfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$archivo"
$cfg_favorite_text_editor "$cmd_default_cache_necesary/$cmd_filename-$archivo"
clear
$cfg_favorite_realpath_textdialog --clear --title "Run this wizard" \
--yesno "Run this wizard" 0 0 && clear \
&& cp "$cmd_default_cache_necesary/$cmd_filename-$archivo" \
"$cmd_default_directory_custom/$archivo" && $cmd_internal loadtiny-custom $archivo || clear
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
if [ "$cmd_first_option" == "wizard-mini" ]; then
####
####
archivo="$cmd_first_option" ; cfg_allow_launchrules_firewall=yes ; cfg_type_firewall="wizard-mini" ; cfg_name_firewall="wizard-mini"
$cmd_internal templates-regen
cp "$cmd_default_minicfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$archivo"
$cfg_favorite_text_editor "$cmd_default_cache_necesary/$cmd_filename-$archivo"
clear
$cfg_favorite_realpath_textdialog --clear --title "Run this wizard" \
--yesno "Run this wizard" 0 0 && clear \
&& cp "$cmd_default_cache_necesary/$cmd_filename-$archivo" \
"$cmd_default_directory_custom/$archivo" && $cmd_internal load-custom $archivo || clear
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
if [ "$cmd_first_option" == "wizard-full" ]; then
####
####
archivo="$cmd_first_option" ; cfg_allow_launchrules_firewall=yes ; cfg_type_firewall="wizard-full" ; cfg_name_firewall="wizard-full"
$cmd_internal templates-regen
cp "$cmd_default_fullcfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$archivo"
$cfg_favorite_text_editor "$cmd_default_cache_necesary/$cmd_filename-$archivo"
clear
$cfg_favorite_realpath_textdialog --clear --title "Run this wizard" --yesno \
"Run this wizard" 0 0 && clear && \
cp "$cmd_default_cache_necesary/$cmd_filename-$archivo" "$cmd_default_directory_custom/$archivo" \
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
if [ "$cmd_first_option" == "load" ]; then
####
####
if [ "second_option" == "$NULL" ]; then
$cmd_internal names ; echo "$txt_text_md $txt_text_info \
[ usage: $cmd_internal load fw-to-load ] \
[ See: $cmd_internal names ]" ; exit ; fi
echo "$txt_text_title_info [ loading firewall control $cmd_second_option ]"
####
####
if [ -f $cmd_default_directory_control/$cmd_second_option-nft-ipv4 ] && \
[ -f $cmd_default_directory_control/$cmd_second_option-legacy-ipv4 ] ; then 
$cmd_internal eraserules &> /dev/null
if [ -f "$cmd_default_directory_control/$cmd_second_option-ebtables" ]; then
$cmd_command_cat  $cmd_default_directory_control/$cmd_second_option-ebtables | \
$cmd_command_ebtables-restore &> /dev/null; fi
if [ -f "$cmd_default_directory_control/$cmd_second_option-arptables" ]; then
cat $cmd_default_directory_control/$cmd_second_option-arptables | \
$cmd_command_arptables-restore &> /dev/null; fi
####
#### 
$cmd_command_cat  $cmd_default_directory_control/$cmd_second_option-nft-ipv4 |  $cmd_command_ip4tablesnft-restore       
$cmd_command_cat  $cmd_default_directory_control/$cmd_second_option-legacy-ipv4 | $cmd_command_ip4tableslegacy-restore  
$cmd_command_cat  $cmd_default_directory_control/$cmd_second_option-nft-ipv6 | $cmd_command_ip6tablesnft-restore       
$cmd_command_cat  $cmd_default_directory_control/$cmd_second_option-legacy-ipv6 | $cmd_command_ip6tableslegacy-restore 
#### echo "$txt_text_title_ok [ firewall loaded ] [ name: $cmd_second_option ]"
echo "$txt_text_title_ok [ Launched: firewall ] [ Type: control ] [ Name: $cmd_second_option ]"
####
####
else
$cmd_internal names
echo "$txt_text_md $txt_text_info [ usage: $cmd_internal load fw-to-load ] [ See: $cmd_internal names ]"
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
if [ "$cmd_first_option" == "save" ]; then
####
####
case "$cmd_second_option" in
"$NULL") echo "$txt_text_md $txt_text_info [ Usage: $cmd_internal save fw-to-save ]"
exit ;;
*) archivofin="$cmd_second_option" ;; 
esac
####
####
if [ "$cmd_command_arptables" != "$NULL"  ]; then 
$cmd_command_arptables-save &> $cmd_default_directory_control/$archivofin-arptables; fi
if [ "$cmd_command_ebtables"  != "$NULL"  ]; then 
$cmd_command_ebtables-save &> $cmd_default_directory_control/$archivofin-ebtables; fi
####
####
if [ "$cmd_command_ip4tablesnft"    != "$NULL"  ]; then
$cmd_command_ip4tablesnft-save      &> $cmd_default_directory_control/$archivofin-nft-ipv4 ; fi
if [ "$cmd_command_ip6tablesnft"    != "$NULL"  ]; then
$cmd_command_ip6tablesnft-save      &> $cmd_default_directory_control/$archivofin-nft-ipv6 ; fi
if [ "$cmd_command_ip4tableslegacy" != "$NULL"  ]; then
$cmd_command_ip4tableslegacy-save   &> $cmd_default_directory_control/$archivofin-legacy-ipv4 ; fi
if [ "$cmd_command_ip6tableslegacy" != "$NULL"  ]; then
$cmd_command_ip6tableslegacy-save   &> $cmd_default_directory_control/$archivofin-legacy-ipv6 ; fi
####
####
echo "$txt_text_title_ok [ firewall saved ] [ name: $archivofin ]"
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
if [ "$cmd_first_option" == "show" ]; then 
####
####
echo "$txt_text_title_info  [ show one firewall saved ] "
echo 
case "$cmd_second_option" in
"$NULL") $cmd_internal names
echo "$txt_text_md $txt_text_info [ Use: $cmd_internal show file-to-show ]" ; exit ;;
*) archivofin=$($cmd_command_sed 's/\///g' <<< "$cmd_second_option") ;;
esac
####
####
if [ ! -f "$cmd_default_directory_control/$archivofin-nft-ipv4" ];
then  $cmd_internal names ; exit ; fi
####
####
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-arptables
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-ebtables
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-nft-ipv4
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-nft-ipv6
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-legacy-ipv4
$cmd_command_ls -l $cmd_default_directory_control/$archivofin-legacy-ipv6
echo "$txt_text_title_ok [ FIREWALL LISTED ] [ $archivofin ]"
echo "$txt_text_title $archivofin-arptables"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-arptables
echo "$txt_text_title $archivofin-ebtables"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-ebtables
echo "$txt_text_title $archivofin-nft-ipv4"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-nft-ipv4
echo "$txt_text_title $archivofin-legacy-ipv4"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-legacy-ipv4
echo "$txt_text_title $archivofin-nft-ipv6"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-nft-ipv6
echo "$txt_text_title archivofin-legacy-ipv6"
$cmd_command_cat  $cmd_default_directory_control/$archivofin-legacy-ipv6
echo "$txt_text_title_ok [ firewall readed ] [ $archivofin ]"
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
if [ "$cmd_first_option" == "actual" ]; then
####
####
echo "$txt_text_title_info  [ show the last firewall saved ] "
echo 
$cmd_command_arptables-save          &> $cmd_default_directory_control/$cmd_filename-actual-arptables
$cmd_command_ebtables-save           &> $cmd_default_directory_control/$cmd_filename-actual-ebtables   
$cmd_command_ip4tablesnft-save       &> $cmd_default_directory_control/$cmd_filename-actual-nft-ipv4   
$cmd_command_ip4tableslegacy-save    &> $cmd_default_directory_control/$cmd_filename-actual-legacy-ipv4
$cmd_command_ip6tablesnft-save      &> $cmd_default_directory_control/$cmd_filename-actual-nft-ipv6   
$cmd_command_ip6tableslegacy-save   &> $cmd_default_directory_control/$cmd_filename-actual-legacy-ipv6
echo "$txt_text_title arptables $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-arptables
echo "$txt_text_title ebtables $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-ebtables
echo "$txt_text_title nft with ipv4 $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-nft-ipv4
echo "$txt_text_title legacy with ipv4 $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-legacy-ipv4
echo "$txt_text_title nft with ipv6 $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-nft-ipv6
echo "$txt_text_title legacy with ipv6 $txt_text_title"
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-actual-legacy-ipv6
echo
echo "  $txt_text_ok [ readed firewall actual ]"
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
if [ "$cmd_first_option" == "stop" ]; then
####
####
echo "$txt_text_title_info  [ Stop the firewall ] "
####
####
#### english: save actual fw #### spanish: guarda actual fw
####
####
$cmd_command_arptables-save &> $cmd_default_directory_control/$cmd_filename-stoped-arptables
$cmd_command_ebtables-save &> $cmd_default_directory_control/$cmd_filename-stoped-ebtables             
$cmd_command_ip4tablesnft-save &> $cmd_default_directory_control/$cmd_filename-stoped-nft-ipv4         
$cmd_command_ip4tableslegacy-save &> $cmd_default_directory_control/$cmd_filename-stoped-legacy-ipv4   
$cmd_command_ip6tablesnft-save &> $cmd_default_directory_control/$cmd_filename-stoped-nft-ipv6        
$cmd_command_ip6tableslegacy-save &> $cmd_default_directory_control/$cmd_filename-stoped-legacy-ipv6  
####
####
#### english: erase the rules #### spanish: borra las reglas
####
####
$cmd_internal eraserules &> /dev/null
echo "$txt_text_title_info [ stopping firewall ]"
echo "$txt_text_title_ok [ firewall stopped  ]"
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
if [ "$cmd_first_option" == "continue" ]; then
####
####
echo "$txt_text_title_info  [ Continue the stopped firewall ] "
####
####
#### english: restore last fw #### spanish: restaura el ultimo fw
####
####
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-arptables | $cmd_command_arptables-restore
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-ebtables | $cmd_command_ebtables-restore
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-nft-ipv4 | $cmd_command_ip4tablesnft-restore  
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-legacy-ipv4 | $cmd_command_ip4tableslegacy-restore  
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-nft-ipv6 | $cmd_command_ip6tablesnft-restore  
$cmd_command_cat  $cmd_default_directory_control/$cmd_filename-stoped-legacy-ipv6 | $cmd_command_ip6tableslegacy-restore  
echo "$txt_text_title_info [ continue firewall  ]"
echo "$txt_text_title_ok [ firewall continued ]"
exit; fi
####
####
#### :rutina-final-continue:
##########    english: config-eng: several options to config in english        ##########
##########    spanish: config-eng: varias opciones para configurar en ingles   ##########
#### :rutina-inicial-config-eng:
####
####
if [ "$cmd_first_option" == "config-eng" ]; then 
####
####
echo "$txt_text_title_info [ show variables cfg from english configuration ] "
$cmd_command_cat $cmd_default_fullcfg_eng
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
if [ "$cmd_first_option" == "config-spa" ]; then 
####
####
echo "$txt_text_title_info [ show variables cfg from spanish configuration ] "
$cmd_command_cat  $cmd_default_fullcfg_spa
####
####
exit; fi
####
####
#### :rutina-final-config-spa:
##########    english: add-whitelist4: whitelist ipv4      ##########
##########    spanish: add-whitelist4: lista blanca ipv4   ##########
#### :rutina-inicial-add-wihtelist4
####
####
if [ "$cmd_first_option" == "add-whitelist4" ] || [ "$cmd_first_option" == "expert-add-whitelist4" ]; then
####
####
if [ "$2" == "$NULL" ]; then echo "$txt_text_title_fail type host ip4 or net ip4 to be in whitelist"; exit ; fi
####
####
host_ip="$(echo $2 | sed 's/,/ /g')"
for add in $host_ip ; do
####
####
echo "$txt_text_title [ Working ] ADD ipv4 rules whitelist: ACCEPT to $add"
$cmd_command_ip4tablesnft    -t filter -I INPUT 2 -s $add   -m comment --comment "add-whitelist4"  \
-j ACCEPT &> /dev/null && echo ok rule nft 1/4 with $add || echo without rule nft 1/4
$cmd_command_ip4tablesnft    -t filter -I OUTPUT 2 -d $add  -m comment --comment "add-whitelist4"  \
-j ACCEPT &> /dev/null && echo ok rule nft 2/4 with $add || echo without rule nft 2/4
$cmd_command_ip4tableslegacy -t filter -I INPUT 2 -s $add   -m comment --comment "add-whitelist4"  \
-j ACCEPT &> /dev/null && echo ok rule legacy 3/4 with $add || echo without rule legacy 3/4
$cmd_command_ip4tableslegacy -t filter -I OUTPUT 2 -d $add  -m comment --comment "add-whitelist4"  \
-j ACCEPT &> /dev/null && echo ok rule legacy 4/4 with $add || echo without rule legacy 4/4
####
####
done
####
####
exit; fi
####
####
#### :rutina-final-add-wihtelist4
##########    english: add-whitelist6: whitelist ipv6    ##########
##########    spanish: add-whitelist6: lista blanca ipv6   ##########
#### :rutina-inicial-add-wihtelist6
####
####
if [ "$cmd_first_option" == "add-whitelist6" ] || [ "$cmd_first_option" == "expert-add-whitelist6" ]; then
####
####
if [ "$2" == "$NULL" ]; then echo "$txt_text_title_fail type host ip6 or net ip6 to be in whitelist"; exit ; fi
####
####
host_ip="$(echo $2 | sed 's/,/ /g')"
for add in $host_ip;  do
####
####
echo "$txt_text_title [ Working ] ADD ipv6 rules whitelist: ACCEPT to $add"
$cmd_command_ip6tablesnft    -t filter -I INPUT 2 -s $add   -m comment --comment "add-whitelist6"  \
-j ACCEPT  &> /dev/null && echo ok rule nft 1/4 with $add    || echo without rule nft 1/4
$cmd_command_ip6tablesnft    -t filter -I OUTPUT 2 -d $add  -m comment --comment "add-whitelist6"  \
-j ACCEPT  &> /dev/null && echo ok rule nft 2/4 with $add    || echo without rule nft 2/4
$cmd_command_ip6tableslegacy -t filter -I INPUT 2 -s $add   -m comment --comment "add-whitelist6"  \
-j ACCEPT  &> /dev/null && echo ok rule legacy 3/4 with $add || echo without rule nft 3/4
$cmd_command_ip6tableslegacy -t filter -I OUTPUT 2 -d $2  -m comment --comment "add-whitelist6"  \
-j ACCEPT &> /dev/null && echo ok rule legacy 4/4 with $add  || echo without rule nft 4/4
####
####
done
####
####
exit; fi
####
####
#### :rutina-final-add-wihtelist6
##########    english: add-blacklist4: blacklist ipv4      ##########
##########    spanish: add-blacklist4: lista negra ipv4    ##########
#### :rutina-inicial-add-blacklist4
####
####
if [ "$cmd_first_option" == "add-blacklist4" ] || [ "$cmd_first_option" == "expert-add-blacklist4" ]; then
####
####
if [ "$2" == "$NULL" ]; then
echo "$txt_text_title_fail type host ip4 or net ip4 to be in blacklist" ; exit ; fi
####
####
host_ip="$(echo $2 | sed 's/,/ /g')"
for add in $host_ip ; do
####
####
echo "$txt_text_title [ Working ] ADD ipv4 rules blacklist: DROP to $add"
$cmd_command_ip4tablesnft    -t filter -I INPUT 2 -s $add  -m comment --comment "add-blacklist4" \
-j DROP  &> /dev/null && echo ok rule nft 1/4 with $add    || echo without rule nft 1/4
$cmd_command_ip4tablesnft    -t filter -I OUTPUT 2 -d $add -m comment --comment "add-blacklist4" \
-j DROP  &> /dev/null && echo ok rule nft 2/4 with $add    || echo without rule nft 2/4
$cmd_command_ip4tableslegacy -t filter -I INPUT 2 -s $add  -m comment --comment "add-blacklist4"  \
-j DROP  &> /dev/null && echo ok rule legacy 3/4 with $add || echo without rule legacy 3/4
$cmd_command_ip4tableslegacy -t filter -I OUTPUT 2 -d $add -m comment --comment "add-blacklist4" \
-j DROP &> /dev/null  && echo ok rule legacy 4/4 with $add || echo without rule legacy 4/4
####
####
done
####
####
exit; fi
####
####
#### :rutina-final-add-blacklist4
##########    english: add-blacklist6: blacklist ipv6    ##########
##########    spanish: add-blacklist6: lista negra ipv6   ##########
#### :rutina-inicial-add-blacklist6
####
####
if [ "$cmd_first_option" == "add-blacklist6" ] || [ "$cmd_first_option" == "expert-add-blacklist6" ]; then
####
####
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail type host ip6 or net ip6 to be in blacklist"; exit ; fi
####
####
host_ip="$(echo $2 | sed 's/,/ /g')"
for add in $host_ip ; do
####
####
echo "$txt_text_title [ Working ] ADD ipv6 rules blacklist: DROP to $add"
$cmd_command_ip6tablesnft    -t filter -I INPUT 2 -s $add  -m comment --comment "add-blacklist6" \
-j DROP  &> /dev/null && echo ok rule nft 1/4 with $add   || echo without rule nft 1/4
$cmd_command_ip6tablesnft    -t filter -I OUTPUT 2 -d $add -m comment --comment "add-blacklist6" \
-j DROP  &> /dev/null && echo ok rule nft 2/4 with $add   || echo without rule nft 2/4
$cmd_command_ip6tableslegacy -t filter -I INPUT 2 -s $add  -m comment --comment "add-blacklist6" \
-j DROP &> /dev/null && echo ok rule legacy 3/4 with $add || echo without rule legacy 3/4
$cmd_command_ip6tableslegacy -t filter -I OUTPUT 2 -d $add -m comment --comment "add-blacklist6" \
-j DROP &> /dev/null && echo ok rule legacy 4/4 with $add || echo without rule legacy 4/4
####
####
done
####
####
exit; fi
####
####
#### :rutina-final-add-blacklist6
##########    english: speed-ip4: speed from internet        ##########
##########    spanish: speed-ip4: velocidad desde internet   ##########
#### :rutina-inicial-speed-ip4:
####
####
if [ "$cmd_first_option" == "speed-ip4" ] || [ "$cmd_first_option" == "expert-speed-ip4" ]; then
####
####
echo "$txt_text_title_info  [ test speed ipv4 with iperf ] "
echo "$txt_text_title $cmd_internal use or iperf or iperf3"
if [ "$cfg_favorite_iperf_command" == "$NULL" ];
then echo "$txt_text_title_fail install iperf";
else echo "$txt_text_title_ok [ choosed iperf ]"; fi
echo "$txt_text_title"
# echo "$txt_text_title [ Working ] Saving firewall before speed-ip4"
$cmd_internal save before-speed-ip4
$cmd_internal add-whitelist4 $cfg_server_ip_iperf_ipv4
echo "$txt_text_title"
echo "$txt_text_title [ Calculing speed .. ]"
echo "$txt_text_title [ Working ] Conecting in ipv4 to $cfg_server_ip_iperf_ipv4 ]"
$cfg_favorite_iperf_command -4 -t 4 -c $cfg_server_ip_iperf_ipv4 -p $cfg_server_port_iperf_ipv4
echo "$txt_text_title"
echo "$txt_text_title [ Working ] [ Restoring firewall ]"
$cmd_internal load before-speed-ip4
echo "$txt_text_title_done $cmd_internal speed-ip4"
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
if [ "$cmd_first_option" == "speed-ip6" ] || [ "$cmd_first_option" == "expert-speed-ip6" ]; then
####
####
echo "$txt_text_title_info  [ test speed ipv6 with iperf ] "
echo "$txt_text_title $cmd_internal use or iperf or iperf3"
if [ "$cfg_favorite_iperf_command" == "$NULL" ];
then echo "$txt_text_title_fail install iperf";
else echo "$txt_text_title_ok [ choosed iperf ]"; fi
$cmd_internal save before-speed-ip6 
$cmd_internal add-whitelist6 $cfg_server_ip_iperf_ipv6
echo "$txt_text_title"
echo "$txt_text_title [ Calculing speed .. ]"
echo "$txt_text_title [ Working ] Conecting in ipv6 to $cfg_server_ip_iperf_ipv4 ]"
$cfg_favorite_iperf_command -6 -t 4 -P 1 -c $cfg_server_ip_iperf_ipv6 -p $cfg_server_port_iperf_ipv6 
echo "$txt_text_title"
echo "$txt_text_title [ Working ] [ Restoring firewall ]"
$cmd_internal load before-speed-ip6 
echo "$txt_text_title_done $cmd_internal speed-ip6"
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
if   [ "$cmd_first_option" == "sockets" ]; then
####
####
echo "$txt_text_title_info [ Show whith ss: LISTEN sockets ] "
if [ "$cmd_command_ss" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install ss command ]"; exit; fi
if [ "$cmd_command_awk" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install awk command ]"; exit; fi
$cmd_command_ss -l -460  | $cmd_command_grep "\:\*" | \
$cmd_command_awk '{print "     " $1 " " $2 " " $5}' ;
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
if   [ "$cmd_first_option" == "web" ]; then
####
####
echo "$txt_text_title_info [ Show one web with command text browser ]"
####
####
if [ "$cfg_favorite_text_browser" == "$NULL" ]; then 
echo "### install: or lynx, or links, or links2, or w3m"; exit ; fi
####
####
if [ "$2" == "$NULL" ]; then 
echo "### type a one link web"; exit ; fi
####
####
url_browse_web="$2"
echo "###"
echo "### With the  browser: $cfg_favorite_text_browser"
echo "### With the link web: $2"
echo "###"
####
####
$cfg_favorite_text_browser -dump $url_browse_web
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
if   [ "$cmd_first_option" == "expert-project-web" ]; then
####
####
echo "$txt_text_title_info [ version - date - size - downloaded last week ]"
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
if   [ "$cmd_first_option" == "expert-browser-web" ]; then
####
####
echo "$txt_text_title_info [ Show one web with command text browser ]"
####
####
if [ "$cfg_favorite_text_browser" == "$NULL" ]; then 
echo "#### install: or lynx, or links, or links2, or w3m"; fi
####
####
if [ "$cmd_second_option" == "$NULL" ]; then 
echo "#### specify web choosed to browse the web, example kernel.org"; exit ; fi
####
####
url_browse_web="$2"
echo "#### browser: $cfg_favorite_text_browser"
echo "####    link: $2"
####
####
$cfg_favorite_text_browser -dump $url_browse_web
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
if   [ "$cmd_first_option" == "expert-sockets-ss" ]; then
####
####
echo "$txt_text_title_info [ Show whith ss: sockets ] "
if [ "$cmd_command_ss" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install ss command ]"; exit; fi
#### if [ "$cmd_command_awk" == "$NULL" ]; then 
#### echo "$txt_text_title_fail [ Install awk command ]"; exit; fi
echo "$txt_text_title sockets ipv4"
$cmd_command_ss -4
$cmd_command_ss -l4
echo "$txt_text_title sockets ipv6"
$cmd_command_ss -6
$cmd_command_ss -l6
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
if [ "$cmd_first_option" == "lsof" ] || \
[ "$cmd_first_option" == "expert-sockets-lsof" ]; then
####
####
echo "$txt_text_title_info [ Show whith lsof: sockets ] "
if [ "$cmd_command_lsof" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install lsof command ]"; exit; fi
$cmd_command_lsof -i
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
if   [ "$cmd_first_option" == "expert-sockets-netstat" ]; then
####
####
echo "$txt_text_title_info [ Show whith lsof: sockets ] "
if [ "$cmd_command_lsof" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Install lsof command ]"; exit; fi
#### if [ "$cmd_command_awk" == "$NULL" ]; then 
#### echo "$txt_text_title_fail [ Install awk command ]"; exit; fi
$cmd_command_netstat -l46
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
if   [ "$cmd_first_option" == "expert-show-webcert" ] ; then
####
####
echo "$txt_text_title_info \
[ get one web certifcate from one server with port 443]"
case "$cmd_command_openssl"  in  $NULL)
echo "$txt_text_md $txt_text_fail [ install openssl ]"; exit ;; esac
####
####
if [ "$cmd_second_option" == "$NULL" ]; then
echo "[ get one web certifcate ] \
[ Example: $cmd_internal webcert www.fast.com ]"; exit; fi
echo
$cmd_command_timeout -s SIGINT -v $cfg_server_time_waiting \
$cmd_command_openssl s_client -connect $cmd_second_option:443
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
if   [ "$cmd_first_option" == "expert-nmap-tcp" ]; then
####
####
echo "$txt_text_title_info  [ scan with nmap tcp ]"
if [ "$cmd_command_nmap" == "$NULL" ];  then
echo "$txt_text_title Please install nmap to work"; exit; fi
echo "$txt_text_title_info [ Use: $cmd_internal $cmd_first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Use: $cmd_internal $cmd_first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-tcp 
$cmd_internal add-whitelist4 $2
echo "$txt_text_title [ Working ] [ Doing nmap to $2 ]"
$cmd_command_nmap -sT $2
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
if   [ "$cmd_first_option" == "expert-nmap-syn" ]; then
####
####
echo "$txt_text_title_info  [ scan with nmap syn ]"
if [ "$cmd_command_nmap" == "$NULL" ];  then
echo "$txt_text_title Please install nmap to work"; exit; fi
echo "$txt_text_title_info [ Use: $cmd_internal $cmd_first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Use: $cmd_internal $cmd_first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-syn
$cmd_internal add-whitelist4 $2
echo "$txt_text_title [ Working ] [ Doing nmap to $2 ]"
$cmd_command_nmap -sF $2
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
if   [ "$cmd_first_option" == "expert-nmap-fin" ] ; then
####
####
echo "$txt_text_title_info  [ scan with nmap fin ]"
if [ "$cmd_command_nmap" == "$NULL" ];  then
echo "$txt_text_title Please install nmap to work"; exit; fi
echo "$txt_text_title_info [ Use: $cmd_internal $cmd_first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Use: $cmd_internal $cmd_first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-fin 
$cmd_internal add-whitelist4 $2
echo "$txt_text_title [ Working ] [ Doing nmap to $2 ]"
$cmd_command_nmap -sT $2
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
if   [ "$cmd_first_option" == "expert-nmap-udp" ]; then
####
####
echo "$txt_text_title_info  [ scan with nmap udp ]"
if [ "$cmd_command_nmap" == "$NULL" ];  then
echo "$txt_text_title Please install nmap to work"; exit; fi
echo "$txt_text_title_info [ Use: $cmd_internal $cmd_first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Use: $cmd_internal $cmd_first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-udp
$cmd_internal add-whitelist4 $2
echo "$txt_text_title [ Working ] [ Doing nmap to $2 ]"
$cmd_command_nmap -sU $2
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
if   [ "$cmd_first_option" == "expert-nmap-ping" ] ; then
####
####
echo "$txt_text_title_info  [ scan with nmap ping ]"
if [ "$cmd_command_nmap" == "$NULL" ];  then
echo "$txt_text_title Please install nmap to work"; exit; fi
echo "$txt_text_title_info [ Use: $cmd_internal $cmd_first_option ip/net ]"
if [ "$2" == "$NULL" ]; then 
echo "$txt_text_title_fail [ Use: $cmd_internal $cmd_first_option ip/net ]"; exit ; fi
$cmd_internal save before-nmap-ping
$cmd_internal add-whitelist4 $2
echo "$txt_text_title [ Working ] [ Doing nmap to $2 ]"
$cmd_command_nmap -sn $2
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
if [ "$cmd_first_option" == "gui" ] && [ "$cmd_third_option" != "$NULL" ]
####
####
then echo $txt_head_waiting_gui
####
####
case $cmd_second_option in
#### 
#### 
"new-tiny-custom")
cp "$cmd_default_tinycfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=NEW-TINY-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option\
ANDlaunch:$cmd_internal-load-custom-$cmd_third_option ; exit
else rm "$cmd_default_directory_custom/$cmd_third_option" ; 
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
#### 
"nueva-diminuta-custom")
cp "$cmd_default_tinycfg_spa" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=NUEVA-DIMINUTA-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option-\
AND-launch:$cmd_internal-loadtiny-custom-$cmd_third_option ; exit
else rm $cmd_default_directory_custom/$cmd_third_option ; 
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
####
"new-mini-custom")
cp "$cmd_default_minicfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=NEW-MINI-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option\
ANDlaunch:$cmd_internal-load-custom-$cmd_third_option ; exit
else rm "$cmd_default_directory_custom/$cmd_third_option" ; 
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
#### 
"nueva-mini-custom")
cp "$cmd_default_minicfg_spa" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=NUEVA-MINI-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option-\
AND-launch:$cmd_internal-load-custom-$cmd_third_option ; exit
else rm $cmd_default_directory_custom/$cmd_third_option ; 
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
#### 
"new-full-custom")
cp "$cmd_default_fullcfg_eng" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=NEW-FULL-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option-\
AND-launch:-$cmd_internal-load-custom-$cmd_third_option ; exit
else rm $cmd_default_directory_custom/$cmd_third_option ; 
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
#### 
"nueva-completa-custom")
cp "$cmd_default_fullcfg_spa" "$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option \
--editable --title=NUEVA-COMPLETA-CONFIG 1> "$cmd_default_directory_custom/$cmd_third_option" ;
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK-new-config-file-$cmd_third_option-\
AND-launch:$cmd_internal-load-custom-$cmd_third_option ; exit
else rm "$cmd_default_directory_custom/$cmd_third_option" ; 
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled-new-file-$cmd_third_option ; exit; fi
;;
#### 
#### 
"modify-custom")
if [ ! -f "$cmd_default_directory_custom/$cmd_third_option" ]
then $cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=file-not-found:$cmd_third_option ; exit ; fi 
cp "$cmd_default_directory_custom/$cmd_third_option" \
"$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option"
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename="$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option" \
--editable --title=MODIFY-CONFIG 1> $cmd_default_directory_custom/$cmd_third_option
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK.file-$cmd_third_option
else cp $cmd_default_cache_necesary/$cmd_filename-$cmd_third_option \
$cmd_default_directory_custom/$cmd_third_option
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled.file-$cmd_third_option; fi
;;
####
####
"expert-wpa-new")
$cmd_internal expert-wpa-regen
cp $cmd_default_directory_wpa/defaultwpa $cmd_default_directory_wpa/wpaconfig_$cmd_third_option
$cmd_internal gui expert-wpa-modify $cmd_third_option
;;
####
####
"expert-wpa-modify")
if [ ! -f "$cmd_default_directory_wpa/wpaconfig_$cmd_third_option" ]
then $cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=file-not-found:-wpaconfig_$cmd_third_option ; exit ; fi 
cp "$cmd_default_directory_wpa/wpaconfig_$cmd_third_option 
"$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option \
--editable --title=MODIFY-CONFIG 1> $cmd_default_directory_wpa/wpaconfig_$cmd_third_option
if [ -s "$cmd_default_directory_wpa/wpaconfig_$cmd_third_option" ]; then  
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK.file-$cmd_third_option
else cp $cmd_default_cache_necesary/$cmd_filename-$cmd_third_option \
$cmd_default_directory_wpa/wpaconfig_$cmd_third_option
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled.file-wpaconfig-$cmd_third_option; fi
;;
####
####
*)$cmd_internal "$cmd_second_option" "$cmd_third_option" "$cmd_quad_option" &> $cmd_file_output_cache
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename="$cmd_file_output_cache" --auto-scroll ;;
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
if [ "$cmd_first_option" == "gui" ] && [ "$cmd_second_option" != "$NULL" ]
####
####
then echo $txt_head_waiting_gui
####
####
case $cmd_second_option in
#### 
####
list*)$cmd_internal txt $cmd_second_option $cmd_third_option \
$cmd_quad_option &> $cmd_file_output_cache
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename=$cmd_file_output_cache --auto-scroll ;;
####
####
"wizard-tiny")
archivo=wizard-tiny
cp $cmd_default_tinycfg_eng $cmd_default_cache_necesary/$cmd_filename-$archivo
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD TINY 1> $cmd_default_directory_custom/$archivo
if [  -s $cmd_default_directory_custom/$archivo ]; then
$cmd_internal -gui loadtiny-custom $archivo ; $cmd_internal -gui list4;
else rm $cmd_default_directory_custom/$archivo ;
$cfg_favorite_realpath_graphicalldialog --info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text Ok-$archivo-canceled; fi
;;
#### 
#### 
"wizard-mini")
archivo=wizard-mini
cp $cmd_default_minicfg_eng $cmd_default_cache_necesary/$cmd_filename-$archivo
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD MINI 1> $cmd_default_directory_custom/$archivo
if [  -s $cmd_default_directory_custom/$archivo ]; then
$cmd_internal -gui load-custom $archivo ; $cmd_internal -gui list4;
else rm $cmd_default_directory_custom/$archivo ;
$cfg_favorite_realpath_graphicalldialog --info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text Ok-$archivo-canceled; fi
;;
#### 
#### 
"wizard-full")
archivo=wizard-full
cp $cmd_default_fullcfg_eng $cmd_default_cache_necesary/$cmd_filename-$archivo
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$archivo \
--editable --title=WIZARD-FULL 1> $cmd_default_directory_custom/$archivo
if [  -s $cmd_default_directory_custom/$archivo ]; then
$cmd_internal -gui load-custom $archivo ; $cmd_internal -gui list4;
else rm $cmd_default_directory_custom/$archivo ;
$cfg_favorite_realpath_graphicalldialog  --info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
#### 
#### 
"modify-custom")
if [ ! -f "$cmd_default_directory_custom/$cmd_third_option" ] ; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=file-not-found:-$cmd_third_option ; exit ; fi 
cp $cmd_default_directory_custom/$cmd_third_option \
$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_default_cache_necesary/$cmd_filename-$cmd_third_option \
--editable --title=MODIFY-CONFIG $cmd_third_option 1> $cmd_default_directory_custom/$cmd_third_option
if [ -s "$cmd_default_directory_custom/$cmd_third_option" ]; then
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=OK.file-$cmd_third_option
else cp $cmd_default_cache_necesary/$cmd_internal-$cmd_third_option \
$cmd_default_directory_custom/$cmd_third_option
$cfg_favorite_realpath_graphicalldialog --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=Canceled.file-$cmd_third_option; fi
;;
#### 
####
"preferences-edit")
archivo="default"
cp $cmd_file_default_preferences $cmd_file_default_preferences.old
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_file_default_preferences.old \
--editable --title=MODIFY-PREFERENCES 1> $cmd_file_default_preferences
if [ ! -s "$cmd_file_default_preferences" ];
then cp $cmd_file_default_preferences.old $cmd_file_default_preferences 
$cfg_favorite_realpath_graphicalldialog  --info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
#### 
####
"alias-edit")
archivo="default"
cp $cmd_file_default_alias $cmd_file_default_alias.old
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--filename=$cmd_file_default_alias.old \
--editable --title=MODIFY-ALIAS 1> $cmd_file_default_alias
if [ ! -s "$cmd_file_default_alias" ];
then cp $cmd_file_default_alias.old $cmd_file_default_alias 
$cfg_favorite_realpath_graphicalldialog  --info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text OK.$archivo-canceled; fi
;;
####
####
*)$cmd_internal txt $cmd_second_option $cmd_third_option \
$cmd_quad_option &> $cmd_file_output_cache
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename=$cmd_file_output_cache --auto-scroll
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
if [ "$cmd_first_option" == "gui" ] && [ "$cmd_second_option" == "$NULL" ]
then echo $txt_head_waiting_gui
####
####
if [ "$cfg_favorite_realpath_graphicalldialog" == "$NULL" ]; then 
echo "$txt_text_title there is not graphicall dialog" ; exit ; fi
####
####
$cmd_internal txt $cmd_second_option $cmd_third_option &> $cmd_file_output_cache
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Gui-Output-$cmd_internal \
--filename=$cmd_file_output_cache --auto-scroll 
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
if   [ "$cmd_first_option" == "gui-shell-zenity" ]
####
####
then echo $txt_head_waiting_gui
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_internal gui-shell-zenity"
untexto="$cmd_internal gui-shell-zenity"
favorite_realpath_graphicalldialog="$cmd_command_zenity"
####
####
#### cd $cmd_default_directory_custom
####
####
menugtk="$($cmd_command_zenity --entry \
--title=Example:options \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height )"
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
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"modify-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"modify-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-mini-custom $unarchivo
;;
new-tiny-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity new-tiny-custom $unarchivo
;;
nueva-diminuta-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity nueva-diminuta-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity show-custom $unarchivo
;;
wizard-full*) $cmd_internal -gui-zenity wizard-full ;;
wizard-mini*) $cmd_internal -gui-zenity wizard-mini ;;
wizard-tiny*) $cmd_internal -gui-zenity wizard-tiny ;;
preferences-edit*) 
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity preferences-edit 
;;
alias-edit*) 
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-zenity alias-edit 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
"$NULL")  exit ;;
*) $cmd_internal $menugtk &> $cmd_file_output_cache
$cfg_favorite_realpath_graphicalldialog  --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=$cmd_internal-gui-shell \
--filename=$cmd_file_output_cache --auto-scroll
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
if   [ "$cmd_first_option" == "gui-shell-yad" ]
####
####
then echo $txt_head_waiting_gui
####
####
####  english: principal gui  #### spanish: principal gui
####
####
titulo="$cmd_internal gui-shell-yad"
untexto="$cmd_internal gui-shell-yad"
favorite_realpath_graphicalldialog="$cmd_command_yad"
####
####
#### cd $cmd_default_directory_custom
####
####
menugtk="$($cmd_command_yad --entry \
--title=Example:options \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height )"
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
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"modify-custom")
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: new-full-custom and nueva-completa-custom whithout parameters ####
#### spanish: new-full-custom and nueva-completa-custom sin parametros      ####
####
####
"new-full-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-completa-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"new-mini-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-mini-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-tiny-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"nueva-diminuta-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
"modify-custom" )
$cfg_favorite_realpath_graphicalldialog  --forms \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--text=$txt_text_md-info-use-one-custom-config.cfg
;;
####
####
#### english: several options con parametros
#### spanish: varias opciones con parametros
####
####
new-full-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad new-full-custom $unarchivo
;;
nueva-completa-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-completa-custom $unarchivo
;;
new-mini-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad new-mini-custom $unarchivo
;;
nueva-mini-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-mini-custom $unarchivo
;;
new-tiny-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad new-tiny-custom $unarchivo
;;
nueva-diminuta-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad nueva-diminuta-custom $unarchivo
;;
modify-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad modify-custom $unarchivo
;;
show-custom*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad show-custom $unarchivo 
;;
wizard-full*) $cmd_internal -gui-yad wizard-full ;;
wizard-mini*) $cmd_internal -gui-yad wizard-mini ;;
wizard-tiny*) $cmd_internal -gui-yad wizard-tiny ;;
preferences-edit*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad preferences-edit 
;;
alias-edit*)
unarchivo=$(echo $menugtk | $cmd_command_sed 's/\///g' | $cmd_command_cut -d " " -f 2)
$cmd_internal -gui-yad alias-edit 
;;
####
####
#### english: all other otpions    ####
#### spanish: las demas opciones   ####
####
####
*) $cmd_internal $menugtk &> $cmd_file_output_cache
$cmd_command_yad --text-info \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=$cmd_internal-gui-shelL-$menugtk \
--filename=$cmd_file_output_cache --auto-scroll
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
if [ "$cmd_first_option" == "cli-menu" ]; then
####
####
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001  "$txt_text_md intro" \
002  "$txt_text_md info-options" \
003  "$txt_text_md firewall-listconceptual" \
004  "$txt_text_md firewall-listnumeral" \
005  "$txt_text_md firewall-wallcontrol" \
006  "$txt_text_md firewall-wallcustom" \
007  "$txt_text_md firewall-wallsystem" \
008  "$txt_text_md firewall-netsystem"  \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal $cfg_favorite_out_cli intro                    ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli info-options             ;;
003) clear ; $cmd_internal cli-menu-listconceptual $cfg_favorite_base_cli ;;
004) clear ; $cmd_internal cli-menu-listnumeral    $cfg_favorite_base_cli ;;
005) clear ; $cmd_internal cli-menu-wallcontrol    $cfg_favorite_base_cli ;;
006) clear ; $cmd_internal cli-menu-wallcustom     $cfg_favorite_base_cli ;;
007) clear ; $cmd_internal cli-menu-wallsystem     $cfg_favorite_base_cli ;;
008) clear ; $cmd_internal cli-menu-netsystem      $cfg_favorite_base_cli ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
exit; fi
####
####
#### :rutina-final-cli-menu:
##########    english: cli-menu-listconceptual: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-listconceptual: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-listconceptual:
####
####
if [ "$cmd_first_option" == "cli-menu-listconceptual" ]; then
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options ] $txt_text_title" \
003 "$txt_text_title [ Firewall List With Conceptual ] $txt_text_title" \
004  "$txt_text_md ls4" \
005  "$txt_text_md ls6"  \
006  "$txt_text_md list-filter4" \
007  "$txt_text_md list-filter6" \
008  "$txt_text_md list-forward" \
009  "$txt_text_md list-forward6" \
010  "$txt_text_md list-nat4" \
011  "$txt_text_md list-nat6" \
012  "$txt_text_md list-alltables" \
013  "$txt_text_md list-raw4" \
014  "$txt_text_md list-raw6" \
015  "$txt_text_md list-mangle4" \
016  "$txt_text_md list-mangle6" \
017  "$txt_text_md list-security4" \
018  "$txt_text_md list-security6" \
019  "$txt_text_md list-ebtables" \
020  "$txt_text_md list-arptables" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-listconceptual ;;
004) clear ; $cmd_internal $cfg_favorite_out_cli ls4 ;;
005) clear ; $cmd_internal $cfg_favorite_out_cli ls6 ;;
006) clear ; $cmd_internal $cfg_favorite_out_cli list-filter4 ;;
007) clear ; $cmd_internal $cfg_favorite_out_cli list-filter6 ;;
008) clear ; $cmd_internal $cfg_favorite_out_cli list-forward ;;
009) clear ; $cmd_internal $cfg_favorite_out_cli list-forward6 ;;
010) clear ; $cmd_internal $cfg_favorite_out_cli list-nat4 ;;
011) clear ; $cmd_internal $cfg_favorite_out_cli list-nat6 ;;
012) clear ; $cmd_internal $cfg_favorite_out_cli list-alltables ;;
013) clear ; $cmd_internal $cfg_favorite_out_cli list-raw4 ;;
014) clear ; $cmd_internal $cfg_favorite_out_cli list-raw6 ;;
015) clear ; $cmd_internal $cfg_favorite_out_cli list-mangle4 ;; 
016) clear ; $cmd_internal $cfg_favorite_out_cli list-mangle6 ;;
017) clear ; $cmd_internal $cfg_favorite_out_cli list-security4 ;;
018) clear ; $cmd_internal $cfg_favorite_out_cli list-security6 ;;
019) clear ; $cmd_internal $cfg_favorite_out_cli list-ebtables ;;
020) clear ; $cmd_internal $cfg_favorite_out_cli list-arptables ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-listconceptual:
##########    english: cli-menu-listnumeral: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-listnumeral: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-listnumeral:
####
####
if [ "$cmd_first_option" == "cli-menu-listnumeral" ]; then
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options     ] $txt_text_title" \
003 "$txt_text_title [ Firewall Numeral ] $txt_text_title" \
004  "$txt_text_md lsn4" \
005  "$txt_text_md lsn6"  \
006  "$txt_text_md listn-filter4" \
007  "$txt_text_md listn-filter6" \
008  "$txt_text_md listn-forward" \
009  "$txt_text_md listn-forward6" \
010  "$txt_text_md listn-nat4" \
011  "$txt_text_md listn-nat6" \
012  "$txt_text_md listn-alltables" \
013  "$txt_text_md listn-raw4" \
014  "$txt_text_md listn-raw6" \
015  "$txt_text_md listn-mangle4" \
016  "$txt_text_md listn-mangle6" \
017  "$txt_text_md listn-security4" \
018  "$txt_text_md listn-security6" \
019  "$txt_text_md list-ebtables" \
020  "$txt_text_md list-arptables" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-listnumeral ;;
004) clear ; $cmd_internal $cfg_favorite_out_cli lsn4 ;;
005) clear ; $cmd_internal $cfg_favorite_out_cli lsn6 ;;
006) clear ; $cmd_internal $cfg_favorite_out_cli listn-filter4 ;;
007) clear ; $cmd_internal $cfg_favorite_out_cli listn-filter6 ;;
008) clear ; $cmd_internal $cfg_favorite_out_cli listn-forward ;;
009) clear ; $cmd_internal $cfg_favorite_out_cli listn-forward6 ;;
010) clear ; $cmd_internal $cfg_favorite_out_cli listn-nat4 ;;
011) clear ; $cmd_internal $cfg_favorite_out_cli listn-nat6 ;;
012) clear ; $cmd_internal $cfg_favorite_out_cli listn-alltables ;;
013) clear ; $cmd_internal $cfg_favorite_out_cli listn-raw4 ;;
014) clear ; $cmd_internal $cfg_favorite_out_cli listn-raw6 ;;
015) clear ; $cmd_internal $cfg_favorite_out_cli listn-mangle4 ;; 
016) clear ; $cmd_internal $cfg_favorite_out_cli listn-mangle6 ;;
017) clear ; $cmd_internal $cfg_favorite_out_cli listn-security4 ;;
018) clear ; $cmd_internal $cfg_favorite_out_cli listn-security6 ;;
019) clear ; $cmd_internal $cfg_favorite_out_cli list-ebtables ;;
020) clear ; $cmd_internal $cfg_favorite_out_cli list-arptables ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-listnumeral:
##########    english: cli-menu-wallcontrol: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallcontrol: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallcontrol:
####
####
if [ "$cmd_first_option" == "cli-menu-wallcontrol" ]; then
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options     ] $txt_text_title" \
003 "$txt_text_title [ Firewall Control ] $txt_text_title" \
004  "$txt_text_md stop" \
005  "$txt_text_md continue" \
006  "$txt_text_md reset" \
007  "$txt_text_md names"  \
008  "$txt_text_md show" \
009  "$txt_text_md save" \
010  "$txt_text_md load" \
011  "$txt_text_md actual" \
012  "$txt_text_md eraserules" \
013  "$txt_text_md wizard-tiny" \
014  "$txt_text_md wizard-mini" \
015  "$txt_text_md wizard-full" \
016  "$txt_text_md without-connection" \
017  "$txt_text_md input-permisive" \
018  "$txt_text_md input-established" \
019  "$txt_text_md eraserules4" \
020  "$txt_text_md eraserules6" \
021  "$txt_text_md eraserules" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-wallcontrol ;;
004) clear ; $cmd_internal $cfg_favorite_out_cli stop ;;
005) clear ; $cmd_internal $cfg_favorite_out_cli continue ;;
006) clear ; $cmd_internal $cfg_favorite_out_cli reset ;;
007) clear ; $cmd_internal $cfg_favorite_out_cli names ;;
008) clear ; $cmd_internal txt names ; echo "$txt_text_title"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $cmd_command_sed s/\\///g)
$cmd_internal show $nombrecillo ;; 
009)archivo="$($cfg_favorite_realpath_textdialog --stdout \
--title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
clear ;  echo "$txt_text_title saved $archivo" ; $cmd_internal save $archivo ;;
010) clear ; $cmd_internal names ; echo "$txt_text_title"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $cmd_command_sed s/\\///g)
$cmd_internal load $nombrecillo ;;
011) clear ; $cmd_internal $cfg_favorite_out_cli actual ;;
012) clear ; $cmd_internal $cfg_favorite_out_cli eraserules ; $cmd_internal cli list4   ;;
013) clear ; $cmd_internal $cfg_favorite_out_cli wizard-tiny ; $cmd_internal cli list4  ;;
014) clear ; $cmd_internal $cfg_favorite_out_cli wizard-mini ; $cmd_internal cli list4  ;;
015) clear ; $cmd_internal $cfg_favorite_out_cli wizard-full ; $cmd_internal cli list4  ;;
016) clear ; $cmd_internal $cfg_favorite_out_cli without-connection ; $cmd_internal cli list4  ;;
017) clear ; $cmd_internal $cfg_favorite_out_cli input-permisive ; $cmd_internal cli list4   ;;
018) clear ; $cmd_internal $cfg_favorite_out_cli input-established ; $cmd_internal cli list4   ;;
019) clear ; $cmd_internal $cfg_favorite_out_cli eraserules4 ; $cmd_internal cli list4   ;;
020) clear ; $cmd_internal $cfg_favorite_out_cli eraserules6 ; $cmd_internal cli list6   ;;
021) clear ; $cmd_internal $cfg_favorite_out_cli eraserules ; $cmd_internal cli status   ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-wallcontrol:
##########    english: cli-menu-wallsystem: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallsystem: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallsystem:
####
####
if [ "$cmd_first_option" == "cli-menu-wallsystem" ]; then
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options        ] $txt_text_title" \
003 "$txt_text_title [ Firewall Wallsystem ] $txt_text_title" \
007  "$txt_text_md client-basic" \
008  "$txt_text_md client-web" \
009  "$txt_text_md client-ssh" \
010  "$txt_text_md client-telnet" \
011  "$txt_text_md client-git" \
012  "$txt_text_md games-shooter" \
013  "$txt_text_md game-wesnoth" \
014  "$txt_text_md game-minetest" \
015  "$txt_text_md game-freeciv" \
016  "$txt_text_md game-widelands" \
017  "$txt_text_md client-web" \
018  "$txt_text_md client-vnc" \
019  "$txt_text_md client-tor" \
020  "$txt_text_md client-vpn" \
021  "$txt_text_md client-torrent" \
022  "$txt_text_md lan-tor" \
023  "$txt_text_md lan-vpn" \
024  "$txt_text_md shield-ssh" \
025  "$txt_text_md server-ssh" \
026  "$txt_text_md server-web" \
027  "$txt_text_md server-vnc" \
028  "$txt_text_md server-print" \
029  "$txt_text_md server-samba" \
030  "$txt_text_md server-lamp" \
031  "$txt_text_md server-mail" \
032  "$txt_text_md server-ftp" \
033  "$txt_text_md server-news" \
034  "$txt_text_md server-teamspeak" \
035  "$txt_text_md server-mumble" \
036  "$txt_text_md server-sql" \
037  "$txt_text_md server-asterisk" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-wallsystem ;;
007) clear ; $cmd_internal txt client-basic ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
008) clear ; $cmd_internal txt client-web ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
009) clear ; $cmd_internal txt client-ssh ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
010) clear ; $cmd_internal txt client-telnet ; $cmd_internal $cfg_favorite_out_cli list4   ;;
011) clear ; $cmd_internal txt client-git ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
012) clear ; $cmd_internal txt games-shooter ; $cmd_internal $cfg_favorite_out_cli list4   ;; 
013) clear ; $cmd_internal txt game-wesnoth ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
014) clear ; $cmd_internal txt game-minetest ; $cmd_internal $cfg_favorite_out_cli list4   ;;
015) clear ; $cmd_internal txt game-freeciv ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
016) clear ; $cmd_internal txt game-widelands ; $cmd_internal  $cfg_favorite_out_cli list4 ;;
017) clear ; $cmd_internal txt client-web ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
018) clear ; $cmd_internal txt client-vnc ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
019) clear ; $cmd_internal txt client-tor ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
020) clear ; $cmd_internal txt client-vpn ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
021) clear ; $cmd_internal txt client-torrent ; $cmd_internal $cfg_favorite_out_cli list4  ;;
022) clear ; $cmd_internal txt lan-tor ; $cmd_internal       $cfg_favorite_out_cli list4   ;;
023) clear ; $cmd_internal txt lan-vpn ; $cmd_internal       $cfg_favorite_out_cli list4   ;; 
024) clear ; $cmd_internal txt shield-ssh ; $cmd_internal    $cfg_favorite_out_cli list4   ;; 
025) clear ; $cmd_internal txt server-ssh ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
026) clear ; $cmd_internal txt server-web ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
027) clear ; $cmd_internal txt server-vnc ; $cmd_internal    $cfg_favorite_out_cli list4   ;;
028) clear ; $cmd_internal txt server-print ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
029) clear ; $cmd_internal txt server-samba ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
030) clear ; $cmd_internal txt server-lamp ; $cmd_internal  $cfg_favorite_out_cli list4    ;;
031) clear ; $cmd_internal txt server-mail ; $cmd_internal  $cfg_favorite_out_cli list4    ;;
032) clear ; $cmd_internal txt server-ftp ; $cmd_internal  $cfg_favorite_out_cli list4     ;;
033) clear ; $cmd_internal txt server-news ; $cmd_internal  $cfg_favorite_out_cli list4    ;;
034) clear ; $cmd_internal txt server-teamspeak ; $cmd_internal  $cfg_favorite_out_cli list4  ;;
035) clear ; $cmd_internal txt server-mumble ; $cmd_internal  $cfg_favorite_out_cli list4     ;;
036) clear ; $cmd_internal txt server-sql ; $cmd_internal  $cfg_favorite_out_cli list4        ;;
037) clear ; $cmd_internal txt server-asterisk ; $cmd_internal  $cfg_favorite_out_cli list4   ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-wallsystem:
##########    english: cli-menu-wallcustom: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-wallcustom: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-wallcustom:
####
####
if [ "$cmd_first_option" == "cli-menu-wallcustom" ]; then
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options        ] $txt_text_title" \
003 "$txt_text_title [ Firewall Wallcustom ] $txt_text_title" \
004  "$txt_text_md load-custom" \
005  "$txt_text_md clone-wallsystem" \
006  "$txt_text_md new-full-custom" \
007  "$txt_text_md nueva-completa-custom" \
008  "$txt_text_md new-mini-custom" \
009  "$txt_text_md nueva-mini-custom" \
010  "$txt_text_md new-tiny-custom" \
011  "$txt_text_md nueva-diminuta-custom" \
012  "$txt_text_md show-custom" \
013  "$txt_text_md modify-custom" \
014  "$txt_text_md del-custom" \
015  "$txt_text_md names-custom" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-wallsystem ;;
004) clear ; $cmd_internal txt names-custom
read -p "Input the custom name to load # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal load-custom $archivo ;;
005) clear ; read -p "Input the systemfw name to clone # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal clone-wallsystem $archivo ;;
006) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-full-custom $archivo ;;
007) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-completa-custom $archivo ;;
008) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-mini-custom $archivo ;;
009) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-mini-custom $archivo ;;
010) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-tiny-custom $archivo ;;
011) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-diminuta-custom $archivo ;;
012) clear ; read -p "Input the custom to show config # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal show-custom $archivo ;;
013) clear ; $cmd_internal names-custom
read -p "Input the custom name to modify # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal modify-custom $archivo ;;
014) clear ; $cmd_internal names-custom
read -p "Input the custom name to delete # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal del-custom $archivo ;;
015) clear ; $cmd_internal txt names-custom ;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-wallcustom:
##########    english: cli-menu-netsystem: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-netsystem: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-netsystem:
####
####
if [ "$cmd_first_option" == "cli-menu-netsystem" ]; then
####
####
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
001 "$txt_text_title_md [ principal menu ] $txt_text_md $txt_text_title" \
002 "$txt_text_title [ Info Options     ] $txt_text_title" \
003 "$txt_text_title [ firewall netsystem ] $txt_text_title" \
011  "$txt_text_md preferences-read" \
012  "$txt_text_md preferences-edit" \
013  "$txt_text_md preferences-regen" \
014  "$txt_text_md alias-read" \
015  "$txt_text_md alias-edit" \
016  "$txt_text_md alias-regen" \
017  "$txt_text_md cat-logcmd" \
018  "$txt_text_md tree-log" \
019  "$txt_text_md tree-pdf" \
020  "$txt_text_md tree-conf" \
021  "$txt_text_md tree-cache" \
022  "$txt_text_md clean-cache" \
023  "$txt_text_md ip4" \
024  "$txt_text_md ip6" \
025  "$txt_text_md speed-ip4" \
026  "$txt_text_md speed-ip6" \
027  "$txt_text_md sockets" \
028  "$txt_text_md notes" \
029  "$txt_text_md license" \
030  "$txt_text_md depends" \
031  "$txt_text_md info" \
032  "$txt_text_md version" \
033  "$txt_text_md options" \
034  "$txt_text_md info-options" \
035  "$txt_text_md info-nodes" \
036  "$txt_text_md date" \
037  "$txt_text_md free" \
038  "$txt_text_md expert" \
039  "$txt_text_md tree-conf" \
040  "$txt_text_md commands" \
041  "$txt_text_md variables" \
042  "$txt_text_md add-whitelist4" \
043  "$txt_text_md add-whitelist6" \
044  "$txt_text_md add-blacklist4" \
045  "$txt_text_md add-blacklist6" \
046  "$txt_text_md intro" \
047  "$txt_text_md download" \
048  "$txt_text_md install" \
3>&1 1>&2 2>&3 )"
##########
##########
case $menuprincipal in
001) clear ; $cmd_internal cli-menu $cfg_favorite_base_cli ;;
002) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
003) clear ; $cmd_internal $cfg_favorite_out_cli firewall-listnumeral ;;
011) clear ; $cmd_internal $cfg_favorite_out_cli preferences-read ;;
012) clear ; $cmd_internal preferences-edit ;;
013) clear ; $cmd_internal $cfg_favorite_out_cli preferences-regen ;;
014) clear ; $cmd_internal $cfg_favorite_out_cli alias-read ;;
015) clear ; $cmd_internal alias-edit ;;
016) clear ; $cmd_internal $cfg_favorite_out_cli alias-regen ;;
017) clear ; $cmd_internal cat-logcmd ;;
018) clear ; $cmd_internal tree-log ;;
019) clear ; $cmd_internal tree-pdf ;;
020) clear ; $cmd_internal tree-conf ;;
021) clear ; $cmd_internal tree-cache ;;
022) clear ; $cmd_internal $cfg_favorite_out_cli clean-cache ;;
023) clear ; $cmd_internal $cfg_favorite_out_cli ip4 ;;
024) clear ; $cmd_internal $cfg_favorite_out_cli ip6 ;;
025) clear ; $cmd_internal $cfg_favorite_out_cli speed-ip4 ;;
026) clear ; $cmd_internal $cfg_favorite_out_cli speed-ip6 ;;
027) clear ; $cmd_internal $cfg_favorite_out_cli sockets ;;
028) clear ; $cmd_internal $cfg_favorite_out_cli notes ;;
029) clear ; $cmd_internal $cfg_favorite_out_cli license ;;
030) clear ; $cmd_internal $cfg_favorite_out_cli depends ;;
031) clear ; $cmd_internal $cfg_favorite_out_cli info ;;
032) clear ; $cmd_internal $cfg_favorite_out_cli version ;;
033) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
034) clear ; $cmd_internal $cfg_favorite_out_cli info-options ;;
035) clear ; $cmd_internal $cfg_favorite_out_cli info-nodes ;;
036) clear ; $cmd_internal $cfg_favorite_out_cli date ;;
037) clear ; $cmd_internal $cfg_favorite_out_cli free ;;
038) clear ; $cmd_internal $cfg_favorite_out_cli expert ;;
039) clear ; $cmd_internal $cfg_favorite_out_cli tree-conf ;;
040) clear ; $cmd_internal $cfg_favorite_out_cli commands ;;
041) clear ; $cmd_internal $cfg_favorite_out_cli variables ;;
042) clear ; read -p "Input host whitelist ip4 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-whitelist4 $archivo ;;
043) clear ; read -p "Input host whitelist ip6 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-whitelist6 $archivo ;;
044) clear ; read -p "Input host blacklist ip4 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-blacklist4 $archivo ;;
045) clear ; read -p "Input host blacklist ip6 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-blacklist6 $archivo ;;
046) clear ; $cmd_internal $cfg_favorite_out_cli intro ;;
047) clear ; $cmd_internal $cfg_favorite_out_cli download;;
048) clear ; $cmd_internal $cfg_favorite_out_cli install;;
*)        ;;
esac
################################################################################
################################################################################
#### $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause ; clear
################################################################################
$cmd_internal cli-menu $cfg_favorite_base_cli
exit; fi
####
####
#### :rutina-final-cli-menu-netsystem:
##########    english: cli-menu-compact: Manage list rules with one text menu          ##########
##########    spanish: cli-menu-compact: Maneja lista de reglas con un menu de texto   ##########
#### :rutina-inicial-cli-menu-compact:
####
####
if [ "$cmd_first_option" == "cli-menu-compact" ]; then
####
####
if [ "$cfg_favorite_realpath_textdialog" == "$NULL" ]; then
echo "$txt_text_title_fail [ Install or dialog or whiptail to work ]"
exit ; fi
##########
##########
if [ "$2" != "$NULL" ]; then
cfg_favorite_basename_textdialog="$(basename) $2"
cfg_favorite_realpath_textdialog="$(realpath) $2"
fi
##########
##########
cfg_favorite_out_cli="cli-$(basename $cfg_favorite_realpath_textdialog)"
cfg_favorite_base_cli="$(basename $cfg_favorite_realpath_textdialog)"
##########
##########
menuprincipal="$($cfg_favorite_base_cli --clear --notags \
--title "$cmd_first_option With $cmd_name $cmd_version" --menu "Select" 0 0 0 \
0110 "$txt_text_title [ intro ] $txt_text_title $txt_text_title" \
0120 "$txt_text_title [ info-options ] $txt_text_title $txt_text_title" \
0200 "$txt_text_title [ firewall-listconceptual ] $txt_text_title" \
0201  "$txt_text_md list4" \
0202  "$txt_text_md list6"  \
0203  "$txt_text_md list-filter4" \
0204  "$txt_text_md list-filter6" \
0205  "$txt_text_md list-forward" \
0206  "$txt_text_md list-forward6" \
0207  "$txt_text_md list-nat4" \
0208  "$txt_text_md list-nat6" \
0209  "$txt_text_md list-alltables" \
0214  "$txt_text_md list-raw4" \
0215  "$txt_text_md list-raw6" \
0216  "$txt_text_md list-mangle4" \
0217  "$txt_text_md list-mangle6" \
0218  "$txt_text_md list-security4" \
0219  "$txt_text_md list-security6" \
0220  "$txt_text_md list-ebtables" \
0221  "$txt_text_md list-arptables" \
0300 "$txt_text_title [ firewall-listnumeral ] $txt_text_title" \
0301  "$txt_text_md listn4" \
0302  "$txt_text_md listn6" \
0303  "$txt_text_md listn-filter4" \
0304  "$txt_text_md listn-filter6" \
0305  "$txt_text_md listn-forward" \
0306  "$txt_text_md listn-forward6" \
0307  "$txt_text_md listn-nat4" \
0308  "$txt_text_md listn-nat6" \
0309  "$txt_text_md listn-alltables" \
0314  "$txt_text_md listn-raw4" \
0315  "$txt_text_md listn-raw6" \
0316  "$txt_text_md listn-mangle4" \
0317  "$txt_text_md listn-mangle6" \
0318  "$txt_text_md listn-security4" \
0319  "$txt_text_md listn-security6" \
0320  "$txt_text_md listn-ebtables" \
0321  "$txt_text_md listn-arptables" \
0400 "$txt_text_title [ firewall-control ] $txt_text_title" \
0401  "$txt_text_md stop" \
0402  "$txt_text_md continue" \
0403  "$txt_text_md reset" \
0404  "$txt_text_md names"  \
0405  "$txt_text_md show" \
0406  "$txt_text_md save" \
0407  "$txt_text_md load" \
0408  "$txt_text_md actual" \
0409  "$txt_text_md eraserules" \
0410  "$txt_text_md wizard-tiny" \
0411  "$txt_text_md wizard-mini" \
0412  "$txt_text_md wizard-full" \
0413  "$txt_text_md without-connection" \
0414  "$txt_text_md input-permisive" \
0415  "$txt_text_md input-established" \
0416  "$txt_text_md eraserules4" \
0417  "$txt_text_md eraserules6" \
0418  "$txt_text_md eraserules" \
0500 "$txt_text_title [ firewall-wallsystem ] $txt_text_title" \
0507  "$txt_text_md client-basic" \
0508  "$txt_text_md client-web" \
0509  "$txt_text_md client-ssh" \
0510  "$txt_text_md client-telnet" \
0511  "$txt_text_md client-git" \
0512  "$txt_text_md games-shooter" \
0513  "$txt_text_md game-wesnoth" \
0514  "$txt_text_md game-minetest" \
0515  "$txt_text_md game-freeciv" \
0516  "$txt_text_md game-widelands" \
0517  "$txt_text_md client-web" \
0518  "$txt_text_md client-vnc" \
0519  "$txt_text_md client-tor" \
0520  "$txt_text_md client-vpn" \
0521  "$txt_text_md client-torrent" \
0522  "$txt_text_md lan-tor" \
0523  "$txt_text_md lan-vpn" \
0524  "$txt_text_md shield-ssh" \
0525  "$txt_text_md server-ssh" \
0526  "$txt_text_md server-web" \
0527  "$txt_text_md server-vnc" \
0528  "$txt_text_md server-print" \
0529  "$txt_text_md server-samba" \
0530  "$txt_text_md server-lamp" \
0531  "$txt_text_md server-mail" \
0532  "$txt_text_md server-ftp" \
0533  "$txt_text_md server-news" \
0534  "$txt_text_md server-teamspeak" \
0535  "$txt_text_md server-mumble" \
0536  "$txt_text_md server-sql" \
0537  "$txt_text_md server-asterisk" \
0600 "$txt_text_title [ firewall-wallcustom ] $txt_text_title" \
0606  "$txt_text_md load-custom" \
0607  "$txt_text_md clone-wallsystem" \
0611  "$txt_text_md new-full-custom" \
0612  "$txt_text_md nueva-completa-custom" \
0613  "$txt_text_md new-mini-custom" \
0614  "$txt_text_md nueva-mini-custom" \
0615  "$txt_text_md new-tiny-custom" \
0616  "$txt_text_md nueva-diminuta-custom" \
0617  "$txt_text_md show-custom" \
0618  "$txt_text_md modify-custom" \
0619  "$txt_text_md del-custom" \
0620  "$txt_text_md names-custom" \
0621  "$txt_text_md templates-regen" \
0700 "$txt_text_title [ firewall-netsystem ] $txt_text_title" \
0701  "$txt_text_md preferences-read" \
0702  "$txt_text_md preferences-edit" \
0703  "$txt_text_md preferences-regen" \
0704  "$txt_text_md alias-read" \
0705  "$txt_text_md alias-edit" \
0706  "$txt_text_md alias-regen" \
0707  "$txt_text_md cat-logcmd" \
0708  "$txt_text_md tree-log" \
0709  "$txt_text_md tree-pdf" \
0710  "$txt_text_md tree-conf" \
0711  "$txt_text_md tree-cache" \
0712  "$txt_text_md clean-cache" \
0713  "$txt_text_md ip4" \
0714  "$txt_text_md ip6" \
0715  "$txt_text_md speed-ip4" \
0716  "$txt_text_md speed-ip6" \
0717  "$txt_text_md sockets" \
0718  "$txt_text_md notes" \
0719  "$txt_text_md license" \
0720  "$txt_text_md depends" \
0721  "$txt_text_md info" \
0722  "$txt_text_md version" \
0723  "$txt_text_md options" \
0724  "$txt_text_md info-options" \
0725  "$txt_text_md info-nodes" \
0726  "$txt_text_md date" \
0727  "$txt_text_md free" \
0728  "$txt_text_md expert" \
0729  "$txt_text_md commands" \
0730  "$txt_text_md variables" \
0731  "$txt_text_md add-whitelist4" \
0732  "$txt_text_md add-whitelist6" \
0733  "$txt_text_md add-blacklist4" \
0734  "$txt_text_md add-blacklist6" \
0735  "$txt_text_md intro" \
0736  "$txt_text_md download" \
0737  "$txt_text_md install" \
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
0201) clear ; $cmd_internal $cfg_favorite_out_cli list4 ;;
0202) clear ; $cmd_internal $cfg_favorite_out_cli list6 ;;
0203) clear ; $cmd_internal $cfg_favorite_out_cli list-filter4 ;;
0204) clear ; $cmd_internal $cfg_favorite_out_cli list-filter6 ;;
0205) clear ; $cmd_internal $cfg_favorite_out_cli list-forward ;;
0206) clear ; $cmd_internal $cfg_favorite_out_cli list-forward6 ;;
0207) clear ; $cmd_internal $cfg_favorite_out_cli list-nat4 ;;
0208) clear ; $cmd_internal $cfg_favorite_out_cli list-nat6 ;;
0209) clear ; $cmd_internal $cfg_favorite_out_cli list-alltables ;;
0214) clear ; $cmd_internal $cfg_favorite_out_cli list-raw4 ;;
0215) clear ; $cmd_internal $cfg_favorite_out_cli list-raw6 ;;
0216) clear ; $cmd_internal $cfg_favorite_out_cli list-mangle4 ;; 
0217) clear ; $cmd_internal $cfg_favorite_out_cli list-mangle6 ;;
0218) clear ; $cmd_internal $cfg_favorite_out_cli list-security4 ;;
0219) clear ; $cmd_internal $cfg_favorite_out_cli list-security6 ;;
0220) clear ; $cmd_internal $cfg_favorite_out_cli list-ebtables ;;
0221) clear ; $cmd_internal $cfg_favorite_out_cli list-arptables ;;
################################################################################
0301) clear ; $cmd_internal $cfg_favorite_out_cli listn4 ;;
0302) clear ; $cmd_internal $cfg_favorite_out_cli listn6 ;;
0303) clear ; $cmd_internal $cfg_favorite_out_cli listn-filter4 ;;
0304) clear ; $cmd_internal $cfg_favorite_out_cli listn-filter6 ;;
0305) clear ; $cmd_internal $cfg_favorite_out_cli listn-forward ;;
0306) clear ; $cmd_internal $cfg_favorite_out_cli listn-forward6 ;;
0307) clear ; $cmd_internal $cfg_favorite_out_cli listn-nat4 ;;
0308) clear ; $cmd_internal $cfg_favorite_out_cli listn-nat6 ;;
0309) clear ; $cmd_internal $cfg_favorite_out_cli listn-alltables ;;
0314) clear ; $cmd_internal $cfg_favorite_out_cli listn-raw4 ;;
0315) clear ; $cmd_internal $cfg_favorite_out_cli listn-raw6 ;;
0316) clear ; $cmd_internal $cfg_favorite_out_cli listn-mangle4 ;; 
0317) clear ; $cmd_internal $cfg_favorite_out_cli listn-mangle6 ;;
0318) clear ; $cmd_internal $cfg_favorite_out_cli listn-security4 ;;
0319) clear ; $cmd_internal $cfg_favorite_out_cli listn-security6 ;;
0320) clear ; $cmd_internal $cfg_favorite_out_cli list-ebtables ;;
0321) clear ; $cmd_internal $cfg_favorite_out_cli list-arptables ;;
################################################################################
0401) clear ; $cmd_internal $cfg_favorite_out_cli stop ;;
0402) clear ; $cmd_internal $cfg_favorite_out_cli continue ;;
0403) clear ; $cmd_internal $cfg_favorite_out_cli reset ;;
0404) clear ; $cmd_internal $cfg_favorite_out_cli names ;;
0405) clear ; $cmd_internal txt names ; echo "$txt_text_title"
read -p "Type the firewall name to read   " nombrecillo
nombrecillo=$(echo $nombrecillo | $cmd_command_sed s/\\///g)
$cmd_internal show $nombrecillo ;; 
0406)archivo="$($cfg_favorite_realpath_textdialog --stdout \
--title "| Save the firewall format standar  |" --inputbox "New name" 0 0)"
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
clear ;  echo "$txt_text_title saved $archivo" ; $cmd_internal save $archivo ;;
0407) clear ; $cmd_internal names ; echo "$txt_text_title"
read -p "| Type the firewall name to restore |   " nombrecillo
nombrecillo=$(echo $nombrecillo | $cmd_command_sed s/\\///g)
$cmd_internal load $nombrecillo ;;
0408) clear ; $cmd_internal $cfg_favorite_out_cli actual ;;
0409) clear ; $cmd_internal $cfg_favorite_out_cli eraserules ; $cmd_internal cli list4   ;;
0410) clear ; $cmd_internal txt wizard-tiny ; $cmd_internal cli list4  ;;
0411) clear ; $cmd_internal txt wizard-mini ; $cmd_internal cli list4  ;;
0412) clear ; $cmd_internal txt wizard-full ; $cmd_internal cli list4  ;;
0413) clear ; $cmd_internal $cfg_favorite_out_cli without-connection ; $cmd_internal cli list4  ;;
0414) clear ; $cmd_internal $cfg_favorite_out_cli input-permisive ; $cmd_internal cli list4   ;;
0415) clear ; $cmd_internal $cfg_favorite_out_cli input-established ; $cmd_internal cli list4   ;;
0416) clear ; $cmd_internal $cfg_favorite_out_cli eraserules4 ; $cmd_internal cli list4   ;;
0417) clear ; $cmd_internal $cfg_favorite_out_cli eraserules6 ; $cmd_internal cli list6   ;;
0418) clear ; $cmd_internal $cfg_favorite_out_cli eraserules ; $cmd_internal cli status   ;;
################################################################################
0507) clear ; $cmd_internal $cfg_favorite_out_cli client-basic ; $cmd_internal cli list4    ;;
0508) clear ; $cmd_internal $cfg_favorite_out_cli client-web ; $cmd_internal cli list4    ;;
0509) clear ; $cmd_internal $cfg_favorite_out_cli client-ssh ; $cmd_internal cli list4    ;;
0510) clear ; $cmd_internal $cfg_favorite_out_cli client-telnet ; $cmd_internal cli list4    ;;
0511) clear ; $cmd_internal $cfg_favorite_out_cli client-git ; $cmd_internal cli list4    ;;
0512) clear ; $cmd_internal $cfg_favorite_out_cli games-shooter ; $cmd_internal cli list4   ;; 
0513) clear ; $cmd_internal $cfg_favorite_out_cli game-wesnoth ; $cmd_internal cli list4    ;;
0514) clear ; $cmd_internal $cfg_favorite_out_cli game-minetest ; $cmd_internal cli list4   ;;
0515) clear ; $cmd_internal $cfg_favorite_out_cli game-freeciv ; $cmd_internal cli list4    ;;
0516) clear ; $cmd_internal $cfg_favorite_out_cli game-widelands ; $cmd_internal cli list4  ;;
0517) clear ; $cmd_internal $cfg_favorite_out_cli client-web ; $cmd_internal cli list4      ;;
0518) clear ; $cmd_internal $cfg_favorite_out_cli client-vnc ; $cmd_internal cli list4      ;;
0519) clear ; $cmd_internal $cfg_favorite_out_cli client-tor ; $cmd_internal cli list4      ;;
0520) clear ; $cmd_internal $cfg_favorite_out_cli client-vpn ; $cmd_internal cli list4      ;;
0521) clear ; $cmd_internal $cfg_favorite_out_cli client-torrent ; $cmd_internal cli list4  ;;
0522) clear ; $cmd_internal $cfg_favorite_out_cli lan-tor ; $cmd_internal cli list4         ;;
0523) clear ; $cmd_internal $cfg_favorite_out_cli lan-vpn ; $cmd_internal cli list4         ;; 
0524) clear ; $cmd_internal $cfg_favorite_out_cli shield-ssh ; $cmd_internal cli list4      ;; 
0525) clear ; $cmd_internal $cfg_favorite_out_cli server-ssh ; $cmd_internal cli list4      ;;
0526) clear ; $cmd_internal $cfg_favorite_out_cli server-web ; $cmd_internal cli list4      ;;
0527) clear ; $cmd_internal $cfg_favorite_out_cli server-vnc ; $cmd_internal cli list4      ;;
0528) clear ; $cmd_internal $cfg_favorite_out_cli server-print ; $cmd_internal cli list4    ;;
0529) clear ; $cmd_internal $cfg_favorite_out_cli server-samba ; $cmd_internal cli list4    ;;
0530) clear ; $cmd_internal $cfg_favorite_out_cli server-lamp ; $cmd_internal cli list4     ;;
0531) clear ; $cmd_internal $cfg_favorite_out_cli server-mail ; $cmd_internal cli list4     ;;
0532) clear ; $cmd_internal $cfg_favorite_out_cli server-ftp ; $cmd_internal cli list4      ;;
0533) clear ; $cmd_internal $cfg_favorite_out_cli server-news ; $cmd_internal cli list4     ;;
0534) clear ; $cmd_internal $cfg_favorite_out_cli server-teamspeak ; $cmd_internal cli list4  ;;
0535) clear ; $cmd_internal $cfg_favorite_out_cli server-mumble ; $cmd_internal cli list4   ;;
0536) clear ; $cmd_internal $cfg_favorite_out_cli server-sql ; $cmd_internal cli list4      ;;
0537) clear ; $cmd_internal $cfg_favorite_out_cli server-asterisk ; $cmd_internal cli list4 ;;
################################################################################
0606) clear ; $cmd_internal txt names-custom
read -p "Input the custom name to load # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal load-custom $archivo ;;
0607) clear ; read -p "Input the systemfw name to clone # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal clone-wallsystem $archivo ;;
0611) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-full-custom $archivo ;;
0612) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-completa-custom $archivo ;;
0613) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-mini-custom $archivo ;;
0614) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-mini-custom $archivo ;;
0615) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal new-tiny-custom $archivo ;;
0616) clear ; read -p "Input the new custom name to create # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal nueva-diminuta-custom $archivo ;;
0617) clear ; read -p "Input the custom to show config # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal show-custom $archivo ;;
0618) clear ; $cmd_internal names-custom
read -p "Input the custom name to modify # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal modify-custom $archivo ;;
0619) clear ; $cmd_internal names-custom
read -p "Input the custom name to delete # " archivo
archivo=$(echo $archivo | $cmd_command_sed s/\\///g)
$cmd_internal del-custom $archivo ;;
0620) clear ; $cmd_internal txt names-custom ;;
0621) clear ; $cmd_internal txt templates-regen ;;
################################################################################
0701) clear ; $cmd_internal $cfg_favorite_out_cli preferences-read ;;
0702) clear ; $cmd_internal preferences-edit ;;
0703) clear ; $cmd_internal $cfg_favorite_out_cli preferences-regen ;;
0704) clear ; $cmd_internal $cfg_favorite_out_cli alias-read ;;
0705) clear ; $cmd_internal alias-edit ;;
0706) clear ; $cmd_internal $cfg_favorite_out_cli alias-regen ;;
0707) clear ; $cmd_internal cat-logcmd ;;
0708) clear ; $cmd_internal tree-log ;;
0709) clear ; $cmd_internal tree-pdf ;;
0710) clear ; $cmd_internal tree-conf ;;
0711) clear ; $cmd_internal tree-cache ;;
0712) clear ; $cmd_internal $cfg_favorite_out_cli clean-cache ;;
0713) clear ; $cmd_internal $cfg_favorite_out_cli ip4 ;;
0714) clear ; $cmd_internal $cfg_favorite_out_cli ip6 ;;
0715) clear ; $cmd_internal $cfg_favorite_out_cli speed-ip4 ;;
0716) clear ; $cmd_internal $cfg_favorite_out_cli speed-ip6 ;;
0717) clear ; $cmd_internal $cfg_favorite_out_cli sockets ;;
0718) clear ; $cmd_internal $cfg_favorite_out_cli notes ;;
0719) clear ; $cmd_internal $cfg_favorite_out_cli license ;;
0720) clear ; $cmd_internal $cfg_favorite_out_cli depends ;;
0721) clear ; $cmd_internal $cfg_favorite_out_cli info ;;
0722) clear ; $cmd_internal $cfg_favorite_out_cli version ;;
0723) clear ; $cmd_internal $cfg_favorite_out_cli options ;;
0724) clear ; $cmd_internal $cfg_favorite_out_cli info-options ;;
0725) clear ; $cmd_internal $cfg_favorite_out_cli info-nodes ;;
0726) clear ; $cmd_internal $cfg_favorite_out_cli date ;;
0727) clear ; $cmd_internal $cfg_favorite_out_cli free ;;
0728) clear ; $cmd_internal $cfg_favorite_out_cli expert ;;
0729) clear ; $cmd_internal $cfg_favorite_out_cli commands ;;
0730) clear ; $cmd_internal $cfg_favorite_out_cli variables ;;
0731) clear ; read -p "Input host whitelist ip4 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-whitelist4 $archivo ;;
0732) clear ; read -p "Input host whitelist ip6 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-whitelist6 $archivo ;;
0733) clear ; read -p "Input host blacklist ip4 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-blacklist4 $archivo ;;
0734) clear ; read -p "Input host blacklist ip6 to add # " archivo
$cmd_internal $cfg_favorite_out_cli add-blacklist6 $archivo ;;
0735) clear ; $cmd_internal $cfg_favorite_out_cli intro ;;
0736) clear ; $cmd_internal $cfg_favorite_out_cli download;;
0737) clear ; $cmd_internal $cfg_favorite_out_cli install;;
################################################################################
*) clear ; $cfg_favorite_realpath_textdialog  --msgbox "fwiptables good bye" 0 0
$cmd_internal text-pause clear ; exit ;;
################################################################################
esac
$cmd_internal text-pause ; clear
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
if [ "$cmd_first_option" == "text-pause" ]
####
####
then read -p '$txt_text_title_ok Press [enter] \
to continue now with the cli-menu $txt_text_title'
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
if [ "$cmd_first_option" == "graphicall-pause" ]
####
####
then $cfg_favorite_realpath_graphicalldialog --forms \
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
if [ "$cmd_first_option" == "gui-roll-zenity" ] ;
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ] ;
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="Info|Firewall-List-With-Conceptual|\
Firewall-List-With-Numeral|firewall-wallcontrol|firewall-wallcustom|\
firewall-wallsystem|firewall-netsystem"
selection_menu="$($cmd_command_zenity --forms \
--text=gui-roll \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $cmd_command_zenity \
--width=$cfg_config_graphicall_width \
--height=$cfg_config_graphicall_height \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-wallcontrol" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ]
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
|stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|wizard-tiny|wizard-mini|wizard-full|\
without-connection|input-permisive|input-established|\
tinyserver-tcp|tinyserver-udp|miniserver-tcp|miniserver-udp"
selection_menu="$($cmd_command_zenity --forms \
--text=gui-roll-firewall-wallcontrol \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
####
case "$selection_final" in
1) $cmd_command_zenity \
--width=$cfg_config_graphicall_width \
--height=$cfg_config_graphicall_height \
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
show)archivo="$($cfg_favorite_realpath_graphicalldialog  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Show-Firewall --entry-text=cfg-to-show)" ; 
$cmd_internal -gui-zenity show $archivo ;;
save)archivo="$($cfg_favorite_realpath_graphicalldialog  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall --entry-text=cfg-to-save)" ; 
$cmd_internal -gui-zenity save $archivo ;;
load)archivo="$($cfg_favorite_realpath_graphicalldialog  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
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
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                         ;
$cmd_internal gui-zenity tinyserver-tcp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
tinyserver-udp)serverports="$(zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                         ;
$cmd_internal gui-zenity tinyserver-udp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
miniserver-tcp)serverports="$(zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                         ;
$cmd_internal gui-zenity miniserver-tcp $serverports    ; 
$cmd_internal gui-zenity list4                         ;;
miniserver-udp)serverports="$(zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-listconceptual" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ]
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|\
list-raw4|list-raw6|list-security4|list-security6|\
list-ebtables|list-arptables"
selection_menu="$($cmd_command_zenity --forms \
--text=gui-roll-firewall-listconceptual \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $cmd_command_zenity \
--width=$cfg_config_graphicall_width \
--height=$cfg_config_graphicall_height \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-listnumeral" ]
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ]
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|lsn4|lsn6|\
listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|\
listn-raw4|listn-raw6|listn-security4|listn-security6|\
list-ebtables|list-arptables"
selection_menu="$($cmd_command_zenity --forms \
--text="gui-roll-firewall-listnumeral" \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
####
####
case "$selection_final" in
1) $cmd_command_zenity \
--width=$cfg_config_graphicall_width \
--height=$cfg_config_graphicall_height \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-wallcustom" ]
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ]
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|load-custom|\
clone-wallsystem|new-full-custom|nueva-completa-custom|\
new-mini-custom|nueva-mini-custom|new-tiny-custom|nueva-diminuta-custom|\
names-custom|show-custom|modify-custom|del-custom|templates-regen"
selection_menu="$($cmd_command_zenity --forms \
--text=gui-roll-firewall-wallcustom \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
selection_final="$(echo $selection_menu | sed 's/\|//g')"
#### 
#### 
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-wallcustom ;;
load-custom)archivo="$($cmd_command_zenity  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Launch-Custom --entry-text=cfg_to_launch)" ; 
$cmd_internal -gui-zenity load-custom $archivo ; $cmd_internal gui list4;;
clone-wallsystem)archivo="$($cmd_command_zenity  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Clone-firewall-static --entry-text=firewall_static_to_clone)" ; 
$cmd_internal -gui-zenity clone-wallsystem $archivo ; $cmd_internal gui list4;;
new-full-custom)
archivo="$($cmd_command_zenity  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_internal -gui-zenity new-full-custom $archivo ;;
nueva-completa-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-completa-custom $archivo ;;
new-mini-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=new-mini-custom \
--entry-text=Input_file_name_to_new_mini_configuration)" ;
$cmd_internal -gui-zenity new-mini-custom $archivo ;;
nueva-mini-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-mini-custom $archivo ;;
new-tiny-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=new-tiny-custom \
--entry-text=Input_file_name_to_new_mini_configuration)" ;
$cmd_internal -gui-zenity new-tiny-custom $archivo ;;
nueva-diminuta-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal -gui-zenity nueva-diminuta-custom $archivo ;;
names-custom)
$cmd_internal -gui-zenity names-custom ;;
show-custom)
archivo="$($cmd_command_zenity --entry \ 
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Show-custom \
--entry-text=cfg-to-show)" ;
$cmd_internal -gui-zenity show-custom $archivo ;;
modify-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=modify-custom --entry-text=cfg-to-modify)" ;
$cmd_internal -gui-zenity modify-custom $archivo ;;
del-custom)
archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-wallsystem" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ]
then echo $txt_message_without_guiroll ; exit ; fi
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
selection="$($cmd_command_zenity --forms \
--text=gui-roll-firewall-wallcustom \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
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
if [ "$cmd_first_option" == "gui-roll-zenity-firewall-netsystem" ] ;
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_command_zenity" == "$NULL" ] ;
then echo $txt_message_without_guiroll ; exit ; fi
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-edit|preferences-regen|alias-edit|alias-regen|\
alias-read|options|info-options|expert|\
info-ip4|info-ip6|route4|route6||sockets|tree-pdf|tree-conf\
tree-log|cat-logcmd|ip4|ip6|notes|speed-ip4|speed-ip6|\
info-nodes|date|free|version|tree-conf|tree-cache|clean-cache|\
depends|utils|about|variables|examples|intro|install|upgrade|\
add-whitelist4|add-whitelist6|add-blacklist4|add-blacklist6|\
license-lgpl-v2|license-gpl-v2"
####
####
selection="$($cmd_command_zenity --forms \
--text=$cmd_first_option \
--title=Gui-roll-With-$cmd_internal-$cmd_version \
--add-combo=$cmd_first_option \
--combo-values=$gui_menu)"
####
####
selection_final="$(echo $selection | sed 's/\|//g')"
case "$selection_final" in
1) exit ;;
gui-principal-menu)$cmd_internal gui-roll-zenity ;;
gui-info-menu)$cmd_internal -gui-zenity firewall-netsystem ;;
preferences-read)$cmd_internal -gui-zenity preferences-read ;;
preferences-edit)$cmd_internal -gui-zenity preferences-edit ;;
preferences-regen)$cmd_internal -gui-zenity preferences-regen ;;
alias-read)$cmd_internal -gui-zenity alias-read ;;
alias-edit)$cmd_internal -gui-zenity alias-edit ;;
alias-regen)$cmd_internal -gui-zenity alias-regen ;;
options)$cmd_internal -gui-zenity options ;;
info-options)$cmd_internal -gui-zenity info-options ;;
expert)$cmd_internal -gui-zenity expert ;;
tree-log) $cmd_internal -gui-zenity tree-log ;; 
tree-pdf) $cmd_internal -gui-zenity tree-pdf ;; 
tree-conf) $cmd_internal -gui-zenity tree-conf ;;
cat-logcmd) $cmd_internal -gui-zenity cat-logcmd ;;
ip4)$cmd_internal -gui-zenity ip4 ;;
ip6)$cmd_internal -gui-zenity ip6 ;;
notes)$cmd_internal -gui-zenity notes ;;
speed-ip4)$cmd_internal -gui-zenity speed-ip4 ;;
speed-ip6)$cmd_internal -gui-zenity speed-ip6 ;;
sockets)$cmd_internal -gui-zenity sockets ;;
info-nodes) $cmd_internal -gui-zenity info-nodes ;;
date) $cmd_internal -gui-zenity date ;;
free) $cmd_internal -gui-zenity free ;;
version) $cmd_internal -gui-zenity version ;;
tree-conf)$cmd_internal -gui-zenity tree-conf ;;
tree-cache)$cmd_internal -gui-zenity tree-cache ;;
clean-cache) $cmd_internal -gui-zenity clean-cache ;;
depends)$cmd_internal -gui-zenity depends ;;
info-ip4)$cmd_internal gui-zenity info-ip4 ;;
info-ip6)$cmd_internal gui-zenity info-ip6 ;;
route4)$cmd_internal gui-zenity route4 ;;
route6)$cmd_internal gui-zenity route6 ;;
install)$cmd_internal -gui-zenity install ;;
upgrade)$cmd_internal -gui-zenity upgrade ;;
license-lgpl-v2) $cmd_internal -gui-zenity license-lgpl-v2 ;;
license-gpl-v2) $cmd_internal -gui-zenity license-gpl-v2 ;;
examples)$cmd_internal -gui-zenity examples ;;
intro) $cmd_internal -gui-zenity intro ;;
variables) $cmd_internal -gui-zenity variables ;;
add-whitelist4) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-whitelist4 \
--entry-text=host-to-add-to-whitelist-with-ip-v4)" 
$cmd_internal gui-zenity add-whitelist4 $archivo ;;
add-whitelist6) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-whitelist6 \
--entry-text=host-to-add-to-whitelist-with-ip-v6)" 
$cmd_internal gui-zenity add-whitelist6 $archivo ;;
add-blacklist4) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-blacklist4 \
--entry-text=host-to-add-to-blacklist-with-ip-v4)" 
$cmd_internal gui-zenity add-blacklist4 $archivo ;;
add-blacklist6) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-blacklist6 \
--entry-text=host-to-add-to-blacklist-with-ip-v6)" 
$cmd_internal gui-zenity add-blacklist6 $archivo ;;
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
if [ "$cmd_first_option" == "gui-menu" ] ;
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
####
####
gui_menu="Firewall-listconceptual|Firewall-listnumeral|firewall-wallcontrol|\
Firewall-wallcustom|Firewall-wallsystem|firewall-netsystem|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width \
--height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu)"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
####
case $final in
1*) exit ;;
Firewall-listconceptual*)
$cmd_internal gui-menu-firewall-listconceptual $cmd_second_option ;;
Firewall-listnumeral*)
$cmd_internal gui-menu-firewall-listnumeral $cmd_second_option ;;
firewall-wallcontrol*)
$cmd_internal gui-menu-firewall-wallcontrol $cmd_second_option ;;
Firewall-wallcustom*)
$cmd_internal gui-menu-firewall-wallcustom $cmd_second_option ;;
Firewall-wallsystem*)
$cmd_internal gui-menu-firewall-wallsystem $cmd_second_option ;;
firewall-netsystem*)
$cmd_internal gui-menu-firewall-netsystem $cmd_second_option ;;
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
if   [ "$cmd_first_option" == "gui-menu-firewall-wallcontrol" ]
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
stop|continue|reset|names|show|save|load|actual|\
eraserules|eraserules4|eraserules6|\
without-connection|input-permisive|input-established|\
wizard-tiny|wizard-mini|wizard-full|\
tinyserver-tcp|tinyserver-udp|miniserver-tcp|miniserver-udp|"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu)"
echo "$txt_text_title The option selected:  $final" ;
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
####
case "$final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option  ;;
gui-info-menu*)$cmd_internal gui-$cmd_second_option firewall-wallcontrol ;;
stop*)$cmd_internal gui-$cmd_second_option stop ;
$cmd_internal gui-$cmd_second_option list4 ;;
continue*)$cmd_internal gui-$cmd_second_option continue ;
$cmd_internal gui-$cmd_second_option list4 ;;
reset*)$cmd_internal gui-$cmd_second_option reset ;
$cmd_internal gui-$cmd_second_option list4 ;;
names*)$cmd_internal gui-$cmd_second_option names ;;
show*)archivo="$($cfg_favorite_basename_graphicalldialog --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-show)" 
$cmd_internal gui-$cmd_second_option $archivo ;;
save*)archivo="$($cmd_second_option--entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-save)" 
$cmd_internal gui-$cmd_second_option save $archivo ;;
load*)archivo="$($cfg_favorite_realpath_graphicalldialog  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=cfg-to-load)" 
$cmd_internal gui-$cmd_second_option load $archivo ;
$cmd_internal gui-$cmd_second_option list4 ;;
actual*)$cmd_internal gui-$cmd_second_option actual ;;
eraserules4*)$cmd_internal gui-$cmd_second_option eraserules4 ;;
eraserules6*)$cmd_internal gui-$cmd_second_option eraserules6 ;;
eraserules*)$cmd_internal gui-$cmd_second_option eraserules ;;
wizard-full*)$cmd_internal gui-$cmd_second_option wizard-full ;
$cmd_internal gui-$cmd_second_option list4 ;;
wizard-mini*)$cmd_internal gui-$cmd_second_option wizard-mini ;
$cmd_internal gui-$cmd_second_option list4 ;;
wizard-tiny*)$cmd_internal gui-$cmd_second_option wizard-tiny ;
$cmd_internal gui-$cmd_second_option list4 ;;
without-connection*)$cmd_internal gui-$cmd_second_option without-connection ;
$cmd_internal gui-$cmd_second_option list4 ;;
input-permisive*)$cmd_internal gui-$cmd_second_option input-permisive ;
$cmd_internal gui-$cmd_second_option list4 ;;
input-established*)$cmd_internal gui-$cmd_second_option input-established ;
$cmd_internal gui-$cmd_second_option list4 ;;
tinyserver-tcp*)serverports="$($cfg_favorite_basename_graphicalldialog --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                                 ;
$cmd_internal gui-$cmd_second_option tinyserver-tcp $serverports    ; 
$cmd_internal gui-$cmd_second_option list4                         ;;
tinyserver-udp*)serverports="$($cfg_favorite_basename_graphicalldialog --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                                 ;
$cmd_internal gui-$cmd_second_option tinyserver-udp $serverports    ; 
$cmd_internal gui-$cmd_second_option list4                         ;;
miniserver-tcp*)serverports="$($cfg_favorite_basename_graphicalldialog --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-tcp)"                                 ;
$cmd_internal gui-$cmd_second_option miniserver-tcp $serverports    ; 
$cmd_internal gui-$cmd_second_option list4                         ;;
miniserver-udp*)serverports="$($cfg_favorite_basename_graphicalldialog --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Save-Firewall \
--entry-text=server-ports-udp)"                                 ;
$cmd_internal gui-$cmd_second_option miniserver-udp $serverports    ; 
$cmd_internal gui-$cmd_second_option list4                         ;;
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
if   [ "$cmd_first_option" == "gui-menu-firewall-listconceptual" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|\
ls4|ls6|list-filter4|list-filter6|list-alltables|\
list-nat4|list-nat6|list-mangle4|list-mangle6|list-raw4|list-raw6|\
list-security4|list-security6|list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu )"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option ;;
gui-info-menu*)$cmd_internal gui-$cmd_second_option firewall-listconceptual ;;
ls4*)$cmd_internal gui-$cmd_second_option ls4 ;;
ls6*)$cmd_internal gui-$cmd_second_option ls6 ;;
list-alltables*)$cmd_internal gui-$cmd_second_option list-alltables ;;
list-filter4*)$cmd_internal gui-$cmd_second_option list-filter4 ;;
list-filter6*)$cmd_internal gui-$cmd_second_option list-filter6 ;;
list-nat4*)$cmd_internal gui-$cmd_second_option list-nat4 ;;
list-nat6*)$cmd_internal gui-$cmd_second_option list-nat6 ;;
list-mangle4*)$cmd_internal gui-$cmd_second_option list-mangle4 ;;
list-mangle6*)$cmd_internal gui-$cmd_second_option list-mangle6 ;;
list-raw4*)$cmd_internal gui-$cmd_second_option list-raw4 ;;
list-raw6*)$cmd_internal gui-$cmd_second_option list-raw6 ;;
list-security4*)$cmd_internal gui-$cmd_second_option list-security4 ;;
list-security6*)$cmd_internal gui-$cmd_second_option list-security6 ;;
list-ebtables*)$cmd_internal gui-$cmd_second_option list-ebtables ;;
list-arptables*)$cmd_internal gui-$cmd_second_option list-arptables ;;
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
if   [ "$cmd_first_option" == "gui-menu-firewall-listnumeral" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|lsn4|lsn6|\
listn-filter4|listn-filter6|listn-alltables|\
listn-nat4|listn-nat6|listn-mangle4|listn-mangle6|\
listn-raw4|listn-raw6|listn-security4|listn-security6|\
list-ebtables|list-arptables"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu )"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option ;;
gui-info-menu*)$cmd_internal gui-$cmd_second_option firewall-listnumeral ;;
lsn4*)$cmd_internal gui-$cmd_second_option lsn4 ;;
lsn6*)$cmd_internal gui-$cmd_second_option lsn6 ;;
listn-alltables*)$cmd_internal gui-$cmd_second_option listn-alltables ;;
listn-filter4*)$cmd_internal gui-$cmd_second_option listn-filter4 ;;
listn-filter6*)$cmd_internal gui-$cmd_second_option listn-filter6 ;;
listn-nat4*)$cmd_internal gui-$cmd_second_option listn-nat4 ;;
listn-nat6*)$cmd_internal gui-$cmd_second_option listn-nat6 ;;
listn-mangle4*)$cmd_internal gui-$cmd_second_option listn-mangle4 ;;
listn-mangle6*)$cmd_internal gui-$cmd_second_option listn-mangle6 ;;
listn-raw4*)$cmd_internal gui-$cmd_second_option listn-raw4 ;;
listn-raw6*)$cmd_internal gui-$cmd_second_option listn-raw6 ;;
listn-security4*)$cmd_internal gui-$cmd_second_option listn-security4 ;;
listn-security6*)$cmd_internal gui-$cmd_second_option listn-security6 ;;
list-ebtables*)$cmd_internal gui-$cmd_second_option list-ebtables ;;
list-arptables*)$cmd_internal gui-$cmd_second_option list-arptables ;;
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
if [ "$cmd_first_option" == "gui-menu-firewall-wallcustom" ]
####
####
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
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
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu )"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option ;;
gui-info-menu*) $cmd_internal gui-$cmd_second_option firewall-wallcustom ;;
load-custom*)archivo="$($cmd_second_option  --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Launch-Custom \
--entry-text=cfg-to-launch)" ; 
$cmd_internal gui-$cmd_second_option load-custom $archivo ;
$cmd_internal gui-$cmd_second_option list4 ;;
clone-wallsystem*)archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=Clone-static \
--entry-text=static-firewall-to-clone-config)" ; 
$cmd_internal gui-$cmd_second_option clone-wallsystem $archivo ;
$cmd_internal gui-$cmd_second_option list4;;
new-full-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=new-full-custom \
--entry-text=Input_file_name_to_new_full_configuration)" ;
$cmd_internal -gui-$cmd_second_option new-full-custom $archivo ;;
nueva-completa-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-completa-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" 
$cmd_internal gui-$cmd_second_option nueva-completa-custom $archivo ;;
new-mini-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height --entry \
--title=new-mini-custom \
--entry-text=Input_file_ name_ to_ new_ mini_configuration)" ;
$cmd_internal gui-$cmd_second_option new-mini-custom $archivo ;;
nueva-mini-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-mini-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal gui-$cmd_second_option nueva-mini-custom $archivo ;;
new-tiny-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height --entry \
--title=new-tiny-custom \
--entry-text=Input_file_ name_ to_ new_ mini_configuration)" ;
$cmd_internal gui-$cmd_second_option new-tiny-custom $archivo ;;
nueva-diminuta-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=nueva-diminuta-custom \
--entry-text=Introduce_el_nombre_del_nuevo_archivo_cfg)" ;
$cmd_internal gui-$cmd_second_option nueva-diminuta-custom $archivo ;;
names-custom*) $cmd_internal gui-menu-$cmd_second_option names-custom ;;
show-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=show-custom \
--entry-text=cfg-to-show)" ;
$cmd_internal gui-$cmd_second_option show-custom $archivo ;;
modify-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=modify-custom \
--entry-text=cfg-to-modify)" ;
$cmd_internal gui-$cmd_second_option modify-custom $archivo ;;
del-custom*) archivo="$($cmd_second_option --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=del-custom \
--entry-text=cfg-to-delete)";
$cmd_internal gui-$cmd_second_option del-custom $archivo ;;
templates-regen*)$cmd_internal gui-$cmd_second_option  templates-regen ;;
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
if [ "$cmd_first_option" == "gui-menu-firewall-wallsystem" ]
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
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
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu )"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
#### 
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option ;;
gui-info-menu*)$cmd_internal gui-$cmd_second_option firewall-wallsystem ;;
client-basic*)$cmd_internal gui-$cmd_second_option client-basic ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-web*)$cmd_internal gui-$cmd_second_option client-web ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-ssh*)$cmd_internal gui-$cmd_second_option client-ssh ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-telnet*)$cmd_internal gui-$cmd_second_option client-telnet ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-ipp*)$cmd_internal gui-$cmd_second_option client-ipp ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-irc*)$cmd_internal gui-$cmd_second_option client-irc ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-mail*)$cmd_internal gui-$cmd_second_option client-mail ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-news*)$cmd_internal gui-$cmd_second_option client-news ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-ftp*)$cmd_internal gui-$cmd_second_option client-ftp ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-git*)$cmd_internal gui-$cmd_second_option client-git ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-vnc*)$cmd_internal gui-$cmd_second_option client-vnc ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-torrent*)$cmd_internal gui-$cmd_second_option client-torrent ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-vpn*)$cmd_internal gui-$cmd_second_option client-vpn ;
$cmd_internal gui-$cmd_second_option list4 ;;
client-tor*)$cmd_internal gui-$cmd_second_option client-tor ;
$cmd_internal gui-$cmd_second_option list4 ;;
games-shooter*)$cmd_internal gui-$cmd_second_option games-shooter ;
$cmd_internal gui-$cmd_second_option list4 ;;
game-wesnoth*)$cmd_internal gui-$cmd_second_option game-wesnoth ; 
$cmd_internal gui-$cmd_second_option list4 ;;
game-minetest*)$cmd_internal gui-$cmd_second_option game-minetest ;
$cmd_internal gui-$cmd_second_option list4 ;;
game-freeciv*)$cmd_internal gui-$cmd_second_option game-freeciv ;
$cmd_internal gui-$cmd_second_option list4;;
game-widelands*)$cmd_internal gui-$cmd_second_option game-widelands ;
$cmd_internal gui-$cmd_second_option list4 ;;
lan-tor*)$cmd_internal gui-$cmd_second_option lan-tor ;
$cmd_internal gui-$cmd_second_option list4 ;;
lan-vpn*)$cmd_internal gui-$cmd_second_option lan-vpn ;
$cmd_internal gui-$cmd_second_option list4 ;;
shield-ssh*)$cmd_internal gui-$cmd_second_option shield-ssh ;
 $cmd_internal gui-$cmd_second_option list4 ;;
server-ssh*)$cmd_internal gui-$cmd_second_option server-ssh ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-web*)$cmd_internal gui-$cmd_second_option server-web ;
 $cmd_internal gui-$cmd_second_option list4 ;;
server-vnc*)$cmd_internal gui-$cmd_second_option server-vnc ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-samba*)$cmd_internal gui-$cmd_second_option server-samba ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-news*)$cmd_internal gui-$cmd_second_option server-news ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-mail*)$cmd_internal gui-$cmd_second_option server-mail ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-ftp*)$cmd_internal gui-$cmd_second_option server-ftp ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-print*)$cmd_internal gui-$cmd_second_option server-print ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-lamp*)$cmd_internal gui-$cmd_second_option server-lamp ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-teamspeak*)$cmd_internal gui-$cmd_second_option server-teamspeak ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-mumble*)$cmd_internal gui-$cmd_second_option server-mumble ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-sql*)$cmd_internal gui-$cmd_second_option server-sql ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-asterisk*)$cmd_internal gui-$cmd_second_option server-asterisk ;
$cmd_internal gui-$cmd_second_option list4 ;;
server-domain*)$cmd_internal gui-$cmd_second_option server-domain ;
$cmd_internal gui-$cmd_second_option list4 ;;
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
if [ "$cmd_first_option" == "gui-menu-firewall-netsystem" ]
then echo $txt_head_waiting_gui ;
if [ "$cmd_second_option" == "zenity" ] || [ "$cmd_second_option" == "yad" ]; then
echo ; else cfg_second_option="$cfg_favorite_basename_graphicalldialog" ; echo ; fi
echo "$txt_text_title The used gui in $cmd_first_option is $cmd_second_option" ;
####
####
gui_menu="gui-principal-menu|gui-info-menu|preferences-read|\
preferences-edit|preferences-regen|alias-read|alias-edit|alias-regen|\
options|clasic-options|info-options|expert|download|intro|\
cat-logcmd|tree-log|tree-pdf|tree-conf|tree-cache|clean-cache|
ip4|ip6|speed-ip4|speed-ip6|notes|\
license-lgpl-v2|license-gpl-v2|\
info-ip4|info-ip6|route4|route6||sockets|\
add-whitelist4|add-whitelist6|add-blacklist4|add-blacklist6|\
install|upgrade|examples|depends|variables|utils|about"
selection_menu="$(echo $gui_menu | sed 's/|/ /g')"
selection_final="$($cmd_second_option \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--column=$cmd_first_option \
--text=$cmd_first_option \
--title=Gui-menu-With-$cmd_internal-$cmd_version \
--list $selection_menu )"
####
####
if [ "$cmd_second_option" == "yad" ]; then
final="$(echo $selection_final | sed 's/|/ /g')"
else final="$selection_final" ; fi
echo ; echo "$txt_text_title option selected: $final" ; echo ;
#### 
####
case "$selection_final" in
1*) exit ;;
gui-principal-menu*) $cmd_internal gui-menu-$cmd_second_option ;;
gui-info-menu*)$cmd_internal gui-$cmd_second_option firewall-netsystem ;;
preferences-read*)$cmd_internal gui-$cmd_second_option preferences-read ;;
preferences-edit*)$cmd_internal gui-$cmd_second_option preferences-edit ;;
preferences-regen*)$cmd_internal gui-$cmd_second_option preferences-regen ;;
alias-read*)$cmd_internal gui-$cmd_second_option alias-read ;;
alias-edit*)$cmd_internal gui-$cmd_second_option alias-edit ;;
alias-regen*)$cmd_internal gui-$cmd_second_option alias-regen ;;
options*)$cmd_internal gui-$cmd_second_option options ;;
clasic-options*)$cmd_internal gui-$cmd_second_option clasic-options ;;
info-options*)$cmd_internal gui-$cmd_second_option info-options ;;
expert*)$cmd_internal gui-$cmd_second_option expert ;;
intro*)$cmd_internal gui-$cmd_second_option intro ;;
download*)$cmd_internal gui-$cmd_second_option download ;;
ip4*)$cmd_internal gui-$cmd_second_option ip4 ;;
ip6*)$cmd_internal gui-$cmd_second_option ip6 ;;
speed-ip4*)$cmd_internal gui-$cmd_second_option speed-ip4 ;;
speed-ip6*)$cmd_internal gui-$cmd_second_option speed-ip6 ;;
sockets*)$cmd_internal gui-$cmd_second_option sockets ;;
cat-logcmd*)$cmd_internal gui-$cmd_second_option cat-logcmd ;;
tree-log*)$cmd_internal gui-$cmd_second_option tree-log ;;
tree-pdf*)$cmd_internal gui-$cmd_second_option tree-pdf ;;
tree-conf*)$cmd_internal gui-$cmd_second_option tree-conf ;;
tree-cache*)$cmd_internal gui-$cmd_second_option tree-cache ;;
clean-cache*)$cmd_internal gui-$cmd_second_option clean-cache ;;
examples*)$cmd_internal gui-$cmd_second_option examples ;;
depends*)$cmd_internal gui-$cmd_second_option depends ;;
install*)$cmd_internal -gui-zenity install ;;
upgrade*)$cmd_internal -gui-zenity upgrade ;;
notes*)$cmd_internal gui-$cmd_second_option notes ;;
info-ip4*)$cmd_internal gui-$cmd_second_option info-ip4 ;;
info-ip6*)$cmd_internal gui-$cmd_second_option info-ip6 ;;
route4*)$cmd_internal gui-$cmd_second_option route4 ;;
route6*)$cmd_internal gui-$cmd_second_option route6 ;;
license-lgpl-v2*)$cmd_internal gui-$cmd_second_option license-lgpl-v2 ;;
license-gpl-v2*)$cmd_internal gui-$cmd_second_option license-gpl-v2 ;;
variables*) $cmd_internal gui-$cmd_second_option variables ;;
add-whitelist4*) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-whitelist4 \
--entry-text=host-to-add-to-whitelist-with-ip-v4)" 
$cmd_internal gui-zenity add-whitelist4 $archivo ;;
add-whitelist6*) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-whitelist6 \
--entry-text=host-to-add-to-whitelist-with-ip-v6)" 
$cmd_internal gui-zenity add-whitelist6 $archivo ;;
add-blacklist4*) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-blacklist4 \
--entry-text=host-to-add-to-blacklist-with-ip-v4)" 
$cmd_internal gui-zenity add-blacklist4 $archivo ;;
add-blacklist6*) archivo="$($cmd_command_zenity --entry \
--width=$cfg_config_graphicall_width --height=$cfg_config_graphicall_height \
--title=add-blacklist6 \
--entry-text=host-to-add-to-blacklist-with-ip-v6)" 
$cmd_internal gui-zenity add-blacklist6 $archivo ;;
utils*) $cmd_internal gui-$cmd_second_option commands ;;
about*) $cmd_internal gui-$cmd_second_option about ;;
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
if [ "$cmd_first_option" == "load-custom" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $cmd_second_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallcustom" ;
cfg_name_firewall="$cmd_second_option" ;
####
####
#### english: configure load-custom variables if there are
#### spanish: configura variables modificadas si estan ahi
####
####
if [ -f "$cmd_default_directory_custom/$cmd_second_option" ]
then source $cmd_default_directory_custom/$cmd_second_option ; fi
####
####
if [ ! -f "$cmd_default_directory_custom/$cmd_second_option" ]
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
if [ "$cmd_first_option" == "loadtiny-custom" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $cmd_second_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="tinycustom" ;
cfg_name_firewall="$cmd_second_option" ;
####
####
#### english: configure load-custom variables if there are
#### spanish: configura variables modificadas si estan ahi
####
####
if [ -f "$cmd_default_directory_custom/$cmd_second_option" ]
then source $cmd_default_directory_custom/$cmd_second_option ; fi
####
####
if [ ! -f "$cmd_default_directory_custom/$cmd_second_option" ]
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
if [ "$cmd_first_option" == "tinyserver-tcp" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $fist_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallcontrol" ;
cfg_name_firewall="tinyserver-tcp" ;
cfg_first_option="loadtiny-custom" ;
####
####
cfg_server_port_tcp="$2"
cfg_server_port_udp=""
####
####
if [ "$cmd_third_option" != "$NULL" ] ;
then 
cfg_config_ipv4_netserver="$3" 
cfg_config_ipv6_netserver="$3"
fi
####
####
if [ "$cmd_second_option" != "$NULL" ]; then
echo "$txt_text_title_info [ Server with ports tcp $2 for host $3 ]"
echo "$txt_text_title_info [ Suggest: list rules with list numeral ]"
else
echo "$txt_text_info Introducction: Put the ports tcp servers"
echo "$txt_text_info Introducction: The tinyserver-udp configured like client for all protocols."
echo "$txt_text_info Example_1: $cmd_internal tinyserver-tcp 20:22,80"
echo "$txt_text_info Example_2: $cmd_internal tinyserver-tcp 20:22,80 12.168.0.0/24"
echo "$txt_text_fail fwiptables $cmd_first_option no loaded"
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
if [ "$cmd_first_option" == "tinyserver-udp" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $fist_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallcontrol" ;
cfg_name_firewall="tinyserver-udp" ;
first_option="loadtiny-custom" ;
####
####
cfg_server_port_udp="$2"
cfg_server_port_tcp=""
####
####
if [ "$cmd_third_option" != "$NULL" ] ;
then
cfg_config_ipv4_netserver="$3"
cfg_config_ipv6_netserver="$3"
fi
####
####
if [ "$cmd_second_option" != "$NULL" ]; then
echo "$txt_text_title_info [ Server with ports udp $2 for host $3 ]"
echo "$txt_text_title_info [ Suggest: list rules with list numeral ]"
else
echo "$txt_text_info Introducction: Put the ports udp servers"
echo "$txt_text_info Introducction: The tinyserver-udp configured like client for all protocols."
echo "$txt_text_info Example_1: $cmd_internal tinyserver-udp 20:22,80"
echo "$txt_text_info Example_2: $cmd_internal tinyserver-udp 20:22,80 192.168.0.0/24"
echo "$txt_text_fail fwiptables $cmd_first_option no loaded"
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
if [ "$cmd_first_option" == "miniserver-tcp" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $fist_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallcontrol"    ; 
cfg_name_firewall="miniserver-tcp" ;
####
####
cfg_server_port_tcp="$2" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="$cfg_client_mini_port_tcp"
cfg_client_port_udp="$cfg_client_mini_port_udp"
####
####
if [ "$cmd_third_option" != "$NULL" ] ;
then cfg_config_ipv4_netserver="$3" 
cfg_config_ipv6_netserver="$3" ; fi
####
####
if [ "$cmd_second_option" != "$NULL" ]; then
echo "$txt_text_title_info [ Server with ports tcp $2 for host $3 ]"
echo "$txt_text_title_info [ Suggest: list rules with list numeral ]"
else
echo "$txt_text_info Introducction: Put the ports tcp servers"
echo "$txt_text_info Introducction: to client ports: see preferences-edit (miniclient ports)"
echo "$txt_text_info Example_1: $cmd_internal miniserver-tcp 20:22,80"
echo "$txt_text_info Example_2: $cmd_internal miniserver-tcp 20:22,80 192.168.0.0/24"
echo "$txt_text_fail fwiptables $cmd_first_option no loaded"
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
if [ "$cmd_first_option" == "miniserver-udp" ]
####
####
then echo "$txt_text_title_info [ loading firewall wallcustom $fist_option ]"
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallcontrol"    ; 
cfg_name_firewall="miniserver-udp" ;
####
####
cfg_server_port_tcp="" ;
cfg_server_port_udp="$2" ;
cfg_client_port_tcp="$cfg_client_mini_port_tcp"
cfg_client_port_udp="$cfg_client_mini_port_udp"
####
####
if [ "$cmd_third_option" != "$NULL" ] ;
then cfg_config_ipv4_netserver="$3" 
cfg_config_ipv6_netserver="$3" ; fi
####
####
if [ "$cmd_second_option" != "$NULL" ]; then
echo "$txt_text_title_info [ Server with ports udp $2 for host $3 ]"
echo "$txt_text_title_info [ Suggest: list rules with list numeral ]"
else
echo "$txt_text_info Introducction: Put the ports udp servers"
echo "$txt_text_info Introducction: to client ports: see preferences-edit (miniclient ports)"
echo "$txt_text_info Example_1: $cmd_internal mioniserver-udp 20:22,80"
echo "$txt_text_info Example_2: $cmd_internal mioniserver-udp 20:22,80 192.168.0.0/24"
echo "$txt_text_fail fwiptables $cmd_first_option no loaded"
exit ; fi
####
####
fi
####
####
#### :rutina-final-miniserver-udp:
################ variables:
################
#### :rutina-inicial-variables:
####
####
if [ "$cmd_first_option" == "variables" ] ; then
####
####
#### list variables
declare | $cmd_command_grep -E ^"cmd_|cfg_|txt_" | $cmd_command_sort
####
####
#### numbers variables
echo "$txt_text_title the statidist variables"
echo "$txt_text_title variables cfg_  : $(declare | \
$cmd_command_grep -E ^"cfg_" | wc -l)"
echo "$txt_text_title variables cmd_  : $(declare | \
$cmd_command_grep -E ^"cmd_" | wc -l)"
echo "$txt_text_title variables txt_  : $(declare | \
$cmd_command_grep -E ^"txt_" | wc -l)"
echo "$txt_text_title total variables : $(declare | \
$cmd_command_grep -E ^"txt_|cfg_|cmd_" | wc -l)"
####
####
exit ; fi
####
####
#### :rutina-final-variables:
###############  variables:
###############
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
if [ "$cmd_first_option" == "without-connection" ]; then
echo "$txt_text_title_info [ loading firewall wallcontrol without-connection ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="without-connection";
cfg_name_firewall="$cmd_first_option";
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
if [ "$cmd_first_option" == "input-permisive" ]; then
####
####
echo "$txt_text_title_info [ loading firewall wallcontrol input-permisive ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="input-permisive" ;
cfg_name_firewall="$cmd_first_option";
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
if [ "$cmd_first_option" == "input-established" ]; then
####
####
echo "$txt_text_title_info [ loading firewall wallcontrol input-established ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="input-established" ;
cfg_name_firewall="$cmd_first_option";
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
if [ "$cmd_first_option" == "shield-ssh" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem shield-ssh ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallsystem"    ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
cfg_allow_shield_maxtries="" ;
cfg_config_shield_maxtries="30" ;
cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="ssh" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-ssh" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-ssh ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallsystem"    ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
cfg_allow_shield_maxtries="no" ;
cfg_config_shield_maxtries="20" ;
cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-telnet" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-telnet ]" ;
cfg_allow_launchrules_firewall="yes" ;
cfg_type_firewall="wallsystem"    ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
cfg_allow_shield_maxtries="no" ;
cfg_config_shield_maxtries="20" ;
cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,telnet" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-basic" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-basic ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-web" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-web ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-git" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-git ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,git" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-ipp" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-ipp ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ipp" ;
cfg_client_port_udp="domain,bootpc,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-irc" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-irc ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-vnc" ]; then
echo "$txt_text_title_info [ loading firewall client-vnc ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web and vnc
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-torrent" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-torrent ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect web normal and bittorrent too
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="1025:65000" ;
cfg_client_port_tcp="http,https,http-alt,ssh,9091,51413" ;
cfg_server_port_tcp="9091,51413" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-vpn" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-vpn ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect web normal and web vpn
cfg_server_port_udp="" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,500,1194,1701,4500" ; 
cfg_client_port_tcp="http,https,http-alt,ssh,443,1701,1723" ; 
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-tor" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-tor ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect web normal and web tor
cfg_server_port_udp="" ; 
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,9000:9170" ;
cfg_server_port_tcp="9000:9170" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-news" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-news ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 may be changed to use TLS via the STARTTLS command. 
cfg_server_port_udp="" ; 
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,119,433,563" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-mail" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-mail ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
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
cfg_server_port_udp="" ; 
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,25,119,563,25,995,110,465,587,143,993" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-ftp" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-ftp ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### client ftp:
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-proxy" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-proxy ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server http and https and ssh /tcp and https udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,3128,ssh" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "lan-vpn" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem lan-vpn ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### vpn ports to connects ports vpn
#### with necesary ports to connect gatway and date, domain for your ip
cfg_server_port_udp="" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,500,1194,1701,4500" ; 
cfg_client_port_tcp="1701,1723" ; 
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "lan-tor" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem lan-tor ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### lan tor, 9000:9170 for connect to tor
#### with necesary ports to connect gatway and date, domain for your ip
cfg_server_port_udp="" ;
cfg_client_port_udp="bootpc,domain,domain-s,ntp" ;
cfg_client_port_tcp="9000:9170" ;
cfg_server_port_tcp="9000:9170" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "games-shooter" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem games-shooter ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="1025:65000" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "games-udp" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem games-udp ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### games shooter 3D all udp without the root ports 1:1024 and ftp for download maps
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="1025:65000" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "game-wesnoth" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem game-wesnoth ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers 
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### game wesnoth port 14999 and 15001 usually
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,14950:15050" ;
cfg_server_port_tcp="14950:15050" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "game-minetest" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem game-minetest ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### game minetest and minecraft porst 25k and 35k /udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,25000:35000" ; 
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,25000:35000" ;
cfg_server_port_tcp="25000:35000" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "game-freeciv" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem game-freeciv ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### for default 5556 port tcp perhaps 5555 too
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ; 
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,5555:5556" ;
cfg_server_port_tcp="5555:5556" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "game-widelands" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem game-widelands ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### for default 7396 port tcp and 7396 udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,7396" ; 
cfg_server_port_udp="7396" ;
cfg_client_port_tcp="ssh,http,https,http-alt,7396" ;
cfg_server_port_tcp="7396" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-uid-root" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-uid-root ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="" ;
cfg_client_port_udp="" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
cfg_allow_output_uid= 
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
cfg_config_output_uid=root
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-gid-users" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-gid-users ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers 
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="" ;
cfg_client_port_udp="" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
cfg_allow_output_gid=  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
cfg_config_output_gid=users 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "client-gid-net" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem client-gid-net ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="" ;
cfg_client_port_udp="" ;
cfg_server_port_tcp="" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
cfg_allow_output_gid=  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
cfg_config_output_gid=net 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-web" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-web ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server http and https and ssh /tcp and https udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="https" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_server_port_tcp="ssh,http,https,http-alt" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-vnc" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-vnc ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"      
#### you can connect normal web and vnc
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,5900:5910" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="ssh,5900:5910" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-ftp" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-ftp ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server http and https and ssh /tcp and https udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ftp,ftp-data,ftps,ftps-data" ;
cfg_server_port_tcp="ssh,http,https,ftp,ftp-data,ftps,ftps-data" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-gateway" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-gateway ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft=""             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server http and https and ssh /tcp and https udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="ssh,http,https,http-alt" ;
cfg_server_port_tcp="ssh,http,https,http-alt" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
cfg_allow_forward_ip4=
# cfg_allow_forward_ip6= 
cfg_allow_gateway_ip4= 
# cfg_allow_gateway_ip6= 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping= 
# cfg_allow_output_ping= 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
cfg_config_gateway_ip4=192.168.0.1/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-proxy" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-proxy ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server http and https and ssh /tcp and https udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,3128,ssh" ;
cfg_server_port_tcp="ssh,http,https,http-alt,3128" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-news" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-news ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"       
#### client news:
#### The well-known TCP port 119 is reserved for NNTP. Well-known TCP port 433 (NNSP) 
#### may be used when doing a bulk transfer of articles from one 
#### server to another. When clients connect to a news server with Transport Layer Security (TLS),
#### TCP port 563 is often used. This is sometimes referred to as NNTPS. 
#### Alternatively, a plain-text connection over port 119 
#### may be changed to use TLS via the STARTTLS command. 
cfg_server_port_udp="" ; 
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,119,433,563" ;
cfg_server_port_tcp="ssh,http,https,119,433,563" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-mail" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-mail ]" ;
####
####
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
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
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,25,119,433,563,25:26,995,110,465,587,143,993" ;
cfg_server_port_tcp="ssh,http,https,25,119,433,563,25:26,995,110,465,587,143,993" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-samba" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-samba ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server samba and active directory
cfg_client_port_tcp="http,https,http-alt,ssh,ldap,636,microsoft-ds" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,ldap,636,137:139" ;
cfg_server_port_tcp="ssh,ldap,636,microsoft-ds" ; 
cfg_server_port_udp="ssh,ntp,domain,domain-s,ldap,636,137:139" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-print" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-print ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ; 
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server ipp and printer
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_server_port_tcp="ssh,printer,ipp" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-ssh" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-ssh ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server ssh 22/tcp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_server_port_tcp="ssh" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-telnet" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-telnet ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server ssh 22/tcp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,telnet" ;
cfg_server_port_tcp="ssh,telnet" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-lamp" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-lamp ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
####  english: udp: 20 is ftp-data, 21 is ftp, 989 is ftps-data y 990 is ftps
####  english: tcp: 10000 is webmin, 3306 is mysql, 5432 is postgresql
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_udp="https" ;
cfg_client_port_tcp="http,https,http-alt,ssh,20,21,989,990" ;
cfg_server_port_tcp="ssh,http,https,10000,3306,5432" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-asterisk" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-asterisk ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
####    UDP:5060 SIP (sip.conf), newer Versions support TCP:5060
####    UDP:10000-20000 RTP (rtp.conf) for the media stream, a higher Portrange
####    UDP:5036 IAX2
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5060,10000:20000,5036" ;
cfg_server_port_udp="5060,10000:20000,5036" ;
cfg_client_port_tcp="http,https,http-alt,ssh,5060" ;
cfg_server_port_tcp="ssh,5060" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-mumble" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-mumble ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers 
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### mumble port 64738 tcp and 64738 udp
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,64738" ;
cfg_server_port_udp="64738" ;
cfg_client_port_tcp="http,https,http-alt,ssh,64738" ;
cfg_server_port_tcp="ssh,64738" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-teamspeak" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-teamspeak ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### Service	        Protocol	Local Port (Server)
#### Voice	        UDP	9987
#### Filetransfer	TCP	30033
#### ServerQuery (raw)	TCP	10011
#### ServerQuery (SSH)	TCP	10022
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,9987" ;
cfg_server_port_udp="9987" ;
cfg_client_port_tcp="http,https,http-alt,ssh,30033,10011,10022" ;
cfg_server_port_tcp="ssh,30033,10011,10022" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-sql" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-sql ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
####  POSTGRESQL 5432/tcp and 5432/udp
####  Technology	Default Port	Required
####  MySQL Client to Server - MySQL Protocol – 3306	3306/tcp	Optional - pick at least 1
####  MySQL Client to Server – New X Protocol – 33060	33060/tcp	Optional - pick at least 1
####  Connects via SSH Tunnel	22/tcp	Optional - pick at least 1
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https,5432" ;
cfg_server_port_udp="5432" ;
cfg_client_port_tcp="http,https,http-alt,ssh,5432,3306,3360" ;
cfg_server_port_tcp="ssh,5432,3306,3360" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-irc" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-irc ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### you can connect normal web
cfg_server_port_udp="" ;
cfg_client_port_tcp="http,https,http-alt,ssh,ircs-u,ircd" ;
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https" ;
cfg_server_port_tcp="ssh,ircs-u,ircd" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
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
if [ "$cmd_first_option" == "server-domain" ]; then
echo "$txt_text_title_info [ loading firewall wallsystem server-domain ]" ;
cfg_allow_launchrules_firewall="yes" ; 
cfg_type_firewall="wallsystem" ;
cfg_name_firewall="$cmd_first_option" ;
#### english: firewall capacities
#### english: firewall capacities
# cfg_allow_use_legacy=""        
# cfg_allow_use_nft="no"             
# cfg_allow_use_ipv4=""            
# cfg_allow_use_ipv6=""           
# cfg_allow_separate_rules=""
#### english: max tries for each hour 
# cfg_allow_shield_maxtries="no" ;
# cfg_config_shield_maxtries="12" ;
# cfg_config_shield_port="22" ;
#### english: log port servers
# cfg_server_log_port_tcp="no"    
# cfg_server_log_port_udp="no"    
#### server domain and domain-s
cfg_client_port_udp="domain,domain-s,bootpc,bootps,ntp,https," ;
cfg_server_port_udp="domain,domain-s" ;
cfg_client_port_tcp="http,https,http-alt,ssh" ;
cfg_server_port_tcp="ssh" ;
# cfg_config_close_deny=DROP  ## or DROP or REJECT"
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_allow_string_dropped=no 
# cfg_allow_string_allowed=no 
# cfg_allow_forward_ip4=no 
# cfg_allow_forward_ip6=no 
# cfg_allow_gateway_ip4=no 
# cfg_allow_gateway_ip6=no 
# cfg_allow_dmz_ip4=no 
# cfg_allow_dmz_ip6=no 
# cfg_allow_input_all=no 
# cfg_allow_output_all=no 
# cfg_allow_input_state=no 
# cfg_allow_output_state=no 
# cfg_allow_input_bandwidth=no 
# cfg_allow_output_bandwidth=no 
# cfg_allow_input_maxconnect=no 
# cfg_allow_output_maxconnect=no 
# cfg_allow_input_ping=no 
# cfg_allow_output_ping=no 
# cfg_allow_mac_whitelist=no 
# cfg_allow_mac_blacklist=no 
# cfg_allow_net_whitelist=no 
# cfg_allow_net_blacklist=no 
# cfg_allow_output_uid=no  
# cfg_allow_output_gid=no  
# cfg_allow_others_protocols=no 
####
####
#### english: advance options in configurations file cfg
#### spanish: avanzadas opciones in configuracion de archivo cfg
####
####
# cfg_config_string_denied=.fb.com,.facebook.com,xxx.html 
# cfg_config_string_allowed=one-string-that-like-how-a-passord,sourceforge.net 
# cfg_config_mac_whitelist=d4:12:43:01:36:2e 
# cfg_config_mac_blacklist=d4:12:43:01:36:2e 
# cfg_config_net_whitelist=wesnoth.org,sf.net,deb.debian.org 
# cfg_config_net_blacklist=facebook.com,www.facebook.com 
# cfg_config_gateway_ip4=192.168.0.0/24
# cfg_config_gateway_ip6=::1
# cfg_config_dmz_ip4=192.168.1.7
# cfg_config_dmz_ip6=d4:12:43:01:36:2e 
# cfg_config_input_state=new,related,established 
# cfg_config_output_state=new,related,established 
# cfg_config_input_bandwidth=12512 
# cfg_config_output_bandwidth=512 
# cfg_config_input_maxconnect=72 
# cfg_config_output_maxconnect=72 
# cfg_config_output_uid=root 
# cfg_config_output_gid=root 
# cfg_config_others_protocols=icmp,igmp 
# cfg_config_ipv4_netclient=0/0 
# cfg_config_ipv4_netserver=0/0 
# cfg_config_ipv6_netclient=::/0 
# cfg_config_ipv6_netserver=::/0 
fi
####
####
#### :rutina-final-server-domain:
############################       english: default: without other valid options
############################	   spanish: default: sin otra valida opcion
####
####
if [ "$cfg_allow_launchrules_firewall" != "yes" ] ; then
####
####
echo "### $txt_text_fail [ Fail Option: $cmd_first_option ] [ List Option: options ]"
cmd_first_option="options" ; $cmd_internal $cmd_first_option ; 
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
case "$cfg_allow_use_legacy"  in "no")   ;; *) cfg_allow_use_legacy=""    ;; esac
case "$cfg_allow_use_nft"     in "no")   ;; *) cfg_allow_use_nft=""       ;; esac
case "$cfg_allow_use_ipv4"    in "no")   ;; *) cfg_allow_use_ipv4=""      ;; esac
case "$cfg_allow_use_ipv6"    in "no")   ;; *) cfg_allow_use_ipv6=""      ;; esac
####
####
case "$cfg_config_string_algoritmo" in "bm"|"kmp") ;;
*) cfg_config_string_algoritmo="bm" ;; esac
case "$cfg_config_close_deny" in "DROP"|"REJECT") ;;
*) cfg_config_close_deny="DROP"  ;; esac
####
####
case "$NULL" in "$cfg_allow_autosave")         ;;  *)  cfg_allow_autosave="no" ;;  esac
case "$NULL" in "$cfg_allow_string_dropped")   ;;  *)  cfg_allow_string_dropped="no" ;;  esac
case "$NULL" in "$cfg_allow_dmz_ip4")          ;;  *)  cfg_allow_dmz_ip4="no" ;; esac
case "$NULL" in "$cfg_allow_dmz_ip6")          ;;  *)  cfg_allow_dmz_ip6="no" ;; esac
case "$NULL" in "$cfg_allow_forward_ip4")      ;;  *)  cfg_allow_forward_ip4="no" ;; esac
case "$NULL" in "$cfg_allow_forward_ip6")      ;;  *)  cfg_allow_forward_ip6="no" ;; esac
case "$NULL" in "$cfg_allow_gateway_ip4")      ;;  *)  cfg_allow_gateway_ip4="no" ;; esac
case "$NULL" in "$cfg_allow_gateway_ip6")      ;;  *)  cfg_allow_gateway_ip6="no" ;; esac
case "$NULL" in "$cfg_allow_input_all")        ;;  *)  cfg_allow_input_all="no";; esac
case "$NULL" in "$cfg_allow_input_bandwidth")  ;;  *)  cfg_allow_input_bandwidth="no";; esac
case "$NULL" in "$cfg_allow_input_maxconnect") ;;  *)  cfg_allow_input_maxconnect="no";; esac
case "$NULL" in "$cfg_allow_input_ping")       ;;  *)  cfg_allow_input_ping="no";; esac
case "$NULL" in "$cfg_allow_input_state")      ;;  *)  cfg_allow_input_state="no";; esac
case "$NULL" in "$cfg_allow_use_ipv4")         ;;  *)  cfg_allow_use_ipv4="no" ;; esac
case "$NULL" in "$cfg_allow_use_ipv6")         ;;  *)  cfg_allow_use_ipv6="no" ;; esac
case "$NULL" in "$cfg_allow_use_legacy")       ;;  *)  cfg_allow_use_legacy="no" ;; esac
case "$NULL" in "$cfg_allow_mac_blacklist")    ;;  *)  cfg_allow_mac_blacklist="no" ;; esac
case "$NULL" in "$cfg_allow_mac_whitelist")    ;;  *)  cfg_allow_mac_whitelist="no" ;; esac
case "$NULL" in "$cfg_allow_shield_maxtries")  ;;  *)  cfg_allow_shield_maxtries="no" ;; esac
case "$NULL" in "$cfg_allow_net_blacklist")    ;;  *)  cfg_allow_net_blacklist="no";; esac
case "$NULL" in "$cfg_allow_net_whitelist")    ;;  *)  cfg_allow_net_whitelist="no";; esac
case "$NULL" in "$cfg_allow_use_nft")          ;;  *)  cfg_allow_use_nft="no" ;; esac
case "$NULL" in "$cfg_allow_only_output")      ;;  *)  cfg_allow_only_output="no" ;; esac
case "$NULL" in "$cfg_allow_other_protocols")  ;;  *)  cfg_allow_other_protocols="no";; esac
case "$NULL" in "$cfg_allow_others_protocols") ;;  *)  cfg_allow_others_protocols="no" ;; esac
case "$NULL" in "$cfg_allow_output_all")       ;;  *)  cfg_allow_output_all="no";; esac
case "$NULL" in "$cfg_allow_output_bandwidth") ;;  *)  cfg_allow_output_bandwidth="no";; esac
case "$NULL" in "$cfg_allow_output_gid")       ;;  *)  cfg_allow_output_gid="no";; esac
case "$NULL" in "$cfg_allow_output_maxconnect");;  *)  cfg_allow_output_maxconnect="no";; esac
case "$NULL" in "$cfg_allow_output_ping")      ;;  *)  cfg_allow_output_ping="no";; esac
case "$NULL" in "$cfg_allow_output_state")     ;;  *)  cfg_allow_output_state="no";; esac
case "$NULL" in "$cfg_allow_output_uid")       ;;  *)  cfg_allow_output_uid="no";; esac
case "$NULL" in "$cfg_config_system_log")      ;;  *)  cfg_config_system_log="log" ;; esac
####
####
####
####
#### :rutina-final-sane-variables-firewall:
#################################################################
#################################################################
####                                                                                            ###############
#### Knowed now sure that:         cfg_allow_launchrules_firewall="yes"                              ###############
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
if [ "$cfg_type_firewall" == "input-permisive" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4   $cmd_command_ip4tablesnft -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4   $cmd_command_ip4tablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A FORWARD \
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
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT   \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A FORWARD \
-j ACCEPT \
-m comment --comment all-forward &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
echo "$txt_text_title_ok [ Launched: firewall ] \
[ Type: $cfg_type_firewall ] [ Name: $cfg_name_firewall ]"
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
if [ "$cfg_type_firewall" == "input-established" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept and the others legacy ipv4 accept too
#### spanish: legacy ipv4 127.0.0.1 acepta y los otros legacy ipv4 acepta tambien
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_nft   $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
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
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
####
####
#### english: allow all output ipv6
#### spanish: permite toda salida ipv6
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
echo "$txt_text_title_ok [ Launched: firewall ] \
[ Type: $cfg_type_firewall ] [ Name: $cfg_name_firewall ]"
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
if [ "$cfg_type_firewall" == "without-connection" ]
then $cmd_internal eraserules &> /dev/null ;
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: legacy ipv4 127.0.0.1 acepta
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A INPUT  \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost   -j ACCEPT \
-m comment --comment host-localhost  &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy ipv4 127.0.0.1 acept
#### spanish: nft ipv4 127.0.0.1 acepta
####
####
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
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
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A INPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept
#### spanish: nft ipv6 127.0.0.1 acepta
####
####
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A INPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
########################################     english: close in without-connection
########################################     spanish: cierra en without-connection
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####  
echo "$txt_text_title_ok [ Launched: firewall ] \
[ Type: $cfg_type_firewall ] [ Name: $cfg_name_firewall ]"
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
if [ "$cmd_first_option" == "loadtiny-custom" ]; then $cmd_internal eraserules &> /dev/null ;
####
####
#### LOCALHOST IS ALLOWED
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft   $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $cfg_server_port_tcp | $cmd_command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_udp in $(echo $cfg_server_port_udp | $cmd_command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: nft ipv4 127.0.0.1 acept and the others nft ipv4 accept too
#### spanish: nft ipv4 127.0.0.1 acepta y los otros nft ipv4 acepta tambien
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
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
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT   \
-m state --state RELATED,ESTABLISHED -j ACCEPT \
-m comment --comment state-input &> /dev/null
####
####
#### english: ipv6-icmp accept in legacy and accept in nft
#### spanish: ipv6-icmp acepta en legacy y acepta en nft
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A INPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment nexthop-ip6 &> /dev/null
####
####
#### english: nft ipv6 127.0.0.1 acept and the others nft ipv6 accept too
#### spanish: nft ipv6 127.0.0.1 acepta y los otros nft ipv6 acepta tambien
####
####
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT  \
-j ACCEPT \
-m comment --comment all-output &> /dev/null
####
####
#### english: close with drop legacy and close with drop nft
#### spanish: cierra con drop legacy y cierra con drop nft
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
echo "$txt_text_title_ok [ Launched: firewall ] \
[ Type: $cfg_type_firewall ] [ Name: $cfg_name_firewall ]"
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
if [ "$cmd_first_option" == "load-custom" ]
####
####
then if [ -f $cmd_default_directory_custom/$cmd_second_option ]
then source $cmd_default_directory_custom/$cmd_second_option &> /dev/null
else echo "$txt_text_md $txt_text_fail [ Config file not found ]"
####
####
exit ; fi ; fi
####
####
##############################      english: selective state of intput/oputut          
##############################      spanish: estado selectivo de entrada/salida        
####
####
if [ "$cfg_allow_input_state" != "$NULL" ]  ; then  cfg_config_input_state=""  ; fi
if [ "$cfg_allow_output_state" != "$NULL" ] ; then  cfg_config_output_state="" ; fi 
####
####
if [ "$cfg_allow_input_state" == "$NULL" ]
then 
cfg_connect_input_state="$cfg_config_input_state"
cfg_config_input_state="-m state --state $connect_input_state"
fi
####
####
if [ "$cfg_allow_output_state" == "$NULL" ]
then 
cfg_connect_output_state="$cfg_config_output_state"
cfg_config_output_state="-m state --state $cfg_connect_output_state"
fi
####
####
##############################      english: 
#### output_uid or output_gid for input established status        #####################
##############################      spanish:
#### usuario o grupo para establecidos de entrada de estado       #####################
####
####
if [ "$cfg_allow_output_uid" == "$NULL" ]
then cfg_config_uid_gid="" ; fi
if [ "$cfg_allow_output_gid" == "$NULL" ]
then cfg_config_uid_gid="" ; fi
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
if [ "$cfg_allow_mac_whitelist" == "$NULL" ] ; then
####
$cmd_command_ebtables -A INPUT  -s $cfg_config_mac_whitelist -j ACCEPT  &> /dev/null
$cmd_command_ebtables -A OUTPUT -d $cfg_config_mac_whitelist -j ACCEPT  &> /dev/null
####
fi
####
####
if [ "$cfg_allow_mac_blacklist" == "$NULL" ] ; then
####
$cmd_command_ebtables -A INPUT  -s ! $cfg_config_mac_whitelist -j ACCEPT  &> /dev/null
$cmd_command_ebtables -A OUTPUT -d ! $cfg_config_mac_whitelist -j ACCEPT  &> /dev/null
####
fi
####
####
#######################################        english: Accept  localhost rules
#######################################        spanish: aceptar reglas localhost
####
####
if [ "$cfg_config_ip4_localhost" != "$NULL" ]; then
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A OUTPUT -s \
$cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A FORWARD \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
fi
####
####
if [ "$cfg_config_ip6_localhost" != "$NULL" ]; then
####
####
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A INPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A INPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A FORWARD \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost  -j ACCEPT \
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
if [ "$cfg_allow_net_blacklist" == "$NULL" ]; then
####
for one_blacklist in $(echo $cfg_config_net_blacklist | $cmd_command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A INPUT -s $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A OUTPUT -d $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  $cmd_command_ip4tablesnft \
-A INPUT -s $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  $cmd_command_ip4tablesnft \
-A OUTPUT -d $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
#### ipv6
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A INPUT -s $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A OUTPUT -d $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft  $cmd_command_ip6tablesnft \
-A INPUT -s $one_blacklist -j $cfg_config_close_deny \
-m comment --comment "blacklist $one_blacklist" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft  $cmd_command_ip6tablesnft \
-A OUTPUT -d $one_blacklist -j $cfg_config_close_deny \
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
if [ "$cfg_allow_net_whitelist" == "$NULL" ]; then
####
for one_vpn in $(echo $cfg_config_net_whitelist | $cmd_command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  $cmd_command_ip4tablesnft \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  $cmd_command_ip4tablesnft \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
#### ipv6
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A  OUTPUT -d $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A  INPUT -s $one_vpn -j ACCEPT -m comment \
--comment "whitelist $one_vpn" &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft  $cmd_command_ip6tablesnft \
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
if [ "$cfg_allow_string_dropped" == "$NULL" ]; then
####
for string_close in $(echo $cfg_config_string_denied | $cmd_command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A  INPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cmd_command_ip4tableslegacy \
-A  OUTPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft $cmd_command_ip4tablesnft \
-A  INPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  $cmd_command_ip4tablesnft \
-A  OUTPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
#### ipv6
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A  INPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy \
-A  OUTPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A  INPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cmd_command_ip6tablesnft \
-A  OUTPUT -m string --string $string_close \
--algo $cfg_config_string_algoritmo \
-j $cfg_config_close_deny &> /dev/null
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
if [ "$cfg_allow_string_allowed" == "$NULL" ]; then
####
for string_allow in $(echo $cfg_config_string_allowed | $cmd_command_sed 's/,/ /g'); do
####
####
#### ipv4
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy  -A  INPUT  \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy  -A  OUTPUT \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  \
$cmd_command_ip4tablesnft     -A  INPUT  \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft  \
$cmd_command_ip4tablesnft     -A  OUTPUT \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
#### ipv6
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A  INPUT  \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A  OUTPUT \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cmd_command_ip6tablesnft    -A  INPUT  \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft  $cmd_command_ip6tablesnft    -A  OUTPUT \
-m string --string $string_allow \
--algo $cfg_config_string_algoritmo -j ACCEPT &> /dev/null
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
if [ "$cfg_allow_shield_maxtries" == "$NULL" ]; then
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A INPUT \
-p tcp -m multiport --dports $cfg_config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $cfg_config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6  $cmd_command_ip6tableslegacy -A INPUT \
-p tcp -m multiport --dports $cfg_config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6  $cmd_command_ip6tablesnft -A INPUT \
-p tcp -m multiport --dport $cfg_config_shield_port -m state --state NEW -m recent \
--set --name count-tries-ssh \
-m comment --comment "shield tries" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $cfg_config_shield_maxtries -j $cfg_config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $cfg_config_shield_maxtries -j $cfg_config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6  $cmd_command_ip6tableslegacy -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $cfg_config_shield_maxtries -j $cfg_config_close_deny \
-m comment --comment "shield tries" &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv6  $cmd_command_ip6tablesnft -A INPUT \
-m recent --name count-tries-ssh --update --seconds 3600 \
--hitcount $cfg_config_shield_maxtries -j $cfg_config_close_deny \
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
if [ "$cfg_allow_input_bandwidth" == "$NULL" ] ; then
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cfg_allow_input_bandwidth \
$cmd_command_ip4tableslegacy -A  INPUT \
-m hashlimit --hashlimit-above   "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinputlegacy  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft $cfg_allow_input_bandwidth \
$cmd_command_ip4tablesnft -A INPUT \
-m hashlimit    --hashlimit-above "$cfg_config_input_bandwidth"kb/sec  \
--hashlimit-name maxinputnft  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
if [ "$cfg_allow_output_bandwidth" == "$NULL" ] ; then
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cfg_allow_output_bandwidth \
$cmd_command_ip4tableslegacy -A OUTPUT \
-m hashlimit --hashlimit-above  "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-mode dstip --hashlimit-name maxoutputlegacy -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null

####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft $cfg_allow_output_bandwidth \
$cmd_command_ip4tablesnft -A OUTPUT \
-m hashlimit  --hashlimit-above "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-mode dstip  --hashlimit-name maxoutputnft -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
fi
####
####
#############        english: ipv6 bandwidth
#############        spanish: ipv6 ancho de banda
####
####
if [ "$cfg_allow_input_bandwidth" == "$NULL" ] ; then
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cfg_allow_input_bandwidth \
$cmd_command_ip6tableslegacy -A INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cfg_allow_input_bandwidth \
$cmd_command_ip6tablesnft -A  INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s"  &> /dev/null
####
fi
####
####
if [ "$cfg_allow_output_bandwidth" == "$NULL" ] ; then
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cfg_allow_output_bandwidth \
$cmd_command_ip6tableslegacy -A OUTPUT -m hashlimit --hashlimit-above \
"$cfg_config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s"  &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cfg_allow_output_bandwidth \
$cmd_command_ip6tablesnft -A OUTPUT -m hashlimit --hashlimit-above \
"$cfg_config_output_bandwidth"kb/sec --hashlimit-name maxoutput -j $cfg_config_close_deny \
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
if [ "$cfg_allow_input_maxconnect" == "$NULL" ]; then
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cfg_allow_input_maxconnect \
$cmd_command_ip4tableslegacy -A INPUT -m connlimit --connlimit-above \
$cfg_config_input_maxconnect   -j $cfg_config_close_deny  \
-m comment --comment "max connect"  &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft $cfg_allow_input_maxconnect \
$cmd_command_ip4tablesnft   -A INPUT -m connlimit --connlimit-above \
$cfg_config_input_maxconnect       -j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$cfg_allow_output_maxconnect" == "$NULL" ]; then
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy $cfg_allow_output_maxconnect \
$cmd_command_ip4tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft $cfg_allow_output_maxconnect \
$cmd_command_ip4tablesnft  -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
#### english: ipv6 bandwidth
#### spanish: ipv6 ancho de banda
####
####
if [ "$cfg_allow_input_maxconnect" == "$NULL" ]; then
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cfg_allow_input_maxconnect \
$cmd_command_ip6tableslegacy -A INPUT  \
-m connlimit --connlimit-above $cfg_config_input_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cfg_allow_input_maxconnect \
$cmd_command_ip6tablesnft   -A INPUT  \
-m connlimit --connlimit-above $cfg_config_input_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
if [ "$cfg_allow_output_maxconnect" == "$NULL" ]; then
####
$cfg_allow_use_ipv6 $cfg_allow_use_legacy $cfg_allow_output_maxconnect \
$cmd_command_ip6tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
####
$cfg_allow_use_ipv6 $cfg_allow_use_nft $cfg_allow_output_maxconnect \
$cmd_command_ip6tablesnft  -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "max connect"  &> /dev/null
####
fi
####
####
####################################### english: rules to allow client ports with without separate rules
####################################### spanish: reglas para permitir puertos cliente without separate rules
####
####
if [ "$cfg_allow_separate_rules" == "no" ]; then 
####
####
####    CLIENT  UDP
####
#### ipv4 legacy udp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $cfg_client_port_udp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $cfg_client_port_udp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $cfg_client_port_udp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $cfg_client_port_udp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 legacy udp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $cfg_client_port_udp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $cfg_client_port_udp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $cfg_client_port_udp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $cfg_client_port_udp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
####    CLIENT  TCP
####
#### ipv4 legacy tcp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $cfg_client_port_tcp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $cfg_client_port_tcp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $cfg_client_port_tcp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $cfg_client_port_tcp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $cfg_client_port_tcp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $cfg_client_port_tcp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $cfg_client_port_tcp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $cfg_client_port_tcp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_udp in $(echo $cfg_client_port_udp | $cmd_command_sed 's/,/ /g') ;
do
####
####
####    CLIENT  UDP
####
#### ipv4 legacy udp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $one_udp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $one_udp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
#### 
#### ipv4 nft udp
####
$cfg_allow_use_nft $cfg_allow_use_ipv4     $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $one_udp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4     $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $one_udp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 legacy udp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-p udp -m multiport $cfg_config_input_state --sports $one_udp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport $cfg_config_output_state --dports $one_udp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
#### ipv6 nft udp
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $one_udp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $one_udp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-udp  &> /dev/null
####
####
done; fi
####
####
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $cfg_client_port_tcp | $cmd_command_sed 's/,/ /g') ;
do
####
####
####    CLIENT TCP
####
#### ipv4 legacy tcp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $one_tcp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $one_tcp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
#### 
#### ipv4 nft tcp
####
$cfg_allow_use_nft $cfg_allow_use_ipv4     $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $one_tcp \
-s $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4     $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $one_tcp \
-d $cfg_config_ipv4_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 legacy tcp
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $one_tcp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $one_tcp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
####
####
#### ipv6 nft tcp
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT \
-p tcp -m multiport $cfg_config_input_state --sports $one_tcp \
-s $cfg_config_ipv6_netclient -j ACCEPT \
-m comment --comment client-tcp  &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport $cfg_config_output_state --dports $one_tcp \
-d $cfg_config_ipv6_netclient -j ACCEPT \
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
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A INPUT  \
-p tcp  -m multiport --dports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A INPUT  \
-p udp  -m multiport --dports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4  $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_nft     $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft    -A INPUT  \
-p tcp  -m multiport --dports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft    -A INPUT  \
-p udp  -m multiport --dports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_nft     $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft    -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv4  $cmd_command_ip4tablesnft    -A OUTPUT \
-p udp -m multiport --sports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
#### ipv6
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6   $cmd_command_ip6tableslegacy -A INPUT   \
-p tcp  -m multiport --dports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6   $cmd_command_ip6tableslegacy -A INPUT   \
-p udp  -m multiport --dports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6   $cmd_command_ip6tableslegacy -A OUTPUT  \
-p tcp -m multiport --sports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6   $cmd_command_ip6tableslegacy -A OUTPUT  \
-p udp -m multiport --sports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_nft     $cfg_allow_use_ipv6   $cmd_command_ip6tablesnft    -A INPUT   \
-p tcp  -m multiport --dports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv6   $cmd_command_ip6tablesnft    -A INPUT   \
-p udp  -m multiport --dports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
-m comment --comment logserver-udp  &> /dev/null
####
####
$cfg_allow_use_nft     $cfg_allow_use_ipv6   $cmd_command_ip6tablesnft    -A OUTPUT  \
-p tcp -m multiport --sports $cfg_server_log_port_tcp \
-j $cfg_config_system_log \
-m comment --comment logserver-tcp  &> /dev/null
$cfg_allow_use_nft     $cfg_allow_use_ipv6   $cmd_command_ip6tablesnft    -A OUTPUT  \
-p udp -m multiport --sports $cfg_server_log_port_udp \
-j $cfg_config_system_log \
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
if [ "$cfg_allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $cfg_server_port_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $cfg_server_port_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" != "$NULL" ]; then 
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $cfg_server_port_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $cfg_server_port_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_tcp in $(echo $cfg_server_port_tcp | $cmd_command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p tcp -m multiport --dports $one_tcp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-tcp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p tcp -m multiport --sports $one_tcp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
if [ "$cfg_allow_separate_rules" == "$NULL" ]; then 
for one_udp in $(echo $cfg_server_port_udp | $cmd_command_sed 's/,/ /g') ;
do
####
####
#### ipv4 legacy
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cmd_command_ip4tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
#### 
#### ipv4 nft
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A INPUT \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv4_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 legacy
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
####
####
#### ipv6 nft
####
####
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT  \
-p udp -m multiport --dports $one_udp -s $cfg_config_ipv6_netserver -j ACCEPT \
-m comment --comment server-udp &> /dev/null
$cfg_allow_use_nft  $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A OUTPUT \
-p udp -m multiport --sports $one_udp -d $cfg_config_ipv6_netserver -j ACCEPT \
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
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_output_ping \
$cmd_command_ip4tableslegacy -A INPUT  \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_input_ping \
$cmd_command_ip4tableslegacy -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp resquest" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_config_uid_gid \
$cmd_command_ip4tableslegacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_others_protocols \
$cmd_command_ip4tableslegacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
################# english: rules from output of legacy ipv4 for ping, uid, gid and protocols
################# spanish: reglas de salida de legacy ipv4 para ping, uid, gid y protocolos
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_output_ping \
$cmd_command_ip4tableslegacy   -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_input_ping \
$cmd_command_ip4tableslegacy -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $cfg_config_output_uid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_output_uid \
$cmd_command_ip4tableslegacy   -A OUTPUT \
-m owner --gid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $cfg_config_output_gid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_output_gid \
$cmd_command_ip4tableslegacy   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_legacy  $cfg_allow_use_ipv4 $cfg_allow_others_protocols \
$cmd_command_ip4tableslegacy -A OUTPUT \
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
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_output_ping \
$cmd_command_ip6tableslegacy -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_input_ping \
$cmd_command_ip6tableslegacy -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_config_uid_gid \
$cmd_command_ip6tableslegacy -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_others_protocols \
$cmd_command_ip6tableslegacy -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter legacy rules output
#### spanish: ipv6 filtros legacy reglas de salida
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_output_ping \
$cmd_command_ip6tableslegacy   -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_input_ping \
$cmd_command_ip6tableslegacy -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $cfg_config_output_uid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_output_uid \
$cmd_command_ip6tableslegacy   -A OUTPUT \
-m owner --gid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $cfg_config_output_gid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cfg_allow_output_gid \
$cmd_command_ip6tableslegacy   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
$cfg_allow_use_legacy  $cfg_allow_use_ipv6 $cmd_command_ip6tableslegacy \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_legacy6  $cfg_allow_use_ipv6 $cfg_allow_others_protocols \
$cmd_command_ip6tableslegacy -A OUTPUT \
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
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_output_ping \
$cmd_command_ip4tablesnft -A INPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_input_ping \
$cmd_command_ip4tablesnft -A INPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_config_uid_gid \
$cmd_command_ip4tablesnft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_others_protocols \
$cmd_command_ip4tablesnft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv4 filter nft rules output
#### spanish: ipv4 filter nft reglas de salida
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_output_ping \
$cmd_command_ip4tablesnft -A OUTPUT \
-p icmp --icmp-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_input_ping \
$cmd_command_ip4tablesnft -A OUTPUT \
-p icmp --icmp-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $cfg_config_output_uid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_output_uid \
$cmd_command_ip4tablesnft   -A OUTPUT \
-m owner --uid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $cfg_config_output_gid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_output_gid \
$cmd_command_ip4tablesnft   -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_nft $cfg_allow_use_ipv4 $cfg_allow_others_protocols \
$cmd_command_ip4tablesnft -A OUTPUT \
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
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_output_ping \
$cmd_command_ip6tablesnft -A INPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_input_ping \
$cmd_command_ip6tablesnft -A INPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "imcp request" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_config_uid_gid \
$cmd_command_ip6tablesnft -A INPUT \
-m state --state related,established -j ACCEPT \
-m comment --comment "uid-gid" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft -A INPUT \
-p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_others_protocols \
$cmd_command_ip6tablesnft -A INPUT \
-p $one_protocol -j ACCEPT \
-m comment --comment "other protocols" &> /dev/null
done
####
####
#### english: ipv6 filter nft rules output
#### spanish: ipv6 filtros nft reglas de salida
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_output_ping \
$cmd_command_ip6tablesnft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-request -j ACCEPT \
-m comment --comment "icmp request" &> /dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_input_ping \
$cmd_command_ip6tablesnft -A OUTPUT \
-p icmpv6 --icmpv6-type echo-reply -j ACCEPT \
-m comment --comment "icmp reply" &> /dev/null
####
####
for uid in $(echo $cfg_config_output_uid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_output_uid \
$cmd_command_ip6tablesnft -A OUTPUT \
-m owner --uid-owner $uid -j ACCEPT \
-m comment --comment "user-uid" &> /dev/null
done
####
####
for gid in $(echo $cfg_config_output_gid | $cmd_command_sed 's/,/ /g') ;
do $cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_output_gid \
$cmd_command_ip6tablesnft -A OUTPUT \
-m owner --gid-owner $gid -j ACCEPT \
-m comment --comment "group-gid" &> /dev/null
done
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cmd_command_ip6tablesnft \
-A OUTPUT -p ipv6-icmp -j ACCEPT \
-m comment --comment "icmp nexthop" &> /dev/null
####
####
for one_protocol in $(echo $cfg_config_others_protocols | $cmd_command_sed 's/,/ /g')
do $cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_others_protocols \
$cmd_command_ip6tablesnft -A OUTPUT \
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
if [ "$cfg_allow_gateway_ip4" == "$NULL" ]; then 
####
####
$cfg_allow_use_nft    $cfg_allow_use_ipv4    $cfg_allow_gateway_ip4 \
$cmd_command_ip4tablesnft -t nat \
-A POSTROUTING -j MASQUERADE -s $cfg_config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4 $cfg_allow_gateway_ip4 \
$cmd_command_ip4tableslegacy -t nat \
-A POSTROUTING -j MASQUERADE -s $cfg_config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv4 \
$cfg_allow_gateway_ip4 $cmd_command_ip4tablesnft -t nat \
-A PREROUTING -j ACCEPT -d $cfg_config_gateway_ip4 \
-m comment --comment "ip gateway"  &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4 \
$cfg_allow_gateway_ip4 $cmd_command_ip4tableslegacy -t nat \
-A PREROUTING -j ACCEPT -d $cfg_config_gateway_ip4 \
-m comment --comment "ip gateway" &>/dev/null
####
fi
####
####
if [ "$cfg_allow_gateway_ip6" == "$NULL" ]; then 
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_gateway_ip6 \
$cmd_command_ip6tablesnft -t nat \
-A POSTROUTING -j MASQUERADE -s $cfg_config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cfg_allow_gateway_ip6 \
$cmd_command_ip6tableslegacy -t nat \
-A POSTROUTING -j MASQUERADE -s $cfg_config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6 $cfg_allow_gateway_ip6 \
$cmd_command_ip6tablesnft -t nat \
-A PREROUTING -j ACCEPT -d $cfg_config_gateway_ip6 \
-m comment --comment "ip gateway" &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cfg_allow_gateway_ip6 \
$cmd_command_ip6tableslegacy -t nat \
-A PREROUTING -j ACCEPT -d $cfg_config_gateway_ip6 \
-m comment --comment "ip gatway" &>/dev/null
####
fi
####
####
#### english: do DMZ nat ip4 and ip6 ALLOW GATEWAY SERVER IN LAN
#### spanish: hace nat DMZ ip4 y ip6 PERMITIR GATEWAY SERVER IN LAN
####
####
if [ "$cfg_config_dmz_ip4" == "$NULL" ]; then 
####
####
$cfg_allow_use_nft    $cfg_allow_use_ipv4    $cfg_allow_dmz_ip4 \
$cmd_command_ip4tablesnft -t nat \
-A PREROUTING -j DNAT --to-destination $cfg_config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv4    $cfg_allow_dmz_ip4 \
$cmd_command_ip4tableslegacy -t nat \
-A PREROUTING -j DNAT --to-destination $cfg_config_dmz_ip4 \
-m comment --comment "ip dmz" &>/dev/null
####
fi
####
####
if [ "$cfg_config_dmz_ip6" == "$NULL" ]; then 
####
####
$cfg_allow_use_nft $cfg_allow_use_ipv6    $cfg_allow_dmz_ip6 \
$cmd_command_ip6tablesnft -t nat \
-A PREROUTING -j DNAT --to-destination $cfg_config_dmz_ip6 \
-m comment --comment "ip dmz" &>/dev/null
$cfg_allow_use_legacy $cfg_allow_use_ipv6 $cfg_allow_dmz_ip6 \
$cmd_command_ip6tableslegacy -t nat \
-A PERROUTING -j DNAT --to-destination $cfg_config_dmz_ip6 \
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
$cmd_command_sysctl -w net.ipv4.conf.all.forwarding=0 &> /dev/null
$cmd_command_sysctl -w net.ipv6.conf.all.forwarding=0 &> /dev/null
####
####
####   Active when there is forward
$ipv4 $cfg_allow_forward $cmd_command_sysctl -w net.ipv4.conf.all.forwarding=1 &> /dev/null
$ipv6 $cfg_allow_forward $cmd_command_sysctl -w net.ipv6.conf.all.forwarding=1 &> /dev/null
####
####
####   ipv4 filter legacy rules forward
$cfg_allow_use_legacy $cfg_allow_forward_ip4 $cmd_command_ip4tableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter legacy rules forward
$cfg_allow_use_legacy $cfg_allow_forward_ip6 $cmd_command_ip6tableslegacy \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv4 filter nft rules forward
$cfg_allow_use_nft $cfg_allow_forward_ip4 $cmd_command_ip4tablesnft \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
####   ipv6 filter nft rules forward
$cfg_allow_use_nft $cfg_allow_forward_ip6 $cmd_command_ip6tablesnft \
-m comment --comment allow-forward -A FORWARD -j ACCEPT &> /dev/null
####
####
######################### input log close
####
####
if [ "$cfg_allow_close_log" == "$NULL" ]; then
####
####
#### english: nft INPUT LOG CLOSE
#### spanish: nft INPUT LOG CLOSE
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A INPUT   -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
$cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A INPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
####
####
#### english: legacy INPUT LOG CLOSE
#### spanish: legacy INPUT LOG CLOSE 
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy  -t filter -A INPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
$cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A INPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
####
####
fi
####
####
######################### output log close
####
####
if [ "$cfg_allow_close_log" == "$NULL" ]; then
####
####
#### english: nft OUPUT LOG CLOSE
#### spanish: nft OUPUT LOG CLOSE
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A OUTPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
$cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A OUTPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
####
####
#### english: legacy OUPUT LOG CLOSE
#### spanish: legacy OUPUT LOG CLOSE 
####
####
$cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy  -t filter -A OUTPUT  -j $cfg_config_system_log \
-m comment --comment close-log &> /dev/null
$cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A OUTPUT  -j $cfg_config_system_log \
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
if [ "$cfg_config_close_deny" != "$NULL" ]; then 
####
####
#### ipv4 drop rules iptables-legacy
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### ipv6 drop rules iptables-legacy
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### ipv4 drop rules iptables-nft
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip4tablesnft -A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
#### ipv6 drop rules iptables-nft
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A INPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A OUTPUT -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_use_nft $cmd_command_ip6tablesnft -A FORWARD -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
fi
####
####
#################### english: iptables ipv4 and ipv6 with variable input_all
#################### english: iptables ipv4 y ipv6 con variable input_all
####
####
if [ "$cfg_allow_input_all" == "$NULL" ]; then 
####
####
#### english: nft INPUT deleted
#### spanish: nft INPUT borradas
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -F INPUT  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -F INPUT  &> /dev/null
####
####
#### english: legacy INPUT deleted
#### spanish: legacy INPUT borradas
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy -t filter -F INPUT  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -F INPUT  &> /dev/null
####
####
#### english: nft INPUT 127.0.0.1 accept
#### spanish: nft INPUT ::1 acepta
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A INPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy INPUT 127.0.0.1 accept
#### spanish: legacy INPUT ::1 acepta
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy -t filter -A INPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment close-rule &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A INPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy4 INPUT  limit bandwidth
#### spanish: legacy6 INPUT limita ancho de banda
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cfg_allow_input_bandwidth iptables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cfg_allow_input_bandwidth ip6tables-legacy -A  INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 INPUT limit bandwidth
#### spanish: nft6 INPUT limita ancho de banda
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cfg_allow_input_bandwidth iptables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cfg_allow_input_bandwidth ip6tables-nft -A  INPUT \
-m hashlimit --hashlimit-above "$cfg_config_input_bandwidth"kb/sec \
--hashlimit-name maxinput  -j $cfg_config_close_deny \
-m comment --comment "input-bandwidth kb/s" &> /dev/null
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cfg_allow_input_maxconnect  $cmd_command_ip4tableslegacy -A INPUT \
-m connlimit --connlimit-above $cfg_config_input_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cfg_allow_input_maxconnect $cmd_command_ip4tablesnft   -A INPUT \
-m connlimit --connlimit-above $cfg_config_input_maxconnect \
-j $cfg_config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cfg_allow_input_maxconnect  $cmd_command_ip6tableslegacy -A INPUT \
-m connlimit --connlimit-above $cfg_config_input_maxconnect -j $cfg_config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cfg_allow_input_maxconnect $cmd_command_ip6tablesnft   -A INPUT \
-m connlimit --connlimit-above $cfg_config_input_maxconnect -j $cfg_config_close_deny \
-m comment --comment "input maxconnect"  &> /dev/null
####
####
#### english: nft INPUT ACCEPT all or input_state
#### spanish: nft INPUT acepta todo o estado de entrada
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A INPUT \
$cfg_config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A INPUT \
$cfg_config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy -t filter -A INPUT \
$cfg_config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A INPUT \
$cfg_config_input_state -j ACCEPT \
-m comment --comment "input-state"  &> /dev/null
####
####
####
####
#### english: nft INPUT DROP all
#### spanish: nft INPUT deniega todo
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cfg_allow_use_ipv4 $cmd_command_ip4tablesnft -t filter -A INPUT \
-j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A INPUT \
-j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$cfg_allow_input_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy -t filter -A INPUT \
-j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_input_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A INPUT \
-j $cfg_config_close_deny \
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
if [ "$cfg_allow_output_all" == "$NULL" ]; then 
####
####
####
#### english: nft OUTPUT deleted
#### spanish: nft OUTPUT borradas
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 \
$cfg_allow_use_nft $cmd_command_ip4tablesnft -t filter -F OUTPUT  &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 \
$cfg_allow_use_nft $cmd_command_ip6tablesnft -t filter -F OUTPUT  &> /dev/null
####
####
#### english: legacy OUTPUT deleted
#### spanish: legacy OUTPUT borradas
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 \
$cfg_allow_use_legacy $cmd_command_ip4tableslegacy -t filter -F OUTPUT  &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 \
$cfg_allow_use_legacy $cmd_command_ip6tableslegacy -t filter -F OUTPUT  &> /dev/null
####
####
#### english: nft OUTPUT 127.0.0.1 accept
#### spanish: nft OUTPUT ::1 acepta
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 \
$cfg_allow_use_nft $cmd_command_ip6tablesnft -t filter -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
####
#### english: legacy OUTPUT 127.0.0.1 accept
#### spanish: legacy OUTPUT ::1 acepta
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
 $cmd_command_ip4tableslegacy -t filter -A OUTPUT \
-s $cfg_config_ip4_localhost -d $cfg_config_ip4_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A OUTPUT \
-s $cfg_config_ip6_localhost -d $cfg_config_ip6_localhost -j ACCEPT \
-m comment --comment host-localhost &> /dev/null
####
fi
####
####
########### english: allow output bandwidth
########### spanish: acepta velocidad de conexiones de salida
####
####
if [ "$cfg_allow_output_bandwidth" == "$NULL" ]; then 
####
####
#### english: legacy4 OUTPUT limit bandwidth
#### spanish: legacy6 OUTPUT limita ancho de banda
####
#### 
$cfg_allow_output_all $cfg_allow_use_ipv4 \
$cfg_allow_use_legacy $cfg_allow_output_bandwidth iptables-legacy -A OUTPUT \
-m hashlimit --hashlimit-above "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cfg_allow_output_bandwidth ip6tables-legacy -A  OUTPUT \
-m hashlimit --hashlimit-above "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
####
#### english: nft4 OUTPUT limit bandwidth
#### spanish: nft6 OUTPUT limita ancho de banda
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cfg_allow_output_bandwidth iptables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cfg_allow_output_bandwidth ip6tables-nft -A OUTPUT \
-m hashlimit --hashlimit-above "$cfg_config_output_bandwidth"kb/sec \
--hashlimit-name maxoutput  -j $cfg_config_close_deny \
-m comment --comment "output-bandwidth kb/s" &> /dev/null
####
fi
####
####
################### english: allow output maxconnect
################### spanish: acepta maximo de conexiones de salida
####
####
if [ "$cfg_allow_output_maxconnect" == "$NULL" ]; then 
####
####
#### english: ipv4  limit conections numbers
#### spanish: ipv4  limita numero de conexiones
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 \
$cfg_allow_use_legacy $cfg_allow_output_maxconnect  $cmd_command_ip4tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect  -j $cfg_config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv4 \
$cfg_allow_use_nft $cfg_allow_output_maxconnect $cmd_command_ip4tablesnft   -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect  -j $cfg_config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
####
#### english: ipv6 limit conections numbers
#### spanish: ipv6 limita numero de conexiones
####
####
$cfg_allow_output_all $cfg_allow_use_ipv6 \
$cfg_allow_use_legacy $cfg_allow_output_maxconnect  $cmd_command_ip6tableslegacy -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect  -j $cfg_config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 \
$cfg_allow_use_nft $cfg_allow_output_maxconnect $cmd_command_ip6tablesnft   -A OUTPUT \
-m connlimit --connlimit-above $cfg_config_output_maxconnect  -j $cfg_config_close_deny \
-m comment --comment "output maxconnect" &> /dev/null
####
fi
####
####
################### english: allow output all
################### spanish: acepta toda salida
####
####
if [ "$cfg_allow_output_all" == "$NULL" ]; then 
####
####
#### english: nft OUTPUT ACCEPT all or input_state
#### spanish: nft OUTPUT acepta todo o estado de entrada
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
####
####
#### english: legacy INPUT ACCEPT all or input_state
#### spanish: entrada acepta todo o estado de entrada
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy -t filter  -A OUTPUT \
$input_state -j ACCEPT \
-m comment --comment "output-state" &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A OUTPUT \
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
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_nft \
$cmd_command_ip4tablesnft -t filter -A OUTPUT  -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_nft \
$cmd_command_ip6tablesnft -t filter -A OUTPUT  -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
#### english: legacy INPUT DROP all
#### spanish: legacy INPUT deniega todo
####
####
$cfg_allow_output_all $cfg_allow_use_ipv4 $cfg_allow_use_legacy \
$cmd_command_ip4tableslegacy  -t filter -A OUTPUT  -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
$cfg_allow_output_all $cfg_allow_use_ipv6 $cfg_allow_use_legacy \
$cmd_command_ip6tableslegacy -t filter -A OUTPUT  -j $cfg_config_close_deny \
-m comment --comment close-rule &> /dev/null
####
####
################ english: show text when active load-custom rules
################ spanish: muestra texto cuando activas las load-custom reglas
####
####  
echo "$txt_text_title_ok [ Launched: firewall ] \
[ Type: $cfg_type_firewall ] [ Name: $cfg_name_firewall ]"
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
