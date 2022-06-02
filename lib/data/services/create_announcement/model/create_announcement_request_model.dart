import 'dart:convert';

String createAnnouncementRequestModelToJson(CreateAnnouncementRequestModel data) =>
    json.encode(data.toJson());

class CreateAnnouncementRequestModel {

  CreateAnnouncementRequestModel({
    //required this.AnnouncementId,
    required this.announcementOwner,
    required this.announcementOwnerId,
    required this.postText,
    required this.postDate,
  });

  //final String AnnouncementId;
  final String announcementOwner;
  final String announcementOwnerId;
  final String postText;
  final String postDate;

  Map<String, dynamic> toJson() => {
    //"AnnouncementId": AnnouncementId,         
    "announcementOwner": announcementOwner,
    "announcementOwnerId": announcementOwnerId,
    "postText": postText,
    "postDate": postDate,
      };
}
