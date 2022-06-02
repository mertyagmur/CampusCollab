import 'package:campuscollab/data/services/bookmarks/get_bookmarks_service.dart';
import 'package:campuscollab/views/profile/user.dart';
import 'package:get/get.dart';

import '../../data/services/bookmarks/model/get_bookmarks_request_model.dart';

class BookmarksController extends GetxController {

  BookmarksController(this._bookmarksService);

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> meetings = Rxn();

  final BookmarksService _bookmarksService;


  @override
  void onInit() {
    callingGetMeetings(userId.value);
    super.onInit();
  }


  void callingGetMeetings(String userId) {

    final BookmarksRequestModel requestModel = BookmarksRequestModel(
      userId: userId,
    );

    isLoading.call(true);

    _bookmarksService.getMeetings(requestModel).then((meeting) {
      meetings.value = meeting;
      print(meetings);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}