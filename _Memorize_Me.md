# RFC-1918
## Internal/Private IP Address Ranges
- 10.0.0.0/8
  - 10.0.0.0-10.255.255.255
- 172.16.0.0/12
  - 172.16.0.0-172.31.255.255
- 192.168.0.0/16
  - 192.168.0.0-192.168.255.255

## Loopback
127.0.0.0/24
  - 127.0.0.0-127.0.0.255

# RFC-6335
## Port Number Ranges
| Port Range | Description |
|---|---|
| 0-1023 | Well Known Ports, also known as System Ports |
| 1024-49151 | Registered Ports, also known as User Ports |
| 49152-65535 | Ephemeral or Dynamic Ports, also known as the Private Ports |


# Port Numbers That Matter

| Port Number | Service |
|---|---|
| 20-21 | FTP |
| 22 | SSH |
| 23 | TelNet |
| 25 | SMTP |
| 53 | DNS |
| 67-68 | DHCP |
| 80 | HTTP |
| 88 | Kerberos |
| 123 | NTP |
| 135 | Microsoft RPC |
| 137-139 | NetBIOS |
| 161-162 | SNMP |
| 389 | LDAP |
| 443 | HTTPS |
| 445 | Microsoft DS(SMB/CIFS) |
| 464 | Kerberos |
| 465 | SMTP over SSL |
| 500 | ISAKMP |
| 514 | Syslog |
| 587 | SMTP over TLS |
| 636 | LDAPS |
| 873 | rsync |
| 989-990 | FTPS |
| 995 | POP3 over SSL |
| 1433-1434 | Microsoft SQL |
| 1812-1813 | Radius |
| 2222 | SSH |
| 3128 | HTTP Proxy |
| 3268-3269 | Windows Global Catalog |
| 3389 | Microsoft RDP |
| 4444 | Meterpreter |
| 5900 | VNC |
| 5985 | WS-MAN/PSRemoting over HTTP |
| 5986 | WS-MAN/PSRemoting over HTTPS |
| 8080 | HTTP Proxy |
| 8081 | HTTP Proxy |
| 8443 | HTTPS |
| 9389 | Active Directory WebServices |