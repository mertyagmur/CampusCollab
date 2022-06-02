<?php

include_once 'db.php';
include_once 'announcements.php';

$announcements = new Announcement($conn);

if($announcements->getAnnouncements())
{
    print_r(json_encode($announcements));
}
else
{
    
   // print_r(json_encode(array("STATUS" => false, "MESSAGE" => "Posts couldn't be retrieved")));
}