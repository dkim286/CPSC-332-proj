# Final Project

yeah

# Running the page

Getting this project directory inside XAMPP's scope is more annoying and involved than it should be.

## Create a `connection.txt` file

```
<?php
        $servername="127.0.0.1";
        $dbname="DocOffice";
        $port=3306;
        $username="root";
        $password="your password here";
?>
```

## Make the `project` directory visible to XAMPP

* Method 1: Use symlinks

Use this method *if and only if* you've cloned this repo inside a folder with 'all' rwx permissions, like `/var/www` for example.

Dump a symlink in the XAMPP htdocs folder (for me, it's `/opt/lampp/htdocs`):

```text
$ ln -s path/to/project/dir /opt/lampp/htdocs
```

* Method 2: Copy it over

Just copy the entire folder to `/opt/lampp/htdocs`. Be extra careful which file you're making changes to.

## Point the browser at it

http://localhost/project/home.php

# `backup.php`

For now, this script dumps the backup file inside `/tmp` folder, which exists in both Linux and macOS. I have no idea what the equivalent is for Windows, but the professor is most likely going to grade this on a macOS so I think we're okay for now.

# Tasks

Items with ~~strikethru~~ styling are finished tasks. 

1. ~~One SCRIPT to create this database (call it DocOffice) with MySQL server.~~

1.  Doctor Robert Stevens is retiring. We need to inform all his patients, and ask them to select a new doctor. For this purpose, Create a VIEW that finds the names and Phone numbers of all of Robert's patients. 

1.  Create a view which has First Names, Last Names of all doctors who gave out prescriptions for Vicodin. 

1.  Create a view which shows the First Name and Last name of all doctors and their specialty’s. 

1.  Modify the view created in Q4 to show the First Name and Last name of all doctors and their specialties ALSO include doctors who DO NOT have any specialty.

1.  Create trigger on the DoctorSpeciality so that every time a doctor specialty is updated or added, a new entry is made in the audit table. The audit table will have the following (Hint-The trigger will be on DoctorSpecialty table). 

    * Doctor’s FirstName 
    * Action(indicate update or added) 
    * Specialty 
    * Date of modification 
 
1.  ~~Create a script to do the following (Write the script for this) ~~

    * ~~If first time backup take backup of all the tables~~
    * ~~If not the first time remove the previous backup tables and take new backups.~~
    * ~~EXTRA CREDIT: Create a stored procedure that gives Prescription name and the number of patients from the city of Fullerton with that prescription. Example: `|20| Aspirin | 2| Ciprofloxacin`... ~~
