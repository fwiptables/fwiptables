[Fran FireWall iptables] [version 216]
##################################################
 [Launch guide]      system-info net-info full-wizard mini-wizard cli gui   
 [Launch rules]      eraserules offline allpermisive custom [config.cfg]    
 [List rules]        list forward list6 forward6 nat-ip4 nat-ip6            
                     listnum forwardnum listnum6 forwardnum6                
 [Modify config]     new-full-config nueva-completa-config                  
                     new-mini-config nueva-mini-config                      
                     show-config modify-config del-config                   
 [List sockets]      route ss netstat lsof ipforwading tcpdump arp          
 [Recover fw]        fw-list fw-save fw-restore                             
 [Tool icmp]         ping-ip4 ping-ip6                                      
 [Tool tcp]          trace-ip4 trace-ip6 host resolveip geoip               
 [Auth sudo]         auth-sudo remove-sudo list-sudo                        
 [Show etc]          hosts protocols services hosts.allow hosts.deny        
 [Show log]          log-fwiptables log-sshd log-search log-search-r        
 [Version]           version upgrade dev-versions all-versions              
 [Help]              about depends examples options opciones help ayuda     
 [||Own  cfg||]
 cliente.cfg servidor.cfg
 [||Examples||]
 [Create a new config myown.cfg]    fwiptables new-mini-config myown.cfg    
 [Launch the config myown.cfg]      fwiptables custom myown.cfg             
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

#####         [Tool icmp]

     ping-ip4: Do a one ping with to one host with ipv4 icmp
     ping-ip6: Do a one ping with to one host with ipv6 icmp

#####         [Tool tcp]

    trace-ip4: Trace route a one host with ipv4 tcp
    trace-ip6: Trace route a one host with ipv6 tcp
         host: Resolve one host
    resolveip: Resolve one host and viceversa
       geo-ip: Locate a one host or ip

#####         [Auth sudo]

    auth-sudo: Permit sudo fwiptables to other choosed users
  remove-sudo: Remove sudo fwiptables to other choosed users
    list-sudo: List sudo fwiptables to other choosed users

#####         [Version]

      version: Info version program from fwiptables
      upgrade: Upgrade fwiptables at the latest version
 dev-versions: Version in development from fwiptables
 all-versions: All versions from fwiptables

#####         [Show etc]

        hosts: show /etc/hosts
   protocolos: show /etc/protocols
     services: show /etc/services
  hosts.allow: show /etc/hosts.allow
   hosts.deny: show /etc/hosts.deny

#####         [Show log]

        hosts: search the logs from sudo fwiptables for /var/log
   protocolos: search the logs from sshd for /var/log
     services: search the logs from a pattern for /var/log
     services: search the recursives logs from a pattern for /var/log

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

#####             ###   .......... BEGIN Necesary options .......... ..........  
#####             ###  the iptables firewall netfilter, choose one or two 
allow_legacy= ;                 ###  launch xtables, void to yes or type no 
allow_nft=no ;                  ###  launch neftables, void to yes or type no 
#####             ###  ip protocol, modify with void or no 
allow_ipv4= ;                   ###  void to config firewall with ipv4 or no to dont configure ipv4  
allow_ipv6=no ;                 ###  void to config firewall with ipv6 or no to dont configure ipv6  
#####             ###  Client ports, add with "," and join ranges with ":" 
client_tcp="http,https,ssh,git" ;                  ###  tcp ports for client 
client_udp="domain,bootpc,ntp,https" ;             ###  udp ports for client 
#####             ###  Server ports, add with "," and join ranges with ":" 
server_tcp=""     ;                ###  tcp ports for server 
server_udp=""     ;                ###  udp ports for server 
logserver_tcp=""  ;                ###  the tcp ports to log server 
logserver_udp=""  ;                ###  the udp ports to log server 
#####             ###  Selective Input state 
input_state="-m state --state new,related,established" ;             ###  void for all or -m state --state new,related,established,untracked,invalid 
#####             ###  void to works with only output rules or no 
only_output="" ;                        ###  void when the rules are only to output in filter or no 
#####             ###  .......... END Necesary options .......... ..........  
#####             ###  .......... BEGIN Optional options .......... .......... 
#####             ###  Allow Other Options,  modify with void, or no 
allow_bandwidth_input=no ;              ###  void to limit bandwidth input in kbits/sec for all sources or no 
allow_bandwidth_output=no ;             ###  void to limit bandwidth output in kbits/sec for each destination or no 
allow_ping_send=no ;                    ###  void to allow send pings, and no to drop send pings 
allow_ping_recive=no ;                  ###  void to allow recive pings, and no to drop recive pings 
allow_forwading=no ;                    ###  void to allow ip forward, and no to drop forward ip 
allow_nat=no ;                          ###  void to do NAT masquerade to default route, or no 
allow_vpn=no ;                          ###  void to allow some exceptional host or no 
allow_blacklist=no ;                    ###  void to drop some excepcional host or no 
allow_output_uid=no ;                   ###  void to allow excepcional user or no 
allow_output_gid=no ;                   ###  void to allow excepcional group or no 
allow_others_protocols=no ;             ###  void to allow other protocol ip excepcional or no 
#####             ###  Other Options, add with "," and join ranges with ":" 
bandwidth_input="12512";             ###  max input bandwidth in kbits/sec for all 
bandwidth_output="512" ;             ###  max output bandwidth in kbits/sec for ip 
vpn="wesnoth.org" ;                  ###  allow this excepcitonal host 
blacklist=""      ;                  ###  drop this excepcional host 
output_uid="root" ;                  ###  allow out packages excepcional from this user 
output_gid="root" ;                  ###  allow out packages excepcional from this group 
others_protocols="icmp,igmp" ;             ###  allow others protocols from /etc/protocolos 
#####             ###  Net to connect like client or server 
net_ipv4_client=0/0  ;              ###  the net to client ipv4, all is 0/0  
net_ipv4_server=0/0  ;              ###  the net to server ipv4, all is 0/0 
net_ipv6_client=::/0 ;              ###  the net to client ipv6, all is ::/0 
net_ipv6_server=::/0 ;              ###  the net to server ipv6, all is ::/0 
#####             ###  .......... END Optional options .......... .......... 

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

  Download the latest version [Fran FireWall iptables] from sourceforge
  https://sourceforge.net/projects/f-iptables/files/latest/download
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.

