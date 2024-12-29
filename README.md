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
       Config Directory:   /etc/fwiptables/config/24-12-H-bash        
       Cache  Directory:   /etc/fwiptables/cache/24-12-H-bash         
        
    [ fwiptables install ]                      
        
       su root TYPE: su root                         
       put bit TYPE: chmod 755 /usr/bin/fwiptables         
       install TYPE: /usr/bin/fwiptables install           
        
    [ fwiptables uninstall ]                    
        
      uninstall TYPE: /usr/bin/fwiptables uninstall        
  
## fwiptables version   
          Detail Firewall: Detail Version              
            Name Firewall: fwiptables                   
         Version Firewall: 24-12-H-bash                
        Released Firewall: Year 2024 / Month 12               
          Source Firewall: /usr/bin/fwiptables           
        Internal Firewall: /usr/bin/fwiptables               
        Short Description: FireWall With IPTABLES       
         Long Description: Iptables templates in one script        
         Config Directory: /etc/fwiptables/config/24-12-H-bash           
          Cache Directory: /etc/fwiptables/cache/24-12-H-bash     
           Finder Program: which                  
        Requisite Program: cat,cut,date,file,id,sed,sort      
      Requisite Firewall4: iptables-legacy,iptables-nft    
      Requisite Firewall6: ip6tables-legacy,ip6tables-nft    
          Automatic xhost: /usr/bin/xhost          
           Automatic edit: /usr/bin/nano   
            Automatic cli: /usr/bin/whiptail         
            Automatic gui: /usr/bin/yad   
            Automatic pdf: /usr/bin/convert        
            Internal PATH: /usr/bin:/usr/sbin:/bin:/sbin                   
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
      Server prefered: tinyserver-tcp ports            
  
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
      Directory  data:         /etc/fwiptables/config/24-12-H-bash   
      Directory cache:         /etc/fwiptables/cache/24-12-H-bash   
        
    [ Log files ]             
      Folder log:              /etc/fwiptables/config/24-12-H-bash/fwiptables-log   
      Folder pdf:              /etc/fwiptables/config/24-12-H-bash/fwiptables-pdf   
      Folder logcmd:           /etc/fwiptables/config/24-12-H-bash/fwiptables-logcmd   
        
    [ Preferences files ]     
      preferences:             /etc/fwiptables/config/24-12-H-bash/fwiptables-preferences/default-preferences-fwiptables-24-12-H-bash.conf
      alias:                   /etc/fwiptables/config/24-12-H-bash/fwiptables-preferences/default-alias-fwiptables-24-12-H-bash.conf
      own-notes:               /etc/fwiptables/config/24-12-H-bash/fwiptables-preferences/default-usernotes-all-versions.txt
        
    [ optional output ]       
      xhost x11:               /usr/bin/xhost    
      dialog cli:              /usr/bin/dialog   
      whiptail cli             /usr/bin/whiptail   
      zenity gui:              /usr/bin/zenity   
      yad gui:                 /usr/bin/yad   
      convert pdf:             /usr/bin/convert   
        
    [ Automatic iptables ]    
      arptables:               /usr/sbin/arptables   
      ebtables:                /usr/sbin/ebtables   
      iptables legacy:         /usr/sbin/iptables-legacy   
      iptables nft:            /usr/sbin/iptables-nft   
      ip6tables legacy:        /usr/sbin/ip6tables-legacy   
      ip6tables nft:           /usr/sbin/ip6tables-nft   
        
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
         
       Launch : /usr/bin/fwiptables input-established               
       Explain: Client for all ports without servers ports    
         
    [ Several examples with tiny server ]                
         
       Launch :/usr/bin/fwiptables wizard-tiny                      
       Explain: wizard template tiny with few options         
         
       Launch :/usr/bin/fwiptables tinyserver-udp 67:68,443         
       Explain: Client for all and server tcp 66:68,443       
         
    [ Several examples with mini server ]                
         
       Launch /usr/bin/fwiptables wizard-mini                       
       Explain: Wizard firewall for clients and servers       
         
    [ Example with add-whitelist4 ]                      
         
       launch : /usr/bin/fwiptables add-whitelist4 gmx.com,sf.net   
       Explain: white list for gmx.com and sf.net in ipv4     
         
         
    [ Without optional output ]                
         
       Explain: depends from firewall               
       Launch : /usr/bin/fwiptables depends               
         
       Explain: List firewall saved                 
       Launch : /usr/bin/fwiptables names                 
         
       Explain: List configs saved                  
       Launch : /usr/bin/fwiptables list-custom           
         
       Explain: Get info speed ipv4                 
       Launch : /usr/bin/fwiptables speed-ip4             
         
       Explain: Show listen sockets                 
       Launch : /usr/bin/fwiptables sockets               
         
       Explain: List last options                   
       Launch : /usr/bin/fwiptables logcmd                
         
       Explain: modify default variables            
       Launch : /usr/bin/fwiptables preferences-edit      
     
    [ With optional output ]               
         
       info list commands                       
       /usr/bin/fwiptables info list                  
         
       experts commands                         
       /usr/bin/fwiptables txt expert                 
         
       source code ip4                          
       /usr/bin/fwiptables cli code ip4               
         
       list rules with numeral ipv4 filter      
       /usr/bin/fwiptables cli lsn4                   
         
       scan nodes in local lan lan              
       /usr/bin/fwiptables gui info-nodes             
         
       viewer web browser with gui              
       /usr/bin/fwiptables gui web kernel.org         
         
       Launch client web firewall in silent     
       /usr/bin/fwiptables silent client-web          
         
       List iptables rules with output txt      
       /usr/bin/fwiptables txt ls4                    
         
       List firewall with output cli whiptail   
       /usr/bin/fwiptables cli-wiptail names          
         
       show listen sockets with output gui      
       /usr/bin/fwiptables gui-yad sockets            
         
       All options in text menu                 
       /usr/bin/fwiptables cli-menu                   
         
       All options in window menu               
       /usr/bin/fwiptables gui-menu-yad               
         
       All options in window roll               
       /usr/bin/fwiptables gui-roll-zenity            
         
       All options in window shell              
       /usr/bin/fwiptables gui-shell-yad              
