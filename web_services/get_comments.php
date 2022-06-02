<?php

include_once 'db.php';
include_once 'comments.php';

$comments = new Comment($conn);
$comments->postId = $_POST['postId'];


if($comments->getComments())
{
    print_r(json_encode($comments));
}
else
{
    
   // print_r(json_encode(array("STATUS" => false, "MESSAGE" => "Posts couldn't be retrieved")));
}
