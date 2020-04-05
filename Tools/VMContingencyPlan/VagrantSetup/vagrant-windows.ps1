# Verify Vagrant installed properly
vagrant --version

# Reset directory
Set-Location $home
Write-Host "In $home..."

# Create a dedicated folder for the VM
$LINUX_DIR="$HOME/Documents/Cybersecurity-Bootcamp/Linux-Module"
New-Item $LINUX_DIR -ItemType Directory -ErrorAction SilentlyContinue 
Copy-Item -Path $psscriptroot/Vagrantfile -Destination $LINUX_DIR -ErrorAction SilentlyContinue

# Launch VM
Set-Location $LINUX_DIR
Write-Host "Bringing up machine..."
vagrant up

# Verify that the machine is up
vagrant status

# Remind user to open VirtualBox GUI to see the machine there, as well
start-job -ScriptBlock {
    $message = 'Next, open up Virtual Box to see this VM running there, as well.
On Windows, press the Windows Key; type "VirtualBox"; and hit ENTER.
On Mac, press Cmd + Space; type "VirtualBox" and hit ENTER.
And thats it - enjoy!'
    Add-Type -AssemblyName PresentationFramework 
    [System.Windows.MessageBox]::Show($message) 
} | out-null 
#>