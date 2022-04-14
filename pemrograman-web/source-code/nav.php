<nav>
    <ul>
        <li><a href="index.php">Home</a></li>
        <?php 
        if (!isset($_SESSION['ISLOGIN'])) {
        ?>
        <li><a href="index.php?page=login">Login</a></li>
        <?php } else { ?>
        <li><a href="index.php?page=profil">Profil</a></li>
        <li><a href="index.php?page=logout">Logout</a></li>
        <?php } ?>
    </ul>
</nav>