import 'dart:convert';


List<dynamic> bookmarksResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["posts"]
    .map((x) => x)
    .map((x) => BookmarksResponseModel.fromJson(x)));

class BookmarksResponseModel {

  factory BookmarksResponseModel.fromJson(Map<String, dynamic> json) =>
      BookmarksResponseModel(
        postId: json["postId"],
        postOwner: json["postOwner"],
        postOwnerId: json["postOwnerId"],
        postText: json["postText"],
        postDate: DateTime.parse(json["postDate"]),
        mentorInfo: json["mentorInfo"],
        location: json["location"],
        maxParticipants: json["maxParticipants"],
        postType: json["postType"],
        courseCode: json["courseCode"],
        studentBranch: json["studentBranch"],
      );

  BookmarksResponseModel({
    required this.postId,
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

  final String postId;
  final String postOwner;
  final String postOwnerId;
  final String postText;
  final DateTime postDate;
  final String mentorInfo;
  final String location;
  final String maxParticipants;
  final String postType;
  final String courseCode;
  final String studentBranch;

}

