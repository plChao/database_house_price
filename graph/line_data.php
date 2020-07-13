
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


$query = sprintf("SELECT district, AVG(unit_price) as price FROM test GROUP BY district");
$result = $mysqli->query($query);
$data = array();
foreach ($result as $row) {
	$data[] = $row;
}
//free memory associated with result
$result->close();

//close connection
$mysqli->close();

//now print the data
print json_encode($data);

