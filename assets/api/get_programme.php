<?php
$i=0;
$lesProgrammes=array();
try {
    $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $requete="select * from programme";
    foreach  ($conn->query($requete) as $row) {
        $lesProgrammes[$i]=array(
            "annee" => $row["ANNEE"],
            "description" => $row["DESCRIPTION"],
            "duree" => $row["DUREE"],
            "hd"=> $row["HD"],
            "inedit" =>  $row["INEDIT"],
            "nom" => $row["NOM"],
        );
        $i++;
    }
    echo json_encode($lesProgrammes);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}