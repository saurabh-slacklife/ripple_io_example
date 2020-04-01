class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});

  Map<String, dynamic> toJson(UserLogin data) {
    Map<String, dynamic> jsonData = new Map<String, dynamic>();
    if (null == data) {
      throw new Exception("The objec is Invalid");
    } else if (null != data && (data.email.isEmpty || data.password.isEmpty)) {
      throw new Exception("The object is Invalid");
    } else {
      jsonData['email'] = this.email.trim();
      jsonData['password'] = this.password.trim();
      return jsonData;
    }
  }
}
