import 'dart:convert';

class Account {
  Account({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    // required this.token
  });

  final int id;
  final String userName;
  final String email;
  final String phoneNumber;
  // final Token token;
  
  static late Account current;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        userName: json["user_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        // token: Token.fromJson(json["token"]
      );

  String toJson() {
    Map map = {
      "id": id,
      "user_name": userName,
      "email": email,
      "phone_number": phoneNumber,
      // "token": token.toJson()
    };
    return jsonEncode(map);
  }
}

class Token {
  Token({
    required this.access,
  });

  String access;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
      };
}
