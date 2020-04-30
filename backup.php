<?php
include('connection.txt');

$filename='/tmp/DocOffice.bak';
if (file_exists($filename))
{
    unlink($filename);
}

$result=exec("mysqldump $dbname --user=$username --password='$password' --single-transaction >$filename", $else);
print $else;

?>
