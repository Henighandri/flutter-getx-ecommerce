import 'dart:convert';

class UserModel {
   String? userId;
   String? name;
   String? email;
   String? password;
   String? phone;
  UserModel({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.phone,
  });


  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
    );
  }

   toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, name: $name, email: $email, password: $password, phone: $phone)';
  }

 

 
}
