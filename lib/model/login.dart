class Login {
  String email;
  String password;

  Login({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}