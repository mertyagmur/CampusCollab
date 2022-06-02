import 'package:campuscollab/data/services/attendings/get_total_attendings_service.dart';
import 'package:get/get.dart';

class TotalAttendingsController extends GetxController {

  TotalAttendingsController(this._totalAttendingsService);

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> attendingsCount = Rxn();

  final TotalAttendingsService _totalAttendingsService;
  //final TotalAttendingsService _totalAttendingsService;


  @override
  void onInit() {
    /* for (var meeting in homeController.meetings.value) {
      print(meeting);
    }; */
    callingGetTotalAttendings();
    //print(attendings.value);
    super.onInit();
  }

  callingGetTotalAttendings() {

    isLoading.call(true);

    _totalAttendingsService.getTotalAttendings().then((attendingCount) {
      attendingsCount.value = attendingCount;
      //print(attendings.value?.toList().length ?? 0);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });

    return attendingsCount.value?.toList() ?? [];
  }
}