  
###  fwiptables. Firewall With iptables.   [ intro.md ] 
  
   fwiptables is a one-file WIZARD    
   for iptables with COMMAND-LINE     
   with CLI-MENU with GUI-MENU        
   with GUI-ROLL with GUI-SHELL.      
   And choose one firewall:           
   eraserules, or wizard-mini,        
   or custom, or one system           
   firewall to choose one. Gen rules  
   with templates or wizard-full,     
   and with shield ssh                
   and with comments rules.           
  
   rules ipv4, rules ipv6, netfilter,        
   neftables, xtables,                       
   tools ip, wizards for rules,              
   save/load rules with files,               
   shield to ssh or other servers choosed,   
   string algoritmo, limit bandwidth,        
   host whitelist, host blacklist,           
   and other more capabilities of firewall.  
  
###   fwiptables location.                    
  
       File location:   /usr/bin/fwiptables-cmd    
    Config directory:   /root/.config/fwiptables-cmd     
    Cache  directory:   /run/fwiptables    
  
###  fwiptables install.                     
  
    su root TYPE: su root                   
    Put bit TYPE: chmod 755 ./fwiptables-version-11-09-bash.sh 
    Install TYPE: ./fwiptables-version-11-09-bash.sh install   
  
###  fwiptables uninstall.                   
  
    Uninstall TYPE: fwiptables-cmd uninstall  
  
###  [ ver ] [ Show version about ] [ ver.md ]       
   [ info ] [ Program ] /root/f-iptables-version/fwiptables-version-11-09-bash.sh      
   [ info ] [ Version ] cmd-11-09       
   [ info ] [ Details ] fwiptables, FireWall With iptables | fwiptables, One Mini Script in one-file wizard  
   [ info ] [ License ] GPL v2, License General Public version 2 
   [ info ] [ Contact ] fwiptables@gmx.com  
   [ info ] [ Data directory  ] /root/.config/fwiptables-cmd                       
   [ info ] [ Cache directory ] /run/fwiptables                      
   [ info ] [ File format     ] /root/f-iptables-version/fwiptables-version-11-09-bash.sh: Bourne-Again shell script, Unicode text, UTF-8 text executable      
###  [ compile ] [  Optionally compile from bash script ] [ compile.md]    
   [ info ] BASH SCRIPT WORKS fully. But if your desire is compiling...                       
   [ step ] [ 0 ] Necesary: fwiptables in source script bash                                  
   [ step ] [ 1 ] Download obash from oficial web internet                                    
   [ step ] [ 2 ] Compile with obash command using command make.                              
   [ step ] [ 3a] Or run: obash -r -c -o ./destination.bin ./source-bash.sh                   
   [ step ] [ 3b] Or run: obash -r -c -o /usr/bin/fwiptables-cmd.bin /usr/bin/fwiptables-cmd  
###  Actually, the file type is:  
/root/f-iptables-version/fwiptables-version-11-09-bash.sh: Bourne-Again shell script, Unicode text, UTF-8 text executable
###  [ options ] [ List general options for fwiptables ] [ list-options.md ]
###  /root/f-iptables-version/fwiptables-version-11-09-bash.sh [optional-output] first_option [second_option]   
###   [ optional-output ]                                                                
   [ -t|-txt -c|-cli -g|-gui -l|-log -p|-pdf -s|-silent ]                               
   [ -cli-dialog -cli-whiptail -gui-zenity -gui-yad ]                                   
   [ -cli-menu-dialog -cli-menu-whiptail -gui-roll-zenity ]                             
   [ -gui-menu-zenity -gui-menu-yad -gui-shell-zenity -gui-shell-yad ]                  
###   [ firewall-control ]                                                               
   stop continue reset actual show save load names-control eraserules                   
###   [ firewall-listconceptual ]                                                        
   ls4 ls6 list4 list6 status list-alltables list-filter4 list-filter6                  
   list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6                    
   list-security4 list-security6 list-ebtables list-arptables                           
###   [ firewall-listnumeral ]                                                           
   lsn4 lsn6 listn4 listn6 statusn listn-alltables listn-filter4 listn-filter6          
   listn-nat4 listn-nat6 listn-raw4 listn-raw6 listn-mangle4 listn-mangle6              
   listn-security4 listn-security6                                                      
###   [ firewall-customfw ]                                                              
   custom eraserules off-line all-permisive wizard-mini wizard-full clone-systemfw      
   new-full-config nueva-completa-config new-mini-config nueva-mini-config              
   config-regen examples-config show-config modify-config del-config names-config       
###   [ firewall-systemfw ]                                                              
   client-basic client-web client-git client-ipp client-irc client-vnc client-mail      
   client-news client-vpn client-torrent client-vpn client-ftp client-proxy             
   client-tor game-widelands games-udp games-shooter game-wesnoth game-minetest         
   game-freeciv lan-tor lan-vpn server-ssh server-irc server-samba server-vnc           
   server-print server-lamp server-news server-ftp server-mail server-webserver         
   server-teamspeak server-mumble server-sql server-asterisk server-proxy               
###   [ options-easy ]                                                                   
   preferences-read preferences-modify preferences-regen preferences-example info       
   list-options clasic-options filelog autolog speed-ip4 speed-ip6 speed-glx            
   ip4 ip6 code free sockets nodes date geoip expert ip-forward examples intro          
   about notes version depends commands variables install uninstall                     
###             ||| Example: fwiptables-cmd -gui-zenity info |||                         
