<?php

require 'classes/Session.class.php';
$session = new Session();

if ($_SERVER['REQUEST_METHOD'] != 'POST' || $session->issetLogin()) {

    header("Location:index.php");
    exit();

}

require 'classes/Database.class.php';

$regLogin = $_POST['username'];
$regPass = $_POST['password'];
$regEmail = $_POST['email'];

$database = new LRSys();

if ($database->register($regLogin, $regPass, $regEmail)) {

    //Todo: header to email confirmation.
    /*echo 'I reached here';
    var_dump($database->register($regLogin, $regPass, $regEmail));
    echo '<br>';
    echo 'And here';*/

}
/*else{
   var_dump($database->register($regLogin, $regPass, $regEmail));
}*/

$_SESSION['TYP'] = 'REG';

header('Location:index.php');

?>
