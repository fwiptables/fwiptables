##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [long-help]
#####         [Long-help] [Larga-ayuda]


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
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [launch-rules]
#####         [Launch iptables rules]

   eraserules: Remove the iptables rules in ipv4 and ipv6
               Borra las reglas de iptables en ipv4 y ipv6
      offline: Firewall disconected for all servers and clients except localhost
               Firewall desconectado para todo servidores y clientes excepto localhost
 allpermisive: Configure a firewall very permisive
               Configura un firewall muy permisivo
       custom: Configure one custom firewall with one file cfg
               Configura un modificado firewall con un archivo cfg
   [file.cfg]: Configure the firewall with file.cfg and show info
               Configura un firewall modificado con un archivo cfg y muestra info
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [control-rules]
#####         [Control iptables rules]

          stop: Save and stop the rules
              : Guarda y para las reglas
      continue: continue with old rules
              : Continua con las viejas reglas
         reset: Reset the rules
              : Resetea las reglas
        fwlist: Show the files firewall standard
              : Muestra los archivos de firewall estandard guardados
          save: Save the files in firewall standard
              : Guarda los archivos de firewall estandard
       restore: Restore files from firewall standard
              : Recupera los archivos de firewall estandard
        actual: Show the actual iptables standard
              : Muestra el actual firewall estandard
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [list-rules]
#####         [List filter iptables rules]
#####         [Lista reglas de iptables filtros]

               [The filter table with names]
               [Lista tabla filtros con nombres]

         list: List iptables filter rules input and output ipv4
             : Lista reglas de tabla filtros entrada y salida ipv4
      forward: List iptables filter rules foward
             : Lista tabla de iptables de reenvio ipv4
        list6: List iptables filter rules input and output ipv6
             : Lista reglas de tabla filtros entrada y salida ipv6
     forward6: List iptables filter rules forward ipv6
             : Lista tabla de iptables de reenvio ipv6

               [List filter table with numbers]
               [Lista tabla filtros con numeros]

      listnum: List iptables filter rules input and output ipv4 in numbers
             : Lista la tabla de reglas de filtros de entrada y salida ipv4 in numeros
   forwardnum: List iptables filter rules foward in numbers
             : Lista la tabla de reglas de filtros de reenvio ipv4 in numeros
     listnum6: List iptables filter rules input and output ipv6 in numbers
             : Lista la tabla de reglas de filtros de entrada y salida ipv6 in numeros
  forwardnum6: List iptables filter rules forward ipv6 in numbers
             : Lista la tabla de reglas de filtros de reenvio ipv6 in numeros

#####         [The others tables]
#####         [Las otras tablas]

          nat: List iptables nat rules from ipv4
             : Lista iptables nat reglas de ipv4
         nat6: List iptables nat rules from ipv6
             : Lista iptables nat reglas de ipv6
   mangle-ip4: List iptables mangle rules from ipv4
             : Lista reglas de manipulacion ipv4
   mangle-ip6: List iptables mangle rules from ipv6
             : Lista reglas de manipulacion ipv6
      raw-ip4: List iptables raw rules from ipv4
             : Lista reglas directas de ipv4
      raw-ip6: List iptables raw rules from ipv6
             : Lista reglas directas de ipv6
 security-ip4: List iptables security rules from ipv4
             : lista reglas de seguridad de ipv4
 security-ip6: List iptables security rules from ipv6
             : lista reglas de seguridad de ipv6
     ebtables: List rules ebtables nft ethernet
             : Lista reglas de iptables de ethernet
    arptables: List rules arptables arp
             : Lista reglas de tabla de arpanet
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-configs ]
#####         [tool configs]

       new-full-config: Create a new advance configfile.cfg in english
                      : Crea una nueva avanzada configfile.cfg en ingles
 nueva-completa-config: Create a new advance configfile.cfg in spanish
                      : Crea una nueva avanzada configfile.cfg en ingles
       new-mini-config: Create a new basic configfile.cfg in english
                      : Crea una nueva basica configfile.cfg en ingles
     nueva-mini-config: Create a new basic configfile.cfg in spanish
                      : Crea una nueva basica configfile.cfg en español
         modify-config: Edit one configfile.cfg
                      : Edita una configuracion.cfg
           show-config: Show one configfile.cfg
                      : Muestra una configuracion.cfg
            del-config: Delete one configuration file
                      : Borra una configuracion.cfg
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [tool-guide]
#####         [tool guide]

  system-info: Show info system
             : Muestra informacion del sistema
     net-info: Show net info
             : Muestra informacion del sistema
  full-wizard: Asistant y launch complete firewall
             : Asiste y lanza un completo firewall
  mini-wizard: Asistant y Launch simple firewall
             : Asiste y lanza un simple firewall
          cli: Comand line interface with menus
             : interfaz de menus de texto
          gui: Graphicall user interface
             : Interfaz grafico de usuario
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-sockets ]
#####         [Tool sockets]

        route: Show net devices and ip route tables
             : Muestra los dispositivos de red y la tabla de rutas
           ss: Show net sockets with command ss
             : Muestra las conexiones de red con ss
         lsof: Show net sockets with command lsof
             : Muestra las conexiones con lsof
      netstat: Show net sockets with command netstat
             : Muestra las conexiones con netstat
  ipforwading: Show kernel config about forward
             : Muestra la configuracion del kernel sobre reenvios
      tcpdump: Listen the connections
             : Escucha las conexiones
          arp: List the last conentions arp
             : Lista las ultimas conexiones arp
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-icmp ]
#####         [Tool icmp]

     ping-ip4: Do a one ping with to one host with ipv4 icmp
             : Hace un ping con una direccion con ipv4 icmp
     ping-ip6: Do a one ping with to one host with ipv6 icmp
             : Hace un ping con una direccion con ipv6 icmp

