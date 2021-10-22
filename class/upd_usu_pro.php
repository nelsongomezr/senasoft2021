<?php 
require("class.php");

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
        $act=$_POST['esta'];
        $rol=$_POST['rol'];
        $espe=$_POST['especi'];
  
        $tra20=new Ips();
        $tra21=$tra20->update_usu_pro($num,$nom,$dir,$email,$tel,$passw,$act,$rol,$espe);
        
    }
}








?>