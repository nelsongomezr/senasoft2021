<?php
    $ids=$_POST['servicio'];
    require("class/class.php");
    $info= new Profesional;
    $inf=$info->queryidserv($ids);

   /* ini_set( 'display_errors','Off' );
    ini_set( 'error_reporting', E_ALL );
    define( 'WP_DEBUG', false );
    define( 'WP_DEBUG_DISPLAY', false );*/
?>
<?php $inf[0]['idServicios']?>
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
    <div class="row">
        <center>
        <table>
            <form method="POST">
                <tr class="color">
                    <td><div class="row"><h3>Control medicamentos</h3></div></td>
                </tr>
                <tr class="color">
                    <th>Nombre</th>
                    <td><input type="text" name="nom" placeholder="Digite Nombre medicamento"></td>
                </tr>
                <tr class="color">
                    <th>Presentacion</th>
                    <td><input type="text" name="pres" placeholder="Digite presentacion"></td>
                </tr>
                <tr class="color">
                    <th>Concentracion</th>
                    <td><input type="text" name="con" placeholder="Digite concentracion"></td>
                </tr>
                <tr class="color">
                    <th>Posologia</th>
                    <td><input type="text" name="pos" placeholder="Digite la posologia"></td>
                </tr>
                <tr class="color">
                    <th>Dilucion</th>
                    <td><input type="text" name="di" placeholder="Digite dilucion"></td>
                </tr>
                <tr class="color">
                    <th>Via Admon</th>
                    <td><input type="text" name="via" placeholder="Digite via administracion"></td>
                </tr>
                    <!--fecha historia-->
                    <td><input type="hidden" name="fecha" value="<?php echo $inf[0]['Fecha_Serv'];?>"></td>
                    <!--id historia medica-->
                    <td><input type="hidden" name="idhis"></td>
                <tr>
                    <td><input type="submit"  name="enviar" class="btn btn-dark" value="Servicio Atendido"></td>
                </tr>
            </form>
        </table>
        </center>
    </div>
</body>
</html>
<?php
    if(isset($_POST['enviar']))
    {
        $med[]=$_POST;
        print_r($med);
        //$infor1=$info->Insertmed($med);
    }
?>