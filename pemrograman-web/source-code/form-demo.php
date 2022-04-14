<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Penanganan Form dengan PHP</title>
    </head>
    <body>
        <h1>Form Nilai Mahasiswa</h1>
        <form action="" method="post">
        NIM :<br/><input type="text" name="nim" /><br/><br/>
        NAMA :<br/><input type="text" name="nama" /><br/><br/>
        NILAI :<br/><input type="number" name="nilai" /><br/><br/>
        <input type="submit" name="kirim" value="Simpan"/>
        </form>
        <?php
        echo date("d/m/Y h:i:s");
        if(isset($_POST['kirim'])) {
            $nim = $_POST['nim'];
            $nama = $_POST['nama'];
            $nilai = $_POST['nilai'];
            $kelulusan = getLulus($nilai);
            echo "<h1>Data Nilai Mahasiswa</h1>";
            echo "NIM : $nim <br/>";
            echo "NAMA : $nama <br/>";
            echo "NILAI : $nilai <br/>";
            echo "LULUS? : $kelulusan <br/>";
        }
        function getLulus($nilai) {
            if ($nilai >= 60) {
                return "LULUS";
            } else {
                return "GAGAL";
            }
        }
        ?>
    </body>
</html>