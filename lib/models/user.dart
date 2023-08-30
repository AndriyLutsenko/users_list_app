import 'dart:convert';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatarUrl;
  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatarUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatarUrl: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

// {"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson","avatar":"https://reqres.in/img/faces/7-image.jpg"}