##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-tcp ]
#####         [Tool tcp]

    trace-ip4: Trace route a one host with ipv4 tcp
             : Traza la routa a una direccion con ipv4 tcp
    trace-ip6: Trace route a one host with ipv6 tcp
             : Traza la routa a una direccion con ipv6 tcp
         host: Resolve one host
             : Resuelve una direccion a ip
    resolveip: Resolve one host and viceversa
             : Resuelve una direccion a ip y a host
       geo-ip: Locate a one host or ip
             : Localiza una direccion o ip
      ntpdate: Update the system date from ntp server
             : Actualiza la fecha del sistema desde un servidor de fecha
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-nmap ]
#####         [Tool nmap]

     tcp-scan: Scan a host/mask per tcp protocol
             : Escanea una host/mascara por tcp protocolo
     syn-scan: Scan a host/mask per syn socket
             : Escanea una host/mascara por syn socket
     fin-scan: Scan a host/mask per fin socket
             : Escanea una host/mascara por fin socket
     udp-scan: Scan a host/mask per udp protocol
             : Escanea una host/mascara por udp protocolo
    ping-scan: Scan a host/mask per ping udp
             : Escanea una host/mascara por ping protocolo
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-sudo ]
#####         [Tool sudo]

    auth-sudo: Permit sudo fwiptables to other choosed users
             : Permite sudo fwiptables a otros elegidos usuarios
  remove-sudo: Remove sudo fwiptables to other choosed users
             : Borra sudo fwiptables a otros elegidos usuarios
    list-sudo: List sudo fwiptables to other choosed users
             : Lista sudo fwiptables a otros elegidos usuarios
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ tool-install ]
#####         [tool install]

       install: Install this actual
              : Instala este actual
 howto-upgrade: Show howto upgrade at the latest version
              : Muestra como actualizar a la ultima version
   net-upgrade: Upgrade at the latest version
              : Actualiza a la ultima version
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ show-etc ]
#####         [Show etc]

        hosts: Show /etc/hosts
             : Muestra /etc/hosts
   protocolos: Show /etc/protocols
             : Muestra /etc/protocols
     services: Show /etc/services
             : Muestra /etc/services
  hosts.allow: Show /etc/hosts.allow
             : Muestra /etc/hosts.allow
   hosts.deny: Show /etc/hosts.deny
             : Muestra /etc/hosts.deny
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ show-log ]

#####         [Show log]

       log-sudo: Search logs with sudo in /var/log
               : Busca logs con sudo en /var/log
       log-sshd: Search logs for sshd in /var/log
               : Busca logs con sshd en /var/log
  log-logserver: Search logs whith this firewall in /var/log
               : Busca logs con this firewall en /var/log
     log-search: Search logs whith a prefix in /var/log
               : Busca logs con patron en /var/log
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ show-about ]
#####         [show about]

          about: About
               : Acerca
        version: Info version
               : Informacion de version
        depends: Show depends
               : Muestra dependencias
       examples: Show examples
               : Muestra ejemplos
     config-eng: Config example with comments in english
               : Ejemplo de configuracion con comentarios en ingles
     config-spa: Config example with comments in spanish
               : Ejemplo de configuracion con comentarios en español
##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ show-help ]
#####         [show help]

      mini-help: Show mini-help
               : Muestra mini ayuda
      list-help: Show list-help
               : Muestra lista de ayuda
      long-help: Show help in english and spanish
               : Muestra la ayuda en ingles y en español
           help: Show help in english
               : Muestra la ayuda en ingles
          ayuda: Show help in spanish
               : Muestra la ayuda en español
