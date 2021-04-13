import 'package:flutter/material.dart';
import '../screens/my_articles.dart' show courses, courseList;

class CourseSelect extends StatefulWidget {
  @override
  _CourseSelectState createState() => _CourseSelectState();
}

class _CourseSelectState extends State<CourseSelect> {
  String _selectedValue;
  final courses = <String>['INSY404', 'COSC418', 'COSC408'];

  //TODO: Make an Init state that gets the available courses from the api

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedValue,
      items: courses.map((value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        // print("Before: " + _selectedValue);
        // print("Change: " + val);
        print(value);
        print(_selectedValue);
        setState(() {
          _selectedValue = value;
        });
      },
    );
  }
}
