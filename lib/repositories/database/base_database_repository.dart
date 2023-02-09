import '../../model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Future<void> updateUserPictures(User user, String imageName);
  Future<void> updateUser(User user);
  Future<String> createUser(User user);
}
