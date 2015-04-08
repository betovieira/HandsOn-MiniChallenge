<?php
	include 'funcoes-acesso-banco.php';

	$tipo_operacao = $_GET['tipo_operacao'];

	if($tipo_operacao == 1)
	{
		$query = "SELECT * FROM `usuario`";
		echo selectMySQL($query);
	}
	else if($tipo_operacao == 2)
	{
		$user = $_GET['user'];

		$query = "SELECT * FROM `usuario` WHERE `user` like '%" . $user. "%'";
		echo selectMySQL($query);
	}

?>