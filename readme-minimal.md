### || || [ ok ] || [ Firewall ] [ Program: fwiptables-min ] [ Version: minimal-7.03 ] || ||
### || || [ ok ] || [ Configure ] [ Configure: /usr/bin/fwiptables-min preferences-modify ] || ||
### || || [ ok ] || [ options ] [ List options ] [ options md ] || ||                              
    Launch: /usr/bin/fwiptables-min [ -cli-menu -gui-menu -gui-roll -gui-shell                                        
    -t|-txt -c|-cli -g|-gui -l|-log -n|-null ] first_option [ second_option ]                             
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
           options-state |  preferences-read preferences-modify preferences-regen                   
                            filelog autolog ip4 ip6 speed-ip4 speed-ip6 sockets                     
                            version notes depends license code                                      
