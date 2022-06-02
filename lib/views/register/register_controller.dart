import 'package:campuscollab/data/services/register/model/register_request_model.dart';
import 'package:campuscollab/data/services/register/model/register_response_model.dart';
import 'package:campuscollab/data/services/register/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController(this._registerService);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxnString errorText = RxnString();
  final RxBool isRegister = RxBool(false);

  final Rxn<RegisterResponseModel> user = Rxn();

  final RxBool passwordMatch = RxBool(true);

  final RegisterService _registerService;

  void callingRegisterService(
    String firstName,
    String lastName,
    String department,
    String email,
    String password,
  ) {
    final RegisterRequestModel _userRequest = RegisterRequestModel(
      firstName: firstName,
      lastName: lastName,
      department: department,
      email: email,
      password: password,
    );

    isLoading.call(true);
    _registerService.register(_userRequest).then((user) {
      isRegister.call(true);
    }).catchError((dynamic error) {
      print(error);
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
