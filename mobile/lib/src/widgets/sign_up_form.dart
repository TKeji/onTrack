import 'package:flutter/material.dart';
import '../services/auth.dart' show registerUser;
import '../models/user.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          //* Full name
          generateFormField('Enter Your First name', (val) => _firstname = val),
          SizedBox(height: 18.0),
          generateFormField('Enter Your Last name', (val) => _lastname = val),
          SizedBox(height: 18.0),
          //* Email
          generateFormField('Enter Your Email', (val) => _email = val,
              isEmail: true),
          SizedBox(height: 18.0),
          generateFormField('Enter Your Password', (val) => _password = val,
              isPassword: true),
          SizedBox(height: 18.0),
          generateFormField(
              'Confirm Your Password', (val) => _confirmPassword = val,
              isPassword: true),
          SizedBox(height: 18.0),

          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.maxFinite, height: 50),
            child: ElevatedButton(
              onPressed: () async {
                // Save the states of each input
                _formKey.currentState.save();
                User user = User(_firstname, _lastname, _email, _password);
                if (await registerUser(user)) {
                  return Navigator.pushReplacementNamed(context, '/my-courses');
                }
                print('Register User Failded');
              },
              child: Text('Sign Up'),
            ),
          ),
          SizedBox(height: 40.0),

          Text('Already have an account?'),
          SizedBox(height: 8.0),

          GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, '/sign-in');
            },
            child: Text(
              'Sign in',
              style: TextStyle(color: Color(0xff377DFF)),
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget generateFormField(String hint, saveFunc,
      {isPassword: false, isEmail: true}) {
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
      ),
      obscureText: isPassword ? true : false,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      onSaved: saveFunc,
    );
  }
}
