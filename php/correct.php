<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 13-Oct-17
 * Time: 12:54 AM
 */


require_once ("connect.php");


$lquery = $link->prepare("INSERT INTO solvelog VALUES (null, ?, ?)");
$lquery->bind_param("is", $qid, $dtime);
$qid = $question[0];
$dtime = $date;
$lquery->execute();

$link->close();


?>