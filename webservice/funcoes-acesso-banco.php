<?php
	/* 
		SELECT MySQL
	 	- Faz uma consulta no banco de dados e retorna um formato JSON
	 */
	function selectMySQL($query)
	{
		include 'conecta.php';
		
		$array_json = array();
		$result_query = mysqli_query($con, $query);

		while($row = mysqli_fetch_array($result_query, MYSQL_ASSOC) ){
			array_push($array_json, $row);
		}
		
		mysqli_close($con);
		
		return json_encode($array_json);
	}

	/*
		INSERT MySQL
		- Insere no banco de dados 
	*/
	function insertMySQL($command){
		include 'conecta.php';

		$result_query = mysqli_query($con, $command) or die (mysqli_error());

		mysql_close($con);
		
		return '[{"retorno":"'.json_encode($result_query).'"}]';
	}
?>