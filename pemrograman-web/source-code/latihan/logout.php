<?php
if (isset($_SESSION['ISLOGIN'])) {
    unset($_SESSION);
    session_destroy();
    echo "<script>document.location='index.php';</script>";
}
?>