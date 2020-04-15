## Solution Guide: Creating Full Backups with `tar`

The goal of this activity was to create a *full backup* of the `epscript` directories and files, including file permissions, owner, size of file, and date and time. We verified the archive for errors after writing it, and the output from the command was saved to a text file.

The main steps of this activity were:

* Creating the name of the `tar` archive using the YYYMMDD ISO 8601 standard.

* Creating a *full backup* using the `tar` create option.

* Printing the *full listing* for each file, including the name, file permissions, and owner information. 

* Verifying the archive *after it was written* to check for errors.

* Creating a *file* of the output of the `tar` command for later review by the SysOps team.

Completing these steps will ensure that our archive has the correct data, no errors, and can be used in the event of a malware attack to restore the E-Prescription Treatment system.

- First, we move to the `epscript` directory and list the directories and files located there.

   
    `cd epscript`  
   `ls -l`
* Output should read: 
 ```
    drwxr-xr-x  2   root  root  4096    Jul 16   14:02   doctors
    drwxr-xr-x  2   root  root  4096    Jul 16   14:02   patients
    drwxr-xr-x  2   root  root  4096    Jul 16   14:00   treatments
 ```  
* List the contents of the `doctor` directory and display the contents, which are `.csv` files.

   
    `cd doctors`  
    `ls -l`

* Output should read: 
```
    -rw-r--r--  1   root  root  75962   Jul 16   14:16   doctor10.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:12   doctor1.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:13   doctor2.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:15   doctor3.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:15   doctor4.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:15   doctor5.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:15   doctor6.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:15   doctor7.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:16   doctor8.csv
    -rw-r--r--  1   root  root  75962   Jul 16   14:16   doctor9.csv
    -rw-r--r--  1   root  root  75962   Jul 16   13:22   doctor.csv
```

* List the contents of the `patient` and `treatment` directories and display the contents, which are also `.csv` files.

    
    `cd patients; ls- l`  
    `cd treatments; ls -l`
    

* The archive filename is created using the ISO 8601 standard.

    * Using the standard format of `[YYYMMDD][filename].tar`, our archive filename is: `20190510epscript.tar`.

        * [ISO](<https://www.iso.org/home.html>) stands for International Organization for Standards. It publishes international standards such as the [ISO/IEC 27032:2012](<https://www.iso27001security.com/html/27032.html>) which is a standard for internet security issues.

        * Remember, [ISO 8601 for filenames](<https://wadegibson.com/why-you-should-use-the-iso-date-format/>) is important because:

            * The naming convention is recognized internationally.  
        
            * Files prefixed with an ISO date will automatically sort *oldest to newest* under the default alphabetical sort.

* The syntax for the command is: 

    `tar [option(s)] [archive_filename] [objects_to_archive]`
    
    For our command, we use: 

    `tar cvvWf 20190510epscript.tar epscript/ > 20190510epscript.txt`

    * Syntax breakdown:

        * `tar` is the name of the command.
        * `c` is the option to create the archive.
        * `vv` is the option to print the full file specification for each file in the archive. 
        * `W` is the option that will verify the archive after writing it. 
        * `f` stands for _use this archive file_.
        *  `20190510epscript.tar` is the archive filename.
        * `epscript/` is the directory containing the files to archive.
        * `> 20190510epscript.txt` saves the output of the command to the file.

* The output of the `tar` command in the `20190510epscript.txt` file:

    ```
    cat 20190510epscript.txt | less

    drwxr-xr-x  root/root   0       2019-07-16  15:11   epscript
    drwxr-xr-x  root/root   0       2019-07-16  15:24   epscript/treatment
    -rw-r--r--  root/root   192273  2019-07-16  15:24   epscript/treatment/treatments10.csv
    ...
    ...

    NOTE 1: The rest of the archive follows with the "doctor" and "patient" directories and files.

    NOTE 2: Next follow the lines that "verify" writing the files in the archive using the "W" option.

    Verify drwxr-xr-x  root/root   0       2019-07-16  15:11   epscript
    Verify drwxr-xr-x  root/root   0       2019-07-16  15:11   epscript/treatment
    Verify -rw-r--r--  root/root   192273  2019-07-16  15:24   epscript/treatment/treatments10.csv

    ``` 

---

#### Copyright
© 2020 Trilogy Education Services, a 2U, Inc. brand.  All Rights Reserved.