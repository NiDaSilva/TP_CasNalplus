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
            "inedit"=>  $row["DIFFUSION"],
            "nom"=> $row["TITREORIGINAL"],
            "periode"=> $row["ID_P"],
            "type"=>$row["ID_T"],
            "signaletiquejeunesse"=> $row["ID_S"],
            "nationalite"=> $row["ID_N"]
        );
        $i++;
    }
    echo json_encode($lesProgrammes);
    $pdo = null;
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}