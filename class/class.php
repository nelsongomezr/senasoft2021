<?php
require("conexion.php");
Class Ips extends Conexion
{
    
    private $variable=array();
    private $vector=array();
    private $validacion=array();
    private $validacion1=array();

    public function consul_admi($codig)
    {
        $sql="SELECT * FROM `servicios` INNER JOIN usuario ON servicios.Usuario_idUsuario=usuario.idUsuario INNER JOIN profesional ON servicios.Medico_idMedico=profesional.idMedico WHERE servicios.Usuario_idUsuario=:num";
        $res=$this->conex->prepare($sql);
	    $res->execute(array(':num'=>$codig));
        
 
		while ($reg=$res->fetch(PDO::FETCH_ASSOC)) 
		{
		
			$this->vector[]=$reg;
			
		
		}
		return $this->vector;
    }
    
    public function insert_pro($num,$nom,$dir,$email,$tel,$passw,$rol,$act)
    {
        
        $sql="INSERT INTO profesional VALUES (:num,:nom,:dir,:email,:telf,:pass,:estad,:rol)";
		$res=$this->conex->prepare($sql);
		$res->execute(array(":num"=>$num, ":nom"=>$nom, ":dir"=>$dir,"email"=>$email, ":telf"=>$tel, ":pass"=>$passw,":estad"=>$act, ":rol"=>$rol));
		

		echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../senasoft2021/crea_usu.php';
			</script>";
        
    }

    public function insert_usu_cit($num,$nom,$fnaci,$eps,$fafi,$dir,$email,$tel,$nacu,$telacu,$passw,$bsex,$cresi,$ecivi,$rol)
    {
        
        $sql="INSERT INTO usuario VALUES (:num,:nom,:fnaci,:eps,:fafi,:dir,:email,:tel,:nacu,:telacu,:passw,:bsex,:cresi,:ecivi,:rol)";
		$res=$this->conex->prepare($sql);
		$res->execute(array(":num"=>$num,":nom"=>$nom,":fnaci"=>$fnaci,":eps"=>$eps,":fafi"=>$fafi,":dir"=>$dir,":email"=>$email,":tel"=>$tel,":nacu"=>$nacu,":telacu"=>$telacu,":passw"=>$passw,":bsex"=>$bsex,":cresi"=>$cresi,":ecivi"=>$ecivi,":rol"=>$rol));
		
		echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../senasoft2021/crea_usu_pas.php';
			</script>";
        
    }

    public function consul_usu($codi)
    {
        $sql="SELECT * FROM `usuario` WHERE idUsuario=:num";
        $res=$this->conex->prepare($sql);
	    $res->execute(array(':num'=>$codi));
        
 
		while ($reg=$res->fetch(PDO::FETCH_ASSOC)) 
		{
		
			$this->vector[]=$reg;
			
		
		}
		return $this->vector;
    }

    public function update_usu_cit($num,$nom,$fnaci,$eps,$fafi,$dir,$email,$tel,$nacu,$telacu,$passw,$bsex,$cresi,$ecivi,$rol)
    {
        
        $sql="UPDATE `usuario` SET `idUsuario`=:num,`Nombre`=:nom,`Fecha_nac`=:fnaci,`Eps`=:eps,`Fecha_Afili`=:fafi,`Direccion`=:dir,`Email`=:email,`Telefono`=:tel,`Responsable`=:nacu,`Tel_Respon`=:telacu,`Password`=:passw,`Sexo`=:bsex,`Ciudad`=:cresi,`Estado_Civil`=:ecivi,`Rol_idRol`=:rol WHERE idUsuario=:num";
       
        
		$res=$this->conex->prepare($sql);
		$res->execute(array(":num"=>$num,":nom"=>$nom,":fnaci"=>$fnaci,":eps"=>$eps,":fafi"=>$fafi,":dir"=>$dir,":email"=>$email,":tel"=>$tel,":nacu"=>$nacu,":telacu"=>$telacu,":passw"=>$passw,":bsex"=>$bsex,":cresi"=>$cresi,":ecivi"=>$ecivi,":rol"=>$rol));
		
		echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../update_usu_pas.php';
			</script>";
        
    }

    public function consul_usu_pro($codi)
    {
        $sql="SELECT * FROM `profesional` WHERE idMedico=:num";
        $res=$this->conex->prepare($sql);
	    $res->execute(array(':num'=>$codi));
        
 
		while ($reg=$res->fetch(PDO::FETCH_ASSOC)) 
		{
		
			$this->vector[]=$reg;
			
		
		}
		return $this->vector;
    }

    public function update_usu_pro($num,$nom,$dir,$email,$tel,$passw,$act,$rol,$espe)
    {
        
        $sql="UPDATE `profesional` SET `idMedico`=:num,`Nombre`=:nom,`Direccion`=:dir,`Email`=:email,`Telefono`=:tel,`Password`=:passw,`Estado`=:estad,`Rol_idRol`=:rol WHERE idMedico=:num";
        
		$res=$this->conex->prepare($sql);
		$res->execute(array(":num"=>$num,":nom"=>$nom,":dir"=>$dir,":email"=>$email,":tel"=>$tel,":passw"=>$passw,":estad"=>$act,":rol"=>$rol));
		
		$sql1="INSERT INTO `especialidad_has_medico` VALUES (:especi,:num)";
        $res1=$this->conex->prepare($sql1);
        $res1->execute(array(":especi"=>$espe,":num"=>$num));
        
        echo "<script type='text/javascript'>
					alert('proceso realizado de manera satisfactoria');
					window.location='../update_usu_pro.php';
			</script>";        
    }

    public function consulta_cita()
    {
        $sql="SELECT * FROM `usuario`";
        $res=$this->conex->prepare($sql);
	    $res->execute(array());
        
 
		while ($reg=$res->fetch(PDO::FETCH_ASSOC)) 
		{
		
			$this->vector[]=$reg;
			
		
		}
		return $this->vector;

    }

    public function consulta_cita1()
    {
        $sql="SELECT * FROM `profesional`";
        $res=$this->conex->prepare($sql);
	    $res->execute(array());
        
 
		while ($reg=$res->fetch(PDO::FETCH_ASSOC)) 
		{
		
			$this->variable[]=$reg;
			
		
		}
		return $this->variable;
    }

    public function crea_cita($fech_serv,$Hini,$Hfin,$Dir_ser,$Est,$usuar,$medi,$ciud)
    {
        $sql="INSERT INTO `servicios`(`Fecha_Serv`, `Hora_Ini`, `Hora_Fin`, `Dir_Servc`, `Estado`, `Usuario_idUsuario`, `Medico_idMedico`, `Ciudad`) VALUES (:fech_serv,:Hini,:Hfin,:Dir_ser,:Est,:usuar,:medi,:ciud)";
        
        $res=$this->conex->prepare($sql);
        $res->execute(array(":fech_serv"=>$fech_serv,":Hini"=>$Hini,":Hfin"=>$Hfin,":Dir_ser"=>$Dir_ser,":Est"=>$Est,":usuar"=>$usuar,":medi"=>$medi,":ciud"=>$ciud));
        
        echo "<script type='text/javascript'>
        alert('proceso realizado de manera satisfactoria');
        window.location='../senasoft2021/crea_cita.php';
        </script>";
    
    
    }

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

    

}
class Profesional extends conexion
{
    Private $query=array();
    Private $quer=array();
    Private $que=array();
    Private $qu=array();
    public function queryserv($id)
    {
        $sql="SELECT * FROM servicios
        INNER JOIN usuario
        ON servicios.Usuario_idUsuario=usuario.idUsuario
        INNER JOIN profesional
        ON servicios.Medico_idMedico=profesional.idMedico
        WHERE servicios.Medico_idMedico=:id";
        $res=$this->conex->prepare($sql);
        $res->execute(array(":id"=>$id));
        while($reg=$res->fetch(PDO::FETCH_ASSOC))
        {
            $this->query[]=$reg;
        }
        return $this->query;
    }
    public function queryidserv($ids)
    {
        $sql="SELECT * FROM servicios
        INNER JOIN usuario
        ON servicios.Usuario_idUsuario=usuario.idUsuario
        WHERE servicios.idServicios=:ids AND servicios.Estado=1";
        $res=$this->conex->prepare($sql);
        $res->execute(array(":ids"=>$ids));
        while($reg=$res->fetch(PDO::FETCH_ASSOC))
        {
            $this->quer[]=$reg;
        }
        return $this->quer;
    }
    public function Inserthis($inf1)
    {
        $date=$inf1[0]['date'];
        $path='c\:';
        $diag=$inf1[0]['Diagnostico'];
        $obs=$inf1[0]['obser'];
        $diag=$inf1[0]['Diagnostico'];
        $idserv=$inf1[0]['servicio'];
        $conci=$inf1[0]['conciencia'];
        $piel=$inf1[0]['estadopiel'];
        $dren=$inf1[0]['drenage'];
        $pun=$inf1[0]['venopuncion'];
        $alimen=$inf1[0]['alimentacion'];
        $depo=$inf1[0]['deposicion'];
        $orina=$inf1[0]['orina'];
        $oxi=$inf1[0]['oxigeno'];
        $Part=$inf1[0]['parterial'];
        $fcar=$inf1[0]['fcardiaca'];
        $fres=$inf1[0]['frespiratoria'];
        $temp=$inf1[0]['temp'];
        $gluco=$inf1[0]['gluco'];
        $oxi=$inf1[0]['oxi'];
        $cinicial=$inf1[0]['cantini'];
        $cadmin=$inf1[0]['cantad'];
        $via=$inf1[0]['via'];
        $tsol=$inf1[0]['tsolu'];
        $Tadmin=$inf1[0]['Tliqad'];
        if($date=="" or($path=="") or ($diag=="") or($obs=="") or($diag=="") or($idserv=="") or($conci=="") or($piel=="") or($dren=="") or($pun=="") or($alimen=="") or($depo=="") or($orina=="") or($oxi=="") or($Part=="") or($fcar=="") or($fres=="") or($temp=="") or($gluco=="") or($oxi=="") or($cinicial=="") or($cadmin=="") or($via=="") or($tsol=="") or($Tadmin==""))
        {
            echo"<script type'text/javascript'>
            alert('Debe diligenciar todos los campos');
            window.location='insertserpro.php';
            </script>";    
        }else
        {
        $sql="INSERT INTO h_clinica VALUES (null, :date, :path, :diag, :obs, :diag, :idserv, :conci, :piel, :dren, :pun, :alimen, :depo,
        :orina, :oxi, :Part,:fcar, :fres, :temp, :gluco, :oxi, :cinicial, :cadmin, :via, :tsol, :Tadmin);";
        $res=$this->conex->prepare($sql);
        $res->execute(array('date'=>$date,'path'=>$path,'diag'=>$diag,'obs'=>$obs,'diag'=>$diag,'idserv'=>$idserv,'conci'=>$conci,'piel'=>$piel,'dren'=>$dren,'pun'=>$pun,'alimen'=>$alimen,'depo'=>$depo,
        'orina'=>$orina,'oxi'=>$oxi,'Part'=>$Part,'fcar'=>$fcar,'fres'=>$fres,'temp'=>$temp,'gluco'=>$gluco,'oxi'=>$oxi,'cinicial'=>$cinicial,'cadmin'=>$cadmin,'via'=>$via,'tsol'=>$tsol,'Tadmin'=>$Tadmin));
        }
    }
    public function Queryhis($id)
        {
            $sql="SELECT * FROM servicios
            INNER JOIN h_clinica
            ON servicios.idServicios=h_clinica.Servicios_idServicios
            WHERE servicios.idServicios=:id";

            $res=$this->conex->prepare($sql);
            $res->execute(array('id'=>$id));
            while($reg=$res->fetch(PDO::FETCH_ASSOC))
            {
                $this->qu[]=$reg;
            }
            return $this->qu;
        }
    public function Insertmed($infor)
    {
        $nombre=$infor[0]['nom'];
        $presenta=$infor[0]['pres'];
        $Concentracion=$infor[0]['con'];
        $posologia=$infor[0]['pos'];
        $dilucion=$infor[0]['di'];
        $viaadmom=$infor[0]['via'];
        $fecha=$infor[0]['fecha'];
        $idhis=$infor[0]['hmedica'];

        if($nombre=="" or($presenta=="") or($Concentracion=="") or($posologia=="") or($dilucion=="") or($viaadmom=="") or($fecha=="") or($idhis==""))
        {
            echo"<script type'text/javascript'>
            alert('Debe diligenciar todos los campos');
            window.location='inshhiscli.php';
            </script>";
        }else
        {
            $sql="INSERT INTO medicamento VALUES(null,:nombre,:presenta,:Concentracion,:posologia,:dilucion,:viaadmom,:fecha,:idhis)";
            $res=$this->conex->prepare($sql);
            $res->execute(array('nombre'=>$nombre,'presenta'=>$presenta,'Concentracion'=>$presenta,'posologia'=>$posologia,'dilucion'=>$dilucion,'viaadmom'=>$viaadmom,'fecha'=>$fecha,'idhis'=>$idhis));
        }
        
    }
}

?>
