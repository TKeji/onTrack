import 'package:flutter/material.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 45.0), 
        child: SingleChildScrollView(
                        child: Column(
                            children: [
                             Text("Hello Profile")
                            ],
                        ),
        ),
      )
    ); 
  }
}
