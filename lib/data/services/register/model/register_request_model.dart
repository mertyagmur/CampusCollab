import 'dart:convert';

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String department;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "department": department,
        "email": email,
        "password": password,
      };
}
