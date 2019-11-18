<?php
   echo "REMOTE_ADRR: " . $_SERVER['REMOTE_ADDR'];
   echo "<br>";
   if(!preg_match('/^[a-zA-Z0-9_.-]{1,15}$/', 'B1NAR1')){
	echo 'wrong';
   }

   $password = '123456';

   $args = escapeshellarg('B1N=R1').' \''.$password.'\' '.escapeshellarg('gorkfern07@gmail.com').' '.escapeshellarg('192.168.0.1');
	echo $args;

   echo "<br> <br>";

   for ($i = -1; $i <= 4; $i++) {
	 $bytes = openssl_random_pseudo_bytes($i, $cstrong);
	 $hexkey   = bin2hex($bytes);
   }

   $key = pack("H*", $hexkey);

   echo $key;

   echo "<br><br><br>";

   $key = '1';
   if(!ctype_digit($key) || $key <= 0 || $key > 5){
       echo 'Error';
       echo '<br>' . $key;
   }
   else{
     echo 'ok';
   }

?>
