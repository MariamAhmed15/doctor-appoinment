class UserModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
    };
  }

  // Create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      password: json['password'],
    );
  }
}