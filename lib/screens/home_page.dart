import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:tinder_app/widgets/custom_progress_indicator.dart';
import '../constants/styles.dart';
import '../data/models/user.dart';
import '../data/repos/user_repo.dart';
import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserRepo _userRepo = UserRepo();

  final double kHorizontalPadding = 25;
  final double kVerticalPadding = 30;

  late Future<List<User>> _futureValue;

  Future<List<User>> _getUsers() async {
    return await _userRepo.getUsers();
  }

  @override
  void initState() {
    super.initState();
    _futureValue = _getUsers();
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
            fontWeight: FontWeight.w800,
            letterSpacing: 1.6,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<User>>(
        future: _futureValue,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = SwipableStack(builder: (context, properties) {
              Widget child;
              final user;
              if (properties.index < snapshot.data!.length) {
                user = snapshot.data![properties.index];
                child = UserCard(user: user!);
              } else {
                user = null;
                child = const SizedBox.shrink();
              }
              return properties.index < snapshot.data!.length
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kHorizontalPadding,
                          vertical: kVerticalPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: kCardBorderRadius,
                        ),
                        child: child,
                      ),
                    )
                  : const SizedBox.shrink();
            });
          } else if (snapshot.hasError) {
            child = const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 45,
              ),
            );
          } else {
            child = const CustomProgressIndicator();
          }
          return child;
        },
      ),
    );
  }
}
