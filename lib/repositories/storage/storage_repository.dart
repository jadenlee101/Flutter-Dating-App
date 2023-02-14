import 'dart:io';
import 'package:Foggle/repositories/database/database_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import '../../model/user_model.dart';
import 'base_storage_repository.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository {
  //final storage = FirebaseStorage.instance;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(User user, XFile image) async {
    try {
      print('2');
      //await storage.ref('user_1${image.name}').putFile(File(image.path));
      await storage
          .ref('${user.id}/${image.name}')
          .putFile(File(image.path))
          .then((p0) =>
              DatabaseRepository().updateUserPictures(user, image.name));
      print('${image.path} sucess here image');
    } catch (err) {
      print('Here is the error =  ${err}');
      // print('${user.id} error here');
    }
  }

  @override
  Future<String> getDownloadURL(User user, String imageName) async {
    // TODO: implement getDownloadURL
    String downloadURL =
        await storage.ref('${user.id}/$imageName').getDownloadURL();
    return downloadURL;
  }
}
