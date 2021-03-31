import 'package:flutter/material.dart';
import '../widgets/logo.dart'; 
import '../widgets/sign_in_form.dart'; 


class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 45.0), 
        child: SingleChildScrollView(
                        child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [AppLogo(),] 
                              ),
                              SizedBox(height: 70.0),
                              SignInForm(),
                            ],
                        ),
        ),
      )
    ); 
  }
}
