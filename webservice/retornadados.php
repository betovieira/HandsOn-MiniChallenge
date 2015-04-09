<?php
	include 'funcoes-acesso-banco.php';

	$tipo_operacao = $_GET['tipo_operacao'];
	
	/* RETORNA O USUÁRIO, SE ELE EXISTE */
	if($tipo_operacao == 1)
	{
		$email = $_GET['email'];
		$senha = $_GET['senha'];

		$query = "SELECT * FROM `usuario` WHERE email = '$email' and senha = '$senha'";
		echo selectMySQL($query);
	}
	/* RETORNA USUÁRIOS POR ID_USUARIO*/
	else if($tipo_operacao == 2)
	{
		$id_usuario = $_GET['id_usuario'];

		$query = "SELECT * FROM `usuario` WHERE id_usuario = $id_usuario";
		echo selectMySQL($query);
	}
	/* RETORNA TODAS AS ÁREAS */
	else if($tipo_operacao == 3)
	{
		$query = "SELECT * FROM `area`";
		echo selectMySQL($query);
	}
	/* RETORNA TODOS OS PROBLEMAS */
	else if($tipo_operacao == 4)
	{
		$query = "SELECT * FROM `problema` ";
		echo selectMySQL($query);
	}
	/* RETORNA TODOS OS PROBLEMAS POR AREA */
	else if($tipo_operacao == 5)
	{
		$id_area = $_GET['id_area'];
		$query = "SELECT * FROM `problema` WHERE id_area = $id_area ";
		echo selectMySQL($query);
	}
	/* RETORNA TODOS OS PROBLEMAS POR AREA */
	else if($tipo_operacao == 6)
	{
		$id_area = $_GET['id_area'];
		$query = "SELECT * FROM `problema` WHERE id_area = $id_area ";
		echo selectMySQL($query);
	} 
	/* RETORNA POR NUMERO DE CURTIDA */
	else if($tipo_operacao == 7)
	{
		$query = "SELECT * FROM `problema` ORDER BY curtidasProblema DESC";
		echo selectMySQL($query);
	}
	/* RETORNAR A QUANTIDADE DE SOLUCOES PARA UM PROBLEMA */
	else if($tipo_operacao == 8)
	{
		$id_problema = $_GET['id_problema'];
		$query = "SELECT COUNT(*) FROM `solucao` WHERE id_problema = $id_problema";

		echo selectMySQL($query);
	}	
	/* Retorna todas as soluções por problema */
	else if($tipo_operacao == 9)
	{
		$id_problema = $_GET['id_problema'];
		$query = "SELECT * FROM `solucao` WHERE id_problema = $id_problema";

		echo selectMySQL($query);
	}
	/* 
		------------------------------------------------------------------------------
		SOLUCOES
	*/
	/* RETORNA AS SOLUCOES */
	else if($tipo_operacao == 10)
	{
		$query = "SELECT * FROM `solucao`";
		echo selectMySQL($query);
	}
	/* RETORNA AS SOLUCOES POR ID_SOLUCOES */
	else if($tipo_operacao == 11)
	{
		$id_solucao = $_GET['id_solucao'];
		$query = "SELECT * FROM `solucao` WHERE id_solucao = $id_solucao";
		echo selectMySQL($query);
	}
	/* RETORNA TODOS OS SOLUCOES POR AREA */
	else if($tipo_operacao == 12)
	{
		$id_area = $_GET['id_area'];
		$query = "SELECT * FROM `solucao` WHERE id_area = $id_area ";
		echo selectMySQL($query);
	}
	/* RETORNA SOLUCOES POR NUMERO DE CURTIDA */
	else if($tipo_operacao == 13)
	{
		$query = "SELECT * FROM `solucao` ORDER BY curtidasSolucao DESC";
		echo selectMySQL($query);
	}
	/* Retornar a quantidade de implementações para uma solução*/
	else if($tipo_operacao == 14)
	{
		$id_solucao = $_GET['id_solucao'];
		$query = "SELECT COUNT(*) FROM `implementacao` WHERE id_solucao = $id_solucao";

		echo selectMySQL($query);
	}	
	/* Retornar todas as implementacoes por soluções */
	else if($tipo_operacao == 15)
	{
		$id_problema = $_GET['id_solucao'];
		$query = "SELECT * FROM `implementacao` WHERE id_solucao = $id_solucao";

		echo selectMySQL($query);
	}
	/*
		-----------------------IMPLEMENTACAO---------------------------
		Retorna as implementações 
	*/
	else if($tipo_operacao == 15)
	{
		$query = "SELECT * FROM `implementacao` ";
		echo selectMySQL($query);
	}
	/*	Retorna as implementações por área
	*/
	else if($tipo_operacao == 16)
	{
		$id_area = $_GET['id_area'];
		$query = "SELECT * FROM `implementacao` where id_area = $id_area ";
		echo selectMySQL($query);
	}
	/* Retorna as implementações por numero de curtidas e mais recentes */
	else if($tipo_operacao == 17) {
		$query = "SELECT * FROM `implementacao`  ORDER BY curtidasImplementacao DESC";
		echo selectMySQL($query);
	}
	/* Retorna as implementações por numero de curtidas e mais recentes */
	else if($tipo_operacao == 18) {
		$query = "SELECT * FROM `implementacao`  ORDER BY curtidasImplementacao DESC";
		echo selectMySQL($query);
	}

?>