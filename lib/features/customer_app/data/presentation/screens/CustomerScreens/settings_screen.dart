import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/helper/validation.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/core/widgets/bottom_sheet_icon.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/customer_app/data/services/group_service.dart';
import 'package:sit_app/features/customer_app/logic/GroupCubit/group_cubit.dart';
import 'package:sit_app/features/customer_app/logic/GroupCubit/group_state.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../auth/data/presentation/widgets/text_field_decoration.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

const List<String> _dropdownItems = [
  'Item 1',
  'Item 2',
  'Item 3'
]; // قائمة ثابتة
String? _selectedCode;
final TextEditingController textFieldController = TextEditingController();

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupCubit(GetIt.I<GroupService>()),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(right: 8.0, top: 16)
                : const EdgeInsets.only(left: 8.0, top: 16),
            child: IconButton(
              icon: AppIcons.backIcon,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ),
        body: BlocConsumer<GroupCubit, GroupState>(
          listener: (context, state) {
            if (state is GroupSuccess) {
              //
              Navigator.pop(context);
              _clearFields();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              //
            } else if (state is GroupFailure) {
              //
              Navigator.pop(context);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              //
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.authScreensPadding,
                right: AppPadding.authScreensPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  Text(
                    S.of(context).settings,
                    style: AppStyles.styleSemiBold22
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      isAdmin()
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    AppIcons.groupAdminIcon,
                                    const SizedBox(width: 20),
                                    Text(S.of(context).groups,
                                        style: AppStyles.styleSemiBold20W600),
                                    const Spacer(flex: 7),
                                    Row(
                                      children: [
                                        BottomSheetIcon(
                                          icon: AppIcons.addAdminIcon,
                                          sheetSize: 0.4,
                                          sheetTitle:
                                              S.of(context).addGroupHeader,
                                          textFields: [
                                            CustomTextField(
                                              controller: textFieldController,
                                              icon: AppIcons.groupIcon,
                                              hintText: S.of(context).groupName,
                                            ),
                                            const SizedBox(height: 14),
                                            const SizedBox(height: 38),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();

                                                  context
                                                      .read<GroupCubit>()
                                                      .addGroup(
                                                          textFieldController
                                                              .text);
                                                },
                                                child: CustomMainButton(
                                                  isSuccess:
                                                      state is GroupSuccess,
                                                  isLoading:
                                                      state is GroupLoading,
                                                  buttonText: S.of(context).add,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        IconButton(
                                          onPressed: () {},
                                          icon: AppIcons.editAdminIcon,
                                        ),
                                        const SizedBox(width: 20),
                                        IconButton(
                                          onPressed: () {},
                                          icon: AppIcons.deleteAdminIcon,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    AppIcons.groupAdminIcon,
                                    const SizedBox(width: 20),
                                    Text(S.of(context).programs,
                                        style: AppStyles.styleSemiBold20W600),
                                    const Spacer(flex: 7),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: AppIcons.addAdminIcon),
                                        const SizedBox(width: 20),
                                        IconButton(
                                          onPressed: () {},
                                          icon: AppIcons.editAdminIcon,
                                        ),
                                        const SizedBox(width: 20),
                                        IconButton(
                                          onPressed: () {},
                                          icon: AppIcons.deleteAdminIcon,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(S.of(context).group,
                                    style: AppStyles.styleReguler16W600),
                                const SizedBox(height: 10),
                                DropdownButtonFormField<String>(
                                  iconSize: 24,
                                  icon: AppIcons.dropDownMenuIcon,
                                  decoration: _dropdownDecoration(),
                                  hint: Text(S.of(context).selectGroup),
                                  value: _selectedCode,
                                  items: _dropdownItems
                                      .map(_buildDropdownItem)
                                      .toList(),
                                  onChanged: (value) =>
                                      setState(() => _selectedCode = value),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _clearFields() {
    textFieldController.clear();

    // setState(() {
    //   _selectedImage = null;
    // });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }
}

InputDecoration _dropdownDecoration() {
  return InputDecoration(
    enabledBorder: TextFieldDecoration.groupEnabledBorder(),
    focusedBorder: TextFieldDecoration.groupFocusedBorder(),
    prefixIcon: AppIcons.groupIcon,
  );
}

DropdownMenuItem<String> _buildDropdownItem(String code) {
  return DropdownMenuItem<String>(
    value: code,
    child: Text(code),
  );
}



// Widget _buildSubmitButton(StaffState state) {
//   return Center(
//     child: InkWell(
//       onTap: _onAddStaffTap,
//       child: CustomMainButton(
//         isSuccess: state is StaffSuccess,
//         isLoading: state is StaffLoading,
//         buttonText: S.of(context).add,
//       ),
//     ),
//   );
// }

  // void _onAddStaffTap() {
  //   FocusScope.of(context).unfocus();
  //   if (_formKey.currentState?.validate() == true) {
  //     final phoneNumber = '+'
  //         '${phoneNumberController.value!.countryCode}${phoneNumberController.value!.nsn}';
  //     // استخدام الـ Cubit لإضافة موظف جديد
  //     context.read<StaffCubit>().addmember(
  //           name: nameController.text,
  //           email: emailController.text,
  //           password: passwordController.text,
  //           phoneNumber: phoneNumber,
  //           languages: languagesController.text,
  //           image: _selectedImage,
  //         );
  //   }
  // }
