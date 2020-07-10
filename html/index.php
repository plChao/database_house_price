<?php
include('config.php');
if(!isset($_SESSION['userid'])){ header("Location: ./login.php"); }
?>


<!DOCTYPE html>
<body>

<?php
//session_start();
//$_SESSION['userid'] = 10;
//isset($_SESSION['userid']);
if(isset($_SESSION['userid'])){
	echo 'Your name : ';
	echo $_SESSION['userid'];
	echo '<br>';
        echo '<br> <a href="http://127.0.0.1/test_project/logout.php">logout</a>';

}
?>
<br>hello everyone this is homepage

</body>
</html>
