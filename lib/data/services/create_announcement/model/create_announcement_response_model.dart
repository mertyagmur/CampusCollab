import 'dart:convert';

CreateAnnouncementResponseModel createAnnouncementResponseModelFromJson(String str) =>
    CreateAnnouncementResponseModel.fromJson(json.decode(str));

class CreateAnnouncementResponseModel {
  CreateAnnouncementResponseModel.fromJson(Map<String, dynamic> json)
      : status = json["STATUS"],
        message = json["MESSAGE"];

  final bool status;
  final String message;
}
