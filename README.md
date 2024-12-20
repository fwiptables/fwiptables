## fwiptables intro   
  
      Readme
      Version
      About
      hints
      Compile
      Depends
      Examples
      Options
  
## fwiptables readme   
     [ fwiptables readme ]                  
        
      fwiptables. Firewall With iptables.
      Intro content information                            
      Readme: description, location, install, uninstall.   
        
     [ fwiptables description ]             
        
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
        
     [ fwiptables location ]                                 
        
       File    Location:   /usr/bin/fwiptables           
       Config Directory:   /root/.config/fwiptables        
       Cache  Directory:   /root/.cache/fwiptables         
        
    [ fwiptables install ]                      
        
       su root TYPE: su root                         
       put bit TYPE: chmod 755 /usr/bin/fwiptables         
       install TYPE: /usr/bin/fwiptables install           
        
    [ fwiptables uninstall ]                    
        
      uninstall TYPE: /usr/bin/fwiptables uninstall        
  
## fwiptables version   
          Detail Firewall: Detail Version              
            Name Firewall: fwiptables                   
         Version Firewall: 24-12-F-bash                
        Released Firewall: Year 2024 / Month 12               
          Source Firewall: /usr/bin/fwiptables           
        Internal Firewall: /usr/bin/fwiptables               
        Short Description: FireWall With iptables       
         Long Description: iptables templates in one script        
           Data Directory: /root/.config/fwiptables           
          Cache Directory: /root/.cache/fwiptables     
           Finder Program: which                  
        Requisite Program: awk,cat,cut,date,file,id,sed,sort      
      Requisite Firewall4: iptables-legacy,iptables-nft    
      Requisite Firewall6: ip6tables-legacy,ip6tables-nft    
               Auth xhost: /usr/bin/xhost          
           Automatic edit: /usr/bin/nano   
            Automatic cli: /usr/bin/whiptail         
            Automatic gui: /usr/bin/yad   
            Automatic pdf: /usr/bin/convert        
          Configured PATH: /usr/bin:/usr/sbin:/bin:/sbin                   
              File Format: Bourne-Again_shell_script,                 
         Developer Actual: Francisco Garcia              
             Email Report: fwiptables@gmx.com                
          License Program: LGPL v2, GPL v2                
  
## fwiptables about   
      File:          fwiptables
      Description:   Command Fran FireWall fwiptables Generator
      Author:        Francisco Garcia <fwiptables@gmx.com>
      Copyright:     (c) 2020-2024 Francisco Garcia <fwiptables@gmx.com>
      launch:        /usr/bin/fwiptables license-lgpl-v2|license-gpl-v2
  
## fwiptables hints   
      [Iptables firewall]   
  
        Legacy or nft: only one of them is sufficent   
      iptables-legacy: support for xtables ipv4   
         iptables-nft: support for nftables ipv4   
     ip6tables-legacy: support for xtables ipv6   
        ip6tables-nft: support for nftables ipv6   
  
      [Firewall recomendation with full client]   
  
      Client prefered: input-established   
      Server prefered: tinyserver-tcp      
  
      [Some options]   
  
      shield maxtries: limit against attack per bruteforce   
            Blacklist: excepcionals hosts dropped in firewall   
            whitelist: excepcionals hosts allowed in firewall   
           tinyserver: client in all allowed, and servers manually   
    input-established: the computer is only client   
  
      [Necesary Ports]   
  
                  ntp: Port necesary to update the time and date   
               bootpc: Port necesary to dhcp and get ip   
               domain: This port is necesary to domain resolver   
                https: This port is necesary for udp named web html5  
            ipv6-icmp: Necesary protocol in ipv6   
           ipv4 ports: ipv6 works too with old ipv4 ports   
  
## fwiptables compile   
      BASH SCRIPT WORKS fully.      
      But if your desire is compiling...     
      Necesary fwiptables in source script bash   
      Download and install obash from oficial web internet   
      Run: obash -s -c -o ./destination.bin ./source-bash.sh   
  
