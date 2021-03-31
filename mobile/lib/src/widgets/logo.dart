import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'OnTrack', 
          style: TextStyle(
          fontSize: 48,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '.', 
          style: TextStyle(
          fontSize: 48,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          // color: Colors.yellow,
          color: Color(0xffecf01c),
          ),
        )
      ],
    );
  }
}