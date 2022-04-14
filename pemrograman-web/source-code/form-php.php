<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Penanganan Form di PHP</title>
    </head>
    <body>
        <h1>Input Data Mahasiswa</h1>
        <form action="" method="POST">
        NIM : <br/><input type="text" name="nim" /><br/><br/>
        NAMA : <br/><input type="text" name="nama" /><br/><br/>
        NILAI : <br/><input type="number" name="nilai" /><br/><br/>
        <input type="submit" name="kirim" value="Simpan"/>
        </form>
        <?php
        if (isset($_POST['kirim'])) {
            $nim    = $_POST['nim'];
            $nama   = $_POST['nama'];
            $nilai  = $_POST['nilai'];

            echo "<h1>Data Mahasiswa</h1>";
            echo "NIM : $nim <br/>";
            echo "NAMA : $nama <br/>";
            echo "NILAI : $nilai <br/>";
        }
        ?>
    </body>
</html>