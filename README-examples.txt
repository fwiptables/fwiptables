##### [Show command list-help / TYPE:] fwiptables list-help
##### [Fran FireWall fwiptables Generator] [Version 1.235]
################################################## [ examples ]

# config web example #
server_tcp=http,https ;
client_tcp=http,https ;
client_udp=domain,ntp,bootpc,http ;

# config games example #
client_udp=domain,bootpc,ntp,https,1025:65499; 
client_tcp=http,https

# config torrent example #
client_udp=domain,bootpc,ntp,https,1025:65499; 
client_tcp=http,https

# config samba example #
client_udp=domain,bootpc,ntp,https,137:139 ; 
client_tcp=http,https,ipp,microsoft-ds
server_udp=137:139 ; 
server_tcp=ssh,ipp,microsoft-ds
allow_ping_send= ; allow_ping_recive= ; 

# config vpn example #
allow_forwading= ; 
allow_vpn= ; 
vpn=wesnoth.org,sourceforge.net

# config email example #
client_tcp=http,https,rsync,ssh,pop3,pop3s,poppassd,smtp,imap2,imaps
server_tcp=ssh,http,https,rsync,ssh,pop3,pop3s,poppassd,smtp,imap2,imaps

# config ssh example #
client_tcp=http,https,printer,ipp,ssh,rsync,git
server_tcp=http,https,printer,ipp,ssh,rsync,git

# config vnc example #
client_tcp=http,https,ssh,5900:5910
server_tcp=ssh,http,https,5900:5910

# config ftp example #
client_tcp=http,https,ftp,ftp-data,ftps,gsiftp,zope-ftp
server_tcp=ssh,http,https,ftp,ftp-data,ftps,gsiftp,zope-ftp
client_udp=domain,bootpc,ntp,https,tftp
server_udp=tftp

# config printer example #
client_tcp=http,https,ipp,printer
server_tcp=ssh,http,https,ipp,printer

# config irc example #
client_tcp=http,https,ircd,ircs-u
server_tcp=ssh,http,https,ircd,ircs-u

# config sql example #
client_tcp=http,https,mysql,postgresql,mysql-proxy,ms-sql-s
server_tcp=ssh,http,https,mysql,postgresql,mysql-proxy,ms-sql-s
