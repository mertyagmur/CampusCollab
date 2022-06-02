import 'package:campuscollab/views/announcements/announcements_page.dart';
import 'package:campuscollab/views/bookmarks/bookmarks_page.dart';
import 'package:campuscollab/views/create_announcement/create_announcement_page.dart';
import 'package:campuscollab/views/create_post/create_post_page.dart';
import 'package:campuscollab/views/homepage/home_page.dart';
import 'package:campuscollab/views/login/login_page.dart';
import 'package:campuscollab/views/meeting_details/meeting_details_page.dart';
import 'package:campuscollab/views/profile/profile_page.dart';
import 'package:campuscollab/views/register/register_page.dart';
import 'package:get/get.dart';

// Page routes are defined in a list. 

List<GetPage> getPages = [

  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage(), transition: Transition.leftToRightWithFade),
  GetPage(name: CreatePostPage.routeName, page: () => CreatePostPage(), transition: Transition.cupertinoDialog),
  GetPage(name: MeetingDetailsPage.routeName, page: () => MeetingDetailsPage(), transition: Transition.cupertino),
  GetPage(name: BookmarksPage.routeName, page: () => BookmarksPage(), transition: Transition.cupertino),
  GetPage(name: AnnouncementPage.routeName, page: () => AnnouncementPage(), transition: Transition.cupertino),
  GetPage(name: CreateAnnouncementPage.routeName, page: () => CreateAnnouncementPage(), transition: Transition.cupertinoDialog),
  GetPage(name: ProfilePage.routeName, page: () => ProfilePage(), transition: Transition.cupertino),

];