<?php

include_once 'db.php';
include_once 'posts.php';

$posts = new Post($conn);

if($posts->getPosts())
{
    print_r(json_encode($posts));
}
else
{
    
   // print_r(json_encode(array("STATUS" => false, "MESSAGE" => "Posts couldn't be retrieved")));
}