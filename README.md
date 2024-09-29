###     fwiptables. Firewall With iptables. intro content information    
  
###     fwiptables. Firewall With iptables.   [ readme md ]   
        
      The fwiptables is a one-file WIZARD,   
      for iptables, with COMMAND-LINE,       
      and CLI-MENU, and GUI-MENU,            
      and GUI-ROLL, and GUI-SHELL.           
        
      From one system firewall to choose one,    
      with eraserules, or template custom,       
      with wizards: tiny, mini, and full,        
      with added comments rules in firewall.     
        
      With rules ipv4, rules ipv6, ebtables, arptables,    
      with netfilter neftables, netfilter xtables,         
      with tools ip, wizards for generate new rules,       
      with save/load rules with files standard iptables,   
      with shield to ssh or other servers choosed,         
      with limit bandwidth, string word,                   
      with host whitelist, host blacklist,                 
      with other more capabilities of firewall.            
        
###      fwiptables location.                              
        
       File    Location:   /usr/bin/fwiptables       
       Config Directory:   /root/.config/fwiptables       
       Cache  Directory:   /root/.cache/fwiptables       
        
###     fwiptables install.                           
        
       su root TYPE: su root                         
       put bit TYPE: chmod 755 ./fwiptables       
       install TYPE: ./fwiptables install         
        
###        fwiptables uninstall.                     
        
      uninstall TYPE: fwiptables uninstall        
  
         Basename program: fwiptables               
         Realpath program: /usr/bin/fwiptables               
          Version program: 24-10-A                
        Short description: FireWall With iptables       
         Long description: iptables mini-script in file-wizard        
           Data Directory: /root/.config/fwiptables    
          Cache Directory: /root/.cache/fwiptables   
         Developer Actual: Francisco Garcia              
             Email Report: fwiptables@gmx.com                
              File Format: Bourne-Again_shell_script,                 
        Requisite program: sudo,awk,sed,file,cut      
      Requisite firewall4: iptables-legacy,iptables-nft    
      Requisite firewall6: ip6tables-legacy,ip6tables-nft    
          License program: LGPL v2, GPL v2                
  
###  [ about ] [ licenses to fwiptables project ] [ about md ]
      File:        fwiptables
      Description: Command Fran FireWall fwiptables Generator
      Author:      Francisco Garcia <fwiptables@gmx.com>
      Copyright:   (c) 2020-2024 Francisco Garcia <fwiptables@gmx.com>
     
      launch: fwiptables license-lgpl-v2|license-gpl-v2
  
###  [ notes ] [ List notes about ] [ notes md ]
             Legacy or nft: whith one of them is sufficent   
     Allow shield maxtries: limit against attack per bruteforce   
                 Blacklist: excepcionals hosts has conection dropped in firewall   
                 whitelist: excepcionals hosts has conection allowed in firewall   
                tinyserver: client in all allowed, and servers selecteds manually   
                miniserver: normal ports in client, and servers selecteds manually   
         input-established: the computer is only client   
      allow output uid/gid: User and/or group excepcional with conection allowed   
           iptables-legacy: support for xtables   
              iptables-nft: support for nftables   
                       ntp: Port necesary to update the time and date   
                    bootpc: Port necesary to dhcp and get ip   
                    domain: This port is necesary to domain resolver   
                     https: This port is necesary for udp named web html5  
                 ipv6-icmp: Necesary protocol in ipv6   
                ipv4 ports: ipv6 works too with old ipv4 ports   
  
###  [ compile ] [ Optionally compile from bash script ] [ compile md]  
      BASH SCRIPT WORKS fully. But if your desire is compiling...     
      Necesary fwiptables in source script bash   
      Download and install obash from oficial web internet   
      Run: obash -s -c -o ./destination.bin ./source-bash.sh   
  
###  [ depends ] [ List for depends programs ] [ depends md ] 
        
###     [ Configuration files ]   
      Directory data:          /root/.config/fwiptables   
      Directory temp:          /root/.cache/fwiptables   
      File Preferences:        /root/.config/fwiptables/fwiptables-preferences/default-preferences-24-10-A   
        
###     [ Log files ]             
      File autolog:            /root/.config/fwiptables/fwiptables-autolog/default-autolog-24-10-A   
      File filelog:            /root/.config/fwiptables/fwiptables-log/default-filelog-24-10-A   
        
###     [ optional output ]       
      dialog cli:              /bin/dialog   
      whiptail cli             /bin/whiptail   
      zenity gui:              /bin/zenity   
      yad gui:                 /bin/yad   
      convert pdf:             /bin/convert   
        
###     [ Automatic iptables ]    
      iptables legacy:         /sbin/iptables-legacy   
      iptables nft:            /sbin/iptables-nft   
      ip6tables legacy:        /sbin/ip6tables-legacy   
      ip6tables nft:           /sbin/ip6tables-nft   
      arptables:               /sbin/arptables   
      ebtables:                /sbin/ebtables   
        
###     [ Automatic favorites ]   
      Automatic txt:           /bin/bash   
      Automatic cli:           /bin/whiptail   
      Automatic gui:           /bin/yad   
      Automatic pdf:           /bin/convert   
      Automatic editor:        /bin/nano   
      Automatic browser:       /bin/w3m   
      Automatic ntpdate:       /sbin/ntpdate   
        
