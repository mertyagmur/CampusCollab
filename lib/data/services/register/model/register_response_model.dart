import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel.fromJson(Map<String, dynamic> json) :
        status = json["STATUS"],
        message = json["MESSAGE"];

    final bool status;
    final String message;

    
}
