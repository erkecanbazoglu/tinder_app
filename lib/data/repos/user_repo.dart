import 'package:tinder_app/data/repos/user_media_repo.dart';
import '../../constants/sample_users.dart' as user_samples;
import '../models/user.dart';
import 'dart:math' as math;

import '../models/user_media.dart';

///User Repo

class UserRepo {
  UserRepo();

  //UserMedia repo instance is initialized
  final UserMediaRepo _userMediaRepo = UserMediaRepo();

  //Getting Users: Default: 6 (max: 10)
  List<User> getUserList() {
    int amount = 6;
    List<User> userList = user_samples.userList;
    return userList.sublist(0, amount);
  }

  ///Distributing the User Medias to Users
  List<dynamic> distributeUserMedias(users, userMedias) {
    ///Final - User Story Contents
    List finalUserMedias = [];

    ///Temp - users of story contents
    List userMediasUsers = [];

    for (int i = 0; i < userMedias.length; i++) {
      ///Generates random number between 0-9
      int numberOfUser = users.length;
      int randomUser = math.Random().nextInt(numberOfUser);
      userMediasUsers.add(randomUser);
    }

    ///For every user check the matching story contents
    for (int i = 0; i < users.length; i++) {
      List<UserMedia> tempUserMedias = [];

      for (int k = 0; k < userMediasUsers.length; k++) {
        ///If user and story contents matching add
        if (i == userMediasUsers[k]) {
          tempUserMedias.add(userMedias[k]);
        }
      }

      finalUserMedias.add(tempUserMedias);
    }

    return finalUserMedias;
  }

  ///Prepare the final stories
  Future<List<User>> prepareFinalUsers(userMedias, usersList) async {
    List<User> users = [];

    for (int i = 0; i < usersList.length; i++) {
      ///No Story for the specified user
      if (userMedias[i].isEmpty) {
        print("user null");
        continue;
      }

      // User user = usersList[i].copyWith(usersList[i]);
      User user = User(
        id: usersList[i].id,
        name: usersList[i].name,
        username: usersList[i].username,
        email: usersList[i].email,
        profileImage: usersList[i].profileImage,
        age: usersList[i].age,
        gender: usersList[i].gender,
        address: usersList[i].address,
        userMedia: userMedias[i],
      );

      users.add(user);
    }

    ///Mixing the User order
    // users.shuffle();

    return users;
  }

  ///Get users data: Default: 6 (max: 6)
  Future<List<User>> getUsers() async {
    ///Getting the User Medias from User Media Repo
    List<UserMedia> finalUserMedias = _userMediaRepo.getUserMedias();

    List<User> userList = getUserList();

    ///Distributing User Medias randomly to Users
    List<dynamic> userMedias = distributeUserMedias(userList, finalUserMedias);

    ///Making ready the final users
    List<User> users = await prepareFinalUsers(userMedias, userList);

    ///Random wait between 500-999 milliseconds
    int random = math.Random().nextInt(500) + 500;
    await Future.delayed(Duration(milliseconds: random), () {});

    return users;
  }
}
