## Solution Guide: Restoring Data with Incremental Backups

The goal of this activity was to test a backup to ensure that a system can be restored in the event of an attack.

### Questions 
1. What is the difference between a full and incremental backup?

    - A full backup saves every file on a hard drive. An incremental backup saves only the data that has changed since the last full backup.

2. If you have a backup schedule of Monday, Tuesday, Wednesday, Thursday and Friday:  

    * On what day do you schedule the level 0 backup to be done?

        - Monday

    * What order should the backups be applied to restore a system that was completely lost after an attack?

        - Start with Monday, end with Friday. 

3. What command do you use to create a level 0 backup of `archive/home/user1`? 
    
    - `tar cvvWf backup.tar --listed-incremental=backup.snar --level 0 archive/home/user1`

4. How do you list the contents of an incremental backup?

    - `tar tvvf backup.tar --incremental`

* After listing the contents of an incremental backup, what do the following letters indicate:

    * `Y` indicates that the file is contained in the `backup.tar` archive.

    * `N` indicates that the file was present in the directory at the time the archive was made, but was not added to the `backup.tar` archive because it has not changed since the last backup.

    * `D` indicates the file is a directory.

### Incremental Backup Restoration

- Create the level 0 backup of the `testenvir` directory by running:
   
    `tar cvvWf epscript_back_sun.tar --listed-incremental=epscript_backup.snar --level=0 testenvir`

   Your output should look similar to this:

    ```
    tar: testenvir: Directory is new
    tar: testenvir/doctor: Directory is new
    tar: testenvir/patient: Directory is new
    tar: testenvir/treatment: Directory is new
    drwxr-xr-x instructor/instructor    0   2019-07-18  09:10   testenvir/
    drwxr-xr-x instructor/instructor    0   2019-07-16  15:07   testenvir/doctor
    drwxr-xr-x instructor/instructor    0   2019-07-16  15:26   testenvir/patient
    drwxr-xr-x instructor/instructor    0   2019-07-16  15:24   testenvir/treatment
    ...
    ...
    ...  
    ```


* Use the `tar` command to list the contents of the level 0 backup:

    `tar tvvf epscript_back_sun.tar --incremental`

* Status of the files in the backup should look similar to:

      drwxr-xr-x instructor/instructor    29   2019-07-18  09:10   testenvir/
      D doctor
      D patient
      D treatment

      drwxr-xr-x instructor/instructor    171   2019-07-16  15:07   testenvir/doctor/
      Y doctor_tar.tar
      Y doctors.csv
      Y doctors1.csv
      ...
      ...

      drwxr-xr-x instructor/instructor    166   2019-07-16  15:26   testenvir/patient/
      Y patients.csv
      Y patients1.csv
      Y patients10.csv
      ...
      ...

      drwxr-xr-x instructor/instructor    188   2019-07-16  15:24   testenvir/treatment/
      Y treatments.csv
      Y treatments1.csv
      Y treatments10.csv
      Y treatments2.csv
      ...
      ...



* What is the status of the files in the backup?
    * **`D`** indicates directories.

    * **`Y`** indicates that these file are contained in the `epscript_back_sun.tar` archive.
    
* What files have been added to the `testenvir/patient` directory?

    Your output should look similar to this:

    ```
    -rw-r--r--  1 instructor instructor 123847  Jul 16  15:25   patient11.csv
    -rw-r--r--  1 instructor instructor 123847  Jul 16  15:25   patient12.csv
    -rw-r--r--  1 instructor instructor 123847  Jul 16  15:25   patient13.csv
    ```


* To create an incremental backup that will include the added files, run:

    `tar cvvWf epscript_back_mon.tar --listed-incremental=epscript_backup.snar testenvir` 

* List the contents of the `epscript_back_mon.tar` incremental backup.

     Your output should look similar to:


      drwxr-xr-x instructor/instructor    29   2019-07-18  09:10   testenvir/
      D doctor
      D patient
      D treatment

      drwxr-xr-x instructor/instructor    171   2019-07-16  15:07   testenvir/doctor/
      N doctor_tar.tar
      N doctors.csv
      N doctors1.csv
      ...
      ...

      drwxr-xr-x instructor/instructor    166   2019-07-16  15:26   testenvir/patient/
      N patients.csv
      N patients1.csv
      N patients10.csv
      Y patients11.csv
      Y patients12.csv
      Y patients13.csv
      N patients2.csv
      ...
      ...

      drwxr-xr-x instructor/instructor    188   2019-07-16  15:24   testenvir/treatment/
      N treatments.csv
      N treatments1.csv
      N treatments10.csv
      ...
      ...

* What is the status of the files in the incremental backup?


    * **`D`** indicates directories.

    * **`N`** indicates that the file was present in the directory at the time the archive was made, but was not added to the `epscript_back_mon.tar` archive because it had not changed since the last backup. 

    * **`Y`** indicates that the file is contained in the `epscript_back_mon.tar` archive.

* Remove the added files from the `testenvir/patient` directory by running:

     `rm patients11.csv patients12.csv patients13.csv`

* The `epscript_back_mon.tar` incremental backup is the only backup that is required to replace the **deleted** files.  
    
    * The `epscript_back_sun.tar` level 0 backup is needed if a **full system restoration** is required.  It would then be followed by the `epscript_back_mon.tar` incremental backup. 


* To restore the deleted files, run:

    `tar xvvf epscript_back_mon.tar -R --incremental`

    * The snapshot file is not included in the command because the incremental file contains all the information to implement the restoration.

     Your output should look similar to:


      block 1: drwxr-xr-x instructor/instructor   29  2019-07-18  09:10 testenvir/
      block 3: drwxr-xr-x instructor/instructor   171  2019-07-16  09:10 testenvir/doctor
      block 5: drwxr-xr-x instructor/instructor   214  2019-07-18  11:38 testenvir/patient
      block 7: drwxr-xr-x instructor/instructor   188  2019-07-15  15:24 testenvir/treatment
      block 9: -rw-r--r-- instructor/instructor   123847  2019-07-18  11:38 testenvir/patient/patients11.csv
      block 252: -rw-r--r-- instructor/instructor   123847  2019-07-18  11:38 testenvir/patient/patients12.csv
      block 495: -rw-r--r-- instructor/instructor   123847  2019-07-18  11:38 testenvir/patient/patients13.csv
      block 737: ** Block of NULS **



See further reading on [backup-manager](<http://manpages.ubuntu.com/manpages/bionic/man8/backup-manager.8.html>) and [Amanda](<http://www.amanda.org/>), which can also be used for incremental backups.
