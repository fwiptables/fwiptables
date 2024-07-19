  
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
    put bit TYPE: chmod 755 ./fwiptables-version-24-07g-bash.sh     
    install TYPE: ./fwiptables-version-24-07g-bash.sh install       
  
###  fwiptables uninstall.                   
  
    uninstall TYPE: fwiptables uninstall  
  
###  [ version ] [ Show version ] [ version md ]            
   [ info ] [ Somes details ]                 
   [ info ] [ Basename program    ] fwiptables-version-24-07g-bash.sh               
   [ info ] [ Realpath program    ] /root/f-iptables-version/fwiptables-version-24-07g-bash.sh               
   [ info ] [ Version program     ] 24-07g                
   [ info ] [ Short description   ] FireWall With iptables       
   [ info ] [ Long description    ] One Mini Script in one-file wizard        
   [ info ] [ Developer Actual    ] Francisco Garcia              
   [ info ] [ Developer Contact   ] fwiptables@gmx.com                
   [ info ] [ License program     ] GPL v2, LGPL v2, BSD                
   [ info ] [ Data  Directory     ] /root/.config/fwiptables    
   [ info ] [ Cache Directory     ] /root/.cache/fwiptables   
   [ info ] [ File  Preferences   ]    
   /root/.config/fwiptables/fwiptables-preferences/default-preferences-24-07g             
   [ info ] [ Fileformat program  ]    
   /root/f-iptables-version/fwiptables-version-24-07g-bash.sh: Bourne-Again shell script, Unicode text, UTF-8 text executable        
  
###  [ compile ] [  Optionally compile from bash script ] [ compile md]         
   [ info ] BASH SCRIPT WORKS fully. But if your desire is compiling...    
   [ step ] [ 0 ] Necesary fwiptables in source script bash                
   [ step ] [ 1 ] Download and install obash from oficial web internet     
   [ step ] [ 3 ] Run: obash -s -c -o ./destination.bin ./source-bash.sh   
  
###  [ options-examples ] [ List examples ] [ examples md ]
###  [ Several examples without optional otuput ]
  
###        | with optional output | Example Description   
    
   | depends                  | fwiptables-version-24-07g-bash.sh depends             
   | List firewall saved      | fwiptables-version-24-07g-bash.sh names               
   | List configs saved       | fwiptables-version-24-07g-bash.sh names-custom        
   | Get info speed ipv4      | fwiptables-version-24-07g-bash.sh speed-ip4           
   | Show listen sockets      | fwiptables-version-24-07g-bash.sh sockets             
   | List last options        | fwiptables-version-24-07g-bash.sh autolog             
   | modify default variables | fwiptables-version-24-07g-bash.sh preferences-modify  
    
###  [ Several examples with optional output ]  
    
         | with optional output | Example Description  
    
   | Example with info        | fwiptables-version-24-07g-bash.sh txt info             
   | Example with expert      | fwiptables-version-24-07g-bash.sh txt expert           
   | Example with code ip4    | fwiptables-version-24-07g-bash.sh cli code ip4         
   | Example with list rules  | fwiptables-version-24-07g-bash.sh cli lsn4             
   | Example with nodes       | fwiptables-version-24-07g-bash.sh gui nodes            
   | Example with web browser | fwiptables-version-24-07g-bash.sh gui web kernel.org   
    
   | Launch client web firewall in silent   | fwiptables-version-24-07g-bash.sh silent client-web   
   | List iptables rules with output txt    | fwiptables-version-24-07g-bash.sh txt ls4             
   | List firewall with output cli whiptail | fwiptables-version-24-07g-bash.sh cli-wiptail names   
   | List sockets ip with output gui yad    | fwiptables-version-24-07g-bash.sh gui-yad sockets     
   | All options in text menu               | fwiptables-version-24-07g-bash.sh cli-menu-dialog     
   | All options in window menu             | fwiptables-version-24-07g-bash.sh gui-menu-yad        
   | All options in window roll             | fwiptables-version-24-07g-bash.sh gui-roll-zenity     
   | All options in window shell            | fwiptables-version-24-07g-bash.sh gui-shell-yad       
  
