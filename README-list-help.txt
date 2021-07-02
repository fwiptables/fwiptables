##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ list-help ]
     [Option]
 [launch-rules]     eraserules offline allpermisive custom [cfg]             
 [control-rules]    stop continue reset fwlist save restore actual           
 [list-rules]       list forward nat list6 forward6 nat6                     
 [list-numrules]    listnum forwardnum listnum6 forwardnum6                  
 [tool-cfg]         new-full-config nueva-completa-config                    
                    new-mini-config nueva-mini-config                        
                    show-config modify-config del-config                     
 [tool-guide]       system-info net-info full-wizard mini-wizard cli gui     
 [tool-sockets]     route ss netstat lsof ipforwading tcpdump arp            
 [tool-icmp]        ping-ip4 ping-ip6                                        
 [tool-tcp]         trace-ip4 trace-ip6 host resolveip geoip ntpdate         
 [tool-nmap]        tcp-scan syn-scan fin-scan udp-scan ping-scan            
 [tool-sudo]        auth-sudo remove-sudo list-sudo                          
 [tool-install]     install howto-upgrade net-upgrade                        
 [show-etc]         hosts protocols services hosts.allow hosts.deny          
 [show-log]         log-sudo log-sshd log-logserver log-search               
 [show-about]       about version depends examples config-eng config-spa     
 [show-help]        mini-help list-help long-help help ayuda                 
     [Configs]
cliente.cfg servidor.cfg
     [Examples]
 [Create a new config myown.cfg:]    fwiptables new-mini-config myown.cfg    
 [Launch the config myown.cfg:]      fwiptables custom myown.cfg             
 [List iptables rules:]              fwiptables list                         
