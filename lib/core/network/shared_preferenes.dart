import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/user_model.dart';

class TokenStorage {
  static const String _tokenKey = 'user_token';

  static Future<void> saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', user.name);
      await prefs.setString('email', user.email);
      await prefs.setString('phone_number', user.phoneNumber);
      await prefs.setString('group_id', user.groupId.toString());
      await prefs.setString(_tokenKey, user.token);
      await prefs.setString('role', user.role);
      if (user.role == 'staff') {
        await prefs.setString('languages', user.languages.toString());
        await prefs.setString('image', user.image);
      }
    } catch (e) {
      // ignore: avoid_print
      print('خطأ في حفظ المستخدم في الشيرد برفرنس:,$e');
    }
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final phoneNumber = prefs.getString('phone_number');
    final groupId = prefs.getString('group_id');
    final role = prefs.getString('role');
    final languages = prefs.getString('languages');
    final image = prefs.getString('image');
    final token = prefs.getString(_tokenKey);
    if (name != null && email != null && phoneNumber != null) {
      return UserModel(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        role: role.toString(),
        groupId: groupId,
        languages: languages,
        image: image,
        token: token.toString(),
      );
    }

    return null;
  }

  static Future<void> updateGroupId(String newGroupId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('group_id', newGroupId);
    } catch (e) {
      print('خطأ في تحديث group_id في الشيرد برفرنس: $e');
    }
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('phone_number');
    await prefs.remove('group_id');
    await prefs.remove('languages');
    await prefs.remove('image');
  }

//

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  //onboarding
  static Future<bool> checkFirstTimeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('onBoarding')) {
      await prefs.setBool('onBoarding', false);
      return false;
    }

    return prefs.getBool('onBoarding') ?? false;
  }

  static Future<void> setOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', true);
  }

  static Future<void> reSetOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', false);
  }
}
