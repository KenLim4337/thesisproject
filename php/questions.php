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

$query = $link -> prepare("SELECT * FROM question q WHERE NOT EXISTS (SELECT * FROM solvelog l WHERE q.qid=l.qid);");
$query -> execute();
//RNG, pick 1 from the results and return
$result = $query->get_result();
$qlist = $result ->fetch_all();

$qnum = rand(0,sizeof($qlist));

echo json_encode($qlist[$qnum]);

?>