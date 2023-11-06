///******************************************************************************
/// Copyright (C) 2021 Savvient Technologies Pty Ltd. All Rights Reserved.
///
/// This file is part of the Gymismo Project.
///
/// Any code files that form part of the Gymismo Project cannot be copied and/or distributed without the express written permission of Savvient Technologies Pty Ltd.
///
/// Note: Copyright will be assigned as instructed by the Client that commissioned the Gymismo Project upon payment in full of all amounts due. This file is developed by Savvient Technologies Pty Ltd as part of code standards trial/ context_menus by the Client
///******************************************************************************/

import 'dart:math';
import 'package:flutter/material.dart';

class ColorLoader3 extends StatefulWidget {
  const ColorLoader3({super.key, this.radius = 30.0, this.dotRadius = 3.0});

  final double radius;
  final double dotRadius;

  @override
  State<ColorLoader3> createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3> with SingleTickerProviderStateMixin {
  late Animation<double> _animationRotation;
  late Animation<double> _animationRadiusIn;
  late Animation<double> _animationRadiusOut;
  late AnimationController _controller;

  double _radius = 0;
  double _dotRadius = 0;

  @override
  void initState() {
    super.initState();

    _radius = widget.radius;
    _dotRadius = widget.dotRadius;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _animationRotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    );

    _animationRadiusIn = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1, curve: Curves.elasticIn),
      ),
    );

    _animationRadiusOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25, curve: Curves.elasticOut),
      ),
    );

    _controller
      ..addListener(() {
        setState(() {
          if (_controller.value >= 0.75 && _controller.value <= 1.0) {
            _radius = widget.radius * _animationRadiusIn.value;
          } else if (_controller.value >= 0.0 && _controller.value <= 0.25) {
            _radius = widget.radius * _animationRadiusOut.value;
          }
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      })
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: RotationTransition(
        turns: _animationRotation,
        child: Center(
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset.zero,
                child: _Dot(
                  radius: _radius,
                  color: Colors.black12,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(0.0),
                  _radius * sin(0.0),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.amber,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(pi / 4),
                  _radius * sin(pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(2 * pi / 4),
                  _radius * sin(2 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.pinkAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(3 * pi / 4),
                  _radius * sin(3 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(4 * pi / 4),
                  _radius * sin(4 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.yellow,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(5 * pi / 4),
                  _radius * sin(5 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.lightGreen,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(6 * pi / 4),
                  _radius * sin(6 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.orangeAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(
                  _radius * cos(7 * pi / 4),
                  _radius * sin(7 * pi / 4),
                ),
                child: _Dot(
                  radius: _dotRadius,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.radius, required this.color});

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
