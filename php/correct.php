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
$temptime = $_POST["time"];

$lquery = $link->prepare("INSERT INTO solvelog VALUES (null, ?, ?, ?, ?, ?)");
$lquery->bind_param("iiiis", $uid, $qid, $att, $time, $disc);
$uid = $tempid;
$qid = $tempqid;
$att = $tempatt;
$disc = $tempdisc;
$time = $temptime;

$lquery->execute();

$lquery->close();
$link->close();


?>