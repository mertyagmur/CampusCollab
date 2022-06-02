<?php

include_once 'db.php';
include_once 'announcements.php';

$announcement = new Announcement($conn);

$announcement->announcementOwner = $_POST['announcementOwner'];
$announcement->announcementOwnerId = $_POST['announcementOwnerId'];
$announcement->postText = $_POST['postText'];
$announcement->postDate = $_POST['postDate'];



          if($announcement->createAnnouncement())
          {
               print_r(json_encode(array("STATUS"=>true, "MESSAGE"=>"Announcement added.")));
          } 
          else
          {
               print_r(json_encode(array("STATUS"=>false, "MESSAGE"=>"Announcement couldn't be added.")));
          }