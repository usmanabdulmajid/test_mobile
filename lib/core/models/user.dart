import 'dart:convert';

class User {
  int? id;
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? gender;
  String? image;
  String? token;
  User({
    this.id,
    this.username,
    this.email,
    this.firstname,
    this.lastname,
    this.gender,
    this.image,
    this.token,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? firstname,
    String? lastname,
    String? gender,
    String? image,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'gender': gender,
      'image': image,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      username: map['username'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      gender: map['gender'],
      image: map['image'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, firstname: $firstname, lastname: $lastname, gender: $gender, image: $image, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.gender == gender &&
        other.image == image &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        token.hashCode;
  }
}
