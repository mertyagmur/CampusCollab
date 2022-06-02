import 'dart:convert';

CreatePostResponseModel createPostResponseModelFromJson(String str) =>
    CreatePostResponseModel.fromJson(json.decode(str));

class CreatePostResponseModel {
  CreatePostResponseModel.fromJson(Map<String, dynamic> json)
      : status = json["STATUS"],
        message = json["MESSAGE"];

  final bool status;
  final String message;
}
