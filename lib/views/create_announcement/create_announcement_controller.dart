import 'package:campuscollab/data/services/create_announcement/create_announcement_service.dart';
import 'package:campuscollab/data/services/create_announcement/model/create_announcement_request_model.dart';
import 'package:campuscollab/data/services/create_announcement/model/create_announcement_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/user.dart';

class CreateAnnouncementController extends GetxController {

  CreateAnnouncementController(this._createAnnouncementService);

  final TextEditingController announcementTextController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isSave = RxBool(false);
  final Rxn<CreateAnnouncementResponseModel> announcement = Rxn();

  final CreateAnnouncementService _createAnnouncementService;


  void callingCreateAnnouncementService(String postText, String postDate) {
    final CreateAnnouncementRequestModel createAnnouncementRequestModel = CreateAnnouncementRequestModel(
      announcementOwner: "${firstName.value} ${lastName.value}",
      announcementOwnerId: userId.value,
      postText:  postText,
      postDate: postDate,
    );
    

    isLoading.call(true);
    _createAnnouncementService
        .createAnnouncement(createAnnouncementRequestModel)
        .then((announcement) {
          //print("Announcement.status");
          isSave.call(true);
        })
        .catchError((dynamic error) {
          this.error.trigger(error);
          print(error);
          isSave.call(true);
        })
        .whenComplete(() {
          isLoading.call(false);
        });
  }
}
