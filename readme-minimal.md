### ### || || [ ok ] || [ Firewall ] [ Program: fwiptables-mini ] [ Version: minimal-5.08 ] || ||
### ### || || [ ok ] || [ Configure ] [ Launch to configure: fwiptables-mini preferences-modify ] || ||
### ### || || [ ok ] || [ options-mini ] [ List mini options ] [ mini-options md ] || ||
###  launch: /usr/bin/fwiptables-mini [ -t|-txt -c|-cli -l|-log -n|-null ] first_option [ second_option ]          
### ### || || [ firewall ]  ### [  Control firewalls and rules to manage iptables ] ### || ||               
     firewall-control |  stop continue reset names actual show save load                              
        firewall-list |  ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6          
                         list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6            
                         list-security4 list-security6 list-ebtables list-arptables                   
      firewall-custom |  new-full-config nueva-completa-config regen-config                           
                         new-mini-config nueva-mini-config examples-config                            
                         show-config modify-config del-config names-config                            
      firewall-launch |  eraserules custom wizard-mini wizard-full off-line all-permisive             
                         games-shooter game-wesnoth game-minetest game-freeciv game-widelands         
                         client-web client-vnc client-mail client-news client-torrent client-vpn      
                         client-tor client-ftp client-squid lan-tor lan-vpn shield-ssh server-ssh     
                         server-vnc server-web server-samba server-print server-lamp server-news      
                         server-mail server-ftp server-teamspeak server-mumble server-sql             
                         server-asterisk server-squid                                                 
       options-state  |  preferences-read preferences-modify preferences-regen version notes          
