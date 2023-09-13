class User {
  final String email;

  final String name;

  final String password;

  User({required this.email, required this.name, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'], // TODO change fields keys
      name: json['name'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'password': password
    };
  }
}
