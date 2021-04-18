

  Fran FireWall iptables
##################################################

#####   Program Name:
  Fran FireWall iptables: fwiptables

#####   Program Description:
  One Script in bash for iptables firewall

#####   Program Install:
  chmod ugo+x fwiptables
  ./fwiptables
  [and then fwiptables is in /usr/bin/fwiptables]

#####   Devevelopments version program:
  The fran iptables ver in development in git code at sourceforge:

  https://sourceforge.net/p/f-iptables/code/ci/master/tree/dev-fwiptables?format=raw

#####   New versions program:
  The fran iptables version 210 and new versions up in files repository at sourceforge:

  https://sourceforge.net/projects/f-iptables/files

#####   All versions program:
  The fran iptables all versions in code repository at sourceforge:

  https://sourceforge.net/p/f-iptables/code/ci/master/tree/

#####   Git clone with all versions:

  git clone https://git.code.sf.net/p/f-iptables/code f-iptables-code

#####   Program License:
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.

##################################################


Fran FireWall iptables: fwiptables version 213
##################################################   Wellcome fwiptables #####
 [Launch guide]     system-info net-info full-wizard mini-wizard cli gui       
 [Launch rules]     eraserules offline allpermisive custom [config.cfg]        
 [List rules]       list forward list6 forward6 nat-ip4 nat-ip6                
                    listnum forwardnum listnum6 forwardnum6                    
 [Modify config]    new-full-config nueva-completa-config                      
                    new-mini-config nueva-mini-config                          
                    show-config modify-config del-config                       
 [List sockets]     route ss netstat lsof ipforwading tcpdump arp              
 [Recover fw]       fw-list fw-save fw-restore                                 
 [Auth sudo]        auth-sudo remove-sudo list-sudo                            
 [Tool icmp]        ping-ip4 ping-ip6                                          
 [Tool tcp]         trace-ip4 trace-ip6 host resolveip geoip                   
 [Version]          version upgrade dev-versions all-versions                  
 [Show]             hosts protocols services hosts.allow hosts.deny            
 [Help]             about depends examples help ayuda                          
#####  Optional /etc/fwiptables/[config.cfg]  #####
 (*) [Example]  default.cfg default-english.cfg default-spanish.cfg
email-example1.cfg ftp-example1.cfg full-wizard.cfg
games-example1.cfg irc-example1.cfg mini-wizard.cfg
printer-example1.cfg samba-example1.cfg sql-example1.cfg
ssh-example1.cfg torrent-example1.cfg vnc-example1.cfg
vpn-example1.cfg web-example1.cfg wizard.cfg
 (*) [Own]  game.cfg udp.cfg web.cfg
#####  [The examples]  #####
 [Create a new config myown.cfg]    fwiptables new-mini-config myown.cfg   
 [Launch the config myown.cfg]      fwiptables myown.cfg                   
 [List iptables rules]              fwiptables list                        

################################################## The first option

#####         [Launch guide]

  system-info: Show info system
     net-info: Show net info
  full-wizard: Asistant y launch complete firewall
  mini-wizard: Asistant y Launch simple firewall
          cli: Comand line interface with menus
          gui: Graphicall user interface

#####         [Launch iptables rules]

   eraserules: Remove the iptables rules in ipv4 and ipv6
      offline: Disconected for all servers and clients except localhost
 allpermisive: Configure a firewall very permisive
       custom: Configure one custom firewall, made for you with file.cfg
   [file.cfg]: Configure the firewall for internet with file.cfg

#####         [List iptables rules]

               [The filter table with names]
         list: List iptables filter rules input and output ipv4
      forward: List iptables filter rules foward
        list6: List iptables filter rules input and output ipv6
     forward6: List iptables filter rules forward ipv6

               [The filter table with numbers]
      listnum: List iptables filter rules input and output ipv4 in numbers
   forwardnum: List iptables filter rules foward in numbers
     listnum6: List iptables filter rules input and output ipv6 in numbers
  forwardnum6: List iptables filter rules forward ipv6 in numbers