###     [ Necesary utils ]        
      iptables nft:            /sbin/iptables-nft   
      iptables legacy:         /sbin/iptables-legacy   
      awk command:             /bin/awk   
      sed command:             /bin/sed   
      file command:            /bin/file   
        
      all utils in command: fwiptables utils   
  
###     [ options-examples ] [ List examples ] [ examples md ]   
###     [ One example with input-established ]   
         
       launch input-stablished        | fwiptables input-stablished                 
       client for all ports in related,established, without servers ports
         
###     [ Several examples with tiny server ]   
         
       launch wizard tiny             | fwiptables wizard-tiny                 
       launch tinyserver-tcp ports    | fwiptables tinyserver-tcp 21:25,80     
       launch tinyserver-udp ports    | fwiptables tinyserver-udp 67:68,443    
       client for all ports in related,established
         
###     [ Several examples with mini server ]   
         
       launch wizard mini             | fwiptables wizard-mini                 
       wizard firewall for clients and servers
         
       launch miniserver-tcp ports    | fwiptables miniserver-tcp 21:25,80     
       launch miniserver-udp ports    | fwiptables miniserver-udp 67:68,443    
       see miniserver clients ports in preferences file
         
###     [ Several examples without optional otuput ]        
         
###      without optional output | Example Description     
         
       depends                  | fwiptables depends               
       List firewall saved      | fwiptables names                 
       List configs saved       | fwiptables names-custom          
       Get info speed ipv4      | fwiptables speed-ip4             
       Show listen sockets      | fwiptables sockets               
       List last options        | fwiptables autolog               
       modify default variables | fwiptables preferences-modify    
     
###      with optional output | Example Description     
         
       Example with info        | fwiptables info list             
       Example with expert      | fwiptables txt expert            
       Example with code ip4    | fwiptables cli code ip4          
       Example with list rules  | fwiptables cli lsn4              
       Example with nodes       | fwiptables gui nodes             
       Example with web browser | fwiptables gui web kernel.org    
          
       Launch client web firewall in silent   | fwiptables silent client-web     
       List iptables rules with output txt    | fwiptables txt ls4               
       List firewall with output cli whiptail | fwiptables cli-wiptail names     
       List sockets ip with output gui yad    | fwiptables gui-yad sockets       
       All options in text menu               | fwiptables cli-menu-dialog       
       All options in window menu             | fwiptables gui-menu-yad          
       All options in window roll             | fwiptables gui-roll-zenity       
       All options in window shell            | fwiptables gui-shell-yad         
  
###  [ options ] [ List general options for fwiptables ] [ list-options md ]
  
### 
   fwiptables [optional-output] first_option [second_option]   
###     optional-output   
   [ t|txt n|narrowtxt l|log c|cli g|gui p|pdf s|silent i|info ]   
   [ cli-dialog cli-whiptail cli-menu-dialog cli-menu-whiptail ]   
   [ cli-menu cli-menu-old gui-zenity gui-yad gui-roll-zenity ]   
   [ gui-menu-zenity gui-menu-yad gui-shell-zenity gui-shell-yad ]   
###     firewall-listconceptual   
   ls4 ls6 status list-filter4 list-filter6 list-nat4 list-nat6   
   list-raw4 list-raw6 list-mangle4 list-mangle6 list-security4   
   list-security6 list-ebtables list-arptables list-alltables   
###     firewall-listnumeral   
   lsn4 lsn6 statusn listn-filter4 listn-filter6 listn-nat4   
   listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6   
   listn-security4 listn-security6 listn-alltables   
###     firewall-wallcontrol   
   stop continue reset show save load names actual eraserules   
   eraserules4 eraserules6 without-connection input-permisive   
   input-established wizard-tiny wizard-mini wizard-full   
   tinyserver-tcp tinyserver-udp miniserver-tcp miniserver-udp   
###     firewall-wallcustom   
   new-full-custom nueva-completa-custom new-mini-custom   
   nueva-mini-custom new-tiny-custom nueva-diminuta-custom   
   clone-wallsystem load-custom loadtiny-custom   
   show-custom modify-custom del-custom names-custom   
###     firewall-wallsystem   
   client-basic client-web client-ssh client-telnet client-ipp   
   client-irc client-git client-vnc client-news client-vpn   
   client-torrent client-vpn client-ftp client-proxy client-mail   
   client-tor game-widelands games-udp games-shooter game-wesnoth   
   game-minetest game-freeciv lan-tor lan-vpn shield-ssh server-ssh   
   server-telnet server-irc server-vnc server-print server-webserver   
   server-lamp server-news server-ftp server-mail server-teamspeak   
   server-mumble server-gateway server-sql server-samba server-proxy   
   server-asterisk client-uid-root client-gid-users client-gid-net    
###     firewall-easynet   
   preferences-read preferences-modify preferences-regen   
   options speed-ip4 speed-ip6 intro filelog autolog date web   
   ip4 ip6 network4 network6 address4 address6 resolve sockets   
   free nodes ip-forward depends utils treeconf treecache   
   cleancache notes variables uninstall install upgrade   
   examples info code expert donate about version   
   license-lgpl-v2 license-gpl-v2   
       | Program: fwiptables 24-10-A   
       | Description: iptables mini-script in file-wizard   
       | Expert: expert is allowed in preferences file   
