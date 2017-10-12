<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 13-Oct-17
 * Time: 12:54 AM
 */


require_once ("connect.php");

$tempid = $_POST["id"];
$tempqid = $_POST["qid"];
$tempdisc = $_POST["discipline"];
$tempatt = $_POST["attempts"];

$lquery = $link->prepare("INSERT INTO solvelog VALUES (null, ?, ?, ?, ?, ?)");
$lquery->bind_param("iiis", $uid, $qid, $att, $disc);
$uid = $tempid;
$qid = $tempqid;
$att = $tempatt;
$disc = $tempdisc;

$lquery->execute();

$lquery->close();
$link->close();


?>