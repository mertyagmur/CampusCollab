import 'package:campuscollab/data/services/announcements/get_announcements_service.dart';
import 'package:campuscollab/views/announcements/announcement_controller.dart';
import 'package:campuscollab/views/bookmarks/bookmarks_controller.dart';
import 'package:campuscollab/views/create_announcement/create_announcement_controller.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/homepage/get_total_attendings_controller.dart';
import 'package:campuscollab/views/homepage/home_controller.dart';
import 'package:campuscollab/views/login/login_controller.dart';
import 'package:campuscollab/views/profile/profile_controller.dart';
import 'package:campuscollab/views/register/register_controller.dart';
import 'package:get/get.dart';

import '../views/create_post/create_post_controller.dart';
import '../views/meeting_details/meeting_details_controller.dart';
import 'services/attendings/get_attendings_service.dart';
import 'services/attendings/get_total_attendings_service.dart';
import 'services/bookmarks/get_bookmarks_service.dart';
import 'services/create_announcement/create_announcement_service.dart';
import 'services/create_post/create_post_service.dart';
import 'services/home/home_service.dart';
import 'services/login/login_service.dart';
import 'services/register/register_service.dart';

Future getControllers() async {

  //Pages
  Get.create(() => LoginController(Get.find()), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(Get.find()), permanent: false);
  Get.create(() => CreatePostController(Get.find()), permanent: false);
  Get.create(() => MeetingDetailsController(), permanent: false);
  Get.create(() => BookmarksController(Get.find()), permanent: false);
  Get.create(() => AttendingsController(Get.find()), permanent: false);
  Get.create(() => TotalAttendingsController(Get.find()), permanent: false);
  Get.create(() => AnnouncementController(Get.find()), permanent: false);
  Get.create(() => CreateAnnouncementController(Get.find()), permanent: false);
  Get.create(() => ProfileController());


  //Services
  Get.lazyPut<RegisterService>(() => RegisterServiceImp(), fenix: true);
  Get.lazyPut<LoginService>(() => LoginServiceImp(), fenix: true);
  Get.lazyPut<HomeService>(() => HomeServiceImp(), fenix: true);
  Get.lazyPut<CreatePostService>(() => CreatePostServiceImp(), fenix: true);
  Get.lazyPut<BookmarksService>(() => BookmarksServiceImp(), fenix: true);
  Get.lazyPut<AttendingsService>(() => AttendingsServiceImp(), fenix: true);
  Get.lazyPut<TotalAttendingsService>(() => TotalAttendingsServiceImp(), fenix: true);
  Get.lazyPut<AnnouncementService>(() => AnnouncementServiceImp(), fenix: true);
  Get.lazyPut<CreateAnnouncementService>(() => CreateAnnouncementServiceImp(), fenix: true);
}