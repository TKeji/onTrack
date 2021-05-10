import 'dart:async';

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
              PomodoroTimer(),
            ],
          ),
        ));
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  double percent_val = 1.0;
  String percent_text = '25:00';
  int original_time;
  static int time_min = 25;
  static int seconds_left = 0;
  int time_sec = time_min * 60;
  bool timer_running = false;

  Timer timer;

  _startTimer() {
    print('Starting timer');
    setState(() {
      timer_running = true;
      original_time = time_min;
    });
    // time_min = 2;
    int cur_time = time_min * 60; // In seconds
    double secondPercent = 1 / cur_time; // How many seconds are 1% of our timer
    seconds_left = 0;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (cur_time > 0) {
          if (cur_time % 60 == 0) {
            // one min gone
            time_min--;
          }
          cur_time--;
          seconds_left = cur_time - (time_min * 60);
          print('Current time: ${time_min}: $seconds_left');

          // REduce percentage by appropriate
          if (percent_val > 0) {
            print('Changed percentage value');
            percent_val -= secondPercent;
          } else {
            percent_val = 0;
          }
        } else {
          // Reset timer
          print('Stopping Timer');
          percent_val = 1;
          time_min = 25;
          timer.cancel();
        }
      });
    });
  }

  _stopTimer() {
    // Stop the timer
    print('Cancelling Timer');
    setState(() {
      percent_val = 1.0;
      time_min = original_time;
      seconds_left = 0;
      print(original_time);
      timer.cancel();
      timer_running = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 250.0,
          lineWidth: 7.0,
          percent: percent_val,
          reverse: true,
          center: new Text(
            '$time_min:${seconds_left.toString().padLeft(2, "0")}',
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
            constraints: BoxConstraints.tightFor(width: 250.0, height: 50),
            child: ElevatedButton(
                onPressed: timer_running ? null : _startTimer,
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
            constraints: BoxConstraints.tightFor(width: 250.0, height: 50),
            child: ElevatedButton(
                onPressed: timer_running ? _stopTimer : null,
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
    );
  }
}
