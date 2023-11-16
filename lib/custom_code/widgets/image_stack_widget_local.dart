// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_stack/image_stack.dart';

class ImageStackWidgetLocal extends StatefulWidget {
  const ImageStackWidgetLocal({
    Key? key,
    this.width,
    this.height,
    this.imagesList,
    this.imageRadius,
    this.imageCount,
    this.imageBorderWidth,
    this.imageBorderColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? imagesList;
  final double? imageRadius;
  final int? imageCount;
  final double? imageBorderWidth;
  final Color? imageBorderColor;

  @override
  _ImageStackWidgetLocalState createState() => _ImageStackWidgetLocalState();
}

class _ImageStackWidgetLocalState extends State<ImageStackWidgetLocal> {
  @override
  Widget build(BuildContext context) {
    final imagesList = widget.imagesList ?? [];
    final imageRadius = widget.imageRadius ?? 80;
    final imageCount = widget.imageCount ?? 3;
    final imageBorderColor = widget.imageBorderColor ?? Colors.transparent;
    final imageBorderWidth = widget.imageBorderWidth ?? 0;

    return Center(
      // Обернуть ImageStack в Center
      child: ImageStack(
          imageList: imagesList,
          totalCount: imagesList.length,
          imageRadius: imageRadius,
          imageCount: imageCount,
          imageBorderColor: imageBorderColor,
          imageBorderWidth: imageBorderWidth),
    );
  }
}
