import 'package:campuscollab/data/services/attendings/get_attendings_service.dart';
import 'package:campuscollab/data/services/attendings/get_total_attendings_service.dart';
import 'package:campuscollab/data/services/attendings/model/get_attendings_request_model.dart';
import 'package:campuscollab/data/services/attendings/model/get_total_attendings_response_model.dart';
import 'package:campuscollab/views/homepage/home_controller.dart';
import 'package:get/get.dart';

import '../post/post.dart';

class AttendingsController extends GetxController {

  AttendingsController(this._attendingsService);

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  //final Rxn<List> attendings = Rxn();
  var attendings = [];
  final AttendingsService _attendingsService;
  //final TotalAttendingsService _totalAttendingsService;


  @override
  void onInit() {
    /* for (var meeting in homeController.meetings.value) {
      print(meeting);
    }; */
    //attendings.close();
    print("attendings controller instantiated");
    print("calling get attendings with ${postId.value}");
    callingGetAttendings(postId.value);
    //print(attendings.value);
    
    super.onInit();
  }

  /* @override
  void onStart(){

  } */

  @override
  void onClose(){
    print("attendings controller closed");
    attendings.clear();
  }

  void callingGetAttendings(String postId) {

    final AttendingsRequestModel requestModel = AttendingsRequestModel(
      postId: postId,
    );

    isLoading.call(true);

    _attendingsService.getAttendings(requestModel).then((attending) {
      //print(attending.length);
      attendings.addAll(attending);
      //print(attendings[0].firstName);
      //print(attendings.value?.length ?? 0);
      //print(attendings.value?.toList().length ?? 0);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
      //attendings.value = [];
    });

  }


  /* callingGetTotalAttendings(String postId) {

    isLoading.call(true);

    _totalAttendingsService.getTotalAttendings().then((attendingCount) {
      attendings.value = attendingCount;
      //print(attendings.value?.toList().length ?? 0);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });

    return attendings.value?.toList() ?? [];
  } */
}