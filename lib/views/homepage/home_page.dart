import 'package:campuscollab/data/services/attendings/model/get_attendings_response_model.dart';
import 'package:campuscollab/data/services/home/home_service.dart';
import 'package:campuscollab/data/services/home/model/home_response_model.dart';
import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/data/src/images.dart';
import 'package:campuscollab/data/src/strings.dart';
import 'package:campuscollab/views/announcements/announcements_page.dart';
import 'package:campuscollab/views/bookmarks/bookmarks_page.dart';
import 'package:campuscollab/views/create_post/create_post_page.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/homepage/get_total_attendings_controller.dart';
import 'package:campuscollab/views/login/login_page.dart';
import 'package:campuscollab/views/meeting_details/meeting_details_page.dart';
import 'package:campuscollab/views/profile/profile_page.dart';
import 'package:campuscollab/views/profile/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'home_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

AttendingsController attendingsController = Get.find();
TotalAttendingsController totalAttendingsController = Get.find();


class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName =
      "/views/homepage/home_page"; // named route for the home page

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
      appBar: AppBar(
        title: Text(homeAppBarText),
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
                onPressed: () {},
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

  void _goToAnnouncements() {
    Get.toNamed(AnnouncementPage.routeName);
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

  Future<void> _refresh() async {
    Get.offAll(() => HomePage(), transition: Transition.noTransition);
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Obx(
        () => ListView.builder(
          //reverse: true,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: _buildCard(controller.meetings.value?[index] ?? ""),
          ),
          itemCount: controller.meetings.value?.length ?? 0,
        ),
      ),
    );
  }

  Widget _buildCard(HomeResponseModel meeting) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Dismiss',
          ),
        ],
      ),
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: null,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.bookmark_add,
            label: 'Bookmark',
          ),
        ],
      ),
        child: Card(
          color: Color.fromARGB(155, 255, 255, 255),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: (() => _goToMeetingDetails(meeting)),
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
                        meeting.postOwner,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //subtitle: Text(timeago.format(meeting.postDate)),
                    subtitle: Text(DateFormat('dd-MM-yyyy').format(meeting.postDate)),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Chip(
                          avatar: Icon(Icons.groups), //co_present
                          label: Text("${meeting.attendingsCount}/${meeting.maxParticipants}")),
                    ),
                    dense: true,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(meeting.postText),
                  ),
                  Divider(),
                  Wrap(
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
                  Divider(),
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
                  /* ExpansionTile(
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
