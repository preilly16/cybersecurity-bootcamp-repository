## Solution Guide:  Restoring Data with `tar`

The goal of this activity was to locate the correct archive to restore the Patient directory and files. 

Completing the activity required the following steps:

* Listing the contents of the archive to view the contents.

* Using the `grep` command to search the archive for two patient names.

* Creating a directory to store the Patient directories and files. 

* Extracting only the Patient directory and files to the directory for review before restoring the files to the E-Prescription Treatment system.

* Validating that the archive does not contain errors, using the **`-R`** option.

First, we move to and list the contents of the `epscript/backup` directory, specifically  the `20190511epscript.tar` file. This file is used to search for the patient information.

- Run `cd epscript/backup`

- Run `ls -l`

    Your output should look like:

    ```
    -rw--r-r--  1   root  root  4341760    Jul 17   01:45   20190511epscript.tar
    ```

Next, list the contents of the Patient FireView, the Patient directory, and files in the archive, printing the output to the screen.

- Run: `tar tvvf 20190511epscript.tar | less`

The clinical technician supplied names for the patient files that were missing. After decompressing the file, use `grep` to find a patient file in the archive. 

- Run: 

    `tar xvf 20190511epscript.tar`  
    `cd epscript/doctors`  
    `cat * | grep "Mark,Lopez"`  
    `cd epscript/patients`  
    `cat * | grep "Mark,Lopez"`  
    `cd epscript/treatments`  
    `cat * | grep "Mark,Lopez"`
    
    Your output should look similar to this:

    ```
    809,Mark,Lopez,male,0,31,577.511.1054x23935,jeffrey93@jones.net,model,"673 Schultz Spur Apt. 244
    ```
	
- Note that a hacker can steal these and other millions of medical records to [sell on the web](<https://www.cbsnews.com/news/hackers-steal-medical-records-sell-them-on-dark-web/>).

Next we’ll extract the patient files from the archive, test for errors, and save them in the `patient_search` directory. 

The general syntax of the command is: 

* `tar [options][archive_name][option][option][save_directory][objects_to_archive]`

In the `epscript/backup` directory, make a new directory called `patient_search`.

- Run  `mkdir patient_search`

- Run  `tar xvvf 20190511epscript.tar -R -C patient_search/ epscript/patients`

    - Syntax breakdown:

        * `xvvf` are the options.
        * `20190511epscript.tar` is the archive name.
        * The `-R` option tells `tar`to print error messages for any errors with the block number in the archive file when extracting files.  
          * We should always use the `R` option while extracting data to verify that there are no file errors.
        * The `-C` option is followed by the directory to save the patient directory and files. 
        * `patient_search/` is the directory where files are saved.
        * `epscript/patients` is the directory that contains the patient files.  We are extracting files from this directory in the `tar` archive.

    Your output should look similar to:

    ```    
    block 4152: --rw-r--r-- root/root   123847  2019-07-16  15:26   epscript/patients/patients4.csv
    ``` 

There were no errors in this archive.

Next, list the contents of the `patient_search` directory.

- Run  `ls -l patient_search/epscript/patients`

    Your output should look similar to this: 

        total 1364
        -rw-r--r-- 1 root root 123847 Jul 16 15:26 patients10.csv
        -rw-r--r-- 1 root root 123847 Jul 16 15:25 patients1.csv
        -rw-r--r-- 1 root root 123847 Jul 16 15:25 patients2.csv
        -rw-r--r-- 1 root root 123847 Jul 16 15:25 patients3.csv
        ...
        ...

--- 
#### Copyright
© 2020 Trilogy Education Services, a 2U, Inc. brand.  All Rights Reserved.
