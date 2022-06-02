<?php

include_once 'db.php';
include_once 'users.php';

$user = new User($conn);
/* if (isset($_POST['email'])) {
    $user->email = $_POST['email'];
}
if (isset($_POST['password'])) {
    $user->password = $_POST['password'];
} */

$user->email = $_POST['email'];
$user->password = md5($_POST['password']);

$currentUser = $user->userExists();


if($currentUser != 0)
{
    if($currentUser == 1)
    {
        $responseArray = array(
                "STATUS" => 1,
                "MESSAGE" => "Wrong password"
                );
                
               
            print_r (json_encode($responseArray));
            
       
    }
    else
    {
        $userArray = array(
            "STATUS" => 2,
            "USER_ID" => $currentUser["id"],
            "EMAIL" => $currentUser["mail"],
            "PASSWORD" => $currentUser["password2"],
            "DEPARTMENT" => $currentUser["department"],
            "FIRST_NAME" => $currentUser["firstName"],
            "LAST_NAME" => $currentUser["lastName"],
            "IMAGE_URL" => $currentUser["image_url"],
            "SPOTIFY_LINK" => $currentUser["spotifyLink"],
            "BIO" => $currentUser["bio"],
            "PERSONAL_WEB" => $currentUser["personalWeb"],
            "INSTAGRAM_LINK" => $currentUser["instaLink"],
            "TWITTER_LINK" => $currentUser["twitterLink"],
            "LINKEDIN_LINK" => $currentUser["linkedinLink"],
            "GITHUB_LINK" => $currentUser["githubLink"],
            );
             
        print_r(json_encode($userArray));
            
    }
}

else
{
    $responseArray = array(
            "STATUS" => 0,
            "MESSAGE" => "User not found"
            );
    print_r(json_encode($responseArray));
}