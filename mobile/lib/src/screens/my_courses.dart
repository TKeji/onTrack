import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../widgets/course_dropdown.dart';

class MyCourses extends StatefulWidget {
  MyCourses({Key key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Courses"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // TODO: Logout the user
                  Navigator.popAndPushNamed(context, '/sign-in');
                }),
            SizedBox(width: 20),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Add Course:",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0)),
                    SizedBox(width: 20.0),

                    // TODO: Make call to get available course to pick from
                    CourseSelect(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        onPressed: () => print('Elevated button'),
                        child: Icon(Icons.add)),
                  ],
                ),
                //! Card for Course
                buildCourseList(),
              ],
            ),
          ),
        ));
  }

  // buildDropdownItems(){
  //   Widget [] dropdowns;
  // }

  buildCourseList() {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: courses.length,
      itemBuilder: (context, index) => listItem(context, index),
      separatorBuilder: (context, index) => SizedBox(height: 5),
    );
  }
}

Widget listItem(BuildContext context, int index) {
  return Container(
    child: CourseCard(courses[index]['code'], courses[index]['title']),
  );
}

List<Map<String, String>> courses = [
  {'code': 'INSY404', 'title': "Introduction to Object Oriented Design"},
  {'code': 'COSC430', 'title': "Hands-on Java Training"},
  {'code': 'COSC418', 'title': "Introduction to Analog Computing"},
  {'code': 'COSC408', 'title': "Modeling and Simulations"},
  {'code': 'INSY402', 'title': "Internet Technologies"}
];
