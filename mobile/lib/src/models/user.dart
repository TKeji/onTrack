class User {
  final String firstname;
  final String lastname;
  final String password;
  final String email;

  User(this.firstname, this.lastname, this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'],
        password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'password': password,
        'email': email,
      };

  Map<String, dynamic> toLoginJson() => {
        'email': email,
        'password': password,
      };

  toString() {
    return 'User<${this.firstname}, ${this.lastname}, ${this.email}, ${this.password}>';
  }
}
