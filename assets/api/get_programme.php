<?php
$tab=array();
$i=0;
try {
    $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $requete="select * from programme";
    foreach  ($conn->query($requete) as $row) {
        $tab[$i]=$row;
        $i++;
    }
    echo json_encode($tab);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}