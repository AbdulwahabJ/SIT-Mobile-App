import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';

import '../../../core/helper/language.dart';
import '../data/services/staff_service.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit(this.staffService) : super(StaffInitial());
  final StaffService staffService;
  List<Map<String, dynamic>>? staffData;
  Future<void> addmember(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String languages,
      dynamic image}) async {
    emit(StaffLoading());

    try {
      final staffUser = await staffService.addStaff(
          name, email, password, phoneNumber, languages, image);
      if (staffUser) {
        emit(StaffSuccess(isArabic()
            ? '${AppTexts.staffAddSuccess_ar} '
            : '${AppTexts.staffAddSuccess} '));
      }
    } catch (e) {
      emit(StaffFailure(isArabic()
          ? '${AppTexts.staffAddFailure_ar} ${e.toString()}'
          : '${AppTexts.staffAddFailure} ${e.toString()}'));
    }
  }

  Future<void> getStaff() async {
    emit(StaffLoading());
    try {
      final staffData = await staffService.getStaff();
      print('cubit staff:$staffData');
      emit(StaffLodedd(staffData));
    } catch (e) {
      print('eeeee:$e');

      emit(StaffFailure(e.toString()));
    }
  }
}
