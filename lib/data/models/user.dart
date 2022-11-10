import 'user_media.dart';

///USER MODEL

enum Gender {
  male,
  female,
  gay,
  lesbian,
  bisexual,
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String profileImage;
  final int age;
  final Gender gender;
  final String address;
  final List<UserMedia> userMedia;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.age,
    required this.gender,
    required this.address,
    required this.userMedia,
  });

  static const User empty = User(
    id: 0,
    name: "John Wick",
    username: "johnwick",
    email: "johnwick@gmail.com",
    profileImage:
        "https://i4.hurimg.com/i/hurriyet/75/750x422/600965400f25443f0406f3ab.jpg",
    age: 22,
    gender: Gender.male,
    address: 'New York',
    userMedia: [],
  );

  @override
  User copyWith({required User user}) => User(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        profileImage: user.profileImage,
        age: user.age,
        gender: user.gender,
        address: user.address,
        userMedia: user.userMedia,
      );

  ///Deprecated
  // User copyWith({
  //   required int id,
  //   required String name,
  //   required String username,
  //   required String email,
  //   required String profileImage,
  //   required int age,
  //   required Gender gender,
  //   required String address,
  //   required List<UserMedia> userMedia,
  // }) {
  //   return User(
  //     id: id,
  //     name: name,
  //     username: username,
  //     email: email,
  //     profileImage: profileImage,
  //     age: age,
  //     gender: gender,
  //     address: address,
  //     userMedia: userMedia,
  //   );
  // }

  @override
  String toString() =>
      'User: {id: $id, name: $name, username: $username, email: $email, profileImage: $profileImage, age: $age, gender: $gender, address: $address, userMedia: $userMedia}';
}
