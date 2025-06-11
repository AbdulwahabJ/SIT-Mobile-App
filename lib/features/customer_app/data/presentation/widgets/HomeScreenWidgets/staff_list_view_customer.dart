import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/logic/StaffCubit/staff_cubit.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../generated/l10n.dart';
import '../../../services/whats_app_service.dart';

class StaffListViewCustomer extends StatefulWidget {
  const StaffListViewCustomer({
    super.key,
  });

  @override
  State<StaffListViewCustomer> createState() => _StaffListViewCustomerState();
}

class _StaffListViewCustomerState extends State<StaffListViewCustomer> {
  List<Map<String, dynamic>> items = [];
  @override
  void initState() {
    super.initState();
    context.read<StaffCubit>().getStaff();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StaffCubit, StaffState>(
      listener: (context, state) {
        if (state is DeleteStaffSuccessSSS) {
          // context.read<StaffCubit>().resetState;
          _showSnackBar(state.message);
          context.read<StaffCubit>().getStaff();
        }
      },
      child: BlocBuilder<StaffCubit, StaffState>(
        builder: (context, state) {
          if (state is StaffLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StaffLodedd) {
            items = state.staffData;
          } else if (state is StaffNotLodedd) {
            return Center(child: Text(state.error));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final image = item['image'];
              final hasImage = image != null &&
                  image.toString().toLowerCase() != 'null' &&
                  image.toString().trim().isNotEmpty;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: GestureDetector(
                  onLongPress: () {
                    deleteStaffDialog(context, item['id'].toString());
                  },
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image(
                                          image:
                                              AssetImage(AppImages.companyLogo)
                                                  as ImageProvider),
                                    );
                                  },
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => const Dialog(
                              child: Text("no image"),
                            ),
                          );
                        }
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: hasImage
                            ? NetworkImage(image)
                            : const AssetImage(AppImages.companyLogo)
                                as ImageProvider,
                        onBackgroundImageError: (exception, stackTrace) {
                          // يمكنك تسجيل الخطأ هنا أو تجاهله
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
                ),
              );
            },
          );
          // return const Center(child: Text('لا توجد بيانات'));
        },
      ),
    );
  }

  Future<dynamic> deleteStaffDialog(BuildContext context, String staffid) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).dialogDeleteHeader),
          content: Text(S.of(context).dialogDeleteQuestionStaff),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).dialogYesButton),
              onPressed: () {
                context.read<StaffCubit>().deleteStaff(staffid);
                Navigator.of(context).pop();

                // context.read<StaffCubit>().resetState;
              },
            ),
            TextButton(
              child: Text(S.of(context).dialogCancelButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
