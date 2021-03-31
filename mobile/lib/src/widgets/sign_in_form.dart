import 'package:flutter/material.dart';
import '../endpoints.dart';
import '../models/user.dart';
import '../screens/sign_up.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //* Email & Password
          generateFormField('Enter Your Email', (val) => _email = val,
              isEmail: true),
          SizedBox(height: 18.0),
          generateFormField('Enter Your Password', (val) => _password = val,
              isPassword: true),
          SizedBox(height: 18.0),

          //* Button
          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.maxFinite, height: 50),
            child: ElevatedButton(
              onPressed: () {
                print('sign up button was pressed');
                print(_email);
                _formKey.currentState.save();
                NewUser user =
                    NewUser(_firstname, _lastname, _email, _password);
                registerUser(user);

                // TODO: VALIDATE BEFORE MOVING TO NEXT SCREEN
                // Navigator.pushReplacementNamed(context, '/my-courses');
                Navigator.pushNamedAndRemoveUntil(
                    context, '/my-courses', (route) => false);
              },
              child: Text('Sign In'),
            ),
          ),
          SizedBox(height: 40.0),
          // SizedBox(height: 40.0),

          Text('Just getting started?'),
          SizedBox(
            height: 5.0,
          ),

          GestureDetector(
            onTap: () {
              print('Sign Up');
              Navigator.popAndPushNamed(context, '/sign-up');
            },
            child: Text(
              'Register',
              style: TextStyle(color: Color(0xff377DFF)),
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  generateFormField(String hint, saveFunc, {isPassword: false, isEmail: true}) {
    return TextFormField(
      //* To get the Borders around field
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black38)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black38)),
        hintText: hint,
        // contentPadding: EdgeInsets.only(top:0.5),
      ),
      obscureText: isPassword ? true : false,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      onSaved: saveFunc,
    );
  }
}
