<?php
require_once ("connect.php");

$query = $link->prepare("SELECT * FROM chatlog");

$query->execute();

$result = $query->get_result();

while ($row = $result->fetch_assoc()) {
    echo ("<ul>".$row["name"]."[".$row["role"]."] "."[".$row["dtime"]."]  - ".$row["message"]."</ul>");
}

$query->close();
$link->close();

?>