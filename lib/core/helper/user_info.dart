import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/features/auth/data/models/user_model.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';

import '../network/shared_preferenes.dart';

Future<UserModel?> getLoggedInUser() async {
  final user = await TokenStorage.getUser();
  print(" fdf: ${user?.role}");
  if (user != null) {
    return user;
  }

  return null;
}

Future<dynamic> getUserInfo(BuildContext context) async {
  final user = await TokenStorage.getUser();
  if (user != null) {
    return context.read<AuthCubit>().userInfo;
  }

  return null;
}

Future<bool> isUserAdmin() async {
  final user = await TokenStorage.getUser();

  return user?.role == 'admin' ? true : false;
}

Future<bool> isUserStaff() async {
  final user = await TokenStorage.getUser();

  return user?.role == 'staff' ? true : false;
}

Future<String> isUserHaveGroup() async {
  final user = await TokenStorage.getUser();
  print('ussssssssss: ${user?.groupId}');
  if (user != null && user.groupId.isNotEmpty) {
    return user.groupId;
  }
  return '';
}




// Future<bool> isAdmin() async {
//   final isAdmin = await isUserAdmin();

//   return isAdmin;
// }
