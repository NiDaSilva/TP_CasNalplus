<?php
$i=0;
$lesChaines=array();
try {
    $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $requete="select * from chaine";
    foreach  ($conn->query($requete) as $row) {
        $lesChaines[$i]= $row["NOMCHAINE"];
        $i++;
    }
    echo json_encode($lesChaines);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}