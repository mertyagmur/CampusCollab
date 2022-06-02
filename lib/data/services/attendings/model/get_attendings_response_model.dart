import 'dart:convert';


List<dynamic> attendingsResponseModelFromJson(String str) => List<dynamic>.from(json
    .decode(str)["attendings"]
    .map((x) => x)
    .map((x) => AttendingsResponseModel.fromJson(x)));

class AttendingsResponseModel {

  factory AttendingsResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendingsResponseModel(
        attendingId: json["id"],
        postId: json["postId"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  AttendingsResponseModel({
    required this.attendingId,
    required this.postId,
    required this.userId,
    required this.firstName,
    required this.lastName,
  });

  final String attendingId;
  final String postId;
  final String userId;
  final String firstName;
  final String lastName;

}


// To parse this JSON data, do
//
//     final attendingsResponseModel = attendingsResponseModelFromJson(jsonString);

/* import 'dart:convert';

AttendingsResponseModel attendingsResponseModelFromJson(String str) => AttendingsResponseModel.fromJson(json.decode(str));

String attendingsResponseModelToJson(AttendingsResponseModel data) => json.encode(data.toJson());

class AttendingsResponseModel {
    AttendingsResponseModel({
        required this.attendings,
        required this.numberOfAttendings,
    });

    List<Attending> attendings;
    String numberOfAttendings;

    factory AttendingsResponseModel.fromJson(Map<String, dynamic> json) => AttendingsResponseModel(
        attendings: List<Attending>.from(json["attendings"].map((x) => Attending.fromJson(x))),
        numberOfAttendings: json["number_of_attendings"],
    );

    Map<String, dynamic> toJson() => {
        "attendings": List<dynamic>.from(attendings.map((x) => x.toJson())),
        "number_of_attendings": numberOfAttendings,
    };
}

class Attending {
    Attending({
        required this.id,
        required this.postId,
        required this.userId,
        required this.firstName,
        required this.lastName,
        required this.count,
    });

    String id;
    String postId;
    String userId;
    String firstName;
    String lastName;
    String count;

    factory Attending.fromJson(Map<String, dynamic> json) => Attending(
        id: json["id"],
        postId: json["postId"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "count": count,
    };
}
 */