<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 13-Oct-17
 * Time: 9:25 AM
 */

require_once ("connect.php");

$query = mysqli_query($link,"SELECT * FROM question");
$row = $query->fetch_assoc();

echo ($row["text"]);


?>