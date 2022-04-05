import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  const LogoWidget({
    Key? key,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(
      size: size,
    );
  }
}
