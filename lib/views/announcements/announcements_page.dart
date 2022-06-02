import 'package:campuscollab/data/services/announcements/model/announcement_response_model.dart';
import 'package:campuscollab/data/services/attendings/model/get_attendings_response_model.dart';
import 'package:campuscollab/data/services/home/home_service.dart';
import 'package:campuscollab/data/services/home/model/home_response_model.dart';
import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/data/src/images.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:campuscollab/views/bookmarks/bookmarks_page.dart';
import 'package:campuscollab/views/create_announcement/create_announcement_page.dart';
import 'package:campuscollab/views/create_post/create_post_page.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/homepage/attendings_page.dart';
import 'package:campuscollab/views/homepage/get_total_attendings_controller.dart';
import 'package:campuscollab/views/login/login_page.dart';
import 'package:campuscollab/views/meeting_details/meeting_details_page.dart';
import 'package:campuscollab/views/profile/profile_page.dart';
import 'package:campuscollab/views/profile/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'announcement_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class AnnouncementPage extends GetWidget<AnnouncementController> {
  const AnnouncementPage({Key? key}) : super(key: key);

  static const String routeName =
      "/views/announcements/announcements_page"; // named route for the home page

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcements"),
        backgroundColor: darkBlueColor,
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateAnnouncementPage(),
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
                onPressed: _goToHomepage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 50),
              child: IconButton(
                icon: Icon(
                  Icons.campaign,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: _goToProfile,
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

  void _goToHomepage() {
    Get.toNamed(HomePage.routeName);
  }

  void _goToLogout() {
    Get.offNamed(LoginPage.routeName);
  }

  void _goToAbout() {
    //Get.toNamed(AboutPage.routeName);
  }

  void _goToProfile() {
    Get.toNamed(ProfilePage.routeName);
  }

   void _goToBookmarks() {
    Get.toNamed(BookmarksPage.routeName);
  }

  void _goToMeetingDetails(meeting){
    //print(meeting.postId);
    //print(attendingsController.callingGetAttendings(meeting.postId).toList().length ?? 0);
    //print(totalAttendingsController.callingGetTotalAttendings());
    Get.toNamed(MeetingDetailsPage.routeName, arguments: meeting);
  }

  void _goToCreatePostPage() {
    Get.toNamed(CreatePostPage.routeName);
    //Get.to(CreatePostPage());
  }

  void _goToCreateAnnouncementPage() {
    Get.toNamed(CreateAnnouncementPage.routeName);
    //Get.to(CreatePostPage());
  }

  Future<void> _refresh() async {
    Get.offAll(() => AnnouncementPage(), transition: Transition.noTransition);
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Obx(
        () => ListView.builder(
          //reverse: true,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: _buildCard(controller.announcements.value?[index] ?? ""),
          ),
          itemCount: controller.announcements.value?.length ?? 0,
        ),
      ),
    );
  }

  Widget _buildCard(AnnouncementResponseModel announcement) {
    return Slidable(
        child: Card(
          color: Color.fromARGB(155, 255, 255, 255),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            //onTap: (() => _goToMeetingDetails(announcement)),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.blueAccent,
                    contentPadding: EdgeInsets.all(0),
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    horizontalTitleGap: 5,
                    leading: CircleAvatar(backgroundImage: NetworkImage("http://10.0.2.2/Meetup3/img/default.jpg", scale: 0.5),),
                    title: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        announcement.announcementOwner,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(DateFormat('dd-MM-yyyy').format(announcement.postDate)),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Chip(
                          avatar: Icon(Icons.campaign_outlined), //co_present
                          label: Text("")),
                    ),
                    dense: true,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(announcement.postText),
                  ),
                  Divider(),
                  /* Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Chip(
                        avatar: Icon(Icons.location_on),
                        label: Text("${meeting.location}"),
                        backgroundColor: greenColor,
                      ),
                      Chip(
                        avatar: Icon(Icons.info),
                        label: Text("${meeting.courseCode}"),
                        backgroundColor: greenColor,
                      ),
                      Chip(
                        avatar: Icon(Icons.supervised_user_circle), //co_present
                        label: Text("${meeting.mentorInfo}"),
                        backgroundColor: greenColor,
                      ),

                      //Chip(label: Text("Max Part.: ${meeting.maxParticipants}")),
                    ],
                  ),
                  Divider(), */
                  /* Row(
                    children: [
                      ExpansionTile(
                        title: Text("Details"),
                        children: [],
                      ),
                      ExpansionTile(
                        title: Text("Details"),
                        children: [],
                      ),
                    ],
                  ), */
                 /*  ExpansionTile(
                    title: Text("Details"),
                    children: [
                      ExpansionTile(
                        title: Text("Comments"),
                        children: [],
                      ),
                      ExpansionTile(
                        title: Text("Attendees"),
                        children: [],
                      ),
                    ],
                  ), */
                ],
              ),
            ),
          ),
        ),
    );
  }

Widget _buildDrawer() {
    var userProfilePic = NetworkImage("http://10.0.2.2/Meetup3/img/default.jpg");
    if (imageUrl.value != ""){
      userProfilePic = NetworkImage("http://10.0.2.2/Meetup3/uploads/${imageUrl.value}");
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

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorMessage,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}
