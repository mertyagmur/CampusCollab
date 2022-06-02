<?php

class Attending{
    
    private $conn;
    private $table_name = 'attendings';
    
    public $id;
    public $postId;
    public $userId;
    public $firstName;
    public $lastName;// list to store user names
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    function createAttending(){
        
        $query = "INSERT INTO $this->table_name
        (
        postid,
        userid
        )
        VALUES
        (
        '$this->postId',
        '$this->userId'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    function getAllAttendings()
    {
        $query = "SELECT $this->table_name.id, $this->table_name.postid, $this->table_name.userid, users.firstName, users.lastName 
        FROM $this->table_name 
        INNER JOIN users ON users.id = $this->table_name.userid
        WHERE postid = '$this->postId'";

        $response = mysqli_query($this->conn, $query);

        if((mysqli_num_rows($response) > 0))
        { 
             while($row = $response->fetch_array())
            { 
                
                $attendingsList = array(
                    "id" => $row["id"],
                    "postId" => $row["postid"],
                    "userId" => $row["userid"],
                    "firstName" => $row["firstName"],
                    "lastName" => $row["lastName"]
                    );
                    
                    
                    $attendingsLists[] = $attendingsList;
                    
                    
                    $attendingsResponse = array("attendings" => $attendingsLists);
                                         
             } 
             print_r(json_encode($attendingsResponse));
        } else {
            return "0";
        }
    }


    function getAttendings()
    {
        /* $query = "SELECT $this->table_name.id, $this->table_name.postid,$this->table_name.userid, users.firstName, users.lastName 
        FROM $this->table_name 
        INNER JOIN users ON users.id = $this->table_name.userid
        WHERE postid = $this->postId"; */

        $query = "SELECT attendings.postid, COUNT(attendings.postid) AS attendingsCount FROM attendings WHERE postid = $this->postId GROUP BY attendings.postid";
        
        $response = mysqli_query($this->conn, $query);


        $query2 = "SELECT COUNT(attendings.postid) AS attendingsCount FROM attendings WHERE attendings.postid = $this->postId";
        $response2 = mysqli_query($this->conn, $query2);
        $row = $response->fetch_array();
        
        if((mysqli_num_rows($response) > 0)){
            return $row["attendingsCount"];
        } else {
            return "0";
        }
    }

    

        /* if((mysqli_num_rows($response) > 0))
        { */
            /* while($row = $response->fetch_array())
            { */
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
                
               /*  $attendingsList = array(
                    "id" => $row["id"],
                    "postId" => $row["postid"],
                    "userId" => $row["userid"],
                    "firstName" => $row["firstName"],
                    "lastName" => $row["lastName"],
                    "count" => $row2["count"]
                    );
                    
                    
                    $attendingsLists[] = $attendingsList;
                    
                    
                    $attendingsResponse = array("attendings" => $attendingsLists
                                        /* "number_of_attendings" => $row2["count"] */
           /*  } */
            
            
            //print_r(json_encode($attendingsResponse));
            
       /*  }
        else{
            return 0;
        }
        
    } */

    function getTotalAttendings()
    {
        $query = "SELECT attendings.postid, COUNT(attendings.postid) AS count FROM attendings WHERE userid = this->userId GROUP BY attendings.postid";
        
        $response = mysqli_query($this->conn, $query);


       /*  $query2 = "SELECT COUNT(attendings.postid) AS count FROM attendings WHERE attendings.postid = $this->postId";
        $response2 = mysqli_query($this->conn, $query2);
        $row2 = $response2->fetch_array();
         */
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
                
                $attendingsList = array(
                    /* "id" => $row["id"],
                    "postId" => $row["postid"],
                    "userId" => $row["userid"],
                    "firstName" => $row["firstName"],
                    "lastName" => $row["lastName"] */

                    "postId" => $row["postid"],
                    "count" => $row["count"]
                    );
                    
                    
                    $attendingsLists[] = $attendingsList;
                    
                    
                    
            }
            //$attendingsResponse = array("total_attendings" => $attendingsLists);
            
            //print_r(json_encode($attendingsLists));
            return $row["count"];
        }
        else{
            return null;
        }
        
    }
}