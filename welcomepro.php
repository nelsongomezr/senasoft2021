<?php 
$id=1024550858;

require("class/class.php");
$serv=new Profesional;
$ser=$serv->queryserv($id); 
$ns=sizeof($ser);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modulo del Profecional</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div class="row">
        <h1>Bienvenido Dr. <?php echo $ser[0]['Nombre']?></h1>
        <h2>Tiene <?php echo $ns; ?> Servicios para atender</h2>
        <h2><a href="queryserpro.php">Ver servicios</a></h2>
    </div>
</body>
</html>