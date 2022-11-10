import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../data/models/user.dart';
import 'user_layer.dart';

class UserCard extends StatefulWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  late double imageWidth;
  late double dx;

  void onTapDown(details) {
    imageWidth = MediaQuery.of(context).size.width;
    dx = details.globalPosition.dx;
  }

  void onTap() {
    if (dx < imageWidth / 2) {
      //Previous Photo
      if (_pageController.page! > 0) {
        _pageController.previousPage(
            duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    } else {
      //Next Photo
      if (_pageController.page! < widget.user.userMedia.length - 1) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          //get the very first tap event
          onTapDown: (details) => onTapDown(details),
          //validate tap event
          onTap: () => onTap(),
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.user.userMedia.length,
            itemBuilder: (context, index) {
              final photoUrl = widget.user.userMedia[_currentIndex].url;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(photoUrl),
                  ),
                  borderRadius: kCardBorderRadius,
                ),
                // child: Image.network(
                //   photoUrl,
                //   fit: BoxFit.cover,
                // ),
              );
              return const Center(child: CircularProgressIndicator());
              // return const StoryProgressIndicator();
            },
          ),
        ),
        UserLayer(user: widget.user, currentIndex: _currentIndex),
      ],
    );
  }
}
