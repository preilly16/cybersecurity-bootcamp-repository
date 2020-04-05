# Verify Vagrant installed properly
vagrant --version

# Reset directory
MY_HOME=$(dirname $0)
cd $MY_HOME
echo "In $MY_HOME..."

# Create a dedicated folder for the VM
LINUX_DIR="$HOME/Documents/Cybersecurity-Bootcamp/Linux-Module"
mkdir -p $LINUX_DIR
cp ./Vagrantfile $LINUX_DIR

# Launch VM
cd $LINUX_DIR
echo "Bringing up machine..."
vagrant up

# Verify that the machine is up
vagrant status

# Remind user to open VirtualBox GUI to see the machine there, as well
cat <<EOF >&1
  Next, open up Virtual Box to see this VM running there, as well.
  On Windows, press the Windows Key; type 'VirtualBox'; and hit ENTER.
  On Mac, press Cmd + Space; type 'VirtualBox' and hit ENTER.
  And that's it — enjoy!
EOF
