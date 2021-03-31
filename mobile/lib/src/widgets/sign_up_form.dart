import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../endpoints.dart';
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

          // //! Button Here
          // Row(
          //   children: [
          //     Expanded(
          //       child: ElevatedButton(
          //           onPressed: (){
          //             print('sign up button was pressed');
          //             print(_email);
          //             _formKey.currentState.save();
          //             NewUser user = NewUser(_firstname, _lastname, _email, _password);
          //             registerUser(user);
          //           },
          //           child: Text('Sign Up'),
          //         ),
          //     ),

          //   ],
          // ),
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

                // TODO: Make sure user is created
                Navigator.pushReplacementNamed(context, '/my-courses');
              },
              child: Text('Sign Up'),
            ),
          ),
          SizedBox(height: 40.0),

          Text('Already have an account?'),
          SizedBox(
            height: 10.0,
          ),

          GestureDetector(
            onTap: () {
              print('Go to Sign in');
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
