<?php

session_start();

$cenaArtikla = $_POST['cenaArtikla'];
$kolicina = $_POST['kolicina'];

$novaCena = $cenaArtikla * $kolicina;

echo json_encode([
    'novaCena' => $novaCena,
]);
