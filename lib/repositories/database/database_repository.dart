import 'package:Foggle/repositories/database/base_database_repository.dart';
import 'package:Foggle/repositories/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(User user, String imageName) async {
    // TODO: implement updateUserPictures
    String downloadUrl =
        await StorageRepository().getDownloadURL(user, imageName);

    return _firebaseFirestore.collection('users').doc(user.id).update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl])
    });
  }

  @override
  Future<String> createUser(User user) async {
    String documentId = await _firebaseFirestore
        .collection('users')
        .add(user.toMap())
        .then((value) {
      print('user added, ID: ${value.id}');
      return value.id;
    });
    return documentId;
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
