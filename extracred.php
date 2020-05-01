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
}
else
{
    die("DB selection '$dbname' fail: " . $conn->error);
}

// run the script for stored procedure
$query = file_get_contents('./extracred.sql');
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

// invoke the stored procedure
if ($result = $conn->query("CALL EXTRACRED;"))
{
    print "<pre>";
    print "<table border=1 align=center>";
    print "<tr>
        <td>count </td>
        <td>prescription name</td>
        </tr>
        ";

    while($row = $result->fetch_array(MYSQLI_BOTH))
    {
        print "\n";
        print "<tr>
            <td>$row[num] </td>
            <td> $row[prescriptionName]  </td>
            </tr>
        ";
    }
    print "</table>";
    print "</pre>";
    $result->free();
}
else
{
    die("stored procedure error: " . $conn->error);
}

$conn->close();

?>
