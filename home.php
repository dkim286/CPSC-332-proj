<?php
include('header.php');
include('connection.txt');

$conn=new mysqli($servername, $username, $password);
if ($conn->connect_error) 
{
	die("conection failed: " . $conn->connect_error);
}

if ($using = $conn->query("USE `$dbname`;"))
{
}
else
{
    die("DB use error: " . $conn->error);
}

// run the starter script
$qqq = file_get_contents('./starter.sql');
if ($conn->multi_query("$qqq"))
{
    while ($conn->next_result())
    {
        // just cycle thru the whole setup
    }
}
else 
{
    die("DB  error: " . $conn->error);
}

/* test it by throwing an example query at it */

$query = "select * from DOCTOR,PERSON where DOCTOR.personID = PERSON.personID;";

if ($result = $conn->query($query)) 
{
    print "<pre>";
    print "<table border=1 align=center>";
    print "<tr>
        <td>doctorID </td>
        <td>Last Name</td>
        <td>First Name</td>
        </tr>
        ";

    while($row = $result->fetch_array(MYSQLI_BOTH))
    {
        print "\n";
        print "<tr>
            <td>$row[doctorID] </td>
            <td> $row[lastName]  </td>
            <td>$row[firstName] </td>
            </tr>
        ";
    }
    print "</table>";
    print "</pre>";
    $result->free();
} 
else 
{
    die("DB  error: " . $conn->error);
}

$conn->close();

// run backup script
$what = exec("php backup.php");
?>
