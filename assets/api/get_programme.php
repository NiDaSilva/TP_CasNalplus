_<?php
if(isset($_REQUEST["id_programme"]))
{
    $id=$_REQUEST["id_programme"];
}
else {

    try {
        $conn = new PDO('mysql:host=localhost;dbname=casnalplus;charset=utf8', 'root', '');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $requete = "SELECT * FROM diffusion INNER JOIN ";
        $row = $conn->query($requete);
        $diffusion=null;
        foreach($row as $r)
        {
            $diffusion .= '<div class="channel">
                        <div class="channelItem">
                        <a title="Programme de ' . $r["LIBELLE"] . '" class="channel_logo">
                            <img src=' . $r["PHOTOCHAINE"] . ' alt="Le programme de Canal+" class="channelLogoPrime">
                        </a>
                        <a class="channel_label" title="Programme de Canal+">
                            <span>Programme<br>Canal+</span>
                        </a>
                    </div>';
            foreach($row["programme"] as $p)
            {
                $diffusion .= '<div class="programme">
                        <div class="prog_desc">
                            <span class="prog_heure">' . $p["DATEH"] . '</span>
                            <span class="prog_type">' . $p["TYPE"] . '</span>
                            <a class="prog_name" title="Journal d\'une femme de chambre">' . $p["NOM"] . '</a>
                        </div><!--/.programme-->
                    </div>';
            }
        }
        echo json_encode($diffusion);
        $pdo = null;
    } catch (PDOException $e) {
        echo 'ERROR: ' . $e->getMessage();
    }
}