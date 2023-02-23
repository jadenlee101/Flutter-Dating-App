import '../../model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Future<void> updateUserPictures(User user, String imageName);
  Future<void> updateUser(User user);
  Future<void> createUser(User user);
}
