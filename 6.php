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

// update existing specialty
print "<p>Updating specialty for 'AS9260' to 'RADI'...</p>";
if ($result = $conn->query(
    "UPDATE DOCTORSPECIALTY 
     SET specialtyID='RADI'
     WHERE doctorID='AS9260';"))
{
    // successful update should trip the trigger
    print "<p>Done.</p>";
}
else 
{
    die("update table error: " . $conn->error);
}

// insert a new specialty
print "<p>Inserting new specialty: ('RS6000', 'RADI')...</p>";
if ($result = $conn->query(
    "REPLACE INTO DOCTORSPECIALTY(doctorID, specialtyID) VALUES
    ('RS6000', 'RADI');"))
{
    print "<p>Done.</p>";
    // successful insert should trip the trigger
}
else
{
    die("insert table error: " . $conn->error);
}

// display Audit
if ($result = $conn->query("SELECT * FROM AUDIT"))
{
    print "<p class='lead'>
        trigger on the DoctorSpeciality so that every time a doctor specialty is updated or added, a new entry is made in the audit table.</p>";
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
            <td>$row[tableAction] </td>
            <td>$row[specialtyName] </td>
            <td>$row[modDate] </td>
            </tr>
        ";
    }
    print "</tbody>";
    print "</table>";
    $result->free();
}
else
{
    die("query error: " . $conn->error);
}

$conn->close();

?>

