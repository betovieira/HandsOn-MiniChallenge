<?php 
/*
	conecta.php
		- Serve para iniciar as configuraçoes do seu banco de dados;
*/

	$hostname = "mysql.hostinger.com.br";
	$username = "u428842902_hands";
	$password = "GtPPotnT7v";
	$database = "u428842902_hands";

	$con = mysqli_connect($hostname, $username, $password);
	mysqli_select_db($con, $database) or 
		die ("Não for possível conectar ao banco");

	mysqli_query($con,"SET NAMES 'utf8'");	
?>
