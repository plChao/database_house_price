
<?php

$db_host= "localhost";
$db_user="root";
$db_pass="";
$db_name="house_project";
$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
$mysqli->set_charset("utf8");


if(!$mysqli){
	die("Connection failed: " . $mysqli->error);
}

//query to get data from the table
$query = sprintf("SELECT district, COUNT(*) as cnt FROM test GROUP BY district");

//execute query
$result = $mysqli->query($query);

//loop through the returned data
$data = array();
foreach ($result as $row) {
	$data[] = $row;
}

//free memory associated w:ith result
$result->close();

//close connection
$mysqli->close();

//now print the data
print json_encode($data);

