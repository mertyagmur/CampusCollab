import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {

  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : status = json["STATUS"],
        message = json["MESSAGE"] == null ? null : json["MESSAGE"],
        userId = json["USER_ID"] == null ? null : json["USER_ID"],
        email = json["EMAIL"] == null ? null : json["EMAIL"],
        password = json["PASSWORD"] == null ? null : json["PASSWORD"],
        department = json["DEPARTMENT"] == null ? null : json["DEPARTMENT"],
        firstName = json["FIRST_NAME"] == null ? null : json["FIRST_NAME"],
        lastName = json["LAST_NAME"] == null ? null : json["LAST_NAME"],
        imageUrl = json["IMAGE_URL"] == null ? null : json["IMAGE_URL"],
        spotifyLink = json["SPOTIFY_LINK"] == null ? null : json["SPOTIFY_LINK"],
        bio = json["BIO"] == null ? null : json["BIO"],
        personalWeb = json["PERSONAL_WEB"] == null ? null : json["PERSONAL_WEB"],
        instaLink = json["INSTAGRAM_LINK"] == null ? null : json["INSTAGRAM_LINK"],
        twitterLink = json["TWITTER_LINK"] == null ? null : json["TWITTER_LINK"],
        linkedinLink = json["LINKEDIN_LINK"] == null ? null : json["LINKEDIN_LINK"],
        githubLink = json["GITHUB_LINK"] == null ? null : json["GITHUB_LINK"];


  final int status;
  final String? message;
  final String? userId;
  final String? email;
  final String? password;
  final String? department;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final String? spotifyLink;
  final String? bio;  
  final String? personalWeb;
  final String? instaLink;
  final String? twitterLink;
  final String? linkedinLink;
  final String? githubLink;

}