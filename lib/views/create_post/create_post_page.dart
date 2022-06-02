import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../homepage/home_page.dart';
import 'create_post_controller.dart';

class CreatePostPage extends GetWidget<CreatePostController> {
  CreatePostPage({Key? key}) : super(key: key);
  
  static const String routeName =
      "/views/create_post/create_post_page"; // named route for the add_notes page

  DateTime date = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        backgroundColor: darkBlueColor,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    controller.isSave.listen((isSave) => isSave ? _goToHome() : null);
    controller.error.listen((error) => _errorDialog);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _buildTextFieldTitle("Post Text:"),
                SizedBox(height: 10),
                _buildTextField(4, controller.postTextController),
                SizedBox(height: 10),
                _buildTextFieldTitle("Date:"),
                
                ElevatedButton(onPressed: (() async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2999),
                  );

                  if (newDate == null) return;

                  date = newDate;
                }),
                child: Text("Pick a date"),),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [_buildTextFieldTitle("Course Code:"),
                        _buildTextField(1, controller.courseCodeTextController),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Leave empty if not related to any course"),
                        ),],
                      ),
                    ),
                    SizedBox(width:10,),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [_buildTextFieldTitle("Student Branch:"),
                        _buildTextField(1, controller.studentBranchTextController),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Leave empty if not related to any branch"),
                        ),],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Obx(()=>CheckboxListTile(title: Text("A mentor will be available at this meeting"),
                  value: controller.checkBool.value,
                  onChanged: (value){
                    controller.checkBool.value = !controller.checkBool.value;
                  },
                  ),
                ),
                SizedBox(height: 20),
                _buildTextFieldTitle("Location:"),
                SizedBox(height: 10),
                _buildTextField(1, controller.locationTextController),
                SizedBox(height: 10),
                 _buildTextFieldTitle("Maximum Number Of (Expected) Participants:"),
                SizedBox(height: 10),
                _buildTextField(1, controller.maxParticipantsTextController),
                SizedBox(height: 10),
              ]),
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextField(int maxLines, TextEditingController textController) {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          maxLines: maxLines,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(border: InputBorder.none),
          controller: textController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: (() => _onTap()),
        child: Text(
          "Save",
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
    var mentorInfo = "without mentor";
    if (controller.checkBool.value){
      mentorInfo = "with mentor";
    }
    if (controller.postTextController.text.isNotEmpty) {
      controller.callingCreatePostService(
        controller.postTextController.text,
        date.toString(),
        mentorInfo,
        "",
        controller.courseCodeTextController.text,
        controller.studentBranchTextController.text,
        controller.locationTextController.text,
        controller.maxParticipantsTextController.text,

      );
    } else {
      _emptyDialog();
    }
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      errorMessage,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorMessage,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  void _goToHome() {
    Get.toNamed(HomePage.routeName);
  }
}
