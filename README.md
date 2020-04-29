# Final Project

yeah

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
 
1.  Create a script to do the following (Write the script for this) 

    * If first time backup take backup of all the tables 
    * If not the first time remove the previous backup tables and take new backups. 
    * EXTRA CREDIT: Create a stored procedure that gives Prescription name and the number
