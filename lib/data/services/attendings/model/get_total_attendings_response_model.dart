// To parse this JSON data, do
//
//     final totalAttendingsResponseModel = totalAttendingsResponseModelFromJson(jsonString);

import 'dart:convert';

List<TotalAttendingsResponseModel> totalAttendingsResponseModelFromJson(String str) => List<TotalAttendingsResponseModel>.from(json.decode(str).map((x) => TotalAttendingsResponseModel.fromJson(x)));

String totalAttendingsResponseModelToJson(List<TotalAttendingsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TotalAttendingsResponseModel {
    TotalAttendingsResponseModel({
        required this.postId,
        required this.count,
    });

    String postId;
    String count;

    factory TotalAttendingsResponseModel.fromJson(Map<String, dynamic> json) => TotalAttendingsResponseModel(
        postId: json["postId"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "count": count,
    };
}
