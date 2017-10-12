<?php
require_once ("connect.php");

$query = $link -> prepare("SELECT * FROM chatlog;");
$query -> execute();


$result = $query->get_result();


echo "lolwhy";

while ($row = $result->fetch_assoc()) {
    echo $row["message"];
}

$query->close();

mysqli_close($link);
?>