import 'package:flutter/material.dart';
import '../widgets/recommendation_card.dart';

class Recommendations extends StatefulWidget {
  Recommendations({Key key}) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recommendations"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // TODO: Logout the user
                  Navigator.popAndPushNamed(context, '/sign-in');
                }),
            SizedBox(width: 20),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.0),
                Text(
                  "Articles For You",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                    wordSpacing: 5.0,
                  ),
                ),
                SizedBox(width: 5.0),
                SizedBox(height: 15.0),
                //! Card for Articles
                buildArticleList(),
              ],
            ),
          ),
        ));
  }

  buildArticleList() {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) => listItem(context, index),
      separatorBuilder: (context, index) => SizedBox(height: 5),
    );
  }
}

Widget listItem(BuildContext context, int index) {
  return Container(
    // TODO: Change this to article card
    child: RecommendationCard(articles[index]['title'], false),
  );
}

List<Map<String, String>> articles = [
  {
    'title': 'Rational Agents for Artificial Intelligence – Hacker Noon',
  },
  {
    'title':
        'MIT 6.S094: Deep Learning for Self-Driving Cars 2018 Lecture 3 Notes: Deep Reinforcement Learning'
  },
  {'title': 'Reinforcement Learning – NECTEC – Medium'},
  {
    'title':
        'Machine Learning for Humans, Part 4: Neural Networks & Deep Learning'
  },
  {'title': 'Nathan.ai newsletter Issue #21 — Part 2/2 – Hacker Noon'},
];
