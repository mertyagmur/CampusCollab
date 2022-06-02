import 'package:campuscollab/data/services/home/model/home_response_model.dart';
import 'package:campuscollab/views/homepage/home_page.dart';
import 'package:campuscollab/views/meeting_details/meeting_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campuscollab/data/services/attendings/model/get_attendings_response_model.dart';
import 'package:campuscollab/data/src/colors.dart';
import 'package:campuscollab/views/homepage/attendings_controller.dart';
import 'package:campuscollab/views/post/post.dart' as currentPost;
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../data/src/colors.dart';

class MeetingDetailsPage extends GetWidget<AttendingsController> {
  //const MeetingDetailsPage({Key? key}) : super(key: key);

  



  static const String routeName =
      "/views/meeting_details/meeting_details_page"; // named route for the home page

  @override
  Widget build(BuildContext context) {
    var meeting = Get.arguments;
    currentPost.postId.value = meeting.postId.toString();
    //print(currentPost.postId);
    //Get.lazyPut((() => MeetingDetailsController()));
    return Scaffold(
        appBar: AppBar(
          title: Text("Meeting Details"),
          backgroundColor: darkBlueColor,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCard(meeting),
                _buildAttendingsChip(meeting),
                _buildAttendings(meeting),
              ]),
        ));
  }

  Widget _buildCard(meeting) {
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
            label: 'Delete',
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
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          //onTap: (() => _goToMeetingDetails(meeting)),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: blueColor,
                  contentPadding: EdgeInsets.all(0),
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  horizontalTitleGap: 5,
                  leading: FlutterLogo(size: 30.0),
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
                ExpansionTile(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAttendings(meeting) {
  print(meeting.attendingsCount);
  return Container(
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        //reverse: true,
        itemCount: attendingsController.attendings.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildAttendingsListTile(
            attendingsController.attendings[index].firstName
            
              ),
        ),
        
      ),
  );
}

Widget _buildAttendingsListTile(String value) {
  return ListTile(title: Text("fadhsjfashdjk"),);
}

_buildAttendingsChip(meeting) {
  return Chip(
      avatar: Icon(Icons.groups), //co_present
      label: Text("View Attendees (${meeting.attendingsCount}/${meeting.maxParticipants})"));
}