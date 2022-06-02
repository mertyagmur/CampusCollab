import 'dart:convert';

String createPostRequestModelToJson(CreatePostRequestModel data) =>
    json.encode(data.toJson());

class CreatePostRequestModel {

  CreatePostRequestModel({
    //required this.postId,
    required this.postOwner,
    required this.postOwnerId,
    required this.postText,
    required this.postDate,
    required this.mentorInfo,
    required this.location,
    required this.maxParticipants,
    required this.postType,
    required this.courseCode,
    required this.studentBranch,
  });

  //final String postId;
  final String postOwner;
  final String postOwnerId;
  final String postText;
  final String postDate;
  final String mentorInfo;
  final String location;
  final String maxParticipants;
  final String postType;
  final String courseCode;
  final String studentBranch;

  Map<String, dynamic> toJson() => {
    //"postId": postId,         
    "postOwner": postOwner,
    "postOwnerId": postOwnerId,
    "postText": postText,
    "postDate": postDate,
    "mentorInfo": mentorInfo,
    "location": location,
    "maxParticipants": maxParticipants,
    "postType": postType,
    "courseCode": courseCode,
    "studentBranch": studentBranch,
      };
}
