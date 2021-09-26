<?php

header('Content-type: application/json');
$idKategorije = $_REQUEST['idKategorije'];

if (isset($idKategorije)) {
    require_once '../config/connection.php';
    session_start();

    $query = $conn->prepare(
        'SELECT
        id_kategorija,
        a.id_artikal AS id_artikal,
        k.naziv AS naziv_kategorije,
        id_artikal,
        a.naziv AS naziv_artikla,
        opis,
        cena,
        promocije,
        brojcano_stanje,
        s.putanja AS putanja_slike,
        s.alt AS alt_slike
    FROM
        kategorija k
    INNER JOIN artikal a ON
        k.id_kategorija = a.kategorija_id
    INNER JOIN slika_artikal sl_ar ON
        sl_ar.artikal_id = a.id_artikal
    INNER JOIN slika s ON
        sl_ar.slika_id = s.id_slika
    WHERE
        k.id_kategorija = :idKategorije'
    );
    $query->bindParam(':idKategorije', $idKategorije);
    $query->execute();
    $artikli = $query->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'message' => 'success',
        'artikli' => $artikli,
    ]);
}
