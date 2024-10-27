import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';

import '../network/shared_preferenes.dart';

Future<dynamic> getLoggedInUser() async {
  final user = await TokenStorage.getUser();
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



// Future<bool> isAdmin() async {
//   final isAdmin = await isUserAdmin();

//   return isAdmin;
// }
