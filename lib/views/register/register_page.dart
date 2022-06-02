import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:campuscollab/views/login/login_page.dart';
import 'package:campuscollab/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetWidget<RegisterController> {
  static const String routeName =
      "/views/register/register_page"; // named route for the register page

  @override
  Widget build(BuildContext context) {

    controller.isRegister.listen((isRegister) { 
      if (isRegister) _goToLogin();
    });

    controller.error.listen((error) => _errorDialog());
    controller.errorText.listen((errorText) {
      if (errorText != null) _errorTextDialog(errorText);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(registerAppBarText),
        backgroundColor: darkBlueColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _buildSpace(20),
          _buildFirstNameTextField(),
          _buildSpace(20),
          _buildLastNameTextField(),
          _buildSpace(20),
          _buildDepartmentTextField(),
          _buildSpace(20),
          _buildEmailTextField(),
          _buildSpace(20),
          _buildPasswordTextField(),
          _buildSpace(20),
          _buildPasswordVerifyTextField(),
          _buildSpace(20),
          _buildButton(),
          _buildSpace(20),
        ]),
      ),
    );
  }

  Widget _buildFirstNameTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: firstNameHintText,
          ),
          controller: controller.firstNameController,
        ),
      ),
    );
  }

  Widget _buildLastNameTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: lastNameHintText,
          ),
          controller: controller.lastNameController,
        ),
      ),
    );
  }

  Widget _buildDepartmentTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: departmentHintText,
          ),
          controller: controller.departmentController,
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: emailHintText,
            suffixText: "@stu.khas.edu.tr", 
          ),
          controller: controller.emailController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          obscureText: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordHintText,
          ),
          controller: controller.passwordController,
        ),
      ),
    );
  }

  Widget _buildPasswordVerifyTextField() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          obscureText: true,
          textInputAction: TextInputAction.done,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordVerifyText,
          ),
          controller: controller.passwordVerifyController,
        ),
      ),
    );
  }

  Widget _buildSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () => _onTap(),
        child: Text(
          registerText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: purpleColor,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: greenColor,
        ),
      ),
    );
  }

  void _onTap() {
    controller.callingRegisterService(
      controller.firstNameController.text,
      controller.lastNameController.text,
      controller.departmentController.text,
      controller.emailController.text,
      controller.passwordController.text,
    );
  }

  void _goToLogin(){
    Get.offAndToNamed(LoginPage.routeName);
  }

  void _errorDialog(){
    Get.snackbar(errorTitle, errorMessage, colorText: Colors.white, backgroundColor: Colors.red,);
  }

  void _errorTextDialog(String description) {
    Get.snackbar(
      errorTitle,
      description,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}
