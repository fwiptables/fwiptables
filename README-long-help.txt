##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:20 CEST] ##### [ long-help ] #####
#####         [Long-help]
#####         [Larga-ayuda]

--------------------------------------------------------------------------
  FRAN INTRO 

  Fran Firewall use to configure both iptables netfilter: xtables and neftables,
  Configure the firewall with your config files or with standar iptables files.
  Use too this firewall with other utilities to control the ip net.

  See web page project in https://sourceforge.net/projects/f-iptables/
--------------------------------------------------------------------------


##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:21 CEST] ##### [ principal-options ] #####
     [principal-options]
 [launch-rules]     eraserules offline allpermisive custom [cfg]              
 [control-rules]    stop continue reset fwlist save load actual               
 [list-rules]       list forward nat list6 forward6 nat6                      
 [tool-cfg]         new-full-config nueva-completa-config                     
                    new-mini-config nueva-mini-config                         
                    show-config modify-config del-config                      
 [tool-guide]       info-net info-system wizard-full wizard-mini              
 [tool-interface]   cli-menu gui-menu gui-shell -text -log -gui               
 [tool-sockets]     ipforwading route ss lsof netstat netstat-nat             
 [tool-sudo]        auth-sudo remove-sudo list-sudo list-alias                
 [tool-install]     install howto-upgrade upgrade new-versions                
 [show-help]        full-options principal-options long-help notes            
     [cfg]
cliente.cfg nueva1.cfg
     [example]                           -text for default output, or -log or -gui   
 Create a new config myown.cfg :#        fwiptables new-mini-config myown.cfg        
 Launch config myown.cfg :#              fwiptables custom myown.cfg                 
 List iptables rules :#                  fwiptables list                             
 List iptables rules with output log :#  fwiptables -log list                        
 List iptables rules with output gui :#  fwiptables -gui list                        

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:21 CEST] ##### [ full-options ] #####
     [option]
 [launch-rules]     eraserules offline allpermisive custom [cfg]              
 [control-rules]    stop continue reset fwlist read save load actual          
 [list-rules]       list forward nat list6 forward6 nat6                      
 [list-numrules]    listnum forwardnum listnum6 forwardnum6                   
                    listnum forwardnum listnum6 forwardnum6                   
                    mangle-ip4 mangle-ip6 raw-ip4 raw-ip6                     
                    security-ip4 seciruty-ip6 ebtables arptables              
 [tool-cfg]         new-full-config nueva-completa-config                     
                    new-mini-config nueva-mini-config                         
                    show-config modify-config del-config                      
 [tool-guide]       info-net info-system wizard-full wizard-mini              
 [tool-interface]   cli-menu gui-menu gui-shell -text -log -gui               
 [tool-sockets]     ipforwading route ss lsof netstat netstat-nat             
 [tool-icmp]        ping-ip4 ping-ip6                                         
 [tool-tcp]         trace-ip4 trace-ip6 host resolveip geoip ntpdate          
 [tool-nmap]        tcp-scan syn-scan fin-scan udp-scan ping-scan             
 [tool-sudo]        auth-sudo remove-sudo list-sudo list-alias                
 [tool-install]     install howto-upgrade upgrade new-versions                
 [show-etc]         hosts protocols services hosts.allow hosts.deny           
 [show-log]         log-fwiptables log-sshd log-search                        
 [show-about]       about version depends examples config-eng config-spa      
 [show-help]        full-options principal-options long-help help ayuda notes 
     [cfg]
