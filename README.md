# KU CyberSecurity BootCamp

![](images/CareerServicesLogo.PNG "Career Services")

[Link to Career Services Online Events Hub](https://careerservicesonlineevents.splashthat.com/)

##### How to start your local git repository from vscode:

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
# you should see a pop-up asking you to login with your GitLab credentials (i.e. email account and password)
# After typing it in and clicking ok, you'll see some things scroll telling you how well the copy is going.
# your done!
# as new content is available, you can just move to this directory with the command:
cd $home\documents\ClassRepository
# and to get the latest copy of what is available just ask git to sync the changes for you
git pull
# let the instructional staff know if you have any questions :)
```

Class Name: # KU-EDW-CYBER-PT-03-2020-U-C