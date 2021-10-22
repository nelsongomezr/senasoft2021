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
        $fnaci=$_POST['f_naci'];
        $eps=$_POST['eps'];
        $fafi=$_POST['f_afi'];
        $dir=$_POST['direcc'];
        $email=$_POST['emai'];
        $tel=$_POST['tel'];
        $nacu=$_POST['n_acu'];
        $telacu=$_POST['tel_acu'];
        $passw=$_POST['pass'];
        $bsex=$_POST['Sex'];
        $cresi=$_POST['c_res'];
        $ecivi=$_POST['e_civi'];
        $rol=$_POST['esta'];

        $tra=new Ips();
        $tra1=$tra->insert_usu_cit($num,$nom,$fnaci,$eps,$fafi,$dir,$email,$tel,$nacu,$telacu,$passw,$bsex,$cresi,$ecivi,$rol);
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
                        Digite fecha de nacimiento
                    </td>
                    <td>
                        <input type="date" name="f_naci">
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
                        <input type="date" name="f_afi">
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
                        Digite nombre del acudiente 
                    </td>
                    <td>
                        <input type="text" name="n_acu" placeholder="nombre completo">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite numero de contacto del acudiente
                    </td>
                    <td>
                        <input type="text" name="tel_acu" placeholder="telefono acudiente">
                    </td>
                </tr>
                <tr>
                    <td>
                        Digite contraseña
                    </td>
                    <td>
                        <input type="password" name="pass" placeholder="*********">
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
                        <input type="text" name="c_res" placeholder="Ciudad">
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
            <input type="hidden" name="valida"="validar">
            <input type="submit" name="envia"="Enviar">
        </form>
    </center>
    </section>
</body>
    <footer>

    </footer>

</html>