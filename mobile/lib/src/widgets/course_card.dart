import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final coursetitle, coursedescription;

  CourseCard(this.coursetitle, this.coursedescription);

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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.coursetitle,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0),
                            width: 210,
                            child: Text(
                              this.coursedescription,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.timer),
                            //TODO: Implement start session screen
                            onPressed: () => print("Start study session"),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            // TODO: Wire up remove course from user call
                            onPressed: () => print('Remove Course'),
                          ),
                        ],
                      )
                    ])),
          )),
    );
  }
}
