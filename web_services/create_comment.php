<?php

include_once 'db.php';
include_once 'comments.php';

$comment = new Comment($conn);

$comment->postId = $_POST['postId'];
$comment->commentOwnerId = $_POST['commentOwnerId'];
$comment->commentText = $_POST['commentText'];

          if($comment->createComment())
          {
               print_r(json_encode(array("STATUS"=>true, "MESSAGE"=>"Comment added.")));
          } 
          else
          {
               print_r(json_encode(array("STATUS"=>false, "MESSAGE"=>"Comment couldn't be added.")));
          }