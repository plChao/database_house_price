<?php
//header('Content-Type: application/json;charset=utf-8'); //return json string

include("config.php");
//$lvnum = $mysql->real_escape_string("Taipei");
$lvnum = $mysql->real_escape_string($_GET['lv']);
//$lvnum = $_GET['lv'];
//echo $lvnum;
//$lvnum = "5.5";
//echo $lvnum;
$jarray = array(); //使用array儲存結果，再以json_encode一次回傳

$query = "SELECT region FROM forselect where city='$lvnum'";
$result = $mysql->query($query);
//echo "<br>";
//echo $result->num_rows;
//echo "<br>";
if($result->num_rows > 0){
   while ($row = $result->fetch_assoc() ) {
  //關於mysql_fetch_*請參考php.net
	   $jarray[] = $row;
	  // echo $row['region'];
	 //echo "match";
}
}
else{
	echo 0;
	return;
}
//echo $jarray;
//print_r($jarray);
echo json_encode($jarray);
return;
?>
