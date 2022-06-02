import 'package:campuscollab/data/services/attendings/get_attendings_service.dart';
import 'package:campuscollab/data/services/home/home_service.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/post/post.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  HomeController(this._homeService);

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> meetings = Rxn();
    //final Rxn<List> attendings = Rxn();


  final HomeService _homeService;

  @override
  void onInit() {
    _callingGetMeetings();
    super.onInit();
  }

  void _callingGetMeetings() {
    isLoading.call(true);

    _homeService.getMeetings().then((meeting) {
      meetings.value = meeting;
    }
     
    ).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

}