import 'package:flutter/material.dart';
import '../widgets/logo.dart'; 
import '../widgets/sign_up_form.dart'; 


class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 45.0), 
        child: SingleChildScrollView(
                        child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [AppLogo(),] 
                              ),
                              SizedBox(height: 30.0),
                              SignUpForm(),
                            ],
                        ),
        ),
      )
    ); 
  }
}
