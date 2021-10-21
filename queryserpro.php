<?php
    $id=1024550858;

    require("class/class.php");
    $serv=new Profesional;
    $ser=$serv->queryserv($id);
?>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta servicios por atender</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/estilos.css">

</head>
<body>
    <div class="row">
        <center><h1>SERVICIOS POR ATENDER</h1></center>
    </div>
    <div class="container">
        <table class="table">
        <thead class=thead>
            <tr>
                <th>Id Servicio</th>
                <th>Fecha</th>
                <th>Hora inicio</th>
                <th>Direccion</th>  
                <th>Id Usuario</th>
                <th>Nombre Usuario</th>
                <th>ciudad</th>
                <th>Atender</th> 
            </tr>
        </thead>
             
            <?php
                for($i=0;$i<sizeof($ser);$i++){
            ?>
            <tr>
                <td><?php echo $ser[$i]['idServicios']; ?></td>
                <td><?php echo $ser[$i]['Fecha_Serv'];?></td>
                <td><?php echo $ser[$i]['Hora_Ini'];?></td>
                <td><?php echo $ser[$i]['Dir_Servc'];?></td>
                <td><?php echo $ser[$i]['Usuario_idUsuario'];?></td>
                <td><?php echo $ser[$i]['Nombre'];?></td>
                <td><?php echo $ser[$i]['Ciudad'];?></td>
                <?php $a=$ser[$i]['idServicios'];echo'<td ><a href=insertserpro.php?id='.$a.'>Atender</a></td>'?>
            </tr>
            <?php
              }
            ?>
        </table>
    </div>

</body>
</html>