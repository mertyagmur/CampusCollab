import 'model/create_post_request_model.dart';
import 'package:http/http.dart' as http;
import 'model/create_post_response_model.dart';

abstract class CreatePostService {
  Future createPost(
      CreatePostRequestModel createPostRequestModel);
}

class CreatePostServiceImp extends CreatePostService {

  @override
  Future createPost(
      CreatePostRequestModel createPostRequestModel) async {
    
    const String _baseUrl = "http://10.0.2.2/CampusCollab/create_posts.php";
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(
      _url,
      body: createPostRequestModel.toJson(),
    );
  
  if (response.statusCode == 200) {
    print('Successfully Created A Post');
    //print(response.body);
    return createPostResponseModelFromJson(response.body);
  } else {
    return "";
  }
  }
}