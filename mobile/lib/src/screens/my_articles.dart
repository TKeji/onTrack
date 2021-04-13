import 'package:flutter/material.dart';
import '../widgets/article_card.dart';

class MyArticles extends StatefulWidget {
  MyArticles({Key key}) : super(key: key);

  @override
  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Articles"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 200.0, height: 55),
                      child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/recommendations'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Articles for you',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Icon(Icons.chevron_right, size: 40.0),
                            ],
                          )),
                    ),
                    SizedBox(width: 5.0),
                  ],
                ),
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
    child: ArticleCard(articles[index]['title']),
  );
}

List<Map<String, String>> articles = [
  {'title': 'Playing Connect 4 with Deep Q-Learning'},
  {'title': 'Teach your AI how to walk | Solving BipedalWalker | OpenAIGym'},
  {'title': 'An introduction to Deep Q-Learning: let’s play Doom'},
  {
    'title':
        'Reinforcement Learning Demystified: Markov Decision Processes (Part 1)'
  },
];
