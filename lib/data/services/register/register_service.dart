import 'model/register_request_model.dart';
import 'package:http/http.dart' as http;

import 'model/register_response_model.dart';

abstract class RegisterService {
  Future register(
      RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  
  @override
  Future register(
      RegisterRequestModel registerRequestModel) async {
   
    const String _baseUrl = "http://10.0.2.2/CampusCollab/register.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: registerRequestModel.toJson(),
    );
  
  if (response.statusCode == 200) {
    print(response.body);
    return registerResponseModelFromJson(response.body);
  } else {
    return "";
  }
  }
}
