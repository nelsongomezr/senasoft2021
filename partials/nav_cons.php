<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos/nav.css">
    <title>Nav Partial</title>
</head>
<body>
<nav class="menu">
        <ul>
            <li><?php echo '<a href=consulta.php>INICIO</a>';?></li>
            <li><?php echo '<a href=actual.php?id='.'>ACTUALIZACION DE DATOS</a>';?></li>
            <li><?php echo '<a href=cons_nov.php?id='.'>CONSULTA NOVEDADES</a>';?></li>
            <li><a href="logout.php">CERRAR SESION</a></li>
        </ul>
</nav>
</body>
</html>


