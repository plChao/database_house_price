<?php
include('config.php');
if(!isset($_SESSION['userid'])){ header("Location: ./login.php"); }
?>


<!DOCTYPE html>
<body>

<!--<?php
//session_start();
//$_SESSION['userid'] = 10;
//isset($_SESSION['userid']);
if(isset($_SESSION['userid'])){
	echo 'Your name : ';
	echo $_SESSION['userid'];
	echo '<br>';
        echo '<br> <a href="http://127.0.0.1/test_project/logout.php">logout</a>';

}
?>-->
<div style="text-align:center;"><h1>首頁</h1></div>
<div style="text-align:right;"><p>
使用者:
<?php
//session_start();
//$_SESSION['userid'] = 10;
//isset($_SESSION['userid']);
if(isset($_SESSION['userid'])){
        echo $_SESSION['userid'];
        echo '<br>';
        echo '<br> <a href="http://127.0.0.1/test_project/logout.php">logout</a>';

}
?>
</p></div>

<div style="text-align:center;">
  <form action="./search.php">
    <input type="submit" value="搜尋房價" />
  </form>
</div>
<div style="text-align:center;">
  <form action="./history.php">
    <input type="submit" value="搜尋紀錄" />
  </form>
</div>
</body>
</html>
