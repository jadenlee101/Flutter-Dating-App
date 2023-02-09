import 'package:image_picker/image_picker.dart';

import '../../model/model.dart';

abstract class BaseStorageRepository {
  //@override
  Future<void> uploadImage(XFile image);
  //Future<void> uploadImage(User user, XFile image);
  //Future<String> getDownloadURL(String imageName);
  Future<String> getDownloadURL(String imageName);
  //Future<void> updateUser(User user);
}
