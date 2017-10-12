<?php
require_once ("connect.php");

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

$query = "SELECT * FROM question q WHERE NOT EXISTS (SELECT * FROM slog l WHERE q.qid=l.qid);"

//RNG, pick 1 from the results and return

?>