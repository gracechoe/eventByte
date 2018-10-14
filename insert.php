<?php
$host='inventorydb.ckem87ln9kst.us-east-1.rds.amazonaws.com';
    $user='gracechoe';
    $password='chapman1861';

    $connection = mysql_connect($host,$user,$password);

    $eventName = $_POST['a'];
    $eventDate = $_POST['b'];
    $eventTime = $_POST['c'];
    $eventLocation = $_POST['d'];
        $orgName = $_POST['e'];
        $eventDescription = $_POST['f'];
        $contactEmail = $_POST['g'];

    if(!$connection)
    {
        die('Connection Failed');
    }
    else
    {
        $dbconnect = @mysql_select_db('testdb', $connection);

        if(!$dbconnect)
        {
            die('Could not connect to Database');
        }
        else
        {
            $query = "INSERT INTO event_list ( EventName, EventDate, EventTime, EventLocation, OrgName, EventDescription, OrgContact)
                VALUES ('$eventName','$eventDate','$eventTime','$eventLocation', '$orgName', '$eventDescription', '$contactEmail');";
            mysql_query($query, $connection) or die(mysql_error());

            echo 'Successfully added.';
            echo $query;
        }
    }
?>
