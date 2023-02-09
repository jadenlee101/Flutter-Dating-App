import '../../model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();
  Future<void> updateUserPictures(String imageName);
  Future<void> updateUser(User user);
  Future<void> createUser(User user);
}
