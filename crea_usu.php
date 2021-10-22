<?php
require("class/class.php");
ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );


if (isset($_POST['valida'])) 
{
    if (isset($_POST['valida'])=="validar") 
    {
        $num=$_POST['docum'];
        $nom=$_POST['nomb'];
        $dir=$_POST['direcc'];
        $email=$_POST['emai'];
        $tel=$_POST['tel'];
        $passw=$_POST['pass'];
        $rol=$_POST['esta'];
        $act=1;
        
        $tra=new Ips();
        $tra1=$tra->insert_pro($num,$nom,$dir,$email,$tel,$passw,$rol,$act);
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
                        <td>
                            Digite numero de documento
                        </td>
                        <td>
                            <input type="text" name="docum" placeholder="digite documento">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite nombres completos
                        </td>
                        <td>
                            <input type="text" name="nomb" placeholder="Digite nombre">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite la direccion (incluyendo complementos)
                        </td>
                        <td>
                            <input type="text" name="direcc" placeholder="direccion">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite su correo electronico
                        </td>
                        <td>
                            <input type="text" name="emai" placeholder="correo">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Digite numero de contacto
                        </td>
                        <td>
                            <input type="text" name="tel" placeholder="telefono">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            digite contraseña 
                        </td>
                        <td>
                            <input type="password" name="pass" placeholder="contraseña">
                        </td>
                    </tr>
                                    <tr>
                        <td colspan="2" align="center">  
                            <select name="esta" >
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