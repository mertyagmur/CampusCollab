import 'package:campuscollab/views/profile/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/src/colors.dart';
import '../announcements/announcements_page.dart';
import '../bookmarks/bookmarks_page.dart';
import '../create_post/create_post_page.dart';
import '../homepage/home_page.dart';
import '../login/login_page.dart';
import '../meeting_details/meeting_details_page.dart';
import 'profile_controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  static const String routeName = "/views/meeting_details/profile_page";
  @override
  Widget build(BuildContext context) {
    //controller.error.listen((error) => _errorDialog());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: darkBlueColor,
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreatePostPage(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: darkBlueColor,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: _goToHome,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 50),
              child: IconButton(
                icon: Icon(
                  Icons.campaign,
                  color: Colors.white,
                ),
                onPressed: _goToAnnouncements,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
                onPressed: _goToBookmarks,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToBack() {
    Get.back();
  }

  void _goToSettings() {
    Get.back();
  }

  void _goToHome() {
    Get.toNamed(HomePage.routeName);
  }

  void _goToLogout() {
    Get.offNamed(LoginPage.routeName);
  }

  void _goToAbout() {
    //Get.toNamed(AboutPage.routeName);
  }

  void _goToProfile() {
    //Get.toNamed(ProfilePage.routeName);
  }

  void _goToBookmarks() {
    Get.toNamed(BookmarksPage.routeName);
  }

  void _goToAnnouncements() {
    Get.toNamed(AnnouncementPage.routeName);
  }

  void _goToCreatePostPage() {
    Get.toNamed(CreatePostPage.routeName);
    //Get.to(CreatePostPage());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(),
            _buildSocialsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    var userProfilePic =
        NetworkImage("http://10.0.2.2/Meetup3/img/default.jpg");
    if (imageUrl.value != "") {
      userProfilePic =
          NetworkImage("http://10.0.2.2/Meetup3/uploads/${imageUrl.value}");
    }

    return Drawer(
      backgroundColor: Colors.white,
      elevation: 50,
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text("${firstName.value} ${lastName.value}"),
          accountEmail: Text(email.value),
          currentAccountPicture: CircleAvatar(
            backgroundImage: userProfilePic,
            backgroundColor: Colors.white,
          ),
          decoration: BoxDecoration(
            color: darkBlueColor,
          ),
        ),
        /* ListTile(
          title: Text("Homepage"),
          leading: Icon(Icons.home),
          onTap: () => _goToBack(),
        ),
        Divider(),
        ListTile(
          title: Text("Profile"),
          leading: Icon(Icons.person),
          onTap: () => _goToProfile(),
        ),
        Divider(), */
        Divider(),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
          onTap: () => _goToSettings(),
        ),
        Divider(),
        ListTile(
          title: Text("About"),
          leading: Icon(Icons.info),
          onTap: () => _goToAbout(),
        ),
        Divider(),
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.logout),
          onTap: () => _goToLogout(),
        ),
        Divider(),
      ]),
    );
  }

  /* Widget _buildCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: darkBlueColor,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.orangeAccent,
              Colors.yellow.shade300,
            ],
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text("testtttttttttt")],
          ),
        ),
      ),
    );
  } */

  Widget _buildCard() {
    var userProfilePic =
        NetworkImage("http://10.0.2.2/Meetup3/img/default.jpg");
    if (imageUrl.value != "") {
      userProfilePic =
          NetworkImage("http://10.0.2.2/Meetup3/uploads/${imageUrl.value}");
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [darkBlueColor, purpleColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: userProfilePic,
                      radius: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${firstName} ${lastName}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 213, 213),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          department.value,
                          style: TextStyle(
                              color: greenColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _buildSocialsCard() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [darkBlueColor, purpleColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Social Media Accounts:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 226, 213, 213),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Text(
                            "Social media accounts will be listed here",
                            style: TextStyle(
                                color: greenColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                        ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
