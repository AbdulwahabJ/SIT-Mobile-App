import 'package:shared_preferences/shared_preferences.dart';
import 'package:sit_app/features/customer_app/data/models/staff_model.dart';

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
    } catch (e) {
      print('خطأ في حفظ المستخدم في الشيرد برفرنس');
    }
// توكن المستخدم العادي
// توكن المستخدم العادي
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final phoneNumber = prefs.getString('phone_number');
    final groupId = prefs.getString('group_id');
    final role = prefs.getString('role');
    final token = prefs.getString(_tokenKey);

    if (name != null && email != null && phoneNumber != null) {
      return UserModel(
        token: token.toString(),
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        groupId: groupId,
        role: role.toString(),
      );
    }

    return null;
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('phone_number');
    // await prefs.remove('group_id');
  }

//

  // تخزين بيانات الموظف
  static Future<void> saveStaff(StaffModel staff) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('staff_name', staff.name);
      await prefs.setString('staff_email', staff.email);
      await prefs.setString('staff_phone_number', staff.phoneNumber);
      await prefs.setString('staff_role', staff.role);
      await prefs.setString('languages', staff.languages);
      await prefs.setString('staff_imagePath', staff.image);
      await prefs.setString(_tokenKey, staff.token);
    } catch (e) {
      print('خطأ في حفظ الستااف في الشيرد برفرنس');
    }
    // توكن الموظف
  }

  // استرجاع بيانات الموظف
  static Future<StaffModel?> getStaff() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('staff_name');
    final email = prefs.getString('staff_email');
    final phoneNumber = prefs.getString('staff_phone_number');
    final role = prefs.getString('staff_role');
    final languages = prefs.getString('languages');
    final image = prefs.getString('imagePath');
    final token = prefs.getString(_tokenKey);

    if (name != null && email != null && phoneNumber != null && role != null) {
      return StaffModel(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          role: role,
          token: token,
          languages: languages,
          image: image);
    }

    return null;
  }

  static Future<void> deleteStaff() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('staff_name');
    await prefs.remove('staff_email');
    await prefs.remove('staff_phone_number');
    await prefs.remove('staff_role');
    await prefs.remove('languages');
    await prefs.remove('imagePath');

    await prefs.remove(_tokenKey);
  }

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
}
