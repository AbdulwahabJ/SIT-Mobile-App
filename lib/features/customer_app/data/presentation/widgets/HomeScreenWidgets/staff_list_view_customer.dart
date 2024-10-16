import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/logic/staff_cubit.dart';

class StaffListViewCustomer extends StatefulWidget {
  const StaffListViewCustomer({
    super.key,
  });

  @override
  State<StaffListViewCustomer> createState() => _StaffListViewCustomerState();
}

class _StaffListViewCustomerState extends State<StaffListViewCustomer> {
  @override
  void initState() {
    super.initState();
    context.read<StaffCubit>().getStaff();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffCubit, StaffState>(
      builder: (context, state) {
        if (state is StaffLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is StaffLodedd) {
          // هنا نستخدم البيانات المحملة
          List<Map<String, dynamic>> items = state.staffData;
          print('dffffffffffd:$items');

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ListTile(
                  tileColor: AppColors.whaiteBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       item['image']!), // استخدام الصورة من الشبكة
                  // ),
                  title: Text(
                    item['name']!,
                    style: AppStyles.styleSemiBold16,
                  ),
                  subtitle: Text(
                    item[
                        'languages']!, // استخدم اللغات أو أي بيانات أخرى تريد عرضها
                    style: AppStyles.styleReguler13,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: AppIcons.staffSendIcon,
                  ),
                ),
              );
            },
          );
        } else if (state is StaffFailure) {
          return Center(child: Text('خطأ: ${state.error}'));
        }

        return Center(child: Text('لا توجد بيانات'));
      },
    );
  }
}
