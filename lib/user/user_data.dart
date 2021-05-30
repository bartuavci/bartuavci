import 'package:neo/shared/constant/values.dart';
import 'package:neo/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  List<UserModel> userList = [
    UserModel(
      name: 'M. Akbar',
      email: 'm.akbar@gmail.com',
      picture: BASE_USERS_URL + 'user_1.jpg',
      qrCode: 'user1.png',
      userName: '@Akbar6584',
    ),
    UserModel(
      name: 'Amira',
      email: 'amira@gmail.com',
      picture: BASE_USERS_URL + 'user_2.jpg',
      qrCode: 'user2.png',
      userName: '@amira',
    ),
  ];

  static saveUserId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
  }

  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id')!;
    return id;
  }

  Future<UserModel> currentUserInfo() async {
    int id = await getUserId();
    return userList[id];
  }
}
