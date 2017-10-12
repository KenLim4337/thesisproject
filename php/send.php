<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 13-Oct-17
 * Time: 6:47 AM
 */

require_once ("connect.php");

$tempuid = $_POST["uid"];
$tempname = $_POST["name"];
$tempmess = $_POST["message"];
$temprole = $_POST["role"];
$tempdtime = date('Y-m-d H:i:s');;

$query = $link->prepare("INSERT INTO chatlog VALUES (null, ?, ?, ?, ?, ?)");
$query->bind_param("issss", $uid, $name, $mess, $role, $dtime);
$uid = $tempuid;
$name = $tempname;
$mess = $tempmess;
$role = $temprole;
$dtime = $tempdtime;

$query->execute();

$query->close();
$link->close();




?>