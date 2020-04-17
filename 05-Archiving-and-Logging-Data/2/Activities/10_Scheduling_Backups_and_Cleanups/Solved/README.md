
## Solution Guide: Scheduling Backups and Cleanups

Completing this activity required the following tasks: 

- Moving the `backup.sh`, `cleanup.sh`, and `update.sh` scripts to their corresponding system-wide `cron` directories.

- Creating `lynis` scripts to perform security scans.

Move the scripts you wrote in the previous exercise to the appropriate `cron` directories in `/etc`. Specifically, your scripts should run at the following intervals:
  
  - `backup.sh` should run weekly.
  - `cleanup.sh` should run daily.
  - `update.sh` should run weekly.

    Run:
    ```bash
    cd ~/custom_scripts  
    sudo cp backup.sh /etc/cron.weekly
    sudo cp cleanup.sh /etc/daily
    sudo cp update.sh /etc/cron.weekly
    ```

In addition to scheduling the above tasks, you should perform regular security scans to ensure your system hasn't been compromised. 

- Create a script called `lynis.system.sh` in your `/home` directory. Write a command that will run a full-system scan using `lynis` every week that saves the results in `/tmp/lynis.system_scan.log`. Run:
    ```bash
    #!/bin/bash
    lynis audit system >> /tmp/lynis.system.log
    ```

- Create a script called `lynis.partial.sh`. Write a command that will use `lynis` to run daily scans for the test groups: `malware`, `authentication`, `networking`, `storage`, and `filesystems` that saves the results in `/tmp/lynis.partial_scan.log`. Run:
    ```bash
    #!/bin/bash
    lynis audit --tests-from-group malware,authentication,networking,storage,filesystems >> /tmp/lynis.partial.log
    ```
- Then add both `lynis` scripts to the `root` crontab to create the tasks. Run:
    ```bash
  sudo cp lynis.system.sh /etc/cron.weekly
   sudo cp lynis.partial.sh /etc/daily
    ```

- **Bonus**: Explain why using scripts to run these commands is preferable to using a `crontab`.

    - Using scripts to run `lynis` security scans in system-wide `cron` directories is preferred over using crontab because system-wide directories affect the entire system, as opposed to only the user.
