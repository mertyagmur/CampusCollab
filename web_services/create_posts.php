<?php

include_once 'db.php';
include_once 'posts.php';

$post = new Post($conn);

$post->postOwner = $_POST['postOwner'];
$post->postOwnerId = $_POST['postOwnerId'];
$post->postText = $_POST['postText'];
$post->postDate = $_POST['postDate'];
$post->mentorInfo = $_POST['mentorInfo'];
$post->location = $_POST['location'];
$post->maxParticipants = $_POST['maxParticipants'];
$post->postType = $_POST['postType'];
$post->courseCode = $_POST['courseCode'];
$post->studentBranch = $_POST['studentBranch'];



          if($post->CreatePost())
          {
               print_r(json_encode(array("STATUS"=>true, "MESSAGE"=>"Post added.")));
          } 
          else
          {
               print_r(json_encode(array("STATUS"=>false, "MESSAGE"=>"Post couldn't be added.")));
          }