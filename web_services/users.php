<?php

class User{
    
    private $conn;
    private $table_name = 'users';
    
    public $id;
    public $email;
    public $password;
    public $department;
    public $firstName;
    public $lastName;
    public $imageUrl;
    public $spotifyLink;
    public $bio;
    public $personalWeb;
    public $instaLink;
    public $twitterLink;
    public $linkedinLink;
    public $githubLink;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    
    function AddUser(){
        
        $query = "INSERT INTO $this->table_name
        (
        mail,
        password2,
        department,
        firstName,
        lastName
        )
        VALUES
        (
        '$this->email',
        '$this->password',
        '$this->department',
        '$this->firstName',
        '$this->lastName'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    
    
    	function userExists()
	{
	    $query = "SELECT * FROM $this->table_name 
	              WHERE 
	              mail = '$this->email'";
	    $response = mysqli_query($this->conn, $query);
	    
	    if((mysqli_num_rows($response) > 0))
	    {
	        $user = mysqli_fetch_array($response);
	        if($user['password2'] == $this->password)
	        {
	            return $user;
	        }
	        else
	        {
	            return 1; // Password is wrong
	        }
	       
	    }
	    else
	    {
	        return 0;  // User doesn't exist
	    }
	}
      
}