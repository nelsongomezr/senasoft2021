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
$tra=new Ips();
$tra1=$tra->trae_datos($usuario);
$eps=$tra1[0]['Eps'];
$nom=$tra1[0]['Nombre'];
$fecha=$tra1[0]['Fecha_nac'];
$dir=$tra1[0]['Direccion'];
$email=$tra1[0]['Email'];
$tel=$tra1[0]['Telefono'];
$respo=$tra1[0]['Responsable'];
$tel_res=$tra1[0]['Tel_Respon'];
$sex=$tra1[0]['Sexo'];
$ciudad=$tra1[0]['Ciudad'];
$estado=$tra1[0]['Estado_Civil'];

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
    <img src="imagenes/imagen_clinica.jpg" heigth="400px">   
    </center>
    <div class="principal">
        <div class="formulario">
            <form class="form-paciente" method="post" name="modulo">
                <h4>Datos Personales</h4>
                <div class="datos">
                    <table>
                        <tr>
                        <td><b>EPS:</b></td>
                        <td><?php echo $eps;?></td>
                        </tr>
                        <tr>
                        <td><b>Nombre:</b> </td> 
                        <td><?php echo $nom;?></td>
                        </tr>
                        <tr>
                        <td><b>Fecha de Nacimiento</b>:</td> 
                        <td><?php echo $fecha;?></td>
                        </tr>
                        <tr>
                        <td><b>Dirección:</b></td>
                        <td><?php echo $dir;?></td>
                        </tr>
                        <tr>
                        <td><b>Email:</b></td>
                        <td><?php echo $email;?></td>
                        </tr>
                        <tr>
                        <td><b>Teléfono Paciente:</b></td>
                        <td><?php echo $tel;?></td>
                        </tr>
                        <tr>
                        <td><b>Responsable:</b></td>
                        <td> <?php echo $respo;?></td>
                        </tr>
                        <tr>
                        <td><b>Teléfono del Responsable:</b></td>
                        <td><?php echo $tel_res;?></td>
                        </tr>
                        <tr>
                        <td><b>Sexo Paciente:</b></td>
                        <td><?php echo $sex;?></td>
                        </tr>
                        <tr>
                        <td><b>Ciudad:</b></td>
                        <td><?php echo $ciudad;?></td>
                        </tr>
                        <tr>
                        <td><b>Estado Civil:</b></td>
                        <td><?php echo $estado;?></td>
                        </tr>
                    </table>
                    <br>
                    <hr>
                </div>    
            </form>
        </div>
            <div class="botones">
                <a class="buttons" href="reporte_paciente.php">Ver Reportes</a><br> <br> 
                <a class="buttons" href="">Descargar Historia Clinica</a><br> <br> 
            </div>
    </div>
    </body>
</html>
