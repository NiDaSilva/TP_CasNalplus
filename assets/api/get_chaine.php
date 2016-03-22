<?php
$i=0;
$lesProgrammes=array();
try {
    $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $requete="select LIBELLE from chaine";
    foreach  ($conn->query($requete) as $row) {
        $lesChaine[$i]= $row["LIBELLE"];
        $i++;
    }
    echo json_encode($lesProgrammes);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}