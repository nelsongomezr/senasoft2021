<?php 
	require("conexion.php");
	class Ips extends Conexion
	{
		private $informacion=array();//atributos
		private $estudiante=array();
		private $datos=array();
        private $paciente=array();
		private $validacion=array();
		private $validacion1=array();
		private $novedad=array();
		
		public function valida_pass($usuario,$pass)
		{
				$sql="SELECT * FROM usuario WHERE idUsuario=:usu AND Contraseña=:pass";
				$res=$this->conex->prepare($sql);
				$res->execute(array(":usu"=>$usuario,":pass"=>$pass));
				while($reg=$res->fetch(PDO::FETCH_ASSOC))
				{
					$this->validacion[]=$reg;
				}
				return $this->validacion;
		}
		public function valida_pass1($usuario,$pass)
		{
				$sql="SELECT * FROM profesional WHERE idMedico=:usu AND Contraseña=:pass";
				$res=$this->conex->prepare($sql);
				$res->execute(array(":usu"=>$usuario,":pass"=>$pass));
				while($reg=$res->fetch(PDO::FETCH_ASSOC))
				{
					$this->validacion1[]=$reg;
				}
				return $this->validacion1;
		}

		Public function trae_datos($usuario)
		{
			
				$sql="SELECT * FROM usuario WHERE idUsuario=:usu";
				$res=$this->conex->prepare($sql);
				$res->execute(array(":usu"=>$usuario,));
				while($reg=$res->fetch(PDO::FETCH_ASSOC))
				{
					$this->paciente[]=$reg;
				}
				return $this->paciente;
		}
		Public function reporte_paciente($usuario)
		{
			
				$sql="SELECT * FROM servicios WHERE Usuario_idUsuario=:usu";
				$res=$this->conex->prepare($sql);
				$res->execute(array(":usu"=>$usuario,));
				while($reg=$res->fetch(PDO::FETCH_ASSOC))
				{
					$this->paciente[]=$reg;
				}
				return $this->paciente;
		}
		Public function medico($id_medico)
		{
			
				$sql="SELECT * FROM profesional WHERE idMedico=:id";
				$res=$this->conex->prepare($sql);
				$res->execute(array(":id"=>$id_medico,));
				while($reg=$res->fetch(PDO::FETCH_ASSOC))
				{
					$this->paciente[]=$reg;
				}
				return $this->paciente;
		}
		
    }
?>