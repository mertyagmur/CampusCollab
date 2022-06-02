<?php

include_once 'attendings.php';

class Post{
    
    private $conn;
    private $table_name = 'posts';
    
    public $postId;
    public $postOwner;
    public $postOwnerId;
    public $postText;
    public $postDate;
    public $mentorInfo;
    public $location;
    public $maxParticipants;
    public $postType;
    public $courseCode;
    public $studentBranch;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    
    function CreatePost(){
        
        $query = "INSERT INTO $this->table_name
        (
        /* id, */
        postowner,
        postownerid,
        posttext,
        date,
        mentorinfo,
        location,
        maxparticipants,
        posttype,
        coursecode,
        studentbranch
        )
        VALUES
        (
        /* '$this->postId', */
        '$this->postOwner',
        '$this->postOwnerId',
        '$this->postText',
        '$this->postDate',
        '$this->mentorInfo',
        '$this->location',
        '$this->maxParticipants',
        '$this->postType',
        '$this->courseCode',
        '$this->studentBranch'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    
    function getPosts()
    {
        $query = "SELECT * FROM $this->table_name";

        /* $query = "SELECT posts.id, posts.postowner, posts.postownerid, posts.posttext,
        posts.date, posts.mentorinfo, posts.location, posts.maxparticipants, posts.posttype,
        posts.coursecode, posts.studentbranch, COUNT(attendings.userid)
        FROM $this->table_name AS posts
        LEFT JOIN attendings ON posts.id = attendings.postid"
         */
        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            while($row = $response->fetch_array())
            {
                $attendings = new Attending($this->conn);
            
                $attendings->postId = $row["id"];
                $attendingsCount = $attendings->getAttendings();
                $postList = array(
                    "postId" => $row["id"],
                    "postOwner" => $row["postowner"],
                    "postOwnerId" => $row["postownerid"],
                    "postText" => $row["posttext"],
                    "postDate" => $row["date"],
                    "mentorInfo" => $row["mentorinfo"],
                    "location" => $row["location"],
                    "maxParticipants" => $row["maxparticipants"],
                    "postType" => $row["posttype"],
                    "courseCode" => $row["coursecode"],
                    "studentBranch" => $row["studentbranch"],
                    "attendingsCount" => $attendingsCount
                    );
                    
                    
                    $postsLists[] = $postList;
                    
                    $postResponse = array("posts" => $postsLists);
                    
            }
            
            print_r(json_encode($postResponse));
        }
        else{
            return null;
        }
        
    }

    function getBookmarks()
    {
        $query = "SELECT * FROM $this->table_name WHERE id IN (SELECT postid FROM bookmarks WHERE userid = $this->userId)";
        

        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            while($row = $response->fetch_array())
            {
                $postList = array(
                    "postId" => $row["id"],
                    "postOwner" => $row["postowner"],
                    "postOwnerId" => $row["postownerid"],
                    "postText" => $row["posttext"],
                    "postDate" => $row["date"],
                    "mentorInfo" => $row["mentorinfo"],
                    "location" => $row["location"],
                    "maxParticipants" => $row["maxparticipants"],
                    "postType" => $row["posttype"],
                    "courseCode" => $row["coursecode"],
                    "studentBranch" => $row["studentbranch"],
                    );
                    
                    
                    $postsLists[] = $postList;
                    
                    $postResponse = array("posts" => $postsLists);
                    
            }
            
            print_r(json_encode($postResponse));
        }
        else{
            return null;
        }
        
    }
}