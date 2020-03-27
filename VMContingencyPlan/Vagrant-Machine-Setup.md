# Virtual Machine Download

You will use a local virtual machine for several units of our program, **beginning with Terminal Week and through the Linux weeks.**

You will first download downloaded and install Virtual Box. You may have done this already during pre-work. If you haven't, that will be the first step. 

Following that you will install a tool called Vagrant, which you'll use to download the VM. 

## Downloading & Running the Machine
### Windows and Mac Users

Windows users will use Powershell

Mac users will use Terminal 

### Virtual Box

Download and install `Virtual Box`, : https://www.virtualbox.org/wiki/Downloads

### Vagrant

Download and install the latest version of `Vagrant`, currently `2.2.7`: https://www.vagrantup.com/downloads.html

Select the appropriate  installer for your operating system:

The installer should save to your Downloads directory. 

Open the Downloads folder, then double-click the installer. 

This will install Vagrant on your system.After Vagrant is installed, run the script in your student repo. Specifically:

- `vagrant-linux.sh` (Mac)
- `vagrant-windows.ps1` (Windows) 


Open **Powershell** (Windows) 

Run: `.\VMContingencyPlan\VagrantSetup\vagrant-windows.sh --create`

Open **Terminal** (Mac).

Run: `bash ~/VMContingencyPlan/VagrantSetup/vagrant-linux.sh --create`

This will download and start the VM we will be using henceforth. It will automatically appear in a GUI after it is downloaded and started.Jf you have trouble running the script, notify your instructor or a TA for help

