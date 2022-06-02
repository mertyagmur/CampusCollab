import 'dart:convert';

import 'package:campuscollab/data/services/bookmarks/model/get_bookmarks_request_model.dart';
import 'package:http/http.dart' as http;

import 'model/get_bookmarks_response_model.dart';


abstract class BookmarksService {
  Future getMeetings(BookmarksRequestModel bookmarksRequestModel);
}

class BookmarksServiceImp extends BookmarksService {
  
  @override
  Future getMeetings(BookmarksRequestModel bookmarksRequestModel) async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/get_bookmarks.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: bookmarksRequestModel.toJson(),
    );
    
    // response.body = {"posts: [{post#1}, {post#2}, {post#3}]"} but as a String
  

/*   print(json
    .decode(response.body)["posts"].map((x) => x)); */

  var meetingsList = [];
  //var announcementList = [];
  
  if (response.statusCode == 200) {
    var data = bookmarksResponseModelFromJson(response.body);
    
    for (int i=0; i < data.length; i++){
      //print(data[i]);
      meetingsList.add(data[i]);
      //print(meetingsList);
    }
    return meetingsList.reversed.toList();
  } else {
    return "";
  }
  }
}