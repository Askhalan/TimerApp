// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  PlayButton({super.key, required this.isRunning, required this.onTap});

  final bool isRunning;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: isRunning ? Colors.redAccent : Colors.green,
              shape: BoxShape.circle),
          padding: EdgeInsets.all(30),
          child: isRunning ? Text('Stop') : Text('Start')),
    );
  }
}
