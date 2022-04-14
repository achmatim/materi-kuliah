<article>
    <h1>Login</h1>
    <p>Isi form login dengan benar</p>
    <form action="" method="post">
        <input type="text" name="username" placeholder="Username" /><br/><br/>
        <input type="password" name="password" placeholder="Password" /><br/><br/>
        <input type="submit" name="login" value="Login" />
    </form>
    <?php 
    if (isset($_POST['login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        if ($username=='budi' && $password=='luhur') {
            $pesan = "Login berhasil";
            $_SESSION['ISLOGIN'] = TRUE;
            $_SESSION['USERNAME'] = $username;
        } else {
            $pesan = "Login gagal. Periksa username dan password Anda";
        }
        echo "<script>
        alert('$pesan');
        document.location='index.php';
        </script>";
    }
    ?>
</article>