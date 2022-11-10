import '../../constants/sample_images.dart' as image_samples;
import '../models/user_media.dart';

///User Media Repo

class UserMediaRepo {
  UserMediaRepo();

  ///Get images data: Default: 24 (max: 30)
  List<UserMedia> getUserMedias({int amount = 24}) {
    List<UserMedia> userMediaList = [];
    List<String> images = image_samples.photoList;

    for (int i = 0; i < images.length; i++) {
      UserMedia userMedia = UserMedia(
        id: i,
        url: images[i],
      );
      userMediaList.add(userMedia);
    }

    return userMediaList.sublist(0, amount);
  }
}
