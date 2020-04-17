## Solution Guide: Introduction to Scripting

Completing this activity required the following steps:

- Creating a directory to hold your scripts in `~/Security_scripts`. Then, move into this directory.

- Writing shell script `backup.sh` to automate gzip-compressed archives and backups.

- Writing shell script `update.sh` to automate software package updates and removal.

- Writing shell script `cleanup.sh` to automate the cleanup of cached files and generate a report of system resource usage.

- Testing the scripts by running them with bash using the `./<name of the script>.sh` command.


Begin by creating a directory to hold your scripts in `~/Security_scripts`. Then move into this directory.

  - `mkdir -p ~/Security_scripts`  
  `cd ~/Security_scripts`


Create a file called `backup.sh`. Write a script that does the following:

  - Moves the file `/var/backups/home.tar.gz` to `/var/backups/home.last.tar.gz`. This allows you to save both the last backup you made, and the one you'll make now.

  - Creates a gzip-compressed archive of `/home`. Save this to `/var/backups/home.tar.gz`.

  - List all files in `/var/backups`, including file sizes, and save the output to `/var/backups/file_report.txt`.

  - Print how much free memory your machine has left. Save this to a file called `/var/backups/disk_report.txt`.

  - **Hint**: `free -h` prints free memory. `ls -lh` produces a long listing, including human-readable file sizes.

[See `backup.sh` for the complete script](backup.sh).


Create a file called `update.sh`. Write a script that does the following:
  - Updates `apt`.
  - Runs the command to upgrade all installed packages.
  - Runs the command to install new packages and upgrade the system.
  - Runs the command to remove unneeded packages and their associated configurations.
  - **Bonus** Add line to the bottom of `update.sh` that combines all of the commands with a single line of code.
 
[See `update.sh` for the complete script](update.sh).

Create a file called `cleanup.sh`. Write a script that does the following:

  - Removes all files in `/tmp` and `/var/tmp`.
  - Clears the `apt` cache.
  - Cleans the `thumbnails` cache.

[See `cleanup.sh` for the complete script](cleanup.sh). 
  
Make each of these custom scripts executable.

- Run the following commands at the command prompt as follows:
 
  `chmod +x backup.sh`  
  `chmod +x update.sh`  
  `chmod +x cleanup.sh`
  

Test the scripts by running them with bash using the `./name.sh` command.

- Run the following commands:

 - `sh ./backup.sh`

    - **Note:** When testing `backup.sh`, stop the script with `Ctrl + C`. Otherwise, it will take a long time to create a full backup of `/home`. We just want to see that it successfully runs. 

- `sh ./cleanup.sh`

- `sh ./update.sh`


