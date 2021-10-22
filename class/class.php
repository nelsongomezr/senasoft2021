<?php
require("conexion.php");
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
    public function Queryhis($idh)
        {
            print_r($idh);

            $sql="SELECT * FROM servicios
            INNER JOIN h_clinica
            ON servicios.idServicios=h_clinica.Servicios_idServicios
            WHERE servicios.idServicios=:idh";

            $res=$this->conex->prepare($sql);
            $res->execute(array('idh'=>$idh));
            while($reg=$res->fetch(PDO::FETCH_ASSOC))
            {
                $this->qu[]=$reg;
            }
            return $this->qu;
        }
    public function Insertmed($infor)
    {
        print_r($infor);
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