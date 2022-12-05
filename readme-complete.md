### ### || || [ ok ] || [ Firewall ] [ Program: fwiptables-cmd complete-5.10 state:complete ] || ||
### ### || || [ ok ] || [ options-all ] [ List full options ] [ full-options md ] || ||
### ### || ||  [ options-interface ]  || ||  ### ###                                                      
###  -cli-menu -gui-menu -gui-shell -t|-txt -c|-cli -g|-gui -w|-web -h|-help -i|-info -l|-log -n|-null
### ### || ||  [ options-firewall ]  || ||  ### ###                                                      
       firewall-control   |  stop continue reset names actual show save load                          
       firewall-list      |  ls4 ls6 list4 list6 listnum listnum6 status list-alltables               
                             list-filter4 list-filter6 listnum-filter4 listnum-filter6                
                             list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6        
                             list-security4 list-security6 list-ebtables list-arptables               
       firewall-custom    |  new-full-config nueva-completa-config regen-config                       
                             new-mini-config nueva-mini-config examples-config                        
                             show-config modify-config del-config names-config                        
      firewall-launch     |  eraserules custom wizard-mini wizard-full off-line all-permisive         
                             games-shooter game-wesnoth game-minetest game-freeciv game-widelands     
                             client-web client-vnc client-mail client-news client-torrent client-vpn  
                             client-tor client-ftp client-squid lan-tor lan-vpn shield-ssh server-ssh 
                             server-vnc server-web server-samba server-print server-lamp server-news  
                             server-mail server-ftp server-teamspeak server-mumble server-sql         
                             server-asterisk server-squid                                             
### ### || ||  [ options-state ]  || ||  ### ###                                                         
          options-state  |  preferences-read preferences-modify preferences-regen install upgrade uninstall       
### ### || ||  [ options-tool ]  || ||  ### ###                                                          
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
       tool-qemu          |  qemu-status qemu-stop qemu-start qemu-restart                            
       tool-install       |  install upgrade dev-upgrade howto-upgrade clean-tmp                      
       tool-addblock      |  addblock-list addblock-on addblock-off                                   
       tool-dev           |  new-versions dev-version dev-changes code intro                          
       tool-computer      |  pc-halt pc-shutdown pc-reboot                                            
### ### || || [ options-show ]   || ||  ### ###                                                          
       show-hardware      |  lpinfo lsblk lsusb lscpu lspci lsgpu lshw                                
       show-log           |  log-search log-ssh filelog autolog                                       
       show-etc           |  hosts resolv.conf hosts.allow hosts.deny                                 
                             protocols services preferences-read preferences-modify                           
### ### || || [ options-help ]   || ||  ### ###                                                          
       help-about         |  about version depends config-eng config-spa license                      
       help-help          |  all-help readme leeme notes options                                      
                             group-options mini-options full-options                                  
### ### || ||  [ Examples ]  || ||  ### ###                                                              
       ./fwiptables-complete-v5.10 -cli-menu                |  All options in text menu                           
       ./fwiptables-complete-v5.10 -gui-menu                |  All options in window menu                         
       ./fwiptables-complete-v5.10 -gui-shell               |  All options in window shell                        
       ./fwiptables-complete-v5.10 -txt list                |  List iptables rules with output txt                
       ./fwiptables-complete-v5.10 -cli names               |  List firewall saved with output cli text menu      
       ./fwiptables-complete-v5.10 -gui wizard-mini         |  Generate rules with output gui window              
       ./fwiptables-complete-v5.10 -web ss                  |  Show ss with output text browser                   
       ./fwiptables-complete-v5.10 -help readme             |  Show help of readme with output text plain         
       ./fwiptables-complete-v5.10 -info lsof               |  Show info of lsof with output text rst             
       ./fwiptables-complete-v5.10 -log info-route          |  Save log info-route with output text plain         
       ./fwiptables-complete-v5.10 -null client-web         |  Launch client web firewall a null output           
