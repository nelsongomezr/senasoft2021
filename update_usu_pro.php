<?php
require("class/class.php");
ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );
$codig=$_POST['documento'];

$tra=new Ips();
$tra1=$tra->consul_usu_pro($codig);

if (isset($_POST['vali_in'])) 
{
    if (isset($_POST['vali_in'])=="validado") 
    {

        for ($i=0; $i<sizeof($tra1); $i++) 
        { 


            $tra3=$tra1[$i]["idMedico"];
            $tra5=$tra1[$i]["Nombre"];
            $tra6=$tra1[$i]["Direccion"];
            $tra7=$tra1[$i]["Email"];
            $tra8=$tra1[$i]["Telefono"];
            $tra9=$tra1[$i]["Password"];
            $tra10=$tra1[$i]["Estado"];
            $tra11=$tra1[$i]["Rol_idRol"];
        
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
    <title>Crea_Usuarios_profe</title>
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
            <form action="class/upd_usu_pro.php" method="POST">
                <table border="1" class="table1">
                    <tr>
                        <td>
                            Digite numero de documento
                        </td>
                        <td>
                            <input type="text" name="docum" placeholder="digite documento" value="<?php echo $tra3;?>">
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
                         Digite la direccion (incluyendo complementos)
                        </td>
                        <td>
                            <input type="text" name="direcc" placeholder="direccion" value="<?php echo $tra6;?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite su correo electronico
                        </td>
                        <td>
                            <input type="text" name="emai" placeholder="correo" value="<?php echo $tra7;?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite numero de contacto
                        </td>
                        <td>
                            <input type="text" name="tel" placeholder="telefono" value="<?php echo $tra8;?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            digite contraseña 
                        </td>
                        <td>
                            <input type="password" name="pass" placeholder="contraseña" value="<?php echo $tra9;?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite estado actual
                        </td>
                        <td>
                        <select name="esta" >
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">  
                            <select name="especi" >
                            <option value="1">ORTOPEDIA</option>
                            <option value="2">MEDICINA GENERAL</option>
                            <option value="3">CARDIOLOGIA</option>
                            <option value="4">ENFERMERIA</option>
                            <option value="5">ADMINISTRATIVO</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">  
                            <select name="rol" >
                            <option value="3">Profesional</option>
                            <option value="1">Admin</option>
                            </select>
                        </td>
                    </tr>
                </table>
                    <input type="hidden" name="valida" value="validar">
                    <input type="submit" name="envia" value="Enviar">
            </form>
        </center>

    </section>

</body>
    <footer>

    </footer>

</html>