<?php
session_start();
if (!isset($_SESSION['login']))
{
    echo "<script type='text/javascript'>
        alert('Usuario no haz Iniciado Sesión, por favor Logueate!!!!');
        window.location='index.php';
        </script>";
}
require("class/class.php");

ini_set( 'display_errors','Off' );
ini_set( 'error_reporting', E_ALL );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );

$tra=new Ips();
$tra1=$tra->consulta_cita();

$tra2=$tra->consulta_cita1();

if (isset($_POST['valida'])) 
{
    if (isset($_POST['valida'])=="validar") 
    {
        $fech_serv=$_POST['f_serv'];
        $Hini=$_POST['H_ini'];
        $Hfin=$_POST['H_fin'];
        $Dir_ser= $_POST['D_servi'];
        $Est=$_POST['Est'];
        $usuar=$_POST['User_asig'];
        $medi=$_POST['Med_asig'];
        $ciud=$_POST['Ciud'];

        $tra3=$tra->crea_cita($fech_serv,$Hini,$Hfin,$Dir_ser,$Est,$usuar,$medi,$ciud);
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
    <title>InicioAdmin</title>
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
        <button class="row casilla"><a href="logout.php">Cerrar Sesión</a></a></button>    
    </center>

    </nav>
</head>
<body>
    <section>
        <form action="" method="POST">
            <table border="2" align="center" class="table1">
                <tr>
                    <td>
                        <h3>Fecha del servicio</h3>
                    </td>
                    <td>
                        <h3>Hora inicial</h3>
                    </td>
                    <td>
                        <h3>Hora Final</h3>
                    </td>
                    <td>
                        <h3>Direccion del servicio</h3>
                    </td>
                    <td>
                        <h3>Estado</h3>
                    </td>
                    <td>
                        <h3>Usuario asignado</h3>
                    </td>
                    <td>
                        <h3>Medico(a)/Enfermero(a)</h3>
                    </td>
                    <td>
                        <h3>Ciudad de atencion</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="date" name="f_serv">
                    </td>
                    <td>
                        <input type="time" name="H_ini">
                    </td>
                    <td>
                        <input type="time" name="H_fin">
                    </td>
                    <td>
                        <input type="text" name="D_servi">
                    </td>
                    <td>
                        <select name="Est" >
                            <option value="1">Activo</option>
                        </select>
                    </td>
                    <td>
                        <select name="User_asig" >
                            <?php
                            for ($i=0; $i<sizeof($tra1) ; $i++) 
                            { 
                                $idPas=$tra1[$i]['idUsuario'];
                                $nom=$tra1[$i]['Nombre'];

                            ?>    
                                <option value="<?php echo$idPas;?>">
                                    <?php echo$nom; ?>
                                </option>
                            <?php
                            }
                            ?>
                        </select>
                    </td>
                    <td>
                    <select name="Med_asig" >
                            <?php
                            for ($i=0; $i<sizeof($tra2) ; $i++) 
                            { 
                                $idMed=$tra2[$i]['idMedico'];
                                $nomb=$tra2[$i]['Nombre'];

                            ?>    
                                <option value="<?php echo$idMed;?>">
                                    <?php echo$nomb; ?>
                                </option>
                            <?php
                            }
                            ?>
                        </select>
                    </td>
                    <td>
                        <select name="Ciud" >
                            <option value="BOGOTA">Bogota</option>
                        </select>
                    </td>
                </tr>
            </table>
            <center>
                <input type="hidden" name="valida" value="validar">
                <input type="submit" name="Crea" value="Crear">
            </center> 
        </form>    
    </section>
</body>
    <footer>

    </footer>

</html>