## fwiptables depends   
    [ Configuration files ]   
      Directory  data:         /root/.config/fwiptables   
      Directory cache:         /root/.cache/fwiptables   
        
    [ Log files ]             
      Folder log:              /root/.config/fwiptables/fwiptables-log   
      Folder pdf:              /root/.config/fwiptables/fwiptables-pdf   
      Folder logcmd:           /root/.config/fwiptables/fwiptables-logcmd   
        
    [ Preferences files ]     
      preferences:             /root/.config/fwiptables/fwiptables-preferences/default-preferences-fwiptables-24-12-F-bash.conf
      alias:                   /root/.config/fwiptables/fwiptables-preferences/default-alias-fwiptables-24-12-F-bash.conf
      own-notes:               /root/.config/fwiptables/fwiptables-preferences/default-usernotes-all-versions.txt
        
    [ optional output ]       
      auth xhost:              /usr/bin/xhost    
      dialog cli:              /usr/bin/dialog   
      whiptail cli             /usr/bin/whiptail   
      zenity gui:              /usr/bin/zenity   
      yad gui:                 /usr/bin/yad   
      convert pdf:             /usr/bin/convert   
        
    [ Automatic iptables ]    
      iptables legacy:         /usr/sbin/iptables-legacy   
      iptables nft:            /usr/sbin/iptables-nft   
      ip6tables legacy:        /usr/sbin/ip6tables-legacy   
      ip6tables nft:           /usr/sbin/ip6tables-nft   
      arptables:               /usr/sbin/arptables   
      ebtables:                /usr/sbin/ebtables   
        
    [ Automatic favorites ]   
      Automatic txt:           /usr/bin/bash   
      Automatic cli:           /usr/bin/whiptail   
      Automatic gui:           /usr/bin/yad   
      Automatic pdf:           /usr/bin/convert   
      Automatic editor:        /usr/bin/nano   
      Automatic browser:       /usr/bin/w3m   
      Automatic date:          /usr/sbin/ntpdate   
        
    [ Necesary utils ]        
      iptables nft:            /usr/sbin/iptables-nft   
      iptables legacy:         /usr/sbin/iptables-legacy   
      iptables nft:            /usr/sbin/ip6tables-nft   
      iptables legacy:         /usr/sbin/ip6tables-legacy   
        id command:            /usr/bin/id   
       awk command:            /usr/bin/awk   
       cat command:            /usr/bin/cat   
       cut command:            /usr/bin/cut   
      date command:            /usr/bin/date   
      file command:            /usr/bin/file   
       sed command:            /usr/bin/sed   
        
      Found all posible utils: fwiptables utils   
  
### <alias-from> examples <alias-to> options-examples
## fwiptables options-examples   
    [ One example with input-established ]              
         
       Launch: input-established                              
       /usr/bin/fwiptables input-established                        
       Explain: Client for all ports without servers ports   
         
    [ Several examples with tiny server ]               
         
       Launch: wizard tiny                                   
       /usr/bin/fwiptables wizard-tiny                             
       Launch: tinyserver-tcp ports                          
       /usr/bin/fwiptables tinyserver-tcp 21:25,80                 
       Launch: tinyserver-udp ports                          
       /usr/bin/fwiptables tinyserver-udp 67:68,443                
       Explain: Client for all ports                         
         
    [ Several examples with mini server ]               
         
       Launch: wizard mini                                   
       /usr/bin/fwiptables wizard-mini                             
       Explain: Wizard firewall for clients and servers      
         
    [ Example with add-whitelist4 ]                     
         
       Launch: add-whitelist4                                
       /usr/bin/fwiptables add-whitelist4 192.168.0.2,sf.net       
         
         
    [ Without optional output ]       
         
       Explain: depends from firewall      
       /usr/bin/fwiptables depends               
       Explain: List firewall saved        
       /usr/bin/fwiptables names                 
       Explain: List configs saved         
       /usr/bin/fwiptables list-custom           
       Explain: Get info speed ipv4        
       /usr/bin/fwiptables speed-ip4             
       Explain: Show listen sockets        
       /usr/bin/fwiptables sockets               
       Explain: List last options          
       /usr/bin/fwiptables logcmd                
       Explain: modify default variables   
       /usr/bin/fwiptables preferences-edit      
     
    [ With optional output ]          
         
       Example with info
       /usr/bin/fwiptables info list             
       Example with expert
       /usr/bin/fwiptables txt expert            
       Example with code ip4
       /usr/bin/fwiptables cli code ip4          
       Example with list rules
       /usr/bin/fwiptables cli lsn4              
       Example with info-nodes
       /usr/bin/fwiptables gui info-nodes        
       Example with web browser 
       /usr/bin/fwiptables gui web kernel.org    
       Launch client web firewall in silent   
       /usr/bin/fwiptables silent client-web     
       List iptables rules with output txt    
       /usr/bin/fwiptables txt ls4               
       List firewall with output cli whiptail 
       /usr/bin/fwiptables cli-wiptail names     
       List sockets ip with output gui yad    
       /usr/bin/fwiptables gui-yad sockets       
       All options in text menu               
       /usr/bin/fwiptables cli-menu              
       All options in window menu             
       /usr/bin/fwiptables gui-menu-yad          
       All options in window roll             
       /usr/bin/fwiptables gui-roll-zenity       
       All options in window shell             
       /usr/bin/fwiptables gui-shell-yad         
