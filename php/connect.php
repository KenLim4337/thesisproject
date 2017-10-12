<?php
/**
 * Created by PhpStorm.
 * User: Jude
 * Date: 03-Oct-17
 * Time: 7:54 PM
 */

/*php connection, to be require_once in other query files*/
//get ini File
$database = parse_ini_file("/data.ini");


//store credentials

//localhost Details
$servername = $database ['server'];
$dbname = $database ['name'];
$username = $database ['user'];
$password = $database ['pass'];

//create connection

$link = new mysqli($servername, $username, $password, $dbname);

//Check connection

if ($link) {

} else {
    echo("Connection failed: " . $link->error);
}
?>
