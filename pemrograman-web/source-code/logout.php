<?php
if (isset($_SESSION['ISLOGIN'])) {
    unset($_SESSION);
    session_destroy();
}
?>
<script>
    alert('Anda berhasil logout');
    document.location='index.php';
</script>