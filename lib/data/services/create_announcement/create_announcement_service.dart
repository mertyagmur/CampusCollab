import 'model/create_announcement_request_model.dart';
import 'package:http/http.dart' as http;

import 'model/create_announcement_response_model.dart';

abstract class CreateAnnouncementService {
  Future createAnnouncement(
      CreateAnnouncementRequestModel createAnnouncementRequestModel);
}

class CreateAnnouncementServiceImp extends CreateAnnouncementService {

  @override
  Future createAnnouncement(
      CreateAnnouncementRequestModel createAnnouncementRequestModel) async {
    
    const String _baseUrl = "http://10.0.2.2/CampusCollab/create_announcement.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: createAnnouncementRequestModel.toJson(),
    );
  
  if (response.statusCode == 200) {
    print('Successfully Created an Announcement');
    //print(response.body);
    return createAnnouncementResponseModelFromJson(response.body);
  } else {
    return "";
  }
  }
}