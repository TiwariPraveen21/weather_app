import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final double xdirection;
  final double yDirection;
  final double height;
  final double width;
  final BoxShape shape;
  final Color color;
  const HomeBackground({
    super.key, 
    required this.xdirection, 
    required this.yDirection, 
    required this.height, 
    required this.width, 
    required this.shape, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  AlignmentDirectional(xdirection, yDirection),
      child: Container(
        height: height,
        width: width,
        decoration:BoxDecoration(
          shape:shape,
          color: color,
        ),
      ),
    );
  }
}