#####         [The others tables]

      nat-ip4: List iptables nat rules from ipv4
      nat-ip6: List iptables nat rules from ipv6
   mangle-ip4: List iptables mangle rules from ipv4
   mangle-ip6: List iptables mangle rules from ipv6
      raw-ip4: List iptables raw rules from ipv4
      raw-ip6: List iptables raw rules from ipv4
 security-ip4: List iptables security rules from ipv4
 security-ip6: List iptables security rules from ipv6
     ebtables: List rules ebtables nft ethernet
    arptables: List rules arptables arp

#####         [Modify config]

       new-full-config: Create a new configfile.cfg in english
 nueva-completa-config: Create a new configfile.cfg in spanish
       new-mini-config: Create a new basic configfile.cfg in english
     nueva-mini-config: Create a new basic configfile.cfg in spanish
         modify-config: Edit one config.cfg
           show-config: Show one config.cfg
            del-config: Delete one configuration file

#####         [List sockets]

      iproute: Show net devices and ip route tables
           ss: Show net sockets with command ss
         lsof: Show net sockets with command lsof
      netstat: Show net sockets with command netstat
  ipforwading: Show kernel config about forward
      tcpdump: Listen the connections
          arp: List the last conentions arp

#####         [Recover fw]

      fw-list: Show the files firewall standar
      fw-save: Save the files in firewall standar
   fw-restore: Show howto reover files firewall standar

#####         [Auth sudo]

    auth-sudo: Permit sudo fwiptables to other choosed users
  remove-sudo: Remove sudo fwiptables to other choosed users
    list-sudo: List sudo fwiptables to other choosed users

#####         [Tool icmp]

     ping-ip4: Do a one ping with to one host with ipv4 icmp
     ping-ip6: Do a one ping with to one host with ipv6 icmp

#####         [Tool tcp]

    trace-ip4: Trace route a one host with ipv4 tcp
    trace-ip6: Trace route a one host with ipv6 tcp
         host: Resolve one host
    resolveip: Resolve one host and viceversa
       geo-ip: Locate a one host or ip

#####         [Version]

      version: Info version program from fwiptables
      upgrade: Upgrade fwiptables at the latest version
 dev-versions: Version in development from fwiptables
 all-versions: All versions from fwiptables

#####         [Show]

        hosts: show /etc/hosts
   protocolos: show /etc/protocols
     services: show /etc/services
  hosts.allow: show /etc/hosts.allow
   hosts.deny: show /etc/hosts.deny

#####         [Help]

        about: About the fwiptables
      depends: Show depends for fwiptables
     examples: Regen examples for fwiptables
         help: Show this help in english
        ayuda: Show this help in spanish

################################################## The second option: (optional)

    if launch without specific the config it takes default.cfg
    you can  modify and create the files in the folder /etc/fwiptables

################################################## Examples

 fwiptables custom server-example1.cfg     [Configure firewall custom]
 fwiptables eraserules                     [Remove iptables rules]
 fwiptables list                           [List iptables rules]
 fwiptables help                           [Show this help in english]

################################################## Examples of variables to the configs files, default.cfg

