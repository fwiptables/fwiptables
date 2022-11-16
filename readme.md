### ### || || [ ok ] || [ Firewall ] [ Program: fwiptables-cmd ] [ Version: complete-5.06 ] || ||
### ### || || [ ok ] || [ readme ] [ help in english ] [ readme md ] || ||
     
---
### ### || || [ ok ] || [ Firewall ] [ Program: fwiptables-cmd ] [ Version: complete-5.06 ] || || 
### ### || || [ ok ] || [ intro ] [ fwiptables-cmd complete-5.06 intro ] [ intro md ] || ||
###     ###  Fran fwiptables intro.  ###   
          # Use Fran Firewall # configure both iptables netfilter for linux with templates. #         
          [ done ] [ Done with support in xtables and/or nftables and ipv4 and/or ipv6 ].             
          [ done ] [ Ready to run in command shell cmd, cli-menu, gui-menu, and gui-shell ].          
          # Standard firewall # Create one firewall with one wizard and save it in standard file. #   
          [ done ] [Control the firewall with the standard iptables files for all tables ].           
          # Custom firewall # Create one firewall custom and launch your custom config firewall #.    
          [ done ] [ Choose run iptables rules of one firewall with your own config files ].          
          # Network tools # Use this firewall with some utilities for ipv4 and ipv6 # .               
          [ done ] [ Gone with options-tool works with network utilities.                             
          [ done ] [ Gone with options-show show config net files ].                                  
---
###     ###  Fran fwiptables installer.  ###
          # fwiptables-cmd complete-5.06
          [ info ] [ Actually, YES, ] [ this version is installed in /usr/bin/fwiptables-cmd ]
          [ info ] [ Install this version from this file    ] [ TYPE: ./fwiptables-complete-5.06 install ]
          [ info ] [ Install lastest version from the web   ] [ TYPE: ./fwiptables-complete-5.06 upgrade ]
          [ info ] [ Uninstall fwiptables-cmd from the computer ] [ TYPE: ./fwiptables-complete-5.06 uninstall ]
---
###     ###  Fran fwiptables project.  ###    
          # Download the latest version Fran FireWall FWiptables Generator from sourceforge
          [ link] [ https://sourceforge.net/projects/f-iptables/files/latest/download ]
          # Copyleft, without warranty, gnu license GPL v2.
          [ link ] [ https://sourceforge.net/p/f-iptables/code/ci/master/tree/LICENSE.txt?format=raw ]
     
---
### ### || || [ ok ] || [ Firewall ] [ Program: fwiptables-cmd ] [ Version: complete-5.06 ] || ||
### ### || || [ ok ] || [ options-all ] [ List full options ] [ full-options md ] || ||
### ### || ||  [ options-interface ]  || ||  ### ###                                                      
###  -cli-menu -gui-menu -gui-shell -t|-txt -c|-cli -g|-gui -w|-web -h|-help -i|-info -l|-log -n|-null
### ### || ||  [ options-firewall ]  || ||  ### ###                                                      
       firewall-control   |  stop continue reset names actual show save load                          
       firewall-list      |  ls4 ls6 list4 list6 listnum listnum6 status list-alltables               
                             list-filter4 list-filter6 listnum-filter4 listnum-filter6                
                             list-nat4 list-nat6 list-raw4 list-raw6 list-mangle4 list-mangle6        
                             list-security4 list-security6 list-ebtables list-arptables               
       firewall-custom    |  new-full-config nueva-completa-config regen-config                       
                             new-mini-config nueva-mini-config examples-config                        
                             show-config modify-config del-config names-config                        
      firewall-launch     |  eraserules custom wizard-mini wizard-full off-line all-permisive         
                             games-shooter game-wesnoth game-minetest game-freeciv game-widelands     
                             client-web client-vnc client-mail client-news client-torrent client-vpn  
                             client-tor client-ftp client-squid lan-tor lan-vpn shield-ssh server-ssh 
                             server-vnc server-web server-samba server-print server-lamp server-news  
                             server-mail server-ftp server-teamspeak server-mumble server-sql         
                             server-asterisk server-squid                                             
### ### || ||  [ options-state ]  || ||  ### ###                                                         
          options-state  |  preferences-read preferences-modify preferences-regen install upgrade uninstall       
### ### || ||  [ options-tool ]  || ||  ### ###                                                          
       tool-sockets       |  info-listen info-nodes info-route info-net info-proxy info-system        
                             ip4 ip6 ss lsof tcpdump netstat netstat-nat web-cert                     
       tool-connect       |  iw-scan iw-info wpa-save wpa-load dhcp-client ntpdate-client             
       tool-rule          |  rule-del-num rule-del-shield rule-add-shield                             
       tool-forward       |  ipforward-list ipforward-on ipforward-off                                
       tool-sshd          |  sshd-tunnel-info sshd-tunnel-on sshd-tunnel-off                          
       tool-tcp           |  tracetcp-ip4 tracetcp-ip6 speed-ip4 speed-ip6                            
       tool-udp           |  host dig resolveip geoip ntpdate-client                                  
       tool-icmp          |  traceicmp-ip4 traceicmp-ip6 ping-ip4 ping-ip6                            
       tool-nmap          |  nmap-tcp nmap-syn nmap-fin nmap-udp nmap-ping                            
       tool-sudofw        |  sudofw-adduser sudofw-deluser sudofw-listuser                            
       tool-game          |  game-word game-number game-domain game-rgb game-hex                      
       tool-speed         |  free-ram speed-ram speed-disk speed-glx speed-cpu                        
       tool-util          |  weather md5sum gpg-notes radio-mp3 radio-cadena100 radio-rockfm          
       tool-install       |  install upgrade dev-upgrade howto-upgrade clean-tmp                      
       tool-addblock      |  addblock-list addblock-on addblock-off                                   
       tool-dev           |  new-versions dev-version dev-changes code intro                          
       tool-computer      |  pc-halt pc-shutdown pc-reboot                                            
### ### || || [ options-show ]   || ||  ### ###                                                          
       show-hardware      |  lpinfo lsblk lsusb lscpu lspci lsgpu lshw                                
       show-log           |  log-search log-ssh filelog autolog                                       
       show-etc           |  hosts resolv.conf hosts.allow hosts.deny                                 
                             protocols services preferences-read preferences-modify                           
### ### || || [ options-help ]   || ||  ### ###                                                          
       help-about         |  about version depends config-eng config-spa license                      
       help-help          |  all-help readme leeme notes options                                      
                             group-options mini-options full-options                                  
### ### || ||  [ Examples ]  || ||  ### ###                                                              
       fwiptables-cmd -cli-menu                |  All options in text menu                           
       fwiptables-cmd -gui-menu                |  All options in window menu                         
       fwiptables-cmd -gui-shell               |  All options in window shell                        
       fwiptables-cmd -txt list                |  List iptables rules with output txt                
       fwiptables-cmd -cli names               |  List firewall saved with output cli text menu      
       fwiptables-cmd -gui wizard-mini         |  Generate rules with output gui window              
       fwiptables-cmd -web ss                  |  Show ss with output text browser                   
       fwiptables-cmd -help readme             |  Show help of readme with output text plain         
       fwiptables-cmd -info lsof               |  Show info of lsof with output text rst             
       fwiptables-cmd -log info-route          |  Save log info-route with output text plain         
       fwiptables-cmd -null client-web         |  Launch client web firewall a null output           
     
---
###          [ All options per groups ]  [ Options one to one in each group ]
     
---
###          [ Launch interface ]
     
              txt OR -txt OR -t : Output at text line | whith bash backend.
              cli OR -cli OR -c : Output at text menu | whith dialog backend.
              gui OR -gui OR -g : Output at graphicall window || whith zenity backend.
              web OR -web OR -w : Output to text web browser.
              log OR -log OR -l : Output in logfile | whith bash backend.
            help OR -help OR -h : Output help to text in text plain format.
            info OR -info OR -i : Output help to text in text rst format.
            null OR -null OR -n : Output in null    | without backend.
                    tor OR -tor : Run in tor, necesary daemon tor and torify command | whith tor backend.
     
---
                 cli-menu Or -cli-menu : Command line interface with menus | whith dialog backend.
                 gui-menu Or -gui-menu : Graphicall interface with menus | whith zenity backend.
              gui-shell Or -shell-menu : Graphicall interface with shell | whith zenity backend.
     
            #################################################################
     
###         [ Control the iptables rules ]
     
               stop : Save and stop firewall iptables.
           continue : Restore the firewall iptables stopped.
              reset : Reset the firewall iptables.
              names : List the firewall iptables saved.
               show : Show one firewall standard.
               save : Save one firewall iptables.
               load : Restore a one firewall iptables.
             actual : Show the firewall standard actual.
     
###          [ List iptables rules]
     
                   ls4 : likes list-filter4.
                   ls6 : likes list-filter6.
                 list4 : likes list-filter4.
                 list6 : likes list-filter6.
        ls|list|status : likes list4 more list6.
               listnum : List iptables filter rules from ipv4 in numbers.
       list-forwardnum : List iptables filter rules foward in numbers.
              listnum6 : List iptables filter rules from ipv6 in numbers.
      list-forwardnum6 : List iptables filter rules forward ipv6 in numbers.
          list-forward : List iptables filter rules forward ipv4.
         list-forward6 : List iptables filter rules forward ipv6.
     
---
          list-filter4 : List iptables filter rules from ipv4.
          list-filter6 : List iptables filter rules from ipv6.
             list-nat4 : List iptables nat rules from ipv4.
             list-nat6 : List iptables nat rules from ipv6.
          list-mangle4 : List iptables mangle rules from ipv4.
          list-mangle6 : List iptables mangle rules from ipv6.
             list-raw4 : List iptables raw rules from ipv4.
             list-raw6 : List iptables raw rules from ipv4.
        list-security4 : List iptables security rules from ipv4.
        list-security6 : List iptables security rules from ipv6
         list-ebtables : List rules ebtables mac of ethernet.
         ist-arptables : List rules arptables arp.
     
###          [ firewall config ]
     
            new-full-config : Create a new configfile.cfg in english.
      nueva-completa-config : Create a new configfile.cfg in spanish.
            new-mini-config : Create a new basic configfile.cfg in english.
          nueva-mini-config : Create a new basic configfile.cfg in spanish.
               regen-config : regen wizard files and templates cfg.
               names-config : List config files cfg.
              modify-config : Edit one config.cfg.
                show-config : Show one config.cfg.
                 del-config : Delete one configuration file.
###         [ Launch firewall iptables rules ]
     
              eraserules : Remove the iptables rules in ipv4 and ipv6.
             wizard-full : Asistant y launch complete firewall.
             wizard-mini : Asistant y Launch simple firewall.
                  custom : Configure one custom firewall, made for you with file.cfg.
                off-line : Launch disconected firewall for all servers and clients except localhost.
           all-permisive : Launch a firewall very permisive.
---
           games-shooter : Launch a firewall likes games udp non-root games.
            game-wesnoth : Launch a firewall likes game of the battle for wesnoth.
           game-minetest : Launch a firewall likes game minecraft or minetest.
            game-freeciv : Launch a firewall likes game game freeciv.
          game-widelands : Launch a firewall likes game widelands.
                 lan-tor : Launch a firewall only to browser with tor.
                 lan-vpn : Launch a firewall only to browser with vpn.
              client-web : Launch a firewall likes web client and ssh client.
              client-tor : Launch a firewall with brwoser with tor.
          client-torrent : Launch a firewall likes web client and ssh client and torrent.
              client-vpn : Launch a firewall likes web client and ssh client and vpn client.
            client-squid : Launch a firewall likes client squid.
---
              shield-ssh : Launch a firewall likes server ssh with shield for new-conecctions until 6-tries each-hour/each-ip.
---
            ______All server ssh configured with shield ssh server at max 10 tries to connect at ip/hour_____
---
              server-ssh : Launch a firewall likes server ssh.
              server-web : Launch a firewall likes web server and ssh server.
            server-samba : Launch a firewall likes server and client for samba and ssh.
            server-print : Launch a firewall likes server ipp, printer and ssh.
             server-lamp : Launch a firewall likes server LAMP.
              server-ftp : Launch a firewall likes server ftp.
             server-news : Launch a firewall likes server news.
             server-mail : Launch a firewall likes server mail.
        server-teamspeak : Launch a firewall likes server teamspeak.
           server-mumble : Launch a firewall likes server mumble.
              server-sql : Launch a firewall likes server sql.
         server-asterisk : Launch a firewall likes server asterisk.
            server-squid : Launch a firewall likes server squid.
     
            #################################################################
     
###          [ options state ]
     
           preferences-read   : Show values for default.
           preferences-modify : Modify values for default.
           preferences-regen  : Regenerate values for default.
           install            : Install program.
           uninstall          : Uninstall program.
           upgrade            : Upgrqade program.
     
     
###          [ List sockets ]
     
           info-nodes : List the conentions arp in lan.
           info-proxy : List system proxy.
          info-listen : List system listen socket list.
           info-route : Show net devices and ip route tables.
          info-system : Show info system.
             info-net : Show net info.
                  ip4 : Show net ip4.
                  ip6 : Show net ip6.
                   ss : Show net sockets with command ss.
                 lsof : Show net sockets with command lsof.
              netstat : Show net sockets with command netstat.
          netstat-nat : Show net sockets with command netstat-nat.
             web-cert : Download one ssl certificated to one web with port https(443).
              tcpdump : Listen the connections.
     
###          [ tool connect ]
     
                    iw-scan : list ssid on wifi
                    iw-info : Show the connected wifi
                   wpa-save : Connect to ssid in wifi for first time
                   wpa-load : Connect to ssid in wifi saved
                dhcp-client : run dhcp client
     
###          [ tool rules ]
     
              rule-del-rule : Delete a rule for its number
            rule-del-shield : Delete the shield to ssh with max number tries
            rule-add-shield : Add the shield to ssh with max number tries
     
###          [ Tool forward ]
     
       ipforward-list : Show kernel config about forward.
         ipforward-on : Active kernel config about forward.
        ipforward-off : Deactive kernel config about forward.
     
###          [ Tool sshd ]
     
       sshd-tunnel-info : Show info about sshd tunnel
         sshd-tunnel-on : Active sshd tunnel.
        sshd-tunnel-off : Deactive sshd tunnel.
     
###          [ Tool tcp ]
     
         tracetcp-ip4 : Trace route a one host with ipv4 tcp.
         tracetcp-ip6 : Trace route a one host with ipv6 tcp.
            speed-ip4 : Test the bandwidth with ipv4.
            speed-ip6 : Test the bandwidth with ipv6.
     
###          [ Tool udp ]
     
                host : Resolve one host.
                 dig : Resolve one host.
           resolveip : Resolve one host and viceversa.
               geoip : Locate a one host or ip.
      ntpdate-client : Update the date from ntp server.
     
###          [ Tool icmp ]
     
       traceicmp-ip4 : Trace route a one host with ipv4 icmp.
       traceicmp-ip6 : Trace route a one host with ipv6 icmp.
            ping-ip4 : Do a one ping with to one host with ipv4 icmp.
            ping-ip6 : Do a one ping with to one host with ipv6 icmp.
     
###          [ Tool nmap ]
     
            nmap-tcp : Scan a host/mask per tcp protocol.
            nmap-syn : Scan a host/mask per syn socket.
            nmap-fin : Scan a host/mask per fin socket.
            nmap-udp : Scan a host/mask per udp protocol.
           nmap-ping : Scan a host/mask per ping udp.
     
###          [ Tool sudo ]
     
         sudofw-adduser : Allow sudo to other choosed users.
         sudofw-deluser : Remove sudo to other choosed users.
        sudofw-listuser : List sudo to other choosed users.
           aliasfw-list : List alias fwiptables and its autocomplete.
     
###          [ Tool game ]
     
              game-word : Play game to discover a random word with five digits.
            game-number : Play game to discover a random number with five digits.
            game-domain : Discover one domain if generic or if country.
            game-hex : convert one number hexadecimal in rgb.
            game-rgb : convert one number rgb in hexadecimal.
     
###          [ Tool speed ]
     
              free-ram : Clean for innecesary ram memory.
             speed-ram : Show the speed of ram memory.
            speed-disk : Show the speed of root hard disc.
             speed-glx : Show frammes for seconds with mesa graphicall.
     
###          [ Tool util ]
     
               weather : Show the weather in your city.
                md5sum : Show the one file md5sum.
             radio-mp3 : Connect to one server mp3, see preferences-read preferences-modify.
             gpg-notes : Write and rewrite notes with crypto.
     
###          [ Tool Install ]
     
              install : Install this program actual.
        howto-upgrade : Howto install the latest version.
              upgrade : Upgrade at the latest stable version.
          dev-upgrade : Upgrade at the latest git version.
            clean-tmp : Remove temporal files of fwiptables.
     
###          [ Tool addblock ]
     
       addblock-list : List options to block dangerous hosts.
         addblock-on : Write one /etc/hosts with block a dangerous sites.
        addblock-off : Return to /etc/hosts for default.
     
###          [ Tool computer ]
     
              reboot : Reboot computer.
                halt : Stop computer.
            shutdown : Stop computer.
     
###          [ Tool dev ]
     
         new-versions : Show the last versions.
          dev-version : Show the link at the developer version.
          dev-changes : Show the last changes.
                 code : Show the source code for one option.
               md5sum : Show the md5 sum from one file.
     
###          [ Tool computer ]
     
              pc-halt : Turn power off computer.
          pc-shutdown : Turn power off computer.
            pc-reboot : Turn reboot the computer.
     
###          [ Show hardware ]
     
               lpinfo : Show the device printers.
                lsblk : Show the device disks.
                lsusb : Show the devices usb.
                lscpu : Show the devices cpu.
                lsgpu : Show the devices gpu.
                lspci : Show the devices pci.
                 lshw : Show the hardware devices.
     
###          [ Show etc ]
     
                hosts : Show /etc/hosts, hosts local and statics host.
           protocolos : Show /etc/protocols, protocols names.
             services : Show /etc/services, ports names.
          hosts.allow : Show /etc/hosts.allow, hosts allowed in some own server.
           hosts.deny : Show /etc/hosts.deny, hosts drops in some own server.
          resolv.conf : Show /etc/resolv.conf, it are the dns configured.
         preferences-read : Show show variables for fwiptables.
       preferences-modify : Modify variables for fwiptables.
     
###          [ Show log ]
     
             log-ssh : Search the logs from sshd for /var/log.
          log-search : Search the logs from a input pattern for /var/log.
             filelog : Show saved with -log.
             filelog : Alias to filelog.
             autolog : Show autolog headers.
     
###          [ Show about ]
     
                about : About info.
              version : Info version program actual.
              depends : Show depends.
           config-eng : config example with comments in english.
           config-spa : config example with comments in spanish.
      examples-config : Show configs examples.
     
###          [ Show help ]
     
             all-help : Show help in spanish and in english.
                 info : Show group options.
        group-options : show group options.
         mini-options : Show necesary options for firewall.
         full-options : Show the full options.
              options : Show the full options.
               readme : Show help in english.
                leeme : Show help in spanish.
                notes : Show firewall notes.
             examples : Show examples to launch.
     
###  [ firewall notes ]
     
          Notes in fwiptables
     
###   [vpn]
     
          Host [vpn] excepcionals hosts has conection allowed in firewall.
     
###   [blacklist]
     
          Host [blacklist] excepcionals hosts has conection dropped in firewall.
     
###   [uid and/or gid excepcional]
     
          User and/or group excepcional have output conection allowed in firewall.
     
###   [iptables netftilter]
     
          iptables-legacy   is    support for xtables.
          iptables-nft      is    support for nftables.
     
###   [client firewall needs in udp ports]
     
          This port is necesary to update the date  : ntp
          This port is necesary to dhcp and get ip  : bootpc
          This port is necesary to domain resolver  : domain
     
###   [Ipv6 needs protocols]
     
          Necesary protocol: ipv6-icmp.
          Ipv6 works too with: ipv4 procotols.
     
###   [License]
     
       Download the latest version from sourceforge
       https://sourceforge.net/projects/f-iptables/files/latest/download
       Copyleft, without warranty, gnu license GPL v2.
       https://sourceforge.net/p/f-iptables/code/ci/master/tree/LICENSE.txt?format=raw
     

