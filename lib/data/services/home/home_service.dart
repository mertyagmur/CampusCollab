import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/home_response_model.dart';

abstract class HomeService {
  Future getMeetings();
}

class HomeServiceImp extends HomeService {
  
  @override
  Future getMeetings() async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/get_posts.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.get(
      _url,
    );
    
    // response.body = {"posts: [{post#1}, {post#2}, {post#3}]"} but as a String
  

  /* print(json
    .decode(response.body)["posts"].map((x) => x)); */

  var meetingsList = [];
  //var announcementList = [];
  
  if (response.statusCode == 200) {
    var data = homeResponseModelFromJson(response.body);
    
    for (int i=0; i < data.length; i++){
      //print(data[i]);
      meetingsList.add(data[i]);
      //print(postList);
    }

    return meetingsList.reversed.toList();
  } else {
    return "";
  }
  }
}