<?php
session_start();
include "header.php";
include "nav.php";

///page selector
$page = isset($_GET['page'])? $_GET['page'] : "home";
switch ($page) {
    case 'profil' : include "profil.php"; break;
    case 'login'  : include "login.php"; break;
    case 'logout' : include "logout.php"; break;
    case 'home' :
    default     : include "home.php";
}

include "footer.php";
?>