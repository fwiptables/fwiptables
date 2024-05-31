  
###  fwiptables. Firewall With iptables.   [ intro md ] 
  
   The fwiptables is a one-file WIZARD,     
    for iptables, with COMMAND-LINE,          
    and CLI-MENU, and GUI-MENU,               
    and GUI-ROLL, and GUI-SHELL.              
  
   From one system firewall to choose one,   
    with eraserules, or template custom,       
    with new wizard-mini or wizard-full,       
    with added comments rules in firewall.     
  
   With rules ipv4, rules ipv6, ebtables, arptables,  
    with netfilter neftables, netfilter xtables,        
    with tools ip, wizards for generate new rules,      
    with save/load rules with files standard iptables,  
    with shield to ssh or other servers choosed,        
    with limit bandwidth, string word,                  
    with host whitelist, host blacklist,                
    with other more capabilities of firewall.           
  
  
###   fwiptables location.                    
  
    File    Location:   /usr/bin/fwiptables     
    Config Directory:   /root/.config/fwiptables     
    Cache  Directory:   /root/.cache/fwiptables     
  
###  fwiptables install.                     
  
    su root TYPE: su root                       
    put bit TYPE: chmod 755 ./fwiptables-version-12-13-dev-bash.sh     
    install TYPE: ./fwiptables-version-12-13-dev-bash.sh install       
  
###  fwiptables uninstall.                   
  
    uninstall TYPE: fwiptables uninstall  
  
###  [ version ] [ Show version ] [ version md ]            
   [ info ] [ Somes details in fwiptables-version-12-13-dev-bash.sh ver 12-13-dev ]  
   [ info ] [ Name program       ] /root/f-iptables-version/fwiptables-version-12-13-dev-bash.sh                 
   [ info ] [ Number Version     ] Mayor 12 Minor 13    
   [ info ] [ Relased Version    ] Year 2024 Month 05      
   [ info ] [ Short description  ] fwiptables, FireWall With iptables       
   [ info ] [ Long description   ] fwiptables, One Mini Script in one-file wizard        
   [ info ] [ Developer Actual   ] Francisco Garcia              
   [ info ] [ Developer Contact  ] fwiptables@gmx.com                
   [ info ] [ License program    ] GPL v2, License General Public version 2                
   [ info ] [ Data  Directory    ] /root/.config/fwiptables    
   [ info ] [ Cache Directory    ] /root/.cache/fwiptables   
   [ info ] [ File  Preferences  ]      
   /root/.config/fwiptables/fwiptables-preferences/default-preferences-12-13-dev        
   [ info ] [ File  Format       ]      
   /root/f-iptables-version/fwiptables-version-12-13-dev-bash.sh: Bourne-Again shell script, Unicode text, UTF-8 text executable   
  
###  [ compile ] [  Optionally compile from bash script ] [ compile md]         
   [ info ] BASH SCRIPT WORKS fully. But if your desire is compiling...    
   [ step ] [ 0 ] Necesary fwiptables in source script bash                
   [ step ] [ 1 ] Download and install obash from oficial web internet     
   [ step ] [ 3 ] Run: obash -s -c -o ./destination.bin ./source-bash.sh   
  
###  [ options ] [ List general options for fwiptables ] [ list-options md ]
  
###  fwiptables-version-12-13-dev-bash.sh [optional-output] first_option [second_option]   
###   [ optional-output ] output                                         
   [ t|txt n|narrow c|cli g|gui l|log p|pdf s|silent ]                  
   [ cli-dialog cli-whiptail gui-zenity gui-yad ]                       
   [ cli-menu-dialog cli-menu-whiptail gui-roll-zenity ]                
   [ gui-menu-zenity gui-menu-yad gui-shell-zenity gui-shell-yad ]      
###   [ firewall-control ] control                                       
   stop continue reset show save load names wizard-mini wizard-full     
   actual eraserules eraserules4 eraserules6 off-line all-permisive     
###   [ firewall-listconceptual ] listconceptual                         
   ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6  
   list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6    
   list-security4 list-security6 list-ebtables list-arptables           
###   [ firewall-listnumeral ] listnumeral                               
   lsn4 lsn6 listn4 listn6 statusn listn-filter4 listn-filter6          
   listn-alltables  listn-nat4 listn-nat6 listn-raw4 listn-raw6         
   listn-mangle4 listn-mangle6 listn-security4 listn-security6          
###   [ firewall-wallcustom ] wallcustom                                 
   new-full-custom nueva-completa-custom new-mini-custom                
   nueva-mini-custom clone-wallsystem load-custom show-custom           
   modify-custom del-custom all-custom                                  
###   [ firewall-wallsystem ] wallsystem                                 
   client-basic client-web client-git client-ipp client-irc             
   client-vnc client-news client-vpn client-torrent client-vpn          
   client-ftp client-proxy client-mail client-tor game-widelands        
   games-udp games-shooter game-wesnoth game-minetest game-freeciv      
   lan-tor lan-vpn shield-ssh server-ssh server-irc server-vnc          
   server-print server-lamp server-news server-ftp server-mail          
   server-webserver server-teamspeak server-mumble server-gateway       
   server-sql server-asterisk server-proxy server-samba                 
###   [ options-easy ] easy                                              
   preferences-read preferences-modify preferences-regen info web       
   options ip4 ip6 speed-ip4 speed-ip6 intro filelog autolog date       
   free sockets nodes ip-forward version code treeconf treecache        
   cleancache notes depends variables license uninstall install         
###   [ options-expert ] expert                                          
###   [ options-examples ] examples                                      
