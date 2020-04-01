class User {
  String email;
  String contactNumber;

  User({this.email, this.contactNumber});

  Map<String, dynamic> toJson(User userData) {
    Map<String, dynamic> jsonData = new Map<String, dynamic>();
    if (null != userData) {
      if (null != this.email && this.email.isNotEmpty) {
        jsonData['email'] = this.email;
        return jsonData;
      } else if (null != this.contactNumber && this.contactNumber.isNotEmpty) {
        jsonData['contact_number'] = this.contactNumber;
        return jsonData;
      } else {
        throw Exception('Invalid Object');
      }
    } else {
      throw Exception('Invalid Object');
    }
  }
}
