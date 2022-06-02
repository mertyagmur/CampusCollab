import 'package:http/http.dart' as http;

import 'model/get_total_attendings_response_model.dart';

abstract class TotalAttendingsService {
  Future getTotalAttendings();
}

class TotalAttendingsServiceImp extends TotalAttendingsService {
  
  @override
  Future getTotalAttendings() async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/get_total_attendings.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.get(
      _url,
    );
    
    // response.body = {"posts: [{post#1}, {post#2}, {post#3}]"} but as a String
  

  /* print(json
    .decode(response.body)["posts"].map((x) => x)); */

  var attendingsCountList = [];
  //var announcementList = [];
  
  if (response.statusCode == 200) {
    var data = totalAttendingsResponseModelFromJson(response.body);
    
    for (int i=0; i < data.length; i++){
      attendingsCountList.add(data[i]);
      //print(attendingsCountList);
    }

    return attendingsCountList;
  } else {
    return "";
  }
  }
}