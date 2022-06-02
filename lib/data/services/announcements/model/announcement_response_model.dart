import 'dart:convert';

import 'package:get/get.dart';


List<dynamic> announcementResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["announcements"]
    .map((x) => x)
    .map((x) => AnnouncementResponseModel.fromJson(x)));

class AnnouncementResponseModel {

  factory AnnouncementResponseModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementResponseModel(
        announcementId: json["announcementId"],
        announcementOwner: json["announcementOwner"],
        announcementOwnerId: json["announcementOwnerId"],
        postText: json["postText"],
        postDate: DateTime.parse(json["postDate"]),
      );

  AnnouncementResponseModel({
    required this.announcementId,
    required this.announcementOwner,
    required this.announcementOwnerId,
    required this.postText,
    required this.postDate,
  });

  final String announcementId;
  final String announcementOwner;
  final String announcementOwnerId;
  final String postText;
  final DateTime postDate;
}