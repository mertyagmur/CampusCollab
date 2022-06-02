<?php

include_once 'db.php';
include_once 'posts.php';

$posts = new Post($conn);

$posts->userId = $_POST['userId'];

if($posts->getBookmarks())
{
    print_r(json_encode($posts));
}
else
{
    /* print_r(json_encode(array("STATUS" => false, "MESSAGE" => "Bookmarks couldn't be retrieved"))); */
}