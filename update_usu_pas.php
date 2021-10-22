<?php
require("class/class.php");
ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );

$codi=$_POST['documento'];

$tra=new Ips();
$tra1=$tra->consul_usu($codi);

if (isset($_POST['vali_in'])) 
{
    if (isset($_POST['vali_in'])=="validado") 
    {
        for ($i=0; $i<sizeof($tra1); $i++) { 
                    
            $tra3=$tra1[$i]["idUsuario"];
            $tra5=$tra1[$i]["Nombre"];
            $tra6=$tra1[$i]["Fecha_nac"];
            $tra7=$tra1[$i]["Eps"];
            $tra8=$tra1[$i]["Fecha_Afili"];
            $tra9=$tra1[$i]["Direccion"];
            $tra10=$tra1[$i]["Email"];
            $tra11=$tra1[$i]["Telefono"];
            $tra12=$tra1[$i]["Responsable"];
            $tra13=$tra1[$i]["Tel_Respon"];
            $tra14=$tra1[$i]["Password"];
            $tra15=$tra1[$i]["Sexo"];
            $tra16=$tra1[$i]["Ciudad"];
            $tra17=$tra1[$i]["Estado_Civil"];
            $tra18=$tra1[$i]["Rol_idRol"];

         }
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/estilos1.css">
    <link rel="stylesheet" href="css/estilos2.css">
    <title>Actualiza_usuario_pron</title>
<header>
    <center> 
    <img src="imagenes/imagen_clinica.jpg" class="row img">
    <table class="row table"  align="center" > 
        <tr>
            <td>
                <h1>VISTA ADMIN </h1>
            </td>
        </tr>
    </table>
    </center>
</header>
    <nav class="row">
        <center>
            <button class="row casilla"><a href="crea_usu.php" style="text-decoration:none">Crear Profesional</a></button>
            <button class="row casilla"><a href="crea_usu_pas.php" style="text-decoration:none">Crear Paciente</a></button>
            <button class="row casilla"><a href="crea_cita.php" style="text-decoration:none">Crear Citas</a></button>
            <button class="row casilla"><a href="update_usu_pas.php" style="text-decoration:none">Actualizar Paciente</a></button>
            <button class="row casilla"><a href="update_usu_pro.php" style="text-decoration:none">Actualizar Profesional</a></button>
        </center>

    </nav>
</head>
<body>
    <section>
    <center>
        <form action="" method="POST"> 
            <table border="1" class="table1">
                <tr>
                    <td colspan="2" align="center">
                        Digite el numero del paciente a actualizar
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="documento" placeholder="Digite documento a consultar"> 
                    </td>
                    <td>
                        <input type="hidden" name="vali_in" value="validado"> 
                        <input type="submit" value="info" name="info">
                    </td>
                </tr>
            </table>
        </form>
        <form action="class/upd_usu_pas.php" method="POST">
            <table border="1" class="table1">   
                <tr>
                    <td>
                        Digite numero de documento
                    </td>
                    <td>
                        <input type="text" name="docum"  value="<?php echo $tra3;?>" placeholder="digite documento"">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite nombres completos
                    </td>
                    <td>
                        <input type="text" name="nomb" placeholder="Digite nombre" value="<?php echo $tra5;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite fecha de nacimiento
                    </td>
                    <td>
                        <input type="date" name="f_naci" value="<?php echo $tra6;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite eps
                    </td>
                    <td>
                        <select name="eps" >
                            <option>Medimas</option>
                            <option value="Salud_Total">Salud Total</option>
                            <option>Compensar</option>
                            <option>Famisanar</option>
                            <option>Sanitas</option>
                            <option>Colmedicas</option>
                            <option>Sura</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite fecha de afiliacion
                    </td>
                    <td>
                        <input type="date" name="f_afi" value="<?php echo $tra8;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite la direccion (incluyendo complementos)
                    </td>
                    <td>
                        <input type="text" name="direcc" placeholder="direccion" value="<?php echo $tra9;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite su correo electronico
                    </td>
                    <td>
                        <input type="text" name="emai" placeholder="correo" value="<?php echo $tra10;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite numero de contacto
                    </td>
                    <td>
                        <input type="text" name="tel" placeholder="telefono" value="<?php echo $tra11;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite nombre del acudiente 
                    </td>
                    <td>
                        <input type="text" name="n_acu" placeholder="nombre completo" value="<?php echo $tra12;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite numero de contacto del acudiente
                    </td>
                    <td>
                        <input type="text" name="tel_acu" placeholder="telefono acudiente" value="<?php echo $tra13;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite contraseña
                    </td>
                    <td>
                        <input type="password" name="pass" placeholder="*********" value="<?php echo $tra14;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Seleccione el sexo biologico del paciente
                    </td>
                    <td>
                        <select name="Sex" >
                            <option>F</option>
                            <option>M</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite la ciudad de residencia
                    </td>
                    <td>
                        <input type="text" name="c_res" placeholder="Ciudad" value="<?php echo $tra16;?>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Seleccione estado civil
                    </td>
                    <td>
                        <select name="e_civi" >
                            <option>Soltero(a)</option>
                            <option>Casado(a)</option>
                            <option>Viudo(a)</option>
                            <option>Divorciado(a)</option>
                            <option value="Union_Libre">Union libre</option>
                            <option>Separado(a)</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"> 
                        <select name="esta">
                            <option value="2">Paciente</option>
                        </select>
                    </td>
                </tr>
            </table>
            <hr>
            <input type="hidden" name="valida" value="validar"> 
            <input type="submit" value="Actualizar" name="info">
        </form>
    </center>
    </section>
</body>
    <footer>

    </footer>

</html>