<?php

include_once 'db.php';
include_once 'users.php';

$user = new User($conn);

$user->firstName = $_POST['firstName'];
$user->lastName = $_POST['lastName'];
$user->department = $_POST['department'];
$user->email = $_POST['email'];
$user->password = md5($_POST['password']);

          if($user->AddUser())
          {
               print_r(json_encode(array("STATUS"=>true, "MESSAGE"=>"User added")));
          } 
          else
          {
               print_r(json_encode(array("STATUS"=>false, "MESSAGE"=>"User couldn't be added")));
          }