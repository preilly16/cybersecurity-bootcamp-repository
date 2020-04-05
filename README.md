# Course Resources
- [Career Services Online Events Hub](https://careerservicesonlineevents.splashthat.com/)

# Cheat
- [Command Line CheatSheet Tool](https://github.com/cheat/cheat)
    ### How to Install Cheat On Windows
    Run the install.ps1 located [here](/Tools/Cheat/)

    ### How to Install Cheat On Linux
    - PreRequisites:
      - Install Windows Subsystem for Linux
      - in powershell type `wsl` to enter bash on linux
    1. go to https://github.com/cheat/cheat/releases
    2. Download cheat-linux-amd64.gz
    3. run `gunzip ./cheat-linux-amd64.gz`
    4. run `sudo mkdir /opt/cheat/`
    5. run `sudo cp ./cheat-linux-amd64.gz /opt/cheat/cheat`
    6. run `sudo PATH=/opt/cheat:$PATH`
    7. run `mkdir -p ~/.config/cheat && cheat --init > ~/.config/cheat/conf.yml`


# Tools
- [Chocolatey Package Manager for Windows](https://chocolatey.org/)
- [BeyondCompare (Diff Gui)](https://www.scootersoftware.com/download.php)
- [ClipboardPath (Simple, but useful)](http://stefan.bertels.org/en/clipboardpath)
- [Easy Password Bypass](https://www.piotrbania.com/all/kon-boot/)
- [Powershell Modules](https://www.powershellgallery.com/)
- [Libre Office](<https://www.libreoffice.org/download/download/>)
    - Libre, is a free, open-source version of Microsoft Office. 
    - (Use if you do not already have Microsoft Office)
    - Download LibreOffice 6.2.8, as it's a more stable version of the software. 
    - The download should only take a few minutes, and then you will be able to open up spreadsheets.

# Web Resources
- [RegexTester](https://regexr.com/)
- [Why crack hashes if someone already did it for us?](https://hashkiller.io/listmanager)
- [SSL/TLS Security Checker](https://www.ssllabs.com/ssltest/index.html)
- [Vendor Visio Stencils](http://www.visiocafe.com/index.htm)
- [VirusTotal on steroids](https://www.hybrid-analysis.com/)
- [Security Header Checker](https://securityheaders.com/)
- [Work for a bank or credit union? Here is a nice resource for policy examples.](https://www.cbancnetwork.com/)
- [The Exploit Database](https://www.exploit-db.com/)
- [Test what your proxy blocks](https://testdatabasewebsense.com/)

# Text Editors
- [VSCode (IDE)](https://code.visualstudio.com/)
- [Sublime Text 3](https://www.sublimetext.com/3)
- [Atom](https://atom.io/)

# Awareness
- [Password Security](https://howsecureismypassword.net/)

# Learn Computer and Security Stuff
- [Pentesting Practice Labs](https://www.amanhardikar.com/mindmaps/Practice.html)
- [Free Hacking Course](https://www.offensive-security.com/metasploit-unleashed/)
- [Web Development Testing and Inspiration](https://codepen.io/)
- [Computer Science Papers](https://paperswelove.org/)
- [How Does AES Work?](http://www.formaestudio.com/rijndaelinspector/archivos/rijndaelanimation.html)

# Other People's Lists
- [Web Hacking Starting Points](https://github.com/infoslack/awesome-web-hacking)
- [AWS Security](https://github.com/toniblyx/my-arsenal-of-aws-security-tools)
- [InfoSec Reference that doesn't suck](https://github.com/rmusser01/Infosec_Reference)
- [Threat Intelligence Resources](https://github.com/hslatman/awesome-threat-intelligence)
- [Public Data Sets](https://github.com/awesomedata/awesome-public-datasets)
- [Interview Questions](https://github.com/MaximAbramchuck/awesome-interview-questions)

# Book List
- The Goal by Eliyahu Goldratt
- The Phoenix Project by Gene Kim
- The Unicorn PRoject by Gene Kim

# God Mode Folder for Windows
Right click on your desktop > New Folder
Name the folder
`GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}`

# Bash in Windows
Open Powershell as Administrator (right click on powershell and choose run as administrator)
Run the following command:
`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
Once this command completes, the next time you open powershell, you can type `wsl` (and press enter) and then you will have bash in your powershell window.

# Git Configuration
git config --global core.editor "code --wait"
git config --global diff.tool "vscode"
git config --global difftool.vscode.cmd  'code --wait --diff $LOCAL $REMOTE'

# Course Overview

## Week 1: Security 101
- [Homework Assignment](01-Cybersecurity-101/Homework/)
- [Day 1](01-Cybersecurity-101/Day-1/)
- [Day 2](01-Cybersecurity-101/Day-2/)
- [Day 3](01-Cybersecurity-101/Day-3/)

## Week 2: Governance, Risk, and Compliance

- [Homework Assignment](/02-GRC/Homework/)
- [Day 1](02-GRC/Day-1/)
- [Day 2](02-GRC/Day-2/)
- [Day 3](02-GRC/Day-3/)

## Week 3: Introduction to Terminal and Bash

- [Homework Assignment](03-Terminal-and-Bash/Homework/)
- [Day 1](03-Terminal-and-Bash/Day-1/)
- [Day 2](03-Terminal-and-Bash/Day-2/)
- [Day 3](03-Terminal-and-Bash/Day-3/)

## Week 4: Linux System Administration Fundamentals

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 5: Linux Archiving and Logging Data

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 6: Bash Scripting and Programming

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 7: Windows Administration and Hardening

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 8: Networking Fundamentals

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 9: Networking Fundamentals and CTF Review

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 10: Cryptography

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 11: Network Security

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 12: Cloud Security and Virtualization

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]
- Day 4

## Week 13: Project ## Week 1

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 14: Web Development

- [Homework Assignment]
- [Day 1]
- [Day 2]

## Week 15: Web Vulnerabilities and Hardening

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 16: Penetration Testing 1

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 17: Penetration Testing 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 18: SIEMs

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 19: SIEMs 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 20: Project ## Week 2

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 21: Digital Forensics

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 22: Test Prep and Review

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 23: Final Projects

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]

## Week 24: Final Projects

- [Homework Assignment]
- [Day 1]
- [Day 2]
- [Day 3]


# Help
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





#### Class Name: # KU-EDW-CYBER-PT-03-2020-U-C