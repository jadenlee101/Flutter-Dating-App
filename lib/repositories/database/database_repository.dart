import 'package:Foggle/repositories/database/base_database_repository.dart';
import 'package:Foggle/repositories/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('SdRboMtMHFc5BUZSdTF8')
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    // TODO: implement updateUserPictures
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);

    return _firebaseFirestore
        .collection('users')
        .doc('SdRboMtMHFc5BUZSdTF8')
        .update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl])
    });
  }

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc('SdRboMtMHFc5BUZSdTF8')
        .set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) async {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then(
          (value) => print('User document updated.'),
        );
  }
}
