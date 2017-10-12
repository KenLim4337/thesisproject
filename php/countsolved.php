<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 8:17 PM
 */

require_once ("connect.php");

$discipline = $_POST['discipline'];

$query = $link -> prepare("COUNT(id) FROM solvelog WHERE disc=?");
$disc = $discipline;
$query->execute();
$result = $query->get_result();

echo $result->fetch_field();

?>