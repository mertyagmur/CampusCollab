import 'dart:convert';

String attendingsRequestModelToJson(AttendingsRequestModel data) =>
    json.encode(data.toJson());

class AttendingsRequestModel {
  
  AttendingsRequestModel({
    required this.postId,
  });

  final String postId;

  Map<String, dynamic> toJson() => {
        "postId": postId,
      };
}