<?php

class Announcement{
    
    private $conn;
    private $table_name = 'announcements';
    
    public $announcementId;
    public $announcementOwner;
    public $announcementOwnerId;
    public $postText;
    public $postDate;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    
    function createAnnouncement(){
        
        $query = "INSERT INTO $this->table_name
        (
        /* id, */
        annowner,
        annownerid,
        posttext,
        date
        )
        VALUES
        (
        /* '$this->postId', */
        '$this->announcementOwner',
        '$this->announcementOwnerId',
        '$this->postText',
        '$this->postDate'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }

    function getAnnouncements()
    {
        $query = "SELECT * FROM $this->table_name";

        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            while($row = $response->fetch_array())
            {
                
                $announcementList = array(
                    "announcementId" => $row["id"],
                    "announcementOwner" => $row["annowner"],
                    "announcementOwnerId" => $row["annownerid"],
                    "postText" => $row["posttext"],
                    "postDate" => $row["date"]
                    );
                    
                    
                    $announcementLists[] = $announcementList;
                    
                    $announcementResponse = array("announcements" => $announcementLists);
                    
            }
            
            print_r(json_encode($announcementResponse));
        }
        else{
            return null;
        }
        
    }
}