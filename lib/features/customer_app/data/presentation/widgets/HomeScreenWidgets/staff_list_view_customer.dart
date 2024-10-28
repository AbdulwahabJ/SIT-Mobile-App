import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/logic/StaffCubit/staff_cubit.dart';

import '../../../services/whats_app_service.dart';

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
          return const Center(child: CircularProgressIndicator());
        } else if (state is StaffLodedd) {
          List<Map<String, dynamic>> items = state.staffData;

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final hasImage = item['image'] != null && item['image'] != '';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ListTile(
                  tileColor: AppColors.whaiteBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      if (hasImage) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Image.network(
                                item['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: hasImage
                          ? NetworkImage(item['image'])
                          : const AssetImage(AppImages.umrahProgramImage)
                              as ImageProvider,
                      onBackgroundImageError: (exception, stackTrace) {
                        print('Error loading image: $exception');
                      },
                    ),
                  ),
                  title: Text(
                    item['name'],
                    style: AppStyles.styleSemiBold16,
                  ),
                  subtitle: Text(
                    item['languages'] ?? '',
                    style: AppStyles.styleReguler13,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      openWhatsApp(
                        phoneNumber: item['phone_number'],
                        text: 'Hi ${item['name']}',
                      );
                    },
                    icon: AppIcons.staffSendIcon,
                  ),
                ),
              );
            },
          );
        } else if (state is StaffNotLodedd) {
          return Center(child: Text(state.error));
        }

        return const Center(child: Text('لا توجد بيانات'));
      },
    );
  }
}