#####             ###  Necesary options .......... .......... ..........  
#####             ###  the iptables firewall netfilter, choose one or two 
allow_legacy= ;             ###  launch xtables, void to yes or type no 
allow_nft=no ;             ###  launch neftables, void to yes or type no 
#####             ###  ip protocol, modify with void or no 
allow_ipv4= ;             ###  void to config firewall with ipv4 or no to dont configure ipv4  
allow_ipv6=no ;             ###  void to config firewall with ipv6 or no to dont configure ipv6  
#####             ###  Client ports, add with "," and join ranges with ":" 
client_tcp="http,https,ssh,git" ;             ###  tcp ports for client 
client_udp="domain,bootpc,ntp,https" ;             ###  udp ports for client 
#####             ###  Server ports, add with "," and join ranges with ":" 
server_tcp=""  ;             ###  tcp ports for server 
server_udp=""  ;             ###  udp ports for server 
#####             ###  Selective Input state 
input_state="-m state --state NEW,RELATED,ESTABLISHED" ;             ### void for all or -m state --state new,related,established,untracked,invalid 
#####             ###  no or void to works with only output rules 
only_output="" ;             ###  void, the rules are only to output in filter, or no 
#####             ###  Optional options .......... .......... .......... 
#####             ###  Allow Other Options,  modify with void, or no 
allow_bandwidth_input=no ;             ###  void to limit bandwidth input in kbits/sec or no 
allow_bandwidth_output=no ;             ###  void to limit bandwidth output in kbits/sec or no 
allow_ping_send=no ;             ###  void to allow send pings, and no to drop send pings 
allow_ping_recive=no ;             ###  void to allow recive pings, and no to drop recive pings 
allow_log_tcp=no ;             ###  void to tcp log, and no to do not log tcp 
allow_log_udp=no ;             ###  void to udp log, and no to do not log udp 
allow_forwading=no ;             ###  void to allow ip forward, and no to drop forward ip 
allow_nat=no ;             ###  void to do NAT masquerade to default route, or no 
allow_vpn=no ;             ###  void to allow some exceptional host or no 
allow_blacklist=no ;             ###  void to drop some excepcional host or no 
allow_output_uid=no ;             ###  void to allow excepcional user or no 
allow_output_gid=no ;             ###  void to allow excepcional group or no 
allow_others_protocols=no ;             ###  void to allow other protocol ip excepcional or no 
#####             ###  Other Options, add with "," and join ranges with ":" 
bandwidth_input="12512"             ###  max input bandwidth in kbits/sec 
bandwidth_output="512"             ###  max output bandwidth in kbits/sec 
log_udp="" ;             ###  the udp ports to log 
log_tcp="ssh" ;             ###  the tcp ports to log 
vpn="sourceforge.net,wesnoth.org" ;             ###  allow this excepcitonal host 
blacklist="" ;             ###  drop this excepcional host 
output_uid="root" ;             ###  allow out packages excepcional from this user 
output_gid="root" ;             ###  allow out packages excepcional from this group 
others_protocols="icmp,igmp" ;             ###  allow others protocols from /etc/protocolos 
#####             ###  Net to connect like client or server 
net_ipv4_client=0/0  ;              ###  the net to client ipv4, all is 0/0  
net_ipv4_server=0/0  ;              ###  the net to server ipv4, all is 0/0 
net_ipv6_client=::/0 ;              ###  the net to client ipv6, all is ::/0 
net_ipv6_server=::/0 ;              ###  the net to server ipv6, all is ::/0 

 fwiptables notes:

################################################## [only_output]

     With [only_output] rules is more practical the firewall

##################################################  [vpn]

     Host [vpn] excepcionals hosts has conection allowed in firewall

##################################################  [blacklist]

     Host [blacklist] excepcionals hosts has conection dropped in firewall

##################################################  [uid and/or gid excepcional]

     User and/or group excepcional have output conection allowed in firewall

##################################################  [Two iptables netftilter]

     iptables-legacy   is    support for xtables 
     iptables-nft      is    support for neftables 

##################################################  [client firewall needs in udp ports]

     This port is necesary to update the date  : ntp
     This port is necesary to dhcp and get ip  : bootpc
     This port is necesary to domain resolver  : domain

##################################################  [Ipv6 needs protocols]

     Necesary protocol: ipv6-icmp
     Ipv6 works too with: ipv4 procotols

##################################################  [License]

  Download the latest version Fran FireWall iptables: fwiptables from sourceforge
  https://sourceforge.net/projects/f-iptables/files/latest/download
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.


     *****     fwiptables roadmap     *****

     *****     Version actual: 213

