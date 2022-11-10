import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../constants/styles.dart';
import '../data/repos/user_repo.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late final SwipableStackController _controller;
  final double kHorizontalPadding = 25;
  final double kVerticalPadding = 30;

  List<Widget> containers = [
    Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: kCardBorderRadius,
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: kCardBorderRadius,
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: kCardBorderRadius,
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: kCardBorderRadius,
      ),
    ),
  ];

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'T I N D E R',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SwipableStack(
          controller: _controller,
          builder: (context, properties) {
            // print(_controller.currentIndex);
            Widget child = properties.index < containers.length
                ? containers[properties.index]
                : const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: kCardBorderRadius,
                ),
                child: child,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }
}
