import 'package:flutter/material.dart';
import '../widgets/logo.dart';
import '../widgets/sign_up_form.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                  ],
                ),
                SizedBox(height: 20.0),
                SignUpForm(),
              ],
            ),
          ),
        ));
  }
}