### 
### 
###  [ options ] [ List general options for fwiptables ] [ list-options md ]
  
###  fwiptables-version-24-07g-bash.sh [optional-output] first_option [second_option]  
###   optional-output                                                      
   [ t|txt n|narrowtxt l|logtxt c|cli g|gui p|pdf s|silent ]                    
   [ cli-dialog cli-whiptail gui-zenity gui-yad ]                         
   [ cli-menu-dialog cli-menu-whiptail gui-roll-zenity ]                  
   [ gui-menu-zenity gui-menu-yad gui-shell-zenity gui-shell-yad ]        
###   firewall-control                                                     
   stop continue reset show save load names wizard-mini wizard-full       
   actual eraserules eraserules4 eraserules6 off-line all-permisive       
###   firewall-listconceptual                                              
   ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6    
   list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6      
   list-security4 list-security6 list-ebtables list-arptables             
###   firewall-listnumeral                                                 
   lsn4 lsn6 listn4 listn6 statusn listn-filter4 listn-filter6            
   listn-alltables  listn-nat4 listn-nat6 listn-raw4 listn-raw6           
   listn-mangle4 listn-mangle6 listn-security4 listn-security6            
###   firewall-wallcustom                                                  
   new-full-custom nueva-completa-custom new-mini-custom                  
   nueva-mini-custom clone-wallsystem load-custom show-custom             
   modify-custom del-custom names-custom                                    
###   firewall-wallsystem                                                  
   client-basic client-web client-ssh client-telnet client-ipp            
   client-irc client-git client-vnc client-news client-vpn                
   client-torrent client-vpn client-ftp client-proxy client-mail          
   client-tor game-widelands games-udp games-shooter game-wesnoth         
   game-minetest game-freeciv lan-tor lan-vpn shield-ssh server-ssh       
   server-telnet server-irc server-vnc server-print server-webserver      
   server-lamp server-news server-ftp server-mail server-teamspeak        
   server-mumble server-gateway server-sql server-samba server-proxy      
   server-asterisk client-uid-root client-gid-users client-gid-net        
###   options-easy                                                         
   preferences-read preferences-modify preferences-regen info web         
   options ip4 ip6 speed-ip4 speed-ip6 intro filelog autolog date         
   free sockets nodes ip-forward depends utils treeconf treecache         
   cleancache notes variables uninstall install upgrade version           
   examples code expert license-gpl license-lgpl license-bsd              
###        | Program: fwiptables-version-24-07g-bash.sh , Version: 24-07g    
###        | Description: One Mini Script in one-file wizard                 
###        | Expert: expert is allowed in preferences file   
  
   
###  | optional-output | fwiptables-version-24-07g-bash.sh optional-ouptut |
  
   | t . output in terminal text  
   | n . output in terminal text narrowtxt (compresed spaces)  
   | c . output in terminal cli  
   | g . output in graphicall gui  
   | l . output in file text log  
   | p . output in file image pdf  
   | s . output in silent or null  
   | txt . output in terminal text  
   | narrowtxt . output in terminal text narrowtxt (compresed spaces)  
   | cli . output in terminal cli  
   | gui . output in graphicall gui  
   | logtxt . output in file text logtxt  
   | pdf . output in file image pdf  
   | silent . output in silent text  
   | cli-dialog . output in terminal cli with dialog  
   | cli-whiptail . output in terminal cli with whiptail  
   | gui-zenity . output in graphicall gui with zenity  
   | gui-yad . output in graphicall gui with yad  
   | cli-menu-dialog . output in terminal menu with dialog  
   | cli-menu-whiptail . output in terminal menu with whiptail  
   | gui-menu-zenity . output in grapicall menu with zenity  
   | gui-menu-yad . output in grapicall menu with yad  
   | gui-shell-zenity . output in grapicall shell with zenity  
   | gui-shell-yad . output in grapicall shell with yad  
   | gui-roll-zenity . output in grapicall roll with zenity  
  
