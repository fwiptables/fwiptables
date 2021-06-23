##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.228]
################################################## [ help ]


#####         [Launch iptables rules]

   eraserules: Remove the iptables rules in ipv4 and ipv6
      offline: Disconected for all servers and clients except localhost
 allpermisive: Configure a firewall very permisive
       custom: Configure one custom firewall, made for you with file.cfg
   [file.cfg]: Configure the firewall with file.cfg and show info
        reset: Reset counter rules

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

#####         [List the others tables]

      nat: List iptables nat rules from ipv4
      nat6: List iptables nat rules from ipv6
   mangle-ip4: List iptables mangle rules from ipv4
   mangle-ip6: List iptables mangle rules from ipv6
      raw-ip4: List iptables raw rules from ipv4
      raw-ip6: List iptables raw rules from ipv4
 security-ip4: List iptables security rules from ipv4
 security-ip6: List iptables security rules from ipv6
     ebtables: List rules ebtables nft ethernet
    arptables: List rules arptables arp

#####         [tool config]

       new-full-config: Create a new configfile.cfg in english
 nueva-completa-config: Create a new configfile.cfg in spanish
       new-mini-config: Create a new basic configfile.cfg in english
     nueva-mini-config: Create a new basic configfile.cfg in spanish
         modify-config: Edit one config.cfg
           show-config: Show one config.cfg
            del-config: Delete one configuration file

#####         [Launch guide]

  system-info: Show info system
     net-info: Show net info
  full-wizard: Asistant y launch complete firewall
  mini-wizard: Asistant y Launch simple firewall
          cli: Comand line interface with menus
          gui: Graphicall user interface

#####         [List sockets]

        route: Show net devices and ip route tables
           ss: Show net sockets with command ss
         lsof: Show net sockets with command lsof
      netstat: Show net sockets with command netstat
  ipforwading: Show kernel config about forward
      tcpdump: Listen the connections
          arp: List the last conentions arp

#####         [Tool fw]

       fw-list: Show the files firewall standar
       fw-save: Save the files in firewall standar
    fw-restore: Show info to recover the files firewall standard
     fw-actual: Show the content of the firewall standard actual

#####         [Tool icmp]

     ping-ip4: Do a one ping with to one host with ipv4 icmp
     ping-ip6: Do a one ping with to one host with ipv6 icmp

#####         [Tool tcp]

    trace-ip4: Trace route a one host with ipv4 tcp
    trace-ip6: Trace route a one host with ipv6 tcp
         host: Resolve one host
    resolveip: Resolve one host and viceversa
       geo-ip: Locate a one host or ip
      ntpdate: update the date from ntp server

#####         [Tool nmap]

     tcp-scan: scan a host/mask per tcp protocol
     syn-scan: scan a host/mask per syn socket
     fin-scan: scan a host/mask per fin socket
     udp-scan: scan a host/mask per udp protocol
    ping-scan: scan a host/mask per ping udp

#####         [Tool sudo]

    auth-sudo: Permit sudo to other choosed users
  remove-sudo: Remove sudo to other choosed users
    list-sudo: List sudo to other choosed users

#####         [Tool Install]

      install: install this program actual
howto-upgrade: Howto install the latest version
 net-upgrade:  Upgrade at the latest version

#####         [Show etc]

        hosts: show /etc/hosts
   protocolos: show /etc/protocols
     services: show /etc/services
  hosts.allow: show /etc/hosts.allow
   hosts.deny: show /etc/hosts.deny

#####         [Show log]

     log-sudo: search the logs from sudo for /var/log
     log-sshd: search the logs from sshd for /var/log
log-logserver: search the logs from net packages with this firewall
   log-search: search the logs from a input pattern for /var/log

#####         [Show about]

          about: About info
        version: Info version program actual
        depends: Show depends
       examples: Show examples 

#####         [Show help]

 configurations: config example with comments in english
 configurations: config example with comments in spanish
      list-help: Show list-help
           help: Show help in english
          ayuda: Show help in spanish

################################################## The second option: (optional)

    if launch without specific the config it takes /etc/fwiptables/default-full-english.cfg
    you can  modify and create the files in the folder /etc/fwiptables

################################################## Examples

 fwiptables custom server-example1.cfg     [Configure firewall custom]
 fwiptables eraserules                     [Remove iptables rules]
 fwiptables list                           [List iptables rules]
 fwiptables help                           [Show this help in english]

################################################## Examples of variables to the configs files

# Fran FireWall fwiptables Generator from fwiptables config file
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
##### END NECESARY # # _ _ _ _ _ _ _ ##### .......... END Necesary options .......... .......... #
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
allow_forwading=no # _ _ _ _ _ _ _ ##### void to allow ip forward or no
allow_nat=no # _ _ _ _ _ _ _ ##### void to do NAT masquerade to default route or no
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

  Download the latest version Fran FireWall fwiptables Generator from sourceforge
  https://sourceforge.net/projects/f-iptables/files/latest/download
  Copyleft, without warranty, free to copy, free to modify, gnu license gpl.

