<?php
require_once("class.php");

ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );

$usuario=$_POST['usuario'];
$pass=$_POST['pass'];
$tra=new Ips();

$tra1=$tra->valida_pass($usuario,$pass);

$usu=$tra1[0]['idUsuario'];
$pass1=$tra1[0]['Contraseña'];
$rol=$tra1[0]['Rol_idRol'];


$tra2=new Ips();
$tra3=$tra2->valida_pass1($usuario,$pass);

$usu1=$tra3[0]['idMedico'];
$pass2=$tra3[0]['Contraseña'];
$rol1=$tra3[0]['Rol_idRol'];

if ($usuario===$usu && $pass===$pass1 && $rol==="2")
{
    session_start();
    $_SESSION['login']=$_POST['usuario'];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL PACIENTE');
        window.location='../princ_usuario.php';
        </script>";

}elseif ($usuario===$usu1 && $pass===$pass2 && $rol1==="1"){



    session_start();
    $_SESSION['login']=$_POST["usuario"];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL ADMINISTRATIVO');
        window.location='../princ_admin.php';
        </script>";
    
}elseif($usuario===$usu1 && $pass===$pass2 && $rol1==="3")
{
    session_start();
    $_SESSION['login']=$_POST['usuario'];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL PROFESIONAL');
        window.location='../consulta.php';
        </script>";
}
else{   
        echo "<script type='text/javascript'>
        alert('No coinciden las credenciales... Por favor verificar!!');
        window.location='../index.php';
        </script>";
    }
?>
=======
<?php
require_once("class.php");

ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );

$usuario=$_POST['usuario'];
$pass=$_POST['pass'];
$tra=new Ips();

$tra1=$tra->valida_pass($usuario,$pass);

$usu=$tra1[0]['idUsuario'];
$pass1=$tra1[0]['Contraseña'];
$rol=$tra1[0]['Rol_idRol'];



if ($usuario===$usu && $pass===$pass1 && $rol==="1")
{
    session_start();
    $_SESSION['login']=$_POST["usuario"];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL ADMINISTRATIVO');
        window.location='../princ_admin.php';
        </script>";
    
}elseif ($usuario===$usu && $pass===$pass1 && $rol==="2")
{
    session_start();
    $_SESSION['login']=$_POST['usuario'];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL PACIENTE');
        window.location='../princ_usuario.php';
        </script>";
}elseif ($usuario===$usu && $pass===$pass1 && $rol==="3")
{
    session_start();
    $_SESSION['login']=$_POST['usuario'];

    echo "<script type='text/javascript'>
        alert('Bienvenido al Sistema de Gestión de Servicios..  Ingresaste con ROL PROFESIONAL');
        window.location='../consulta.php';
        </script>";
}
else{   
        echo "<script type='text/javascript'>
        alert('No coinciden las credenciales... Por favor verificar!!');
        window.location='../index.php';
        </script>";
    }
?>