

class User {
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

  User(
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['first_name'],
        lastName: json['lst_name'],
        email: json['email'],
        contactNumber: json['contact_number'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        zipcode: json['zip_code'],
        dob: json['dob'],
        gender: json['json'],
        isActive: json['is_active'],
        isDisabled: json['os_disabled']);
  }
}
