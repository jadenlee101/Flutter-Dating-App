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
  Future<void> uploadImage(XFile image) async {
    try {
      print('2');
      //await storage.ref('user_1${image.name}').putFile(File(image.path));
      await storage
          .ref()
          .child('user_1/${image.name}')
          .putFile(File(image.path))
          .then((p0) => DatabaseRepository().updateUserPictures(image.name));
      print('${image.path} sucess here image');
    } catch (err) {
      print(err);
      // print('${user.id} error here');
    }
  }

  @override
  Future<String> getDownloadURL(String imageName) async {
    // TODO: implement getDownloadURL
    String downloadURL =
        await storage.ref('user_1/$imageName').getDownloadURL();
    return downloadURL;
  }
}
