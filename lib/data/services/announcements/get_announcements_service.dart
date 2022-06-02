import 'dart:convert';

import 'package:campuscollab/data/services/announcements/model/announcement_response_model.dart';
import 'package:http/http.dart' as http;



abstract class AnnouncementService {
  Future getAnnouncements();
}

class AnnouncementServiceImp extends AnnouncementService {
  
  @override
  Future getAnnouncements() async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/get_announcements.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.get(
      _url,
    );
    
    // response.body = {"posts: [{post#1}, {post#2}, {post#3}]"} but as a String
  

  /* print(json
    .decode(response.body)["posts"].map((x) => x)); */

  var announcementsList = [];
  //var announcementList = [];
  
  if (response.statusCode == 200) {
    var data = announcementResponseModelFromJson(response.body);
    
    for (int i=0; i < data.length; i++){
      //print(data[i]);
     announcementsList.add(data[i]);
      //print(postList);
    }

    return announcementsList.reversed.toList();
  } else {
    return "";
  }
  }
}