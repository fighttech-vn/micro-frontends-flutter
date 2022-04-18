// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../platforms/mobile_io.dart'
    if (dart.library.html) '../platforms/web_io.dart'
    if (dart.library.io) '../platforms/mobile_io.dart' show getFile;
import 'skeleton_widget.dart';

const kPackage = 'design_system';

class ImageWidget extends StatelessWidget {
  final String source;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool usePlaceHolder;
  final Color? color;
  final double? borderRadius;

  const ImageWidget(
    this.source, {
    Key? key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.usePlaceHolder = true,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  const ImageWidget.avatar(
    this.source, {
    Key? key,
    this.fit = BoxFit.cover,
    this.width = 40,
    this.height = 40,
    this.usePlaceHolder = true,
    this.color,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (source.isEmpty) {
      body = const Placeholder();
    } else if (source.contains('.svg')) {
      body = SvgPicture.asset(
        source,
        fit: fit,
        color: color,
        width: width,
        height: height,
        package: kPackage,
      );
    } else if (source.contains('http')) {
      // return Image.network(
      body = ExtendedImage.network(
        source,
        cache: true,
        fit: fit,
        loadStateChanged: loadStateChanged,
      );
    } else if (source.startsWith('/') ||
        source.startsWith('file://') ||
        source.substring(1).startsWith(':\\')) {
      body = ExtendedImage.file(
        getFile(source),
        fit: fit,
        loadStateChanged: loadStateChanged,
      );
    } else if (source.contains('.json')) {
      return Lottie.asset(
        source,
        package: kPackage,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      body = Image.asset(
        source,
        fit: fit,
        width: width,
        height: height,
        package: kPackage,
      );
    }
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: body,
      );
    }

    return body;
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    Widget widget;
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        widget = usePlaceHolder ? const SizedBox() : const Skeleton();
        break;
      case LoadState.completed:
        widget = ExtendedRawImage(
          image: state.extendedImageInfo?.image,
          width: width,
          height: height,
          fit: fit,
        );
        break;
      case LoadState.failed:
        widget = Container(
          width: width,
          height: height,
          color: Colors.grey,
        );
        break;
    }
    return widget;
  }
}
