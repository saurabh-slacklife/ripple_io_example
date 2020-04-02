class UserDto {
  String firstName;
  String lastName;
  String email;
  String contactNumber;
  String city;
  String state;
  String country;
  String zipcode;
  DateTime dob;
  String gender;
  bool isActive;
  bool isDisabled;

  UserDto(
      {this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.city,
      this.state,
      this.country,
      this.zipcode,
      this.dob,
      this.gender,
      this.isActive,
      this.isDisabled});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
        firstName: json['first_name'],
        lastName: json['lst_name'],
        email: json['email'],
        contactNumber: json['contact_number'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        zipcode: json['zip_code'],
        dob: json['dob'],
        gender: json['gender'],
        isActive: json['is_active'],
        isDisabled: json['os_disabled']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = new Map<String, dynamic>();
    jsonData['first_name'] = this.firstName;
    jsonData['last_name'] = this.lastName;
    jsonData['email'] = this.email;
    jsonData['contact_number'] = this.contactNumber;
    jsonData['city'] = this.city;
    jsonData['state'] = this.state;
    jsonData['country'] = this.country;
    jsonData['zip_code'] = this.zipcode;
    jsonData['dob'] = this.dob;
    jsonData['gender'] = this.gender;

    return jsonData;
  }
}
