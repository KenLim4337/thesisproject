<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 10:38 PM
 */

//Gets datetime of most recent question
require_once ("connect.php");

$query = $link->prepare("SELECT * FROM questionlog ORDER BY dtime DESC LIMIT 1");
$query->execute();
$result = $query->get_result();
$time = $result->fetch_assoc();

echo $time["dtime"];
?>