import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/features/customer_app/data/services/group_service.dart';
import 'package:sit_app/features/customer_app/logic/GroupCubit/group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit(this.groupService) : super(GroupInitial());
  final GroupService groupService;
  //
  Future<void> addGroup(String name) async {
    //
    emit(GroupLoading());
    try {
      //
      final response = await groupService.addGroup(name);
      emit(GroupSuccess(response.data['message']));
      //
    } catch (e) {
      emit(GroupFailure(e.toString()));
    }
  }

  // Future<void> getStaff() async {
  //   emit(StaffLoading());
  //   try {
  //     final staffData = await staffService.getStaff();
  //     print('cubit staff:$staffData');
  //     emit(StaffLodedd(staffData));
  //   } catch (e) {
  //     emit(StaffNotLodedd(e.toString()));
  //     print('get stafff:$e');
  //   }
  // }
}
