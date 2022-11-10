import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinder_app/constants/styles.dart';
import 'package:tinder_app/screens/home_page.dart';
import 'package:tinder_app/screens/color_page.dart';
import 'package:tinder_app/screens/test_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TestPage(),
    ColorPage(color: Colors.green),
    ColorPage(color: Colors.blue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // final Widget homeSvg = SvgPicture.asset(
  //   "images/icons/home_outline.svg",
  //   color: Colors.black87,
  //   semanticsLabel: 'Home Outline',
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 60,
        child: BottomNavigationBar(
          elevation: 0,
          selectedIconTheme: kBottomNavbarSelectedIconTheme,
          unselectedIconTheme: kBottomNavbarUnselectedIconTheme,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24,
              ),
              // SizedBox(
              //   height: 24,
              //   width: 24,
              //   child: homeSvg,
              // ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mode_comment,
                size: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                size: 24,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
