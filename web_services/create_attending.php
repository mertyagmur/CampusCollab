<?php

include_once 'db.php';
include_once 'attendings.php';

$attending = new Attending($conn);

$attending->postId = $_POST['postId'];
$attending->userId = $_POST['userId'];

          if($attending->createAttending())
          {
               print_r(json_encode(array("STATUS"=>true, "MESSAGE"=>"Attendance added.")));
          } 
          else
          {
               print_r(json_encode(array("STATUS"=>false, "MESSAGE"=>"Attendance couldn't be added.")));
          }