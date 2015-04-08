<?php
	include 'funcoes-acesso-banco.php';

	$tipo_operacao = $_POST['tipo_operacao'];

	if($tipo_operacao == 1)
	{
		$user = $_POST['user'];
		$senha = $_POST['senha'];
		$apelido = $_POST['apelido'];
		$email = $_POST['email'];

		$command = "INSERT INTO `usuario`(`id_usuario`, `user`, `senha`, `apelido`, `email`) VALUES (null,'". $user. "','". $senha ."','".$apelido."','". $email ."')";	
		 
		insertMySQL($command);
	}
?>