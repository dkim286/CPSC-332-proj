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

print "
<p>
Writing backup...
</p>";

// run backup script
$exit_code = exec("php backup.php", $output, $ret_val);
if ($ret_val == 0)
{
    print "<p>Done!</p>";
}
else
{
    print "<p>Backup failed!</p>";
}

// print out the contents of backup.php
$handle = fopen("backup.php", "r");
if ($handle)
{
    print "<p><h4>backup.php</h4></p>";
    print "<pre>";
    while (($line = fgets($handle)) !== false)
    {
        print htmlspecialchars($line);
    }

    fclose($handle);
    print "</div></pre>";
} 
else 
{
    print "Error opening file: backup.php";
}

?>
