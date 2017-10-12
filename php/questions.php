<?php

/*Grab random question,
 * select question not in solved
 * Display
 * */

/*SELECT  *
FROM    match m
WHERE   NOT EXISTS
        (
        SELECT  1
        FROM    email e
        WHERE   e.id = m.id
        )
*/

require_once ("connect.php");

$discipline = $_POST['discipline'];

//Select random row from unsolved questions
$query = $link -> prepare("SELECT * FROM question q WHERE NOT EXISTS (SELECT * FROM solvelog l WHERE q.qid=l.qid) AND disc=? ORDER BY RAND()
LIMIT 1");
$query->bind_param("s",$disc);
$disc = $discipline;
$query -> execute();
//RNG, pick 1 from the results and return
$result = $query->get_result();
$question = $result ->fetch_row();

$query->close();

//get answers from question id
$aquery = $link->prepare("SELECT * FROM answer a WHERE a.qid = ?");
$aquery->bind_param("d", $id);
$id = $question[0];
$aquery->execute();
$ares = $aquery->get_result();
$alist = $ares->fetch_all();

$combo = array($question, $alist);

$aquery->close();

//insert question into questionlog + time

$link->close();

echo json_encode($combo);

?>