cliente.cfg nueva1.cfg
     [example]                           -text for default output, or -log or -gui   
 Create a new config myown.cfg :#        fwiptables new-mini-config myown.cfg        
 Launch config myown.cfg :#              fwiptables custom myown.cfg                 
 List iptables rules :#                  fwiptables list                             
 List iptables rules with output log :#  fwiptables -log list                        
 List iptables rules with output gui :#  fwiptables -gui list                        

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:21 CEST] ##### [ option ] #####
#####         [List option]
#####         [Lista opcion]

  launch-rules:  Launch the iptables firewall rules
              :  Lanza las reglas de iptables
 control-rules:  Control the iptables firewall rules
              :  Controla las reglas de iptables
    list-rules:  List the iptables firewall rules
              :  Lista las reglas de iptables
      list-num:  List the iptables firewall rules in numbers
              :  Lista las reglas numericas de iptables
      tool-cfg:  Create, modify and show configurations
              :  Crea, modifica y muestra configuraciones
    tool-guide:  Guide to beginners
              :  Guia para empezar
  tool-sockets:  List net sockets ip in system
              :  Lista sockets de red ip en el sistema
     tool-icmp:  Tool icmp to ping at other hosts
              :  Herramienta icmp para hacer ping a otros
      tool-tcp:  Several tools tcp
              :  Varias herramientas tcp
     tool-nmap:  Port scan
              :  Escaneo de puertos
     tool-sudo:  Tool to auth sudo a users for fwiptables
              :  Herramienta de autorizacion a usuarios para fwiptables
  tool-install:  Tool to install and upgrade fwiptables
              :  Herramienta para instalar y actualizar fwiptables
      show-etc:  Show net files in /etc/
              :  Muestra archivos de red de /etc/
      show-log:  Show logs systems
              :  Muestra logs del sistema
    show-about:  About fwiptables
              :  Acerca de fwiptables
     show-help:  Help for fwiptables
              :  Ayuda de fwiptables

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:21 CEST] ##### [ cfg ] #####
#####         [list configs files]
#####         [Lista de archivos de configuraciones]

cliente.cfg
default.cfg
default-english.cfg
default-full-english.cfg
default-full-spanish.cfg
default-mini-english.cfg
default-mini-spanish.cfg
default-spanish.cfg
email-example1.cfg
ftp-example1.cfg
fullwizard.cfg
games-example1.cfg
irc-example1.cfg
miniwizard.cfg
nueva1.cfg
printer-example1.cfg
samba-example1.cfg
sql-example1.cfg
ssh-example1.cfg
torrent-example1.cfg
vnc-example1.cfg
vpn-example1.cfg
web-example1.cfg

##### [OK CONFIGS NAMES]

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:22 CEST] ##### [ example ] #####
#####         [list examples]
#####         [Lista ejemplos]

     [list-examples]                   -text for default, or -gui              
 #Create a new config myown.cfg:#      fwiptables new-mini-config myown.cfg    
 #Launch config myown.cfg:#            fwiptables custom myown.cfg             
 #List iptables rules with console:#   fwiptables list                         
 #List iptables rules with gui:#       fwiptables -gui list                    

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:22 CEST] ##### [ launch-rules ] #####
#####         [Launch iptables rules]
#####         [Lanza reglas de iptables]

   eraserules: Remove the iptables rules in ipv4 and ipv6
             : Borra las reglas de iptables en ipv4 y ipv6
      offline: Firewall disconected for all servers and clients except localhost
             : Firewall desconectado para todo servidores y clientes excepto localhost
 allpermisive: Configure a firewall very permisive
             : Configura un firewall muy permisivo
       custom: Configure one custom firewall with one file cfg
             : Configura un modificado firewall con un archivo cfg
   [file.cfg]: Configure the firewall with file.cfg and show info
             : Configura un firewall modificado con un archivo cfg y muestra info

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:22 CEST] ##### [ control-rules ] #####
#####         [Control iptables rules]
#####         [Controla reglas de iptables]

          stop: Save and stop the rules
              : Guarda y para las reglas
      continue: continue with old rules
              : Continua con las viejas reglas
         reset: Reset the rules
              : Resetea las reglas
        fwlist: Show the files firewall standard
              : Muestra los archivos de firewall estandard guardados
          read: Read the files in firewall standard
              : Lee los archivos de firewall estandard
          save: Save the files in firewall standard
              : Guarda los archivos de firewall estandard
          load: Restore files from firewall standard
              : Recupera los archivos de firewall estandard
        actual: Show the actual iptables standard
              : Muestra el actual firewall estandard

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:23 CEST] ##### [ list-rules ] #####
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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:23 CEST] ##### [ tool-configs ] #####
#####         [Tool configs]
#####         [Herramienta de configuraciones]

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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:23 CEST] ##### [ tool-guide ] #####
#####         [tool guide]
#####         [Herramienta guia]

  info-system: Show info system
             : Muestra informacion del sistema
     info-net: Show net info
             : Muestra informacion del sistema
  wizard-full: Asistant y launch complete firewall
             : Asiste y lanza un completo firewall
  wizard-mini: Asistant y Launch simple firewall
             : Asiste y lanza un simple firewall

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:24 CEST] ##### [ tool-interface ] #####
#####         [tool interface]
#####         [Herramienta interfaz]

     cli-menu: Text cli interface from menus
             : Interfaz de menus desde texto
     gui-menu: Gui interface from menu
             : Interfaz grafica desde menu
    gui-shell: Gui with comand line interface
             : Gui con interfaz desde linea de comandos
        -text: Text output interface, for default
             : Interfaz de texto, por defecto
         -log: Save the output to /var/log/fwiptables
             : Guarda la salida a /var/log/fwiptables
         -gui: Graphicall output interface
             : Interfaz grafico de salida
         text: alias a -text
             : apodo a -text
          log: alias a -log
             : apodo a -log
          gui: alias a -gui
             : apodo a -gui

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:24 CEST] ##### [ tool-sockets ] #####
#####         [Tool sockets]
#####         [Herramienta de sockets]

        route: Show net devices and ip route tables
             : Muestra los dispositivos de red y la tabla de rutas
           ss: Show net sockets with command ss
             : Muestra las conexiones de red con ss
         lsof: Show net sockets with command lsof
             : Muestra las conexiones con lsof
      netstat: Show net sockets with command netstat
             : Muestra las conexiones con netstat
  netstat-nat: Show net sockets wiht command netstat-nat
             : Muestra las conexiones con netstat-nat
  ipforwading: Show kernel config about forward
             : Muestra la configuracion del kernel sobre reenvios
      tcpdump: Listen the connections
             : Escucha las conexiones
          arp: List the last conentions arp
             : Lista las ultimas conexiones arp

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:24 CEST] ##### [ tool-icmp ] #####
#####         [Tool icmp]
#####         [Herramienta icmp]

     ping-ip4: Do a one ping with to one host with ipv4 icmp
             : Hace un ping con una direccion con ipv4 icmp
     ping-ip6: Do a one ping with to one host with ipv6 icmp
             : Hace un ping con una direccion con ipv6 icmp


