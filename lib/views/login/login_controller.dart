
import 'package:campuscollab/data/services/login/login_service.dart';
import 'package:campuscollab/data/services/login/model/login_request_model.dart';
import 'package:campuscollab/data/services/login/model/login_response_model.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:campuscollab/views/profile/user.dart' as activeUser;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  LoginController(this._loginService);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable variables are defined
  final Rx<bool> isLoading = RxBool(false); // Will be used when progress indicators are added
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isLogin = RxBool(false);
  final Rxn<LoginResponseModel> currentUser = Rxn();
  final RxnString errorText = RxnString();

  var isPasswordHidden = true.obs;

  final LoginService _loginService;

  void callingLoginService(String email, String password) {
    final LoginRequestModel requestModel = LoginRequestModel(
      email: email,
      password: password,
    );

    isLoading.call(true);
    _loginService.login(requestModel).then((currentUser) {
      if (currentUser.status == 2) isLogin.call(true);
      if (currentUser.status == 1) errorText.value = wrongPasswordText;
      if (currentUser.status == 0) errorText.value = noUserText;
      //print(currentUser.userId);
      activeUser.userId.value = currentUser.userId;
      activeUser.email.value = currentUser.email;
      activeUser.department.value = currentUser.department;
      activeUser.firstName.value = currentUser.firstName;
      activeUser.lastName.value = currentUser.lastName;
      activeUser.imageUrl.value = currentUser.imageUrl;
      activeUser.spotifyLink.value = currentUser.spotifyLink;
      activeUser.bio.value = currentUser.bio;
      activeUser.personalWeb.value = currentUser.personalWeb;
      activeUser.instaLink.value = currentUser.instaLink;
      activeUser.twitterLink.value = currentUser.twitterLink;
      activeUser.linkedinLink.value = currentUser.linkedinLink;
      activeUser.githubLink.value = currentUser.githubLink;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}