### Vagrant Troubleshooting

## Potential Issues

Overall, this VM tends to run smoothly on most peoples' computers. However, students with older or weaker machines may find that it lags a little bit.

In addition to that, be aware that students work almost exclusively on the Terminal during the Linux units. As such, they do _not_ need to open the GUI in Virtual Box to use the machine. Instead, they can simply run `vagrant ssh` from within the directory containing their `Vagrantfile` to access the VM's command line. Avoiding the GUI tends to save some CPU cycles, and often helps with lag.

These are the commands to do this:

  ```bash
  # Ensure you're in the folder containing the `Vagrantfile`
  $ cd ~/Documents/Cybersecurity-Bootcamp

  # Connect to the VM's command line
  $ vagrant ssh
  ```

If this still does not lead to a performance improvement, modifications can be made to the `Vagrantfile` to reduce the amount of RAM it consumes, which — counterintuitively — can sometimes improve performance if you're using `vagrant ssh` instead of the GUI. In this case, reach out to the Bootcamp team for direct troubleshooting support. 

## Useful Troubleshooting Commands

Students do not need to learn the commands below as part of the course, but they are useful for instructional staff to keep in mind should anyone encounter errors.

All of the commands below must be run from the directory containing the `Vagrantfile`, which we'll assume to be `~/Documents/Cybersecurity-Bootcamp`.

  ```bash
  # Prints whether the machine is on or off
  $ vagrant status

  # Stops the machine, if it's on
  $ vagrant halt

  # Starts the machine, if it's off
  $ vagrant up

  # Stops and destroys the existing machine 
  # This eliminates all data on the VM, so be careful
  # But, keep it in mind as a "last resort" fix for misbehaving VMs
  $ vagrant destroy --force

  # Connect to the VM's command line without opening the GUI
  $ vagrant ssh
  ```

Again — after running `vagrant up` the first time, students can manage the machine through Virtual Box, thus allowing them to avoid running `vagrant` commands on the CLI entirely if they wish.