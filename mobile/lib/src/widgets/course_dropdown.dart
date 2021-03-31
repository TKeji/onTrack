import 'package:flutter/material.dart';

class CourseSelect extends StatefulWidget {
  @override
  _CourseSelectState createState() => _CourseSelectState();
}

class _CourseSelectState extends State<CourseSelect> {
  String _selectedValue;
  final courses = <String>['INSY404', 'COSC202', 'GEDS420'];

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
