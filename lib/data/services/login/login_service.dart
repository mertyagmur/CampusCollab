import 'model/login_request_model.dart';
import 'package:http/http.dart' as http;

import 'model/login_response_model.dart';

abstract class LoginService {
  Future login(
      LoginRequestModel registerRequestModel);
}

class LoginServiceImp extends LoginService {
  
  @override
  Future login(
      LoginRequestModel loginRequestModel) async {

    const String _baseUrl = "http://10.0.2.2/CampusCollab/login.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: loginRequestModel.toJson(),
    );
  
  if (response.statusCode == 200) {
    return loginResponseModelFromJson(response.body);
    //print(response.body);
  } else {
    return "";
  }
  }
}
