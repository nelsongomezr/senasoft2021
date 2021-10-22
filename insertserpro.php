<?php
    session_start();
    if (!isset($_SESSION['login']))
    {
        echo "<script type='text/javascript'>
            alert('Usuario no haz Iniciado Sesión, por favor Logueate!!!!');
            window.location='index.php';
            </script>";
    }
    $ids=$_GET['id'];
    require("class/class.php");
    $info= new Profesional;
    $inf=$info->queryidserv($ids); 
    $a=$ids;
    //print_r($hme);
    /*ini_set( 'display_errors','Off' );
    ini_set( 'error_reporting', E_ALL );
    define( 'WP_DEBUG', false );
    define( 'WP_DEBUG_DISPLAY', false );*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de servicios</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="row">
        <div class="row color1">
            <h3> servicio #  <?php echo "   ".$inf[0]['idServicios']?>
        </div>
        <div class="col-4 color2">
            fecha: <?php echo  "   ".$inf[0]['Fecha_Serv']?>
        </div>
        <div class="col-4 color2">
            Hora inicio:<?php echo "   ".$inf[0]['Hora_Ini']?>
        </div>
        <div class="col-4 color2">
            hora finalizacion: <?php echo "   ".$inf[0]['Hora_Fin']?>
        </div>
    </div>
    <div class="row">
        <div class="col-6 color2">
            Direccion servicio:<?php echo "   ".$inf[0]['Dir_Servc']?>
        </div>
        <div class="col-6 color2">
            Ciudad:<?php echo "   ".$inf[0]['Ciudad']?>
        </div>
    </div>
    <div class="row">
        <div class="row color1">
            <h3>Datos del paciente</h3>
        </div>
        <div class="col-3 color2">
            Identificacion:<?php echo "   ".$inf[0]['Usuario_idUsuario']?>
        </div>
        <div class="col-3 color2">
            Nombre:<?php echo "   ".$inf[0]['Nombre']?>
        </div>
        <div class="col-3 color2">
            Fecha nacimiento:<?php echo "   ".$inf[0]['Fecha_nac']?>
        </div>
        <div class="col-3 color2">
            Edad:<?php 
            $fnac= date('Y', strtotime($inf[0]['Fecha_nac']))." ";
            $hoy = date("Y");
            echo "   ".$edad=$hoy-$fnac;
            ?>
        </div>
    </div>
    <div class="row">
        <div class="col-4 color2">
            Direccion recidencia:<?php echo "   ".$inf[0]['Direccion']?>
        </div>
        <div class="col-4 color2">
            Email:<?php echo "   ".$inf[0]['Email']?>
        </div>
        <div class="col-4 color2">
            Telefono:<?php echo "   ".$inf[0]['Telefono']?>
        </div>
    </div>
    <div class="row">
    <div class="col-4 color2">
            sexo paciente:<?php echo "   ".$inf[0]['Sexo']?>
        </div>
        <div class="col-4 color2">
            Persona responsable:<?php echo "   ".$inf[0]['Responsable']?>
        </div>
        <div class="col-4 color2">
            Telefono:<?php echo "   ".$inf[0]['Tel_Respon']?>
        </div>
    </div>
    <div class="row color1">
        <h2>Nota Enfermeria</h2>
    </div>
    <div class="row">
    <!--Formilario historia medica-->
        <center>
        <table>
            <form method="POST">
                <tr class="color">
                    <th>Conciencia:</th>
                    <td>
                        Alerta <input type="radio" name="conciencia" value="Alerta">
                        Somnolencia <input type="radio" name="conciencia" value="Somnolencia">
                        Coma <input type="radio" name="conciencia" value="Coma"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Estado de la piel:</th>
                    <td>
                        Integra <input type="radio" name="estadopiel" value="Integra">
                        Zona de presion <input type="radio" name="estadopiel" value="Zona de presion">
                        Escara <input type="radio" name="estadopiel" value="Escara"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Alimentacion:</th>
                    <td>
                        Enteral <input type="radio" name="alimentacion" value="Enteral">
                        Parental <input type="radio" name="alimentacion" value="Parental">
                        Oral <input type="radio" name="alimentacion" value="Oral"><br>
                </td>
                </tr>
                <tr class="color">
                    <th>Deposicion:</th>
                    <td>
                        Normal <input type="radio" name="deposicion" value="Normal">
                        Disenterico <input type="radio" name="deposicion" value="Disenterico">
                        Estreñido <input type="radio" name="deposicion" value="Estreñido"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Venopuncion:</th>
                    <td>
                        Edema: <input type="radio" name="venopuncion" value="Edema">
                        Parental: <input type="radio" name="venopuncion" value="Parental">
                        Rubor: <input type="radio" name="venopuncion" value="Rubor">
                        Calor: <input type="radio" name="venopuncion" value="Calor">
                        Dolor: <input type="radio" name="venopuncion" value="Dolor"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Orina:</th>
                    <td>
                        Normal <input type="radio" name="orina" value="Normal">
                        Retencion<input type="radio" name="orina" value="Retencion">
                        Incontinencia<input type="radio" name="orina" value="Incontinencia">
                        Sonda Vesical<input type="radio" name="orina" value="Sonda Vesical"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Oxigeno:</th>
                    <td>
                        Bipap <input type="radio" name="oxigeno" value="Bipap">
                        Cipap <input type="radio" name="oxigeno" value="Cipap">
                        Condensador <input type="radio" name="oxigeno" value="Condensador">
                        Bala <input type="radio" name="oxigeno" value="Bala"><br>
                    </td>
                </tr>
                <tr class="color">
                    <th>Diagnostico:</th>
                    <td><input type="text" name="Diagnostico" placeholder="Digite el diagnostico"><br></td><!--enfermedad actual y motivo-->
                </tr>
                <tr class="color">
                    <th>Drenages:</th>
                    <td><input type="text" name="drenage" placeholder="Digite el tipo de drenaje"><br></td>
                </tr>
                <!--signos vitales-->
                <tr class="color">
                    <td><div class="row"><h3>Signos vitales</h3></div></td>
                </tr>
                <tr class="color">
                    <th>Presion Arterial:</th>
                    <td><input type="text" name="parterial" placeholder="Digite la precion arterial"><br></td>
                </tr>
                <tr class="color">
                    <th>Frecuencia Cardiaca:</th>
                    <td><input type="text" name="fcardiaca" placeholder="Digite la frecuencia cardiaca"></td>
                </tr>
                <tr class="color">
                    <th>Frecuencia respiratoria:</th>
                    <td><input type="text" name="frespiratoria" placeholder="Digite la frecuencia respiratoria"></td>
                </tr>
                <tr class="color">
                    <th>Temperatura:</th>
                    <td><input type="text" name="temp" placeholder="Digite la temperatura"></td>
                </tr>
                <tr class="color">
                    <th>Glucometria:</th>
                    <td><input type="text" name="gluco" placeholder="Digite glucometria"></td>
                </tr>
                <tr class="color">
                    <th>Oximetria:</th>
                    <td><input type="text" name="oxi" placeholder="Digite oximetria"></td>
                </tr>
                <!--Administracion de liquidos-->
                <tr class="color">
                    <td colspan="2"><div class="row"><h3>Administracion de liquidos</h3></div></td>
                </tr>
                <tr class="color">
                    <th>Cantidad inicial:</th>
                    <td><input type="text" name="cantini" placeholder="Digite cantidad"></td>
                </tr>
                <tr class="color">
                    <th>Cantidad administrada:</th>
                    <td><input type="text" name="cantad" placeholder="Digite cantidad"></td>
                </tr>
                <tr class="color">
                    <th>Via:</th>
                    <td><input type="text" name="via" placeholder="Digite via"></td>
                </tr>
                <tr class="color">
                    <th>Tipo Solucion:</th>
                    <td><input type="text" name="tsolu" placeholder="Digite tipo de solucion"></td>
                </tr>
                <tr class="color">
                    <th>Total liquido administrado:</th>
                    <td><input type="text" name="Tliqad" placeholder="Digite total"></td>
                </tr>
                <tr class="color"> 
                    <th>Observaciones:</th>
                    <td><textarea name="obser" rows="8" cols="23" placeholder="Digite su observacion aqui"></textarea></td>
                </tr>
            <input type="hidden" name="date" value="<?php echo $inf[0]['Fecha_Serv'];?>"><br><!--fecha--> 
            <input type="button">
            <input type="hidden" name="servicio" value="<?php echo $ids;?>"><!--id de servicio-->
            <input type="hidden" name="hmedica" value="<?php $hme[0]['Id_Hclinica'];?>"><!--id historia medica-->
            <tr>
                <td  align="center"><input type="submit" name="siguiente" class="btn btn-dark" value="Guardar"></td>
                <?php echo'<td><button class= btn btn-dark><a href=inshhiscli.php?id='.$a.'>Siguiente</a></td>'?>
            </tr>
        </form>
        </table>
</center>
    </div>

</body>
</html>
<?php 

if (isset($_POST['siguiente']))
{
    $inf1[]=$_POST;
    $pos=$info->Inserthis($inf1);
}

?>