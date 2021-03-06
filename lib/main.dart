import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var _start = 0;
  Timer _timer;

  startTimer(int i) {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _start = i;
    });
    _timer =Timer.periodic(Duration(milliseconds: 700), (timer) =>
      setState(() {
        _start<1? _timer.cancel() : _start -= 1;
      })
    );
  }

  pauseTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  continueTimer() {
    startTimer(_start);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Timer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$_start",
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () => startTimer(100),
                    icon: Icon(Icons.replay),
                    label: Text("Restart"),
                  ),
                  FlatButton.icon(
                    onPressed: pauseTimer,
                    icon: Icon(Icons.pause),
                    label: Text("Pause"),
                  ),
                  FlatButton.icon(
                    onPressed: continueTimer,
                    icon: Icon(Icons.play_arrow),
                    label: Text("Continue"),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}
