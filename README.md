# KU CyberSecurity BootCamp

## Links you'll Need
[Career Services Online Events Hub](https://careerservicesonlineevents.splashthat.com/)

[Libre Office](<https://www.libreoffice.org/download/download/>)

    Libre, a free, open-source version of Microsoft Office. 
    (Use if you do not already have Microsoft Office)
    Download LibreOffice 6.2.8, as it's a more stable version of the software. 
    The download should only take a few minutes, and then you will be able to open up spreadsheets.

# Week 1: Security 101
- [Homework Assignment](01-Cybersecurity-101/Homework/)
- [Day 1](01-Cybersecurity-101/Day-1/)
- [Day 2](01-Cybersecurity-101/Day-2/)
- [Day 3](01-Cybersecurity-101/Day-3/)

# Week 2: Governance, Risk, and Compliance

- [Homework Assignment](/02-GRC/Homework/)
- [Day 1](02-GRC/Day-1/)
- [Day 2](02-GRC/Day-2/)
- [Day 3](02-GRC/Day-3/)

# Week 3: Introduction to Terminal and Bash

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 4: Linux System Administration Fundamentals

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 5: Linux Archiving and Logging Data

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 6: Bash Scripting and Programming

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 7: Windows Administration and Hardening

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 8: Networking Fundamentals

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 9: Networking Fundamentals and CTF Review

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 10: Cryptography

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 11: Network Security

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 12: Cloud Security and Virtualization

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]
- Day 4

# Week 13: Project # Week 1

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 14: Web Development

- [Homework Assignment]
- [Day 1]
- [Day 2]

# Week 15: Web Vulnerabilities and Hardening

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 16: Penetration Testing 1

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 17: Penetration Testing 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 18: SIEMs

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 19: SIEMs 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 20: Project # Week 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 21: Digital Forensics

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 22: Test Prep and Review

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 23: Final Projects

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

# Week 24: Final Projects

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]


## How to start your local git repository from vscode:

```powershell
# lets move to my documents
cd $home\documents

# your shell should say something like 
# PS C:\users\john\documents>
# This means we're in the right spot.

# Before we copy the class repository we want to make sure that our powershell session is using the latest version of TLS
# This means the encryption will be stronger and will prevent any errors when attempting to download the content.

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Next, lets create a copy of our class repository 
# and save it to a folder named 'ClassRepository'

git clone https://ku.bootcampcontent.com/ku-coding-boot-camp/ku-edw-cyber-pt-03-2020-u-c.git ./ClassRepository

# you should see a pop-up OR a prompt in your terminal asking you to login with your GitLab credentials (i.e. GitLab username and password)
# After typing it in and clicking ok, you'll see some things scroll telling you how well the copy is going.
# your done!

# as new content is available, you can just move to this directory with the command:
cd $home\documents\ClassRepository

# and to get the latest copy of what is available just ask git to sync the changes for you
git pull

# let the instructional staff know if you have any questions :)
```





Class Name: # KU-EDW-CYBER-PT-03-2020-U-C