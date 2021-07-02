##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ mini-help ]
     [Option]
 [launch-rules:]    eraserules offline allpermisive custom [cfg]             
 [control-rules:]   stop continue reset fwlist save restore actual           
 [list-rules:]      list forward nat list6 forward6 nat6                     
 [tool-configs:]    new-full-config nueva-completa-config                    
                    new-mini-config nueva-mini-config                        
                    show-config modify-config del-config                     
 [show-help:]       mini-help list-help long-help help ayuda                 
     [Configs]
cliente.cfg servidor.cfg
     [Examples]
 [Create a new config myown.cfg:]    fwiptables new-mini-config myown.cfg    
 [Launch the config myown.cfg:]      fwiptables custom myown.cfg             
 [List iptables rules:]              fwiptables list                         
