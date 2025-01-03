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
      Description | Location | Install | Uninstall.        
        
     [ fwiptables description ]                       
        
      The fwiptables is a one-file WIZARD,                 
      for iptables,     with COMMAND-LINE,                 
      with CLI-MENU,        with GUI-MENU,                 
      with GUI-ROLL,       with GUI-SHELL.                 
        
      From one system firewall to select one  fw,          
      with eraserules, with template with custom,          
      from wizard and custom: tiny,  mini,  full,          
      with added comments rule in firewall table.          
        
      With rules ipv4, rules ipv6, ebtables,  arptables,   
      with netfilter   neftables,   netfilter   xtables,   
      with tools ip, wizards for  generate  new   rules,   
      with save/load rules with files standard iptables,   
      with shield  to  ssh  or  other  servers  choosed,   
      with limit  the   bandwidth,   the  string   word,   
      with the   host  whitelist, the  host   blacklist,   
      with other more capabilities of firewall iptables.   
        
     [ fwiptables location ]                          
        
       File    Location: /usr/bin/fwiptables      
       Config Directory: /etc/fwiptables/config/25-01-B-bash   
       Cache  Directory: /etc/fwiptables/cache/25-01-B-bash           
        
    [ fwiptables install ]                            
        
       su root, TYPE: su root                              
       put bit, TYPE: chmod 755 fwiptables                  
       install, TYPE: fwiptables install                    
        
    [ fwiptables uninstall ]                          
        
      uninstall TYPE: fwiptables uninstall                  
  
## fwiptables version   
          Detail Firewall: Detail Version              
              Session XDG: x11           
            Name Firewall: fwiptables                   
         Version Firewall: 25-01-B-bash                
        Released Firewall: Year 2025 / Month 01               
          Source Firewall: /usr/bin/fwiptables           
        Internal Firewall: /usr/bin/fwiptables               
        Short Description: Firewall With IPTABLES       
         Long Description: Iptables templates in one script        
         Config Directory: /etc/fwiptables/config/25-01-B-bash           
          Cache Directory: /etc/fwiptables/cache/25-01-B-bash     
           Finder Program: which                  
        Requisite Program: cat,cut,date,file,id,sed,sort      
      Requisite Firewall4: iptables-legacy,iptables-nft    
      Requisite Firewall6: ip6tables-legacy,ip6tables-nft    
          Automatic xhost: /usr/bin/xhost          
         Automatic editor: /usr/bin/nano   
            Automatic cli: /usr/bin/whiptail         
            Automatic gui: /usr/bin/yad   
            Automatic pdf: /usr/bin/convert        
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
      Directory  data:         /etc/fwiptables/config/25-01-B-bash   
      Directory cache:         /etc/fwiptables/cache/25-01-B-bash   
        
    [ Log files ]             
      Folder log:              /etc/fwiptables/config/25-01-B-bash/fwiptables-log   
      Folder pdf:              /etc/fwiptables/config/25-01-B-bash/fwiptables-pdf   
      Folder logcmd:           /etc/fwiptables/config/25-01-B-bash/fwiptables-logcmd   
        
    [ Preferences files ]     
      preferences:             /etc/fwiptables/config/25-01-B-bash/fwiptables-preferences/default-preferences-fwiptables-25-01-B-bash.conf
      alias:                   /etc/fwiptables/config/25-01-B-bash/fwiptables-preferences/default-alias-fwiptables-25-01-B-bash.conf
      own-notes:               /etc/fwiptables/config/25-01-B-bash/fwiptables-preferences/default-own-notes-fwiptables-25-01-B-bash.conf
        
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
  
## fwiptables options   
      fwiptables [optional-output] first_option [second_option]
      ......  optional-output:
      [ t|txt n|narrowtxt l|log c|cli g|gui p|pdf s|silent i|info ]
      [ gui-menu  gui-menu-zenity   gui-menu-yad  gui-roll-zenity ]
      [ gui-shell  gui-shell-zenity  gui-shell-yad ]
      [ gui-zenity gui-yad cli-dialog cli-whiptail ]
      [ cli-menu cli-menu-dialog cli-menu-whiptail ]
      ......  firewall-listconceptual:
      ls4 ls6 status list-filter4 list-filter6 list-nat4 list-nat6
      list-raw4 list-raw6 list-mangle4 list-mangle6 list-security4
      list-security6 list-ebtables  list-arptables  list-alltables
      ......  firewall-listnumeral:
      lsn4 lsn6  statusn  listn-filter4  listn-filter6  listn-nat4
      listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6
      listn-security4 listn-security6 listn-alltables
      ......  firewall-wallcontrol:
      stop    continue   reset  show  save  load   names    actual
      eraserules-all        eraserules-arp     eraserules-ebtables
      eraserules4   eraserules6  eraserules-nft  eraserules-legacy
      without-connection      input-permisive    input-established
      wizard-tiny wizard-mini wizard-full
      tinyserver-tcp tinyserver-udp
      ......  firewall-walladdrule:
      add-localhost    add-established    all-output    close-drop
      drop-send-ping  drop-get-ping allow-send-ping allow-get-ping
      drop-port-tcp  drop-port-udp  allow-port-tcp  allow-port-udp
      log-port-tcp  log-port-udp  return-port-tcp  return-port-udp
      drop-string   add-shield-tcp  drop-protocol   allow-protocol
      add-whitelist  add-whitelist4  add-whitelist6
      add-blacklist  add-blacklist4  add-blacklist6
      limit-minute   del-commented
      ......  firewall-wallcustom:
      new-full-custom        new-mini-custom       new-tiny-custom
      wallinet-clone loadmini-custom  loadtiny-custom  load-custom
      list-custom      show-custom     modify-custom    del-custom
      ......  firewall-wallinet:
      wallinet-update  wallinet-list  wallinet-load  wallinet-show
      ......  firewall-wallutil:
      preferences-edit alias-edit  options info-options  own-notes
      tree-cmd  tree-pdf tree-log tree-conf tree-cache clean-cache
      ip4 ip6  route4 route6 info-ip4 info-ip6 info-nodes  sockets
      lsof  free ip-forward utils date resolve speed-ip4 speed-ip6
      log-stat  web intro depends uninstall install upgrade  hints
      variables  examples info code expert  donate  about  version
      license-lgpl-v2 license-gpl-v2
      ......#fwiptables-25-01-B-bash#  #expert:deactived#  
