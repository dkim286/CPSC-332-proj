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
Writing backup to '/tmp/DocOffice.bak'...
</p>";

// run backup script
$exit_code = exec("php backup.php", $output, $ret_val);
if ($ret_val == 0)
{
    print "<p>Done!</p>";
}
else
{
    print "<p>Backup failed! Trying fallback location (./DocOffice.bak)...</p>";

    $exit_code = exec("php backup_fallback.php", $output, $ret_val);
    if ($ret_val == 0)
    {
        print "<p>Done! Backup is in the project directory.</p>";
    }
    else
    {
        print "<p>Backup failed! Couldn't write to project directory (check your folder permissions)";
    }
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
