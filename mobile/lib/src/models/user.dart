
class NewUser {
  String firstname = ''; 
  String lastname = ''; 
  String password = ''; 
  String email = ''; 

  NewUser(this.firstname, this.lastname,this.email, this.password); 

  toString(){
    return 'User<${this.firstname}, ${this.lastname}, ${this.email}, ${this.password}>'; 
  }

  Map<String, dynamic> toJson() => {
    'firstname': firstname,
    'lastname': lastname,
    'password': password,
    'email': email,
  };
}