import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  final MaterialColor color;
  const ColorPage({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
      ),
    );
  }
}
