import 'package:flutter/material.dart';
import 'package:mobile/src/screens/profile.dart';
import './screens/sign_up.dart';
import './screens/sign_in.dart';
import './screens/my_courses.dart';
import './screens/session_screen.dart';
import './screens/my_articles.dart';
import './screens/recommendations.dart';

var mainbackgroundcolor = 0xffA5A1A1;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/sign-up': (context) => SignUp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/sign-in': (context) => SignIn(),
        '/profile': (context) => Profile(),
        '/my-courses': (context) => MyCourses(),
        '/session': (context) => Session(),
        '/my-articles': (context) => MyArticles(),
        '/recommendations': (context) => Recommendations(),
      },
    );
  }
}
