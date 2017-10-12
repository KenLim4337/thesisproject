<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 8:17 PM
 */

require_once ("connect.php");

$discipline = $_POST['discipline'];

$query = $link -> prepare("SELECT * FROM solvelog WHERE disc=?");
$query->bind_param("s", $disc);
$disc = $discipline;
$query->execute();
$query->store_result();

echo $query->num_rows();

?>