import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/data/src/images.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:campuscollab/views/homepage/home_page.dart';
import 'package:campuscollab/views/login/login_controller.dart';
import 'package:campuscollab/views/register/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* GetWidget caches a Controller. 
Get.create(()=>Controller()) will generate a new Controller each time 
you call Get.find<Controller>(),
That's where GetWidget shines... as you can use it, for example, 
to keep a list of Todo items. 
So, if the widget gets "rebuilt", 
it will keep the same controller instance.
*/
class LoginPage extends GetWidget<LoginController> {
  static const String routeName =
      "/views/login/login_page"; // named route for the login page

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    controller.isLogin.listen((isLogin) {
      if (isLogin) {
        _goToHomePage();
        print("Login successful");
      }
    });
    controller.errorText.listen((errorText) {
      if (errorText != null) _errorTextDialog(errorText);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("$loginAppBarText Beta"),
          backgroundColor: darkBlueColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSpace(20),
            _buildImage(),
            _buildSpace(20),
            _buildUsernameTextField(),
            _buildSpace(10),
            _buildPasswordTextField(),
            _buildSpace(20),
            _buildButton(),
            _buildSpace(20),
            _buildRegisterText(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      campusCollabLogo,
      height: Get.height * .4,
    );
  }

  Widget _buildUsernameTextField() {
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
        child: Obx(
          (() => TextField(
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: passwordHintText,
                  suffix: InkWell(
                      child: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onTap: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      }),
                ),
                controller: controller.passwordController,
              )),
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () {
          if (controller.emailController.text.isNotEmpty &&
              controller.passwordController.text.isNotEmpty) {
            controller.callingLoginService(
              controller.emailController.text,
              controller.passwordController.text,
            );
          } else {
            _emptyErrorDialog();
          }
          ;
        },
        child: Text(
          loginButton,
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

  Widget _buildSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildRegisterText() {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: registerQuestionText,
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: registerButtonText,
          style: TextStyle(
            color: blueColor,
            fontStyle: FontStyle.italic,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed(RegisterPage.routeName);
            },
        ),
      ])),
    );
  }

  void _goToHomePage() {
    Get.offAndToNamed(HomePage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorMessage,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  void _emptyErrorDialog() {
    Get.snackbar(errorTitle, emptyErrorText,
        colorText: Colors.white, backgroundColor: Colors.red);
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