roadmap.txt - crear roadmap.txt - ok 193
cli - subir la opcion de fw-recover desde la opcion 600 del cli - ok 193
fw-save - guardar el archivo desde la misma linea de comandos - ok 193
new-config - generar archivo desde la miema linea de comandos - ok 193
nueva-config - generar archivo desde la misma linea de comandos - ok 193
rename-config - renombrar archivo desde la misma linea de comandos - ok 193
clone-config - clonar archivo desde la misma linea de comandos - ok 193
remove-sudo - añadir la opcion remove sudo - ok 193 
upgrade - cambiarlo de categoria a categoria version - ok 193
web-upgrade - modificar - ok 193
gui - new-config modify - ok 194
gui - nueva-config modify - ok 194
gui - clone-config modify - ok 194
gui - modify-config modify - ok 194
rename-config - modify - ok 193
clone-config - modify - ok 193
auth-sudo - modify - ok 194
gui - modify-config - ok 194
command line - rediseño de apariencia inicial - ok 194
command line - eliminados lineas en blanco con "echo" - ok 194
command line - modify forwading - ok 194
host - create host option - ok 194
resolveip - create resolveip option - ok 194
help - completa y modifica - ok 194
ayuda - completa y modifica - ok 194
all-versions - añadir - ok 195
help - añadir - ok 195
ayuda - añadir - ok 195
geoip - añadir - ok 195
variables - allow_owner_uid - ok 195
command line - rediseño de aspecto - ok 195
cli - recursive - ok 195
gui - recursive - ok 195
command line - modifica util icp  y util tcp - ok 196
ebtables - añade la opcion - ok 197
mini-wizard - añade la opcion - ok 197
cli - modifica util icmp y util tcp - ok 197
gui - modifica launch-mini - ok 197
gui - modifica util icmp y util tcp - ok 197
cli - caso null redefine una nueva variable - ok 199
gui - caso null redefine una nueva variable - ok 199
wizard - lanzar reglas - ok 198
cli - comprobar - ok 198
gui - comprobar - ok 198
arptables - añade la opcion - ok 199
fwiptables - variables de iptables legacy y nft - ok 200
ejecutables - autorecoger las rutas de los ejecutables y poner los programas con variables - ok 201
upgrade - corregir - ok 201
web-upgrade - corregir - ok 201
ayuda - añadir - ok 201
help - añadir - ok 201
linea de comando - no pregunta, recoge variables - ok 202
limpieza de codigo - ok 202
eliminar clone-config - ok 202
eliminar rename-config - ok 202
cli - corregir - ok 202
gui - corregir - ok 202
variable only_output - añadir regla para localhost - ok 202
verbose cliente y servidor - quitar un retorno de carro - ok 202
verbose cliente y servidor - añadir variable only_output - ok 202
mini-wizard - ampliar a variable only_output - ok 203
only_output - por defecto - ok 203
visual - pequeños cambios - ok 203
profile - añade source /etc/profile al script fwiptables - ok 203
codigo - añadir localhost a ipv6 - ok 203
variables - variables autoinstalacion  para default example1 del castellano y del ingles - ok 204
server - para wizard y mini-wizard - ok 204
ejemplos - cambios en udp de 60000 a 65000 - ok 204
codigo - añadir comentarios en castellano - ok 204
nueva-mini-config - añadir - ok 205
nueva-new-config - añadir - ok 205
gui - nueva apariencia - ok 206
server - lanza server con: fwiptables config.cfg - ok 207
ejemplos - añadir a udp https: domain,bootpc,ntp,https - ok 207
ejemplos - only_input="" - ok 208
velocidad - poder limintarla - ok 208
server y cliente - cambiados a custom - ok 208
cfg - valida como primer parametro - ok 208
cambios en ayuda y help - ok 208
cambios en default y wizard - ok 209
cambios de apariencia - ok 210
system-info - ok 210
help - modificado - ok 211
ayuda - modificado - ok 211
route - arreglado - ok 211
uname - "uname -a" pasa a "uname -srmon" - ok 211
blacklist - nueva variable - ok 211
system-info - actualizado - ok 212
net-info - mostrar sockets a la escucha - ok 212
show - services - ok 212
show - protocols - ok 212
show - hosts - ok 212
code - actualizar blacklist - ok 212
code - actualizar vpn -  ok 212
code - actualizar - ok 212
show - hosts.allow - ok 212
show - hosts.deny - ok 212
help - acutalizado - ok 212
ayuda - actualizado - ok 212
cli - actualizado - ok 212
offline - actualizado - ok 213
allpermisive - actualizado - ok 213
custom - actualizado - ok 213
