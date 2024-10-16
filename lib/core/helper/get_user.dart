import '../network/shared_preferenes.dart';

Future<dynamic> getLoggedInUser() async {
  final user = await TokenStorage.getUser();
  if (user != null) {
    return user;
  }

  final staff = await TokenStorage.getStaff();
  if (staff != null) {
    return staff;
  }

  return null;
}
