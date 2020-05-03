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
$sqlfile = "./4.sql";
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

// display the view
if ($result = $conn->query("SELECT * FROM docSpeclty;"))
{
    print "<p class='lead'>Doctors and their specialty's :</p>";
    print "<table class='table table-bordered'>
            <thead>
                <tr>
                    <th scope='col'>First name</th>
                    <th scope='col'>Last name</th>
                    <th scope='col'>Specialty name</th>

                </tr>
            </thead>
            <tbody>";

    while($row = $result->fetch_array(MYSQLI_ASSOC))
    {
        print "\n";
        print "<tr>
            <td>$row[firstName] </td>
            <td> $row[lastName]  </td>
            <td> $row[specialtyName]  </td>
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
