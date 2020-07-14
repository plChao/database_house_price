<?php
include("config.php");

//前往
// if (isset($_POST['']))
 for($i = 0; $i <= 20; $i+=1){
   $temp = (string) $i;
   if( isset( $_POST[$temp] ) ){
     $userid = $_SESSION['userid'];
     $sql = "SELECT city, district, trade_date, highest_price, lowest_price FROM history WHERE userid = '$userid'";
     $result = $mysql->query($sql);
    
     for($j = 0; $j <= $result->num_rows; $j += 1){
       //fetch_assoc()
	$row = $result->fetch_assoc();
	if($j == $i){
       $_SESSION['city'] = $row['city'];
       $_SESSION['district'] = $row['district'];
       $_SESSION['trade_date'] = $row['trade_date'];
       $_SESSION['highest_price'] = $row['highest_price'];
       $_SESSION['lowest_price'] = $row['lowest_price'];
       break;
     }
   }

     header("location: ./search.php");
     exit;
   }
   $j = $i + 20;
   $temp = (string) $j;
  if( isset( $_POST[$temp] ) ){
   
	  
	  $userid = $_SESSION['userid'];
     $sql = "SELECT city, district, trade_date, highest_price, lowest_price FROM history WHERE userid = '$userid'";
     $result = $mysql->query($sql);

     for($j = 0; $j <= $result->num_rows; $j += 1){
       //fetch_assoc()
        $row = $result->fetch_assoc();
	if($j == $i){
	$city = $row['city'];
        $district = $row['district'];
	
	$trade_date = $row['trade_date'];
	$trade_date = (int) $trade_date;

	$highest_price = $row['highest_price'];
	$highest_price = (int) $highest_price;
	
	$lowest_price = $row['lowest_price'];
	$lowest_price = (int) $lowest_price;

       $sql = "DELETE from  history WHERE userid = '$userid' AND city='$city' AND district='$district' AND trade_date=$trade_date AND highest_price=$highest_price AND lowest_price=$lowest_price";
       $result = $mysql->query($sql);
       break;
     }
     }

    
  }
  
 // else{
 // header("location: ./search.php");
 // }

 }
?>
<!DOCTYPE html>
<html>
<head>
  <style>
  table, th, td {
    border: 1px solid black;
  }
  </style>
</head>
<body>

<div style="text-align:center;"><h1>搜尋紀錄</h1></div>
<div style="text-align:right;">
<p>使用者:
<?php
echo $_SESSION['userid'];
?>
</p>
</div>

<div style="text-align:left;">
  <form action="./index.php">
    <input type="submit" value="返回" />
  </form>
</div>

<table style="width:100%">
  <tr>
    <th>縣市(city)</th>
    <th>區域(district)</th>
    <th>時間(trade_date)</th>
    <th>最高價格(highest_price)</th>
    <th>最低價格(lowest_price)</th>
    <th>連結</th>
    <th>刪除</th>
  </tr>
  <?php
   $userid = $_SESSION['userid'];
   $sql = "SELECT city, district, trade_date, highest_price, lowest_price FROM history WHERE userid = '$userid'";
   $result = $mysql->query($sql);
   for($i = 0; $i < $result->num_rows; $i += 1){
     //fetch_assoc()
     $row = $result->fetch_assoc();
     echo '<tr>';
     echo '<td>'.$row['city'].'</td>';
     echo '<td>'.$row['district'].'</td>';
     echo '<td>'.$row['trade_date'].'</td>';
     echo '<td>'.$row['highest_price'].'</td>';
     echo '<td>'.$row['lowest_price'].'</td>';
     echo '<td>';
     echo '<form action="./history.php" method="post">';
     echo '<input type="submit" value="前往" name="'.$i.'" />';
     echo '</form>';
      echo '</td>';

      echo '<td>';
     $j = 20 + $i;
     echo '<form action="./history.php" method="post">';
     echo '<input type="submit" value="刪除" name="'.$j.'" />';
     echo '</form>';
     
     echo '</td>';
     echo '</tr>';
  }
?>
</table>

</body>
</html>
