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
    child: RecommendationCard(articles[index]['title'], index % 2 == 1),
  );
}

List<Map<String, String>> articles = [
  {
    'title': 'Hands-on Graph Neural Networks with PyTorch & PyTorch Geometric',
  },
  {'title': 'How to Use ggplot2 in Python'},
  {'title': 'Databricks: How to Save Files in CSV on Your Local Computer'},
];
