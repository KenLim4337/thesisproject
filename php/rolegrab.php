<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 1:14 PM
 */

require_once ("connect.php");
$discipline = $_POST['discipline'];

$query = $link->prepare("SELECT role FROM user WHERE disc=?");
$query->bind_param("s",$disc);
$disc = $discipline;

$query->execute();
$result = $query->get_result();
$row = $result->fetch_assoc();

$query->close();

echo json_encode($row);

$link->close();

?>