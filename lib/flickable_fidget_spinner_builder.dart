import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlickableFidgetSpinner extends StatefulWidget {

  FlickableFidgetSpinner({this.url});

  final String url;

  @override
  FlickableFidgetSpinnerState createState() => new FlickableFidgetSpinnerState();
}

class FlickableFidgetSpinnerState extends State<FlickableFidgetSpinner> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  int spins = 0;
  int speed = 500;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = new CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed && spins > 0) {
        if (speed >= 150)
          speed -= 50;
        _controller.duration = new Duration(milliseconds: speed);
        _controller.forward(from: _controller.value == null ? 0.0 : 1 - _controller.value);
        if (spins > 0)
          spins--;
      } else if (status == AnimationStatus.completed && spins <= 0) {
        speed = 500;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new GestureDetector(
        onHorizontalDragEnd: (DragEndDetails det) {
          if (det.velocity.pixelsPerSecond.dx <= 0.0 && !_controller.isAnimating) {
            print("true");
            _controller.duration = new Duration(milliseconds: speed);
            _controller.forward(from: _controller.value == null ? 0.0 : 1 - _controller.value);
            if (spins > 0) {
              spins--;
            }
          } else if (det.velocity.pixelsPerSecond.dx <= 0.0 && _controller.isAnimating) {
            spins++;
          }
        },
        onLongPress: () {
          _controller.stop();
          spins = 0;
          speed = 500;
          print("resetting");
        },
        child: new AnimatedBuilder(
          animation: _animation,
          child: new Image.network(widget.url),
          builder: (BuildContext context, Widget child) {
            return new Transform.rotate(
              angle: _controller.value * 2.0 * math.PI,
              child: child,
            );
          },
        ),
      )
    );
  }
}