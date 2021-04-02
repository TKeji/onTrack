import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String title;
  final bool isSelected;

  RecommendationCard(this.title, this.isSelected);

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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        width: 250,
                        child: Text(
                          this.title,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: isSelected ? Icon(Icons.done) : Icon(Icons.add),
                        onPressed: () {
                          print('Add to list of articles for a user/session');
                        },
                        iconSize: 30.0,
                      )
                    ])),
          )),
    );
  }
}
