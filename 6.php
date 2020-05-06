<?php
include('header.php');
include('connection.txt');

$conn=new mysqli($servername, $username, $password);

if ($conn->connect_error)
{
    die("conection failed: " . $conn->connect_error);
}

if ($result=$conn->query("use `$dbname`;"))
{
    // eh
}
else
{
    die("DB select error: " . $conn->error);
}

if ($result = $conn->query("Use $dbname;"))
{
    // successful
}
else
{
    die("DB selection '$dbname' fail: " . $conn->error);
}

// run the script for creating the view
$sqlfile = "./6.sql";
$query = file_get_contents($sqlfile);
if ($result = $conn->multi_query("$query"))
{
    while ($conn->next_result())
    {
    }
}
else
{
    die("DB query error: " . $conn->error);
}

// display Audit
if ($result = $conn->query("
                           CREATE TABLE AUDIT (
                                               dFirstName varchar(10) not null,
                                               tableAction char(6) not null,
                                               specialtyName varchar(50) not null,
                                               modDate date not null
                                               );
    
       
                           CREATE TRIGGER SpecialtyToAudit
                           AFTER INSERT ON DOCTORSPECIALTY for each row
                           INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
                           VALUES ((SELECT firstName FROM PERSON where personID =
                                    (SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'INSERT',
                                (SELECT specialtyName from SPECIALTY where specialtyID =
                                    (SELECT specialtyID from DOCTORSPECIALTY where specialtyID = New.specialtyID)),
                                        CURRENT_TIMESTAMP);
  
                            CREATE TRIGGER SpecialtyToAudit2
                            AFTER UPDATE ON DOCTORSPECIALTY for each row
                                INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
                                VALUES ((SELECT firstName FROM PERSON where personID =
                                            (SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'UPDATE',
                                        (SELECT specialtyName from SPECIALTY where specialtyID =
                                            (SELECT specialtyID from DOCTORSPECIALTY where specialtyID = New.specialtyID)),
                                        CURRENT_TIMESTAMP);"))
{
    print "<p class='lead'>trigger on the DoctorSpeciality so that every time a doctor specialty is updated or added, a new entry is made in the audit table.</p>";
    print "<table class='table table-bordered'>
            <thead>
                <tr>
                    <th scope='col'>Doctor Name</th>
                    <th scope='col'>Table Action</th>
                    <th scope='col'>Specialty Name</th>
                    <th scope='col'>Modification Date</th>
                </tr>
            </thead>
            <tbody>";

    while($row = $result->fetch_array(MYSQLI_ASSOC))
    {
        print "\n";
        print "<tr>
            <td>$row[dFirstName] </td>
            <td> $row[tableAction]  </td>
            <td>$row[specialtyName] </td>
            <td> $row[modDate]  </td>
            </tr>
        ";
    }
    print "</tbody>";
    print "</table>";
    $result->free();
}
else
{
    die("stored procedure error: " . $conn->error);
}

$conn->close();

?>

