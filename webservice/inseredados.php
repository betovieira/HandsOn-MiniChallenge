<?php
	include 'funcoes-acesso-banco.php';
	// $tipo_operacao1 = $_GET['tipo_operacao'];
	$tipo_operacao = $_POST['tipo_operacao'];

	/*Cria o usuário */
	if($tipo_operacao == 1)
	{
		$nomeUsuario = $_POST['nomeUsuario'];
		$email = $_POST['email'];
		$senha = $_POST['senha'];
		$curso = $_POST['curso'];
		$interesses = $_POST['interesses'];

		$command = "INSERT INTO `usuario`(`id_usuario`, `nome_usuario`, `email`, `senha`, `curso`, `interesses`) VALUES (null,'".$nomeUsuario."','".$email."','".$senha."','".$curso."','".$interesses."')";

		echo insertMySQL($command);
	} 
	/* Insere Problema */
	else if($tipo_operacao == 2) {
		$id_usuario = $_POST['id_usuario'];
		$id_area = $_POST['id_area'];
		$descricaoProblema = $_POST['descricaoProblema'];
		$descricaoTotalProblema = $_POST['descricaoTotalProblema'];
		$caminhoLink = $_POST['caminhoLink'];

		$command = "INSERT INTO `problema`(`id_problema`, `id_usuario`, `id_area`, `descricaoProblema`, `descricaoTotalProblema`, `caminhoLink`, `curtidasProblema`) VALUES (null,$id_usuario,$id_area,'$descricaoProblema','$descricaoTotalProblema', '$caminhoLink',0)";

		echo insertMySQL($command);
	}
	/* UPDATE - Insere curtida de um problema */
	else if($tipo_operacao == 3)
	{
		$id_problema = $_POST['id_problema'];

		$command = "UPDATE `problema` SET `curtidasProblema` = `curtidasProblema`+ 1 WHERE id_problema = $id_problema";
		echo insertMySQL($command);
	}
	/* Insere soluções */
	else if($tipo_operacao == 4)
	{
		$id_problema = $_POST['id_problema'];
		$descricaoSolucao = $_POST['descricaoSolucao'];
		$caminhoAnexoSolucao = $_POST['caminhoAnexoSolucao'];
		$interesse = $_POST['interesse'];	
		$id_area = $_POST['id_area']; 
		$id_usuario = $_POST['id_usuario'];

		$descricaoTotalSolucao = $_POST['descricaoTotalSolucao'];
		$caminhoLink = $_POST['caminhoLink'];

		$command = "INSERT INTO `solucao`(`id_solucao`, `id_problema`, `descricaoSolucao`, `descricaoTotalSolucao`,`caminhoLink`, `caminhoAnexoSolucao`, `interesse`, `curtidasSolucao`, `id_area`, `id_usuario`) VALUES (null,$id_problema,'$descricaoSolucao','$descricaoTotalSolucao','$caminhoLink' ,'$caminhoAnexoSolucao','$interesse',0, $id_area, $id_usuario)";
		//echo $command;
		echo insertMySQL($command);
	} 
	/* Insere curtida de uma solução */
	else if($tipo_operacao == 5)
	{
		$id_solucao = $_POST['id_solucao'];
		$command = "UPDATE `solucao` SET `curtidasSolucao` = `curtidasSolucao`+ 1 WHERE `id_solucao` = $id_solucao";
		echo insertMySQL($command);
	}
	/* Insere implementação */
	else if($tipo_operacao == 6)
	{
		$id_solucao = $_POST['id_solucao'];
		$id_usuario = $_POST['id_usuario'];
		$descricaoImplementacao = $_POST['descricaoImplementacao'];
		$caminhoAnexoImplementacao = $_POST['caminhoAnexoImplementacao'];
		$tags = $_POST['tags'];
	
		$command = "INSERT INTO `implementacao`(`id_implementacao`, `id_solucao`, `id_usuario`, `descricaoImplementacao`, `caminhoAnexoImplementacao`, `tags`, `curtidasImplementacao`) VALUES (null, $id_solucao, $id_usuario,'$descricaoImplementacao','$caminhoAnexoImplementacao','$tags',0)";
		echo insertMySQL($command);
	}
	/* Insere implementação */
	else if($tipo_operacao == 7)
	{
		$id_implementacao = $_POST['id_implementacao'];
		$command = "UPDATE `implementacao` SET `curtidasImplementacao` = `curtidasImplementacao`+ 1 WHERE `id_implementacao` = $id_implementacao";
		echo insertMySQL($command);
	}

/*
	UPLOAD DE ARQUIVO
	else if($tipo_operacao1 == 2)
	{
		echo 'entra';
		uploadFile();
	}*/
?>


