<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 12:40 PM
 */

require_once ("connect.php");

$query1 = $link->prepare("SELECT role FROM user WHERE id=1");
$query1->execute();
$result1 = $query1->get_result();
$row1 = $result1->fetch_assoc();

if($row1["role"]=="GUI") {
    $query1 = $link->prepare("UPDATE user SET role='SOL' WHERE id=1");
} else if ($row1["role"]=="SOL") {
    $query1 = $link->prepare("UPDATE user SET role='GUI' WHERE id=1");
}

$query1->execute();
$query1->close();


$query2 = $link->prepare("SELECT role FROM user WHERE id=3");
$query2->execute();
$result2 = $query2->get_result();
$row2 = $result2->fetch_assoc();

if($row2["role"]=="GUI") {
    $query2 = $link->prepare("UPDATE user SET role='SOL' WHERE id=3");
} else if ($row2["role"]=="SOL") {
    $query2 = $link->prepare("UPDATE user SET role='GUI' WHERE id=3");
}

$query2->execute();
$query2->close();

mysqli_close($link);

?>