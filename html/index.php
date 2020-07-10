<?php
include('config.php');
if(!isset($_SESSION['userid'])){ header("Location: ./login.php"); }
?>


<!DOCTYPE html>
<head>
	<style>
        h2 {text-align: center;}
        p {text-align: center;}
        div {text-align: center;}
	</style>
</head>
<body>
<h2>Homepage of DataBase house project</h2>
<?php
//session_start();
//$_SESSION['userid'] = 10;
//isset($_SESSION['userid']);
if(isset($_SESSION['userid'])){
	echo 'Your name : ';
	echo $_SESSION['userid'];
	echo '<br>';
        echo '<br> <a href="http://127.0.0.1/logout.php">logout</a>';

}
?>

</body>
</html>
