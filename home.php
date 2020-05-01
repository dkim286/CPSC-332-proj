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


$conn->close();
?>
