<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 10:38 PM
 */

//Gets datetime of most recent question
require_once ("connect.php");

date_default_timezone_set('Australia/Brisbane');

//Grab newest question in log
$query = $link->prepare("SELECT * FROM questionlog ORDER BY dtime DESC LIMIT 1");
$query->execute();
$result = $query->get_result();
$top = $result->fetch_assoc();


$query1 = $link->prepare("SELECT * FROM question q WHERE qid = ?");
$query1->bind_param("d", $id);
$id = $top["qid"];
$query1->execute();
$result1 = $query1->get_result();
$question = $result1->fetch_assoc();

//get answers
$aquery = $link->prepare("SELECT * FROM answer a WHERE a.qid = ?");
$aquery->bind_param("d", $id);
$id = $top["qid"];
$aquery->execute();
$ares = $aquery->get_result();
$alist = $ares->fetch_all();

$combo = array($question, $alist);

echo json_encode($combo);

$query->close();
$query1->close();
$aquery->close();
$link->close()
?>