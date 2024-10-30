// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Stopwatch stopwatch;
  late Timer t;
  bool isRunning = false;

//-----Start-Stop Function

  onStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      isRunning = false;
    } else {
      stopwatch.start();
      isRunning = true;
    }
  }

//------
  String formatedValue() {
    var ms = stopwatch.elapsed.inMilliseconds;
    String milliSeconds = ((ms % 1000) % 100).toString().padLeft(2, '0');
    String seconds = ((ms ~/ 1000) % 60).toString().padLeft(2, '0');
    String minutes = ((ms ~/ 1000) ~/ 60).toString().padLeft(2, '0');
    return "$minutes:$seconds:$milliSeconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                formatedValue(),
                style: TextStyle(fontSize: 60),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      stopwatch.reset();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle),
                        padding: EdgeInsets.all(30),
                        child: Text('Reset')),
                  ),
                  InkWell(
                    onTap: () {
                      onStartStop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: isRunning ? Colors.redAccent : Colors.green,
                            shape: BoxShape.circle),
                        padding: EdgeInsets.all(30),
                        child: isRunning ? Text('Stop') : Text('Start')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
