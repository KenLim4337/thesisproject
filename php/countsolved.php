<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 12-Oct-17
 * Time: 8:17 PM
 */

require_once ("connect.php");

$tempdisc = $_POST['discipline'];

$query = $link -> prepare("SELECT * FROM solvelog WHERE disc=?");
$query->bind_param("s", $disc);
$disc = $tempdisc;

$query->execute();
$result = $query->get_result();

$numbrows = 0;

while($row = $result->fetch_row()) {
    $numbrows += 1;
}

echo $numbrows;

?>