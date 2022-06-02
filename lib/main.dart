import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/get_controllers.dart';
import 'data/util/routing/get_pages.dart';
import 'views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> main() async {
    await getControllers();
  }

  @override
  Widget build(BuildContext context) {

    getControllers();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,  // Hides the little debug banner
      getPages: getPages,   // All available pages in the app are here so that GetX has access to them
      home: LoginPage(),
    );
  }
}