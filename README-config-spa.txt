##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ config-spa ]
##### Fran FireWall fwiptables Generator from fwiptables config file
##### BEGIN NECESARY # # _ _ _ _ _ _ _ ##### INICIO .......... Opciones Necesarias .......... .......... #
##### NETFILTER # # _ _ _ _ _ _ _ ##### el iptables firewall netfilter, elige uno o dos
allow_legacy= # _ _ _ _ _ _ _ ##### lanza xtables, vacio para si, o escribe no
allow_nft=no # _ _ _ _ _ _ _ ##### lanza neftables, vacio para si, o escribe no
##### PROTOCOL IP # # _ _ _ _ _ _ _ ##### procolo ip, modificar con vacio o no
allow_ipv4= # _ _ _ _ _ _ _ ##### varcio para ejecutar el firewall con ipv4 o no para no
allow_ipv6=no # _ _ _ _ _ _ _ ##### varcio para ejecutar el firewall con ipv6 o no para no
##### CLIENT PORTS# # _ _ _ _ _ _ _ ##### puertos Cliente, añadir con ',' y poner rangos con ':'
client_tcp=http,https,ssh # _ _ _ _ _ _ _ ##### puertos tcp para ser cliente
client_udp=domain,bootpc,ntp,https # _ _ _ _ _ _ _ ##### puertos udp para ser cliente
##### SERVER PORTS # # _ _ _ _ _ _ _ ##### Puertos Servidor, añadir con ',' y poner rangos con ':'
server_tcp=ssh # _ _ _ _ _ _ _ ##### puertos tcp para servidor
server_udp= # _ _ _ _ _ _ _ ##### puertos udp para servidor
logserver_tcp=ssh # _ _ _ _ _ _ _ ##### puertos tcp para logear servidor
logserver_udp= # _ _ _ _ _ _ _ ##### puertos udp para logear servidor
##### END NECESARY # # _ _ _ _ _ _ _ ##### FINAL .......... Opciones Necesarias .......... .......... #
##### BEGIN OPTIONAL # # _ _ _ _ _ _ _ ##### INICIO .......... Opciones opcionales .......... .......... #
##### choose void or no # # _ _ _ _ _ _ _ ##### Permitir Otras Opciones, modificar con vacio o no
allow_only_output=no # _ _ _ _ _ _ _ ##### vacio, reglas solo para salida o no
allow_input_state=no # _ _ _ _ _ _ _ ##### Estado de entrada selectivo o no
allow_bandwidth_input=no # _ _ _ _ _ _ _ ##### vacio para limitar ancho de banda de entrada para todas las fuentes en kbits/sec o no
allow_bandwidth_output=no # _ _ _ _ _ _ _ ##### vacio limitar ancho de banda de salida en kbits/sec por cada destino o no
allow_maxconnect_input=no # _ _ _ _ _ _ _ ##### vacio para limitar numero de conexiones simultaneas de entrada o no
allow_maxconnect_output=no # _ _ _ _ _ _ _ ##### vacio para limitar numero de conexiones simultaneas de salida o no
allow_ping_send=no # _ _ _ _ _ _ _ ##### vacio para permitir enviar ping o no
allow_ping_recive=no # _ _ _ _ _ _ _ ##### vacio para permitir recivir ping o no
allow_forwading=no # _ _ _ _ _ _ _ ##### vacio para permitir reenvio, y no para denegar reenvios
allow_nat=no # _ _ _ _ _ _ _ ##### vacio para hacer masquerade a otras redes o no
allow_vpn=no # _ _ _ _ _ _ _ ##### vacio para permitir hosts excepcionales o no
allow_blacklist=no # _ _ _ _ _ _ _ ##### vacio para denegar hosts excepcionales o no
allow_output_uid=no # _ _ _ _ _ _ _ ##### vacio permite salida de paquetes de un usuario excepcional o no
allow_output_gid=no # _ _ _ _ _ _ _ ##### vacio permite salida de paquetes de un grupo excepcional o no
allow_others_protocols=no # _ _ _ _ _ _ _ ##### vacio para permitir otro protocolo ip excepcional o no
##### Begin Variables # # _ _ _ _ _ _ _ ##### Rellena Variables #
##### Options # _ _ _ _ _ _ _ ##### Otras Opciones, añadir con , y poner rangos con :
input_state=new,related,established # _ _ _ _ _ _ _ ##### modificar con vacio o new,related,established,untracked,invalid
bandwidth_input=12512 # _ _ _ _ _ _ _ ##### maximo entrada de ancho de banda en kbit/sec para todos
bandwidth_output=512 # _ _ _ _ _ _ _ ##### maximo salida de ancho de banda en kbits/sec para cada ip
maxconnect_input=72 # _ _ _ _ _ _ _ ##### maximo numero de conexiones simultaneas de entrada
maxconnect_output=72 # _ _ _ _ _ _ _ ##### maximo numero de conexiones simultaneas de salida
vpn=wesnoth.org,sf.net # _ _ _ _ _ _ _ ##### permitir estos host excepcionales
blacklist=facebook.com,google.com # _ _ _ _ _ _ _ ##### deniega estos host excepcionales
output_uid=root # _ _ _ _ _ _ _ ##### permite salida de paquetes de este usuario excepcional
output_gid=root # _ _ _ _ _ _ _ ##### permite salida de paquetes de este grupo excepcional
others_protocols=icmp,igmp # _ _ _ _ _ _ _ ##### permitir otros protocolos desde /etc/protocols
##### NET TO CLIENT AND SERVER # # _ _ _ _ _ _ _ ##### Red para conectar como cliente o server
net_ipv4_client=0/0 # _ _ _ _ _ _ _ ##### la red cual cliente ipv4, todos es 0/0
net_ipv4_server=0/0 # _ _ _ _ _ _ _ ##### the net to server ipv4, all is 0/0
net_ipv6_client=::/0 # _ _ _ _ _ _ _ ##### the net to client ipv6, all is ::/0
net_ipv6_server=::/0 # _ _ _ _ _ _ _ ##### the net to server ipv6, all is ::/0
##### # # _ _ _ _ _ _ _ ##### .......... END Optional options .......... .......... #
