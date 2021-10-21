<?php
    $ids=$_GET['id'];
    require("class/class.php");
    $info= new Profesional;
    $inf=$info->queryidserv($ids);
    ini_set( 'display_errors','Off' );
    ini_set( 'error_reporting', E_ALL );
    define( 'WP_DEBUG', false );
    define( 'WP_DEBUG_DISPLAY', false );
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de servicios</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/estilos.css">
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
        <center>
        <form method="POST" class="#">
            <div class=row>
                <div class="col-3">
                </div>
                <div class="col-3 color2">
                Diagnostico:<input type="text" name="Diagnostico"><br> <!--enfermedad actual y motivo-->
                </div>
                <div class="col-3 color2">
                Drenages:<input type="text" name="drenage"><br>    
                </div>
            </div>

            <div class="row"> 
                <div class="col-3">
                </div>
                <div class="col-3 color2">
                <b>Conciencia: </b>
                    Alerta <input type="radio" name="conciencia" value="Alerta">
                    Somnolencia <input type="radio" name="conciencia" value="Somnolencia">
                    Coma <input type="radio" name="conciencia" value="Coma"><br>
                </div>
                <div class="col-3 color2">
                <b>Estado de la piel:  </b>
                    Integra <input type="radio" name="estadopiel" value="Integra">
                    Zona de presion <input type="radio" name="estadopiel" value="Zona de presion">
                    Escara <input type="radio" name="estadopiel" value="Escara"><br>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                </div>
                <div class="col-3 color2">
                <b>Alimentacion: </b>
                    Enteral <input type="radio" name="alimentacion" value="Enteral">
                    Parental <input type="radio" name="alimentacion" value="Parental">
                    Oral <input type="radio" name="alimentacion" value="Oral"><br>
                </div>
                <div class="col-3 color2">                    
                <b>Deposicion:</b>
                    Normal <input type="radio" name="deposicion" value="Normal">
                    Disenterico <input type="radio" name="deposicion" value="Disenterico">
                    Estreñido <input type="radio" name="deposicion" value="Estreñido"><br>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                </div>
                <div class="col-3 color2">
                <b>Venopuncion:</b>
                Edema: <input type="radio" name="venopuncion" value="Edema">
                Parental: <input type="radio" name="venopuncion" value="Parental">
                Rubor: <input type="radio" name="venopuncion" value="Rubor">
                Calor: <input type="radio" name="venopuncion" value="Calor">
                Dolor: <input type="radio" name="venopuncion" value="Dolor"><br>
                </div>
                <div class="col-3 color2">
                <b>Orina:</b>
                Normal <input type="radio" name="orina" value="Normal">
                Retencion<input type="radio" name="orina" value="Retencion">
                Incontinencia<input type="radio" name="orina" value="Incontinencia">
                Sonda Vesical<input type="radio" name="orina" value="Sonda Vesical"><br>
                </div>
</div>
            <div class="col-4 color2">
                <b>Oxigeno:</b>
                Bipap <input type="radio" name="oxigeno" value="Bipap">
                Cipap <input type="radio" name="oxigeno" value="Cipap">
                Condensador <input type="radio" name="oxigeno" value="Condensador">
                Bala <input type="radio" name="oxigeno" value="Bala"><br>
            </div>

            </div>
            <input type="hidden" name="date" value=""><br><!--fecha--> 
            <input type="hidden" name="servicio" value=""><!--id de servicio-->
            
            <!--signos vitales-->
            Presion Arterial: <input type="text" name="parterial"><br>
            Frecuencia Cardiaca:<input type="text" name="fcardiaca"><br>
            Frecuencia respiratoria: <input type="text" name="frespiratoria"><br>
            Temperatura: <input type="text" name="temp"><br>
            Glucometria: <input type="text" name="gluco"><br>
            Oximetria: <input type="text" name="oxi"><br>
            <!--Administracion de liquidos-->
            Cantidad inicial: <input type="text" name="cantini"><br>
            Cantidad administrada: <input type="text" name="cantad"><br>
            Via: <input type="text" name="via"><br>
            Tipo Solucion: <input type="text" name="tsolu"><br>
            Total liquido administrado: <input type="text" name="Tliqad"><br>

            <!--Primera parte-->


            Observaciones: <textarea name=obser></textarea><br>

            <input type="submit" class="btn btn-dark" value="Registrar">

        </form>
</center>
    </div>

</body>
</html>