##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:25 CEST] ##### [ tool-tcp ] #####
#####         [Tool tcp]
#####         [Herramienta tcp]

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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:25 CEST] ##### [ tool-nmap ] #####
#####         [Tool nmap]
#####         [Herramienta nmap]

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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:25 CEST] ##### [ tool-sudo ] #####
#####         [Tool sudo]
#####         [Herramienta sudo]

    auth-sudo: Permit sudo fwiptables to other choosed users
             : Permite sudo fwiptables a otros elegidos usuarios
  remove-sudo: Remove sudo fwiptables to other choosed users
             : Borra sudo fwiptables a otros elegidos usuarios
    list-sudo: List sudo fwiptables to other choosed users
             : Lista sudo fwiptables a otros elegidos usuarios

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:26 CEST] ##### [ tool-install ] #####
#####         [Tool install]
#####         [Herramienta instalar]

       install: Install this actual
              : Instala este actual
 howto-upgrade: Show howto upgrade at the latest version
              : Muestra como actualizar a la ultima version
       upgrade: Upgrade at the latest version
              : Actualiza a la ultima version

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:26 CEST] ##### [ show-etc ] #####
#####         [Show etc]
#####         [Mostrar etc]

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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:26 CEST] ##### [ show-log ] #####
#####         [Show log]
#####         [Mostrar log]

 log-fwiptables: Show /var/log/fwiptables
               : Muestra /var/log/fwiptables
       log-sudo: Search logs with sudo in /var/log
               : Busca logs con sudo en /var/log
       log-sshd: Search logs for sshd in /var/log
               : Busca logs con sshd en /var/log
  log-logserver: Search logs whith this firewall in /var/log
               : Busca logs con this firewall en /var/log
     log-search: Search logs whith a prefix in /var/log
               : Busca logs con patron en /var/log

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:27 CEST] ##### [ show-about ] #####
#####         [Show about]
#####         [Mostrar acerca de]

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

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:27 CEST] ##### [ show-help ] #####
#####         [Show help]
#####         [Mostrar ayuda]

principal-options: Show favorites options
                 : Muestra favoritas opciones
     full-options: Show full options
                 : Muestra lista de opciones
        long-help: Show help in english and spanish
                 : Muestra la ayuda en ingles y en español
             help: Show help in english
                 : Muestra la ayuda en ingles
            ayuda: Show help in spanish
                 : Muestra la ayuda en español

##### [fwiptables] [1.37-Jesus] [jue 12 ago 2021 14:10:27 CEST] ##### [ notes ] #####

