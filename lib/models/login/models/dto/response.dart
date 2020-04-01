class LoginResponse {
  String authToken;
  String refreshToken;
  int ttl;

  LoginResponse({this.authToken, this.refreshToken, this.ttl});

  factory LoginResponse.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponse(
        authToken: jsonData['authToken'],
        refreshToken: jsonData['refreshToken'],
        ttl: jsonData['ttl']);
  }
}
