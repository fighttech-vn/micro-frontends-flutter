import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class JumpingDotAnimation extends StatelessWidget {
  final Color? color;

  const JumpingDotAnimation({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JumpingDots(
      color: color ?? Theme.of(context).primaryColor,
      radius: 6,
      numberOfDots: 3,
    );
  }
}