##### [only_output] [only output]
##### [only_output] [solo salida]

     With [only_output] rules is more practical the firewall with all input
     Con [only_output] reglas es mas practico el firewall con todo entrando

##### [vpn] [virtual private network] [whitelist]
##### [vpn] [red privada virtual] [lista blanca]

     Host [vpn] excepcionals hosts has conection allowed in firewall
     Host [vpn] excepcionales hosts tienen la conexion permitida en el firewall

##### [blacklist] [deny host]
##### [blacklist] [Lista negra]

     Host [blacklist] excepcionals hosts has conection dropped in firewall
     Host [blacklist] expcecionales hosts tienen la conexion denegada en firewall

##### [allow_output_uid] [user and group]
##### [allow_output_uid] [usuario y grupo]

     User and/or group excepcional have output conection allowed in firewall
     Usuario y/o grupo excepcional tienen la salida permitida en firewall

##### [Notes] [Two iptables netfilter]
##### [Notas] [Dos iptables netfilter]

     iptables-legacy   is    support for xtables 
     iptables-nft      is    support for neftables 

##### [Notes] [necesary ports to connect with ipv4 and ipv6 in udp protocol]
##### [Notas] [puertos necesarios para conectar con ipv4 y ipv6 en udp protocolo]

 ntp   : Port necesary to update the time and date
       : Puerto necesario para actualizar la hora y fecha
 bootpc: Port necesary to dhcp and get ip
       : Puerto necesario para actualizar y conseguir la ip
 domain: This port is necesary to domain resolver
       : Puerto necesario para resolver dominios

##### [Notes] [necesary protocols for ipv6]
##### [Notas] [protocolos necesarios para ipv6]

 ipv6-icmp     : Necesary protocol in ipv6
               : Protocolo necesario en ipv6
 ipv4 protocols: ipv6 works too with pv4 procotols
               : ipv6 funciona tambien con ipv4 protocolos

##################################################  [License]

  Download the latest version Fran FireWall FWiptables Generator from sourceforge
  https://sourceforge.net/projects/f-iptables/files/latest/download
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.


##### [Config cfg example]
##### [Configuracion cfg ejemplo]

