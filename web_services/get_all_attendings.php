<?php

include_once 'db.php';
include_once 'attendings.php';

$attendings = new Attending($conn);
$attendings->postId = $_POST['postId'];


if($attendings->getAllAttendings())
{
    print_r(json_encode($attendings));
}
else
{
    
   // print_r(json_encode(array("STATUS" => false, "MESSAGE" => "Posts couldn't be retrieved")));
}
