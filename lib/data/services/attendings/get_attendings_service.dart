import 'package:campuscollab/data/services/attendings/model/get_attendings_response_model.dart';
import 'package:http/http.dart' as http;

import 'model/get_attendings_request_model.dart';

abstract class AttendingsService {
  Future getAttendings(AttendingsRequestModel attendingsRequestModel);
}

class AttendingsServiceImp extends AttendingsService {
  
  @override
  Future getAttendings(AttendingsRequestModel attendingsRequestModel) async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/get_all_attendings.php";
    var _url = Uri.parse(_baseUrl);


    final response = await http.post(
      _url,
      body: attendingsRequestModel.toJson(),
    );
    
    // response.body = {"posts: [{post#1}, {post#2}, {post#3}]"} but as a String
    print(response.body);

/*   print(json
    .decode(response.body)["posts"].map((x) => x)); */

  var attendingsList = [];
  //var announcementList = [];
  
  if (response.statusCode == 200) {
    var data = attendingsResponseModelFromJson(response.body);
    
    for (int i=0; i < data.length; i++){
      //print(data[i]);
      attendingsList.add(data[i]);
      //print(meetingsList);
    }
    return attendingsList.reversed.toList();
  } else {
    return "";
  }
  }
}