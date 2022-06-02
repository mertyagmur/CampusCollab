import 'package:campuscollab/data/services/announcements/get_announcements_service.dart';
import 'package:campuscollab/data/services/attendings/get_attendings_service.dart';
import 'package:campuscollab/data/services/home/home_service.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/post/post.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {

  AnnouncementController(this._announcementService);

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> announcements = Rxn();
    //final Rxn<List> attendings = Rxn();


  final AnnouncementService _announcementService;

  @override
  void onInit() {
    _callingGetAnnouncements();
    super.onInit();
  }

  void _callingGetAnnouncements() {
    isLoading.call(true);

    _announcementService.getAnnouncements().then((announcement) {
      announcements.value = announcement;
    }
     
    ).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

}