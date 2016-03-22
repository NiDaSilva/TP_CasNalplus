<?php
$i=0;
$lesProgrammes=array();
try {
    $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $requete="select * from programme";
    foreach  ($conn->query($requete) as $row) {
        $lesProgrammes[$i]=array(
            "annee" => $row["ANNEEREALISATION"],
            "description" => $row["DESCRIPTION"],
            "duree" => $row["DUREE"],
            "hd"=> $row["HD"],
            "inedit" =>  $row["DIFFUSION"],
            "nom" => $row["TITREORIGINAL"],
        );
        $i++;
    }
    echo json_encode($lesProgrammes);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}