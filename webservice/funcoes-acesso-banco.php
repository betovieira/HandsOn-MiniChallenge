<?php
	/* 
		SELECT MySQL
	 	- Faz uma consulta no banco de dados e retorna um formato JSON
	 */
	function selectMySQL($query)
	{
		include 'conecta.php';
		
		try{
			$array_json = array();
			$result_query = mysqli_query($con, $query);

			while($row = mysqli_fetch_array($result_query, MYSQL_ASSOC) ){
				array_push($array_json, $row);
			}
			
			mysqli_close($con);
		}catch(Exception $e){
			return '[{"retorno":"false"}]';
		}

		return json_encode($array_json);
	}

	/*
		INSERT MySQL
		- Insere no banco de dados 
	*/
	function insertMySQL($command){
		include 'conecta.php';
		try{
			$result_query = mysqli_query($con, $command);
			
		}catch(Exception $e)
		{
			return '[{"retorno":"false"}]';
		}
		mysqli_close($con);
		return '[{"retorno":"'.json_encode($result_query).'"}]';
	}

	function uploadFile()
	{
		$uploaddir = '../uploads/imagens/';
		$uploadfile = $uploaddir . basename($_FILES['image']['name']);
		echo 'doido'. $uploadfile;
		echo '<pre>';
		if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
		    echo "Arquivo válido e enviado com sucesso.\n";
		} else {
		    echo "Possível ataque de upload de arquivo!\n";
		}

		echo 'Aqui está mais informações de debug:';
		print_r($_FILES);

		print "</pre>";
	}
?>