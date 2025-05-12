import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilmaame/model/login/authorisation_model.dart';
import 'package:tilmaame/model/login/login_response.dart';
import 'package:tilmaame/model/login/user_model.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 */
class LocalStorage {
  static late final SharedPreferences storeSharedPreferences;
  static Future init() async {
    storeSharedPreferences = await SharedPreferences.getInstance();
  }

  static LoginResponse loginResponse =
  LoginResponse(
      status: "",
      user: User(id: 0, name: '', slug: '', type: '', email: '', mobile: '', status: 0, createdAt: '', updatedAt: ''),
      authorisation: Authorisation(token: '', type: '')
  );
}
