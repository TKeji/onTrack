import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final int rating;

  ArticleCard(this.title, {this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // TODO: Navigate to Course Details page
      onTap: () => print('Move to Course Details Page'),
      child: Card(
          elevation: 1,
          color: Colors.indigo[50],
          child: Container(
            height: 90,
            width: double.maxFinite,
            padding: EdgeInsets.all(10),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        width: double.maxFinite,
                        height: 50.0,
                        child: Text(
                          this.title,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemSize: 20.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // TODO: Send rating to backend
                          print("Update Rating");
                        },
                      ),
                    ])),
          )),
    );
  }
}
