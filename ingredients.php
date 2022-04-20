<?php
    include "db.php";

    if(!isset($_POST) || !isset($_POST['cakeid']))
        echo "Please Enter Cake ID.";
    else {
        $cakeid = $_POST['cakeid'];
        $cake = $db->query('select * from cake where cakeid='.$cakeid);
        if ($cake->num_rows == 0) {
            echo $cake['cakename'].' is not present.';
        } else {
            $qry = 'select I.ingredid as ingredid, iname, qty from Contain join Cake C on Contain.cakeid = C.cakeid join Ingredient I on I.ingredid = Contain.ingredid where C.cakeid ='.$cakeid;
            $ingreds = $db->query($qry);
            $return_str = '<table class="tables">'.'<tr>' .
                '<th>ID</th>' .
                '<th>Ingredient Name</th>' .
                '<th>Quantity</th>' .
                '</tr>';
            foreach ($ingreds as $ingred) {
                $return_str = $return_str. '<tr>' .
                    '<td>'.$ingred['ingredid']. '</td>' .
                    '<td>' . $ingred['iname'] . '</td>'.
                    '<td>' . $ingred['qty'] . '</td>'.
                    '</tr>';
            }
            echo $return_str. '</table>';
        }
    }
?>