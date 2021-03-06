pragma solidity 0.5.0;

contract Main{
	
	struct User{
	string account_name;
	string password;
	}

	struct User2{
		string title;
		string text;
	}

	struct User3{
		string name;
		string hash;
	}

	mapping(address=>User[]) public user;
	mapping(address=>User2[]) public user2;
	mapping(address=>User3[]) public user3; 
	mapping(address=>bool) public user_check;
	mapping(address=>string) public hash;

	mapping(address=>string) public user_login;

	function signup(string memory _password, string memory _hash) public{
		user_login[msg.sender] = _password;
		user_check[msg.sender] = true;
		hash[msg.sender] = _hash;		
	}




	function login() public view returns(string memory){
		return user_login[msg.sender];
	}
	 
	function add_id(string memory _name, string memory _id) public{
		
		user[msg.sender].push(User(_name, _id));
	}

	function add_text(string memory _title, string memory _text) public{
		user2[msg.sender].push(User2(_title, _text));
	}

	function add_files(string memory _hash, string memory _name) public{
		user3[msg.sender].push(User3(_name, _hash));
	}

	function check() public view returns(bool){
		return user_check[msg.sender];	
	}


	function get_accountname(uint i) public view returns(string memory){		
		return user[msg.sender][i].account_name;
	}

	function get_password(uint i) public view returns(string memory){		
		return user[msg.sender][i].password;
	}
	
	function get_title(uint i) public view returns(string memory){		
		return user2[msg.sender][i].title;
	}

	function get_text(uint i) public view returns(string memory){		
		return user2[msg.sender][i].text;
	}
		function get_filename(uint i) public view returns(string memory){		
		return user3[msg.sender][i].name;
	}

	function get_filehash(uint i) public view returns(string memory){		
		return user3[msg.sender][i].hash;
	}
	
	function get_length()public view returns(uint){
		return user[msg.sender].length;
	}

	function get_length_text()public view returns(uint){
		return user2[msg.sender].length;
	}
		function get_length_files()public view returns(uint){
		return user3[msg.sender].length;
	}

	function get_hash()public view returns(string memory){
		return hash[msg.sender];
	}
}