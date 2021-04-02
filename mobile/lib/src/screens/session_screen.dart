import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SessionArguments {
  final String course_code;
  final String course_title;

  SessionArguments(this.course_code, this.course_title);
}

class Session extends StatelessWidget {
  final String course_name = 'INSY404';
  final double percent_val = 1.0;
  final String percent_text = '25:00';

  @override
  Widget build(BuildContext context) {
    final SessionArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Study Session"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 45.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  args.course_code,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 40.0),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 120.0, height: 40),
                  child: ElevatedButton(
                    child: Text('Articles'),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/my-articles'),
                  ),
                )
              ]),
              SizedBox(height: 50.0),
              // ! Pomodoro Timer
              CircularPercentIndicator(
                radius: 290.0,
                lineWidth: 7.0,
                percent: percent_val,
                reverse: true,
                center: new Text(
                  percent_text,
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 60.0,
                      fontWeight: FontWeight.w300),
                ),
                progressColor: Colors.blue[600],
              ),
              SizedBox(
                height: 50.0,
              ),
              // ! Start & Stop Session Buttons
              ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 250.0, height: 50),
                  child: ElevatedButton(
                      onPressed: () => print('Start Session'),
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('Start Session'),
                        ],
                      ))),
              SizedBox(height: 30.0),
              ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 250.0, height: 50),
                  child: ElevatedButton(
                      onPressed: null,
                      child: Row(
                        children: [
                          Icon(Icons.stop),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('Stop Session'),
                        ],
                      )))
            ],
          ),
        ));
  }
}
