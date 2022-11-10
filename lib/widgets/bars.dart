import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Animated Progress Bar Widget

class Bar extends StatelessWidget {
  final int position;
  final int currentIndex;

  const Bar({
    Key? key,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return _buildContainer(
              double.infinity,
              // constraints.maxWidth,
              position < currentIndex ? Colors.white : Colors.grey.shade400,
            );
          },
        ),
      ),
    );
  }
}

Container _buildContainer(double width, Color color) {
  return Container(
    height: 5.0,
    width: width,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: Colors.black26,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(3.0),
    ),
  );
}
