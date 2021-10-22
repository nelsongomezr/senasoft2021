<?php 
require("class.php");

if (isset($_POST['valida']))
{
    if (isset($_POST['valida'])=="validar") {
        
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
  
        $tra20=new Ips();
        $tra21=$tra20->update_usu_cit($num,$nom,$fnaci,$eps,$fafi,$dir,$email,$tel,$nacu,$telacu,$passw,$bsex,$cresi,$ecivi,$rol);
        
    }
}








?>