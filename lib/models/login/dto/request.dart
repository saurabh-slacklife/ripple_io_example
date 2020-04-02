import 'package:flutter/cupertino.dart';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({@required this.email, @required this.password})
      : assert(email != null && password != null);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = new Map<String, dynamic>();
    jsonData['email'] = this.email.trim();
    jsonData['password'] = this.password.trim();
    return jsonData;
  }
}
