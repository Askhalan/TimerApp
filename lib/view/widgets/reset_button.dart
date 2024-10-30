// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    required this.stopwatch,
    this.color = Colors.grey,
  });

  final Stopwatch stopwatch;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        stopwatch.reset();
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
          padding: EdgeInsets.all(30),
          child: Text('Reset')),
    );
  }
}
