<?php

// ------- CONNEXION BDD -------
$connect_db = new PDO('mysql:host=localhost;dbname=annonceo', 'root', '', [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
]);

// ------- CONNEXION BDD -------
session_start();

//  ------- CHEMIN -------
define('RACINE_SITE', $_SERVER['DOCUMENT_ROOT'] . '/php/ANNONCEO/');
// echo '<pre>'; print_r(RACINE_SITE); '<pre>';
define("URL", "http://localhost/php/ANNONCEO/");
//  Cette constante servira à enregistré l'URL d'une photo/image dans la BDD, on ne peut pas conservé la photo physiquement dans la BDD, donc on définit une URL vers le bon dossier.

//  ------- VARIABLES -------
$content = '';

//  ------- FAILLE XSS -------
foreach ($_POST as $key => $value) {
    $_POST[$key] = htmlentities(addslashes(trim($value)));
}

foreach ($_GET as $key => $value) {
    $_GET[$key] = htmlentities(addslashes(trim($value)));
}

//  ------- INCLUSIONS FONCTIONS -------
require_once("functions.php");
