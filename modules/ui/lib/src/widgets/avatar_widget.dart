import 'package:flutter/material.dart';

import 'image_widget.dart';

class AvatarWidget extends StatelessWidget {
  final String avatar;
  final double size;
  final bool isVerified;
  final double borderRadius;
  const AvatarWidget(this.avatar,
      {Key? key,
      this.size = 40.0,
      this.borderRadius = 10.0,
      this.isVerified = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ImageWidget(
        avatar,
        width: size,
        height: size,
        fit: BoxFit.cover,
        usePlaceHolder: false,
      ),
    );

    if (isVerified) {
      return Stack(
        children: [
          body,
          const Positioned(
            bottom: 0,
            right: 0,
            child: ImageWidget('assets/icons/stick.svg'),
          ),
        ],
      );
    }
    return body;
  }
}
