<?php
header('Content-Type: application/json');
session_start();
$idArtikla = $_POST['productId'];

$allArticlesInCart = $_SESSION['artikli'];

$arrayWithOutDeletedArticle = [];

foreach ($allArticlesInCart as $key => $article) {
    if ($article['id_artikal'] !== $idArtikla) {
        array_push($arrayWithOutDeletedArticle, $article);
        unset($_SESSION['artikli']);
    }
}

$_SESSION['artikli'] = $arrayWithOutDeletedArticle;
$noviArtikliSession = $_SESSION['artikli'];

$quantity = 0;
foreach ($noviArtikliSession as $article) {
    $quantity += $article['kolicina'];
}
$_SESSION['quantity'] = $quantity;

echo json_encode([
    'noviArtikli' => $noviArtikliSession,
]);
