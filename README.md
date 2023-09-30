###  #[ fwiptables-cmd command-10.01 ] [ Options: /usr/bin/fwiptables-cmd options ]
###  [ intro ] [ /usr/bin/fwiptables-cmd command-10.01 intro ] [ intro md ] 
  
###  fwiptables. Firewall With iptables.    
  
   fwiptables is one simple in one-file FRONT-END                       
   for iptables linux with COMMAND-LINE with CLI-MENU                   
   with GUI-MENU with GUI-ROLL with GUI-SHELL.                          
   And choose one firewall: eraserules, or wizard-mini,                 
   or wizard-full, or custom, or one predesignated                      
   firewall to choose one. Gen new rules with templates                 
   and with shield ssh and with comments rules.                         
  
   rules ipv4, rules ipv6, netfilter, neftables, xtables,               
   tools ip, wizards for rules, save/load rules with files,             
   shield to ssh or other servers choosed,                              
   limit bandwidth, host whitelist, host blacklist,                     
   and other more capacities of firewall.                               
  
###   fwiptables location.                                               
  
    File location   :   /usr/bin/fwiptables-cmd                         
    Config directory:   /root/.config/fwiptables-cmd                    
  
###  fwiptables install.                                                 
  
    Put bit of execution. TYPE:   chmod u+x ./fwiptables-command-10.01   
    Install this version. TYPE:   ./fwiptables-command-10.01 install     
  
###  fwiptables uninstall.                                               
  
    Uninstall fwiptables. TYPE:   ./fwiptables-command-10.01 uninstall   
  
### #[ fwiptables-cmd command-10.01 ] [ Options: /usr/bin/fwiptables-cmd options ]
###  /usr/bin/fwiptables-cmd [ one_optional_parametter ] first_option [ second_option ]              
  
   /usr/bin/fwiptables-cmd [ -t|-txt -c|-cli -g|-gui -l|-log -s|-silent ]                           
   [ -gui-menu-zenity -gui-menu-yad -gui-shell-zenity -gui-shell-yad ]                  
   [ -gui-roll-zenity -cli-dialog -cli-whiptail -gui-zenity -gui-yad ]                  
   [ -cli-menu-dialog -cli-menu-whiptail ] first_option [ second_option ]               
  
###       | firewall-control |                                                           
   stop continue reset actual show save load names-control                              
###       | firewall-conceptual |                                              
   ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6                  
   list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6                    
   list-security4 list-security6 list-ebtables list-arptables                           
###       | firewall-numeral |                                                 
   lsn4 lsn6 listn4 listn6 statusn listn-alltables listn-filter4 listn-filter6          
   listn-nat4 listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6              
   listn-security4 listn-security6                                                      
###        | firewall-custom |                                                           
   custom new-full-config nueva-completa-config new-mini-config nueva-mini-config       
   regen-config examples-config show-config modify-config del-config names-config       
###        | firewall-launch |                                                           
   eraserules custom wizard-mini wizard-full off-line all-permisive client-basic        
   client-web client-git client-ipp client-vnc client-mail client-news client-vpn       
   client-torrent client-vpn client-ftp client-tor client-squid game-widelands          
   games-udp games-shooter game-wesnoth game-minetest game-freeciv lan-tor lan-vpn      
   server-ssh server-samba server-vnc server-webserver server-print server-lamp         
   server-news server-ftp server-mail server-teamspeak server-mumble server-sql         
   server-asterisk server-domain server-squid                                           
###         | options-easy |                                                             
   preferences-read preferences-modify preferences-regen list-options clasic-options    
   info-options filelog autolog ip4 ip6 speed-ip4 speed-ip6 speed-glx sockets nodes     
   geoip webcert date free ver version notes depends license code examples commands     
   variables intro clean-tmp download install uninstall pc-halt pc-shutdown pc-reboot   
