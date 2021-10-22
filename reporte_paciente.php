<?php
session_start();
if (!isset($_SESSION['login']))
{
    echo "<script type='text/javascript'>
        alert('Usuario no haz Iniciado Sesión, por favor Logueate!!!!');
        window.location='index.php';
        </script>";
}
require_once("class/class.php");
$usuario=$_SESSION['login']; 


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos6.css">
    
    <title>&#129657; Módulo Paciente &#129657;</title>
  
</head>

<body>

 
    <div class=titulo>
    <h1>MODULO PACIENTE</h1>
    </div>
    <div class="caja">
        <div class="fecha">
            <table>
            <tr>
                <td>Fecha Actual: <?php echo date("d-m-Y");?></td>
            </tr>
        </table>
        </div>
        <div class="cerrar">
            <table>
            <tr>
                <td><a href="logout.php">Cerrar Sesión</a></td>
            </tr>
        </table>
        </div>
    </div> 
    <center>
    <br>
    <img src="imagenes/imagen_clinica.jpg" width="500px" heigth="400px">   
    </center>
    <div class="reporte">
    <center>
            <form class="formNov" method="POST" name="novedad" action="">
                <br><h1>REPORTE TOTAL DE SERVICIOS</h1><hr><br>
                <div class="container" method="POST">
                    <div class="result_nov">
                    <table border=1>
                            <?php
                            $tra2=new Ips();
                            $tra3=$tra2->reporte_paciente($usuario);
                            $id_medico=$tra3[0]['Medico_idMedico'];
                            $tra4=new Ips();
                            $tra5=$tra4->medico($id_medico);
                            $medico=$tra5[0]['Nombre'];
                            
                        for($i=0; $i<sizeof($tra3); $i++){
                            ?>
                            <tr>
                            <td>Fecha del Servicio:</td>
                            <td><?php echo $tra3[$i]['Fecha_Serv'];?></td>
                            </tr>
                            <tr>
                            <td>Hora inicial:</td>
                            <td><?php echo $tra3[$i]['Hora_Ini'];?></td>
                            </tr>
                            <tr>
                            <td>Hora Final:</td>
                            <td><?php echo $tra3[$i]['Hora_Fin'];?></td>
                            </tr>
                            <tr>
                            <td>Dirección del Servicio:</td>
                            <td><?php echo $tra3[$i]['Dir_Servc'];?></td>
                            </tr>
                            <tr>
                            <td>Ciudad:</td>
                            <td><?php echo $tra3[$i]['Ciudad'];?></td>
                            </tr>
                            <tr>
                            <td>Observaciones:</td>
                            <td><?php echo $tra3[$i]['Observaciones'];?></td>
                            </tr>
                            <tr>
                            <td></td>
                            <td></td>
                            
                            <?php
                            }   
                        
                        ?>
                        </table>
                    </div>    
                </div>
            </form>
        </center><br>
    </div>
    <div class="regresar">
        <center><table>
                    <tr>
                        <td><a href="princ_usuario.php">Regresar</a></td>
                    </tr>
        </table></center>
    </div>
    </body>
</html>
