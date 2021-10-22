<?php
require_once("class/class.php");

ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>&#129658;Bienvenidos al gestor de atención de servicios médicos &#128138;</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<center>
    <br>
    <img src="imagenes/imagen_clinica.jpg" width="500px" heigth="400px">   
</center>
    <div class="titulo">
        <h1>BIENVENIDO(A) AL SISTEMA DE GESTION DE SERVICIOS</h1>
    </div>
    <form class="form-login" method="post" name="login" action="class/valida_usuario.php">
        <center><img src="imagenes/login.png" width="70px" heigth="70px"></center><br>
        <h4>Ingresa tus Credenciales</h4>
        
        <input class="controls" type="text" name="usuario" value="" placeholder="&#128273;Usuario" required>
        <input class="controls" type="password" name="pass" value="" placeholder="&#128272;Contraseña" required>
        
        <input class="buttons" type="submit" name="enviar" value="Acceder">
        <p><a href="Recuperacion_contraseña.php">¿Olvidaste tu Contraseña?</a></p>
    </form>
    <br><br><br><br>
</body>
</html>
