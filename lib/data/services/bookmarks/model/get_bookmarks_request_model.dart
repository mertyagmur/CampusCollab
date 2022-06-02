import 'dart:convert';

String bookmarksRequestModelToJson(BookmarksRequestModel data) =>
    json.encode(data.toJson());

class BookmarksRequestModel {
  
  BookmarksRequestModel({
    required this.userId,
  });

  final String userId;

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}