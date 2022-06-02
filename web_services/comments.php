<?php

class Comment{
    
    private $conn;
    private $table_name = 'comments';
    
    public $id;
    public $postId;
    public $commentOwnerId;
    public $commentText;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    function createComment(){
        
        $query = "INSERT INTO $this->table_name
        (
        postid,
        commentownerid,
        commenttext
        )
        VALUES
        (
        '$this->postId',
        '$this->commentOwnerId',
        '$this->commentText'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    
    function getComments()
    {
        $query = "SELECT $this->table_name.id, $this->table_name.postid,$this->table_name.commenttext, users.firstName, users.lastName 
        FROM $this->table_name 
        INNER JOIN users ON users.id = $this->table_name.commentownerid 
        WHERE postid = $this->postId";
        
        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            while($row = $response->fetch_array())
            {
                /* $query2 = "SELECT firstName, lastName FROM users WHERE id = $this->userId";
                $response2 = mysqli_query($this->conn, $query2);

                while ($row2 = $response2->fetch_array()){
                    $usersList = array(
                        "firstName" => $row2["firstName"],
                        "lastName" => $row2["lastName"],
                    );

                    $usersLists[] = $usersList;
                    
                    $this->users = $usersLists;
                } */
                
                $commentsList = array(
                    "id" => $row["id"],
                    "postId" => $row["postid"],
                    "commentText" => $row["commenttext"],
                    "firstName" => $row["firstName"],
                    "lastName" => $row["lastName"]
                    );
                    
                    
                    $commentsLists[] = $commentsList;
                    
                    $commentsResponse = array("comments" => $commentsLists);
                    
            }
            
            print_r(json_encode($commentsResponse));
        }
        else{
            return null;
        }
        
    }
}