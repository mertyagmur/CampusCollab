import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/views/announcements/announcements_page.dart';
import 'package:campuscollab/views/create_announcement/create_announcement_controller.dart';
import 'package:campuscollab/views/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/src/strings.dart';

class CreateAnnouncementPage extends GetWidget<CreateAnnouncementController> {
  CreateAnnouncementPage({Key? key}) : super(key: key);
  
  static const String routeName =
      "/views/create_announcement/create_announcement_page"; // named route for the add_notes page

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Announcement"),
        backgroundColor: darkBlueColor,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    controller.isSave.listen((isSave) => isSave ? _goToAnnouncementsPage() : null);
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
                _buildTextFieldTitle("Announcement Text"),
                SizedBox(height: 20),
                _buildTextField(5),
                SizedBox(height: 20),
                //_buildTextFieldTitle("Date"),
                /* ElevatedButton(onPressed: (() {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2999),
                  );
                }),
                child: Text("Pick a date"),), */
                /* Row(
                  children: [
                    Column(
                      children: [_buildTextFieldTitle("Course Code"),
                      _buildTextField(1),],
                    ),
                    Column(
                      children: [_buildTextFieldTitle("Student Branch"),
                      _buildTextField(1),],
                    )
                  ],
                ), */
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
                SizedBox(height: 20),
                //_buildTextField(1),
                SizedBox(height: 20),
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
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextField(int maxLines) {
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
          controller: controller.announcementTextController,
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
    if (controller.announcementTextController.text.isNotEmpty) {
      controller.callingCreateAnnouncementService(
        controller.announcementTextController.text,
        date.toString(),
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

  void _goToAnnouncementsPage() {
    Get.toNamed(AnnouncementPage.routeName);
  }
}
