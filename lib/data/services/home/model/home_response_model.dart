import 'dart:convert';

import 'package:get/get.dart';


List<dynamic> homeResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["posts"]
    .map((x) => x)
    .map((x) => HomeResponseModel.fromJson(x)));

class HomeResponseModel {

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
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
        attendingsCount: json["attendingsCount"],
      );

  HomeResponseModel({
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
    required this.attendingsCount,
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
  final String attendingsCount;
}