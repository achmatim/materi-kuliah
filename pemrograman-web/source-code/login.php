<article>
    <h1>Login</h1>
    <p>Silahkan isi form login secara lengkap</p>
    <form action="" method="post">
    <input type="text" name="username" placeholder="Username" required/><br/><br/>
    <input type="password" name="password" placeholder="Password" required/><br/><br/>
    <input type="submit" name="Login" value="Login"/>
    </form>
    <?php
    if(isset($_POST['Login'])) {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        if ($user=='budi' && $pass == 'luhur') {
            $pesan = "Anda berhasil login";
            $_SESSION['SESSUSER'] = $user;
            $_SESSION['ISLOGIN'] = TRUE;
        } else {
            $pesan = "Login gagal. Periksa username dan password Anda";
        }
        echo "<script>alert('$pesan');document.location='index.php'</script>";
    }
    ?>
</article>