##### Fran FireWall FWiptables Generator from fwiptables config file
##### BEGIN NECESARY # # _ _ _ _ _ _ _ ##### .......... BEGIN Necesary options .......... .......... #
##### NETFILTER # # _ _ _ _ _ _ _ ##### the iptables firewall netfilter, choose one or two
allow_legacy= # _ _ _ _ _ _ _ ##### launch xtables, void to yes or type no
allow_nft=no # _ _ _ _ _ _ _ ##### launch neftables, void to yes or type no
##### PROTOCOL IP # # _ _ _ _ _ _ _ ##### ip protocol, modify with void or no
allow_ipv4= # _ _ _ _ _ _ _ ##### void to config firewall with ipv4 or no to dont configure ipv4
allow_ipv6=no # _ _ _ _ _ _ _ ##### void to config firewall with ipv6 or no to dont configure ipv6
##### CLIENT PORTS# # _ _ _ _ _ _ _ ##### Client ports, add with ',' and join ranges with ':'
client_tcp=http,https,ssh # _ _ _ _ _ _ _ ##### tcp ports for client
client_udp=domain,bootpc,ntp,https # _ _ _ _ _ _ _ ##### udp ports for client
##### SERVER PORTS # # _ _ _ _ _ _ _ ##### Server ports, add with ',' and join ranges with ':'
server_tcp=ssh # _ _ _ _ _ _ _ ##### tcp ports for server
server_udp= # _ _ _ _ _ _ _ ##### udp ports for server
logserver_tcp=ssh # _ _ _ _ _ _ _ ##### the tcp ports to log server
logserver_udp= # _ _ _ _ _ _ _ ##### the udp ports to log server
##### FORWARD IP # # _ _ _ _ _ _ _ ##### void to yes, or no to no
allow_forwading=no # _ _ _ _ _ _ _ ##### void to allow ip forward or no
allow_nat=no # _ _ _ _ _ _ _ ##### void to do NAT masquerade to default route or no
##### END NECESARY # # _ _ _ _ _ _ _ ##### .......... END Necesary options .......... .......... #
# _ _ _ _ _ _ _
##### BEGIN OPTIONAL # # _ _ _ _ _ _ _ ##### .......... BEGIN Optional options .......... .......... #
##### choose void or no # # _ _ _ _ _ _ _ ##### Allow Other Options, modify with void, or no
allow_only_output=no # _ _ _ _ _ _ _ ##### void when the rules are only to output filter or no
allow_input_state=no # _ _ _ _ _ _ _ ##### Selective Input state or no
allow_bandwidth_input=no # _ _ _ _ _ _ _ ##### void to limit bandwidth input in kbits/sec for all sources or no
allow_bandwidth_output=no # _ _ _ _ _ _ _ ##### void to limit bandwidth output in kbits/sec for each destination or no
allow_maxconnect_input=no # _ _ _ _ _ _ _ ##### void to limit max number for input simultaneous connections or no
allow_maxconnect_output=no # _ _ _ _ _ _ _ ##### void to limit max number for output simultaneous connections or no
allow_ping_send=no # _ _ _ _ _ _ _ ##### void to allow send pings or no
allow_ping_recive=no # _ _ _ _ _ _ _ ##### void to allow recive pings or no
allow_vpn=no # _ _ _ _ _ _ _ ##### void to allow some exceptional host or no
allow_blacklist=no # _ _ _ _ _ _ _ ##### void to drop some excepcional host or no
allow_output_uid=no # _ _ _ _ _ _ _ ##### void to allow excepcional user or no
allow_output_gid=no # _ _ _ _ _ _ _ ##### void to allow excepcional group or no
allow_others_protocols=no # _ _ _ _ _ _ _ ##### void to allow other protocol ip excepcional or no
##### Begin Variables # # _ _ _ _ _ _ _ ##### Fill Variables#
##### Options # _ _ _ _ _ _ _ ##### Other Options, add with , and join ranges with :
input_state=new,related,established # _ _ _ _ _ _ _ ##### void for all or new,related,established,untracked,invalid
bandwidth_input=12512 # _ _ _ _ _ _ _ ##### max input bandwidth in kbits/sec for all
bandwidth_output=512 # _ _ _ _ _ _ _ ##### max output bandwidth in kbits/sec for each ip
maxconnect_input=72 # _ _ _ _ _ _ _ ##### max number for input simultaneous connections
maxconnect_output=72 # _ _ _ _ _ _ _ ##### max number for output simultaneous connections
vpn=wesnoth.org,sf.net # _ _ _ _ _ _ _ ##### allow this excepcitonal host
blacklist=facebook.com,google.com # _ _ _ _ _ _ _ ##### drop this excepcional host
output_uid=root # _ _ _ _ _ _ _ ##### allow out packages excepcional from this user excepcional
output_gid=root # _ _ _ _ _ _ _ ##### allow out packages excepcional from this group excepcional
others_protocols=icmp,igmp # _ _ _ _ _ _ _ ##### allow others protocols from /etc/protocolos
##### NET TO CLIENT AND SERVER # # _ _ _ _ _ _ _ ##### Net to connect like client or server
net_ipv4_client=0/0 # _ _ _ _ _ _ _ ##### the net to client ipv4, all is 0/0
net_ipv4_server=0/0 # _ _ _ _ _ _ _ ##### the net to server ipv4, all is 0/0
net_ipv6_client=::/0 # _ _ _ _ _ _ _ ##### the net to client ipv6, all is ::/0
net_ipv6_server=::/0 # _ _ _ _ _ _ _ ##### the net to server ipv6, all is ::/0
##### # # _ _ _ _ _ _ _ ##### .......... END Optional options .......... .......... #



     [Fran FireWall iptables Generator]
##################################################

     [Exec name]
  fwiptables

     [Program Name]
  Fran FireWall FWiptables Generator

     [Program Description]
  One Script in bash for iptables firewall

     [Program Install]
  chmod ugo+x fwiptables
  ./fwiptables install
  [and then fwiptables is in /usr/bin/fwiptables]

     [Devevelopments version program]
  The fran iptables ver in development in git code at sourceforge:

  https://sourceforge.net/p/f-iptables/code/ci/master/tree/dev-fwiptables?format=raw

     [New versions program]
  The last versions in files repository at sourceforge:

  https://sourceforge.net/projects/f-iptables/files

     [Access web with all versions program]
  The fran iptables all versions in code repository at sourceforge:

  https://sourceforge.net/p/f-iptables/code/ci/master/tree/

     [Git clone with all versions program]
  The fran iptables all versions in code repository at sourceforge:

  git clone https://git.code.sf.net/p/f-iptables/code f-iptables-code

     [Program License]
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.

##################################################



