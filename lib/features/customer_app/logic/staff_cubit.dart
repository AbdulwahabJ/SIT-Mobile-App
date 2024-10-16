import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/features/customer_app/data/models/staff_model.dart';

import '../../../core/helper/language.dart';
import '../data/services/staff_service.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit(this.staffService) : super(StaffInitial());
  final StaffService staffService;

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
        emit(StaffAdded(isArabic()
            ? '${AppTexts.staffAddSuccess_ar} '
            : '${AppTexts.staffAddSuccess} '));
      }
    } catch (e) {
      emit(StaffFailure(isArabic()
          ? '${AppTexts.staffAddFailure_ar} ${e.toString()}'
          : '${AppTexts.staffAddFailure} ${e.toString()}'));
    }
  }
}
