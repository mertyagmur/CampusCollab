import 'package:campuscollab/data/services/create_post/create_post_service.dart';
import 'package:campuscollab/data/services/create_post/model/create_post_request_model.dart';
import 'package:campuscollab/data/services/create_post/model/create_post_response_model.dart';
import 'package:campuscollab/views/profile/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  CreatePostController(this._createPostService);

  final TextEditingController postTextController = TextEditingController();
  final TextEditingController courseCodeTextController = TextEditingController();
  final TextEditingController studentBranchTextController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController maxParticipantsTextController = TextEditingController();

  var checkBool = false.obs;

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isSave = RxBool(false);
  final Rxn<CreatePostResponseModel> post = Rxn();

  final CreatePostService _createPostService;

  void callingCreatePostService(
    String postText,
    String postDate,
    String mentorInfo,
    String postType,
    String courseCode,
    String studentBranch,
    String location,
    String maxParticipants,
  ) {
    final CreatePostRequestModel createPostRequestModel =
        CreatePostRequestModel(
      postOwner: "${firstName.value} ${lastName.value}",
      postOwnerId: userId.value,
      postText: postText,
      postDate: postDate,
      mentorInfo: mentorInfo,
      location: location,
      maxParticipants: maxParticipants,
      postType: postType,
      courseCode: courseCode,
      studentBranch: studentBranch,
    );

    isLoading.call(true);
    _createPostService.createPost(createPostRequestModel).then((post) {
      print("post.status");
      isSave.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
