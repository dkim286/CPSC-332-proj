<?php
include('header.php');

print "
<p class='lead'>
Technically, this part is already done once 'home.php' is displayed. So, here's the relevant files instead.
</p>";


// print out the contents of starter.sql
$handle = fopen("starter.sql", "r");
if ($handle)
{
    print "<p><h4>starter.sql</h4></p>";
    print "<div style='overflow:scroll; height:20em;'><pre>";
    while (($line = fgets($handle)) !== false)
    {
        print htmlspecialchars($line);
    }

    fclose($handle);
    print "</div></pre>";
} 
else 
{
    print "Error opening file: starter.sql";
}

?>
