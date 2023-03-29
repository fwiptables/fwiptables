### || || [ ok ] || [ Firewall ] [ Program: fwiptables-cmd ] [ Version: complete-7.02 ] |||
### || || [ ok ] || [ options-all ] [ List full options ] [ full-options md ] || ||
### || ||  [ options-interface ]  || ||  ### ###                                                      
     Launch: /usr/bin/fwiptables-cmd [-cli-menu -gui-menu -gui-roll -gui-shell                                       
     -t|-txt -c|-cli -g|-gui -w|-web -h|-help -i|-info -l|-log -n|-null] first_option [second_option]     
### || || [ firewall ]  ### [  Control firewalls and rules to manage iptables ] ### || ||             
           firewall-control |  stop continue reset names actual show save load                         
        firewall-conceptual |  ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6     
                               list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6       
                               list-security4 list-security6 list-ebtables list-arptables              
           firewall-numeral |  lsn4 lsn6 listn4 listn6 statusn listn-alltables listn-filter4           
                               listn-nat4 listn-nat6 listn-raw4 listn-raw6 listn-filter6               
                               listn-mangle4  listn-mangle6 listn-security4 listn-security6            
                               listn-mangle4  listn-mangle6 listn-security4 listn-security6            
            firewall-custom |  new-full-config nueva-completa-config regen-config                      
                               new-mini-config nueva-mini-config examples-config                       
                               show-config modify-config del-config names-config                       
            firewall-launch |  eraserules custom wizard-mini wizard-full off-line all-permisive        
                               games-udp games-shooter game-wesnoth game-minetest game-freeciv         
                               game-widelands client-web client-vnc client-mail client-news            
                               client-torrent client-vpn  client-ftp  client-tor client-squid          
                               lan-tor lan-vpn server-ssh server-samba server-vnc server-web           
                               server-print server-lamp server-news server-ftp server-mail             
                               server-teamspeak server-mumble server-sql server-asterisk               
                               server-domain server-squid                                              
### || ||  [ options-state ]  || ||  ### ###                                                          
            options-state  |  preferences-read preferences-modify preferences-regen                    
                              ip4 ip6 version notes examples install uninstall                         
### || ||  [ options-tool ]  || ||  ### ###                                                           
        tool-sockets       |  info-listen info-nodes info-route info-net info-proxy info-system        
                              ip4 ip6 ss lsof tcpdump netstat netstat-nat web-cert                     
        tool-connect       |  iw-scan iw-info wpa-save wpa-load dhcp-client ntpdate-client             
        tool-rule          |  rule-del-num rule-del-shield rule-add-shield                             
        tool-forward       |  ipforward-list ipforward-on ipforward-off                                
        tool-sshd          |  sshd-tunnel-info sshd-tunnel-on sshd-tunnel-off                          
        tool-tcp           |  tracetcp-ip4 tracetcp-ip6 speed-ip4 speed-ip6                            
        tool-udp           |  host dig resolveip geoip ntpdate-client                                  
        tool-icmp          |  traceicmp-ip4 traceicmp-ip6 ping-ip4 ping-ip6                            
        tool-nmap          |  nmap-tcp nmap-syn nmap-fin nmap-udp nmap-ping                            
        tool-sudofw        |  sudofw-adduser sudofw-deluser sudofw-listuser                            
        tool-game          |  game-word game-number game-domain game-rgb game-hex                      
        tool-speed         |  free-ram speed-ram speed-disk speed-glx speed-cpu                        
        tool-util          |  weather md5sum gpg-notes                                                 
        tool-pdf           |  pdf-resize pdf-unite pdf-separate                                        
        tool-mp3           |  radio-mp3 radio-cadena100 radio-rockfm                                   
        tool-qemu          |  qemu-status qemu-stop qemu-start                                         
        tool-install       |  install uninstall clean-tmp upgrade-minimal upgrade-complete             
        tool-addblock      |  addblock-list addblock-on addblock-off                                   
        tool-dev           |  new-versions dev-version dev-changes code intro                          
        tool-computer      |  pc-halt pc-shutdown pc-reboot                                            
### || || [ options-show ]   || ||  ### ###                                                           
        show-hardware      |  lpinfo lsblk lsusb lscpu lspci lsgpu lshw                                
        show-log           |  log-search log-ssh filelog autolog                                       
        show-etc           |  hosts resolv.conf hosts.allow hosts.deny protocols services              
### || || [ options-help ]   || ||  ### ###                                                           
        help-about         |  about version depends config-eng config-spa license                      
        help-help          |  all-help readme leeme notes options                                      
                              group-options mini-options full-options                                  
### || ||  [ Examples ]  || ||  ### ###                                                               
       /usr/bin/fwiptables-cmd -cli-menu                |  All options in text menu                                
       /usr/bin/fwiptables-cmd -gui-menu                |  All options in window menu                              
       /usr/bin/fwiptables-cmd -gui-shell               |  All options in window shell                             
       /usr/bin/fwiptables-cmd -txt list                |  List iptables rules with output txt                     
       /usr/bin/fwiptables-cmd -cli names               |  List firewall saved with output cli text menu           
       /usr/bin/fwiptables-cmd -gui wizard-mini         |  Generate rules with output gui window                   
       /usr/bin/fwiptables-cmd -web ss                  |  Show ss with output text browser                        
       /usr/bin/fwiptables-cmd -help readme             |  Show help of readme with output text plain              
       /usr/bin/fwiptables-cmd -info lsof               |  Show info of lsof with output text rst                  
       /usr/bin/fwiptables-cmd -log info-route          |  Save log info-route with output text plain              
       /usr/bin/fwiptables-cmd -null client-web         |  Launch client web firewall a null output                
