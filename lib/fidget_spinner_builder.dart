import 'dart:math' as math;

import 'package:flutter/material.dart';

class FidgetSpinner extends StatefulWidget {

  FidgetSpinner({this.url});

  String url;

  @override
  FidgetSpinnerState createState() => new FidgetSpinnerState();
}

class FidgetSpinnerState extends State<FidgetSpinner> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: _controller,
        child: new Image.network(widget.url),
        builder: (BuildContext context, Widget child) {
          return new Transform.rotate(
            angle: _controller.value * 2.0 * math.PI,
            child: child,
          );
        },
      ),
    );
  }
}