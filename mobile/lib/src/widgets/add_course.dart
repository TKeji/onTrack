import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/course_serv.dart' show fetchAllCourses, addCourse;
import '../global_data.dart' show globalSessionData;

class AddCourse extends StatefulWidget {
  AddCourse({Key key, this.addToCourseList}) : super(key: key);

  void Function(Course) addToCourseList;

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String _selectedValue;
  List<Course> newCourseList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        courseDropdownBuilder(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
            ),
            onPressed: () async {
              print('Adding Course to this user');
              print(_selectedValue);
              print(globalSessionData.userId);
              //! Add course to userCourse also
              if (await addCourse(
                  courseCode: _selectedValue,
                  userId: globalSessionData.userId)) {
                print('Successfully added the course');
                //? Remove course from the list state
                setState(() {
                  newCourseList
                      .removeWhere((element) => element.code == _selectedValue);
                });
                widget
                    .addToCourseList(Course('INNEW', 'A sample new course', 5));
              } else {
                print('Unable to Add course');
              }
            },
            child: Icon(Icons.add)),
      ],
    );
  }

  FutureBuilder<List<Course>> courseDropdownBuilder() {
    return FutureBuilder<List<Course>>(
      future: fetchAllCourses(),
      // initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Set state here
          newCourseList = snapshot.data;
          return Container(
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('-' * 10),
                value: _selectedValue,
                items: snapshot.data.map((Course selectedCourse) {
                  return DropdownMenuItem<String>(
                    value: selectedCourse.code,
                    child: Text(
                      selectedCourse.code,
                      // style: TextStyle(fontSize: 20.0),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
