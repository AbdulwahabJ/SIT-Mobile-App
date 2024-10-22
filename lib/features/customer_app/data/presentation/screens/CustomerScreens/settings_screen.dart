import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/core/widgets/bottom_sheet_icon.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../auth/data/presentation/widgets/text_field_decoration.dart';
import '../../widgets/HomeScreenWidgets/custome_date_field_picker.dart';
import '../../widgets/HomeScreenWidgets/custome_time_field_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //
  final TextEditingController textFieldController = TextEditingController();
  List<String>? dropdownItems = [''];
  String? _selectedCode;
  String? selectedTimeFromPicker;
  String? selectedDateFromPicker;

  @override
  void initState() {
    super.initState();

    _loadUser();
  }

  _loadUser() async {
    await context.read<AdminSettingsCubit>().getGroup();
    dropdownItems =
        context.read<AdminSettingsCubit>().allGroups?.cast<String>();
    // print('list :$dropdownItems');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocConsumer<AdminSettingsCubit, AdminSettingsState>(
        listener: (context, state) {
          if (state is AdminSettingsSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadUser();
            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is AdminSettingsFailure) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();

            //
          } else if (state is UpdateUserGroupSuccess) {
            //
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadUser();
            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is UpdateGroupNameSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadUser();
            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is DeleteGroupNameSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadUser();
            context.read<AdminSettingsCubit>().resetState();

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
                        ? adminSettingsBody(context, state)
                        : userSettingsBody(context),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column adminSettingsBody(BuildContext context, AdminSettingsState state) {
    return Column(
      children: [
        Row(
          children: [
            AppIcons.groupAdminIcon,
            const SizedBox(width: 20),
            Text(S.of(context).groups, style: AppStyles.styleSemiBold20W600),
            const Spacer(flex: 7),
            adminGroupSettings(context, state),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            AppIcons.programIcon,
            const SizedBox(width: 20),
            Text(S.of(context).programs, style: AppStyles.styleSemiBold20W600),
            const Spacer(flex: 7),
            Row(
              children: [
                BottomSheetIcon(
                  icon: AppIcons.addAdminIcon,
                  sheetSize: 0.53,
                  sheetTitle: S.of(context).addProgramHeader,
                  textFields: [
                    DropdownButtonFormField<String>(
                      iconSize: 24,
                      icon: AppIcons.dropDownMenuIcon,
                      decoration: _dropdownDecoration(),
                      hint: Text(S.of(context).selectGroup),
                      value: _selectedCode,
                      items: dropdownItems!.map(_buildDropdownItem).toList(),
                      onChanged: (value) async {
                        setState(() => _selectedCode = value);
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      iconSize: 24,
                      icon: AppIcons.dropDownMenuIcon,
                      decoration:
                          _dropdownDecoration(icon: AppIcons.programFieldIcon),
                      hint: Text(S.of(context).selectProgram),
                      value: _selectedCode,
                      items: dropdownItems!.map(_buildDropdownItem).toList(),
                      onChanged: (value) async {
                        setState(() => _selectedCode = value);
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDateFieldPicker(
                            onDateSelected: (DateTime date) {
                              setState(() {
                                selectedDateFromPicker =
                                    DateFormat('yyyy-MM-dd').format(date);
                              });
                            },
                            textLabel: S.of(context).chooseDateHint),
                        CustomTimeFieldPicker(
                          textLabel: S.of(context).chooseTimeHint,
                          onTimeSelected: (TimeOfDay time) {
                            setState(() {
                              selectedTimeFromPicker =
                                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const SizedBox(height: 38),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // FocusScope.of(context).unfocus();

                          // context
                          //     .read<GroupCubit>()
                          //     .addGroup(textFieldController.text);
                          // context.read<GroupCubit>().resetState();

                          _clearFields();
                        },
                        child: CustomMainButton(
                          isSuccess: state is AdminSettingsSuccess,
                          isLoading: state is AdminSettingsLoading,
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
      ],
    );
  }

  Row adminGroupSettings(BuildContext context, AdminSettingsState state) {
    return Row(
      children: [
        BottomSheetIcon(
          icon: AppIcons.addAdminIcon,
          sheetSize: 0.4,
          sheetTitle: S.of(context).addGroupHeader,
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
                  FocusScope.of(context).unfocus();

                  context
                      .read<AdminSettingsCubit>()
                      .addGroup(textFieldController.text);
                  context.read<AdminSettingsCubit>().resetState();

                  _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).add,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.editAdminIcon,
          sheetSize: 0.5,
          sheetTitle: S.of(context).editGroupHeader,
          textFields: [
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedCode,
              items: dropdownItems!.map(_buildDropdownItem).toList(),
              onChanged: (value) async {
                setState(() => _selectedCode = value);
              },
            ),
            const SizedBox(height: 30),
            Text(
              S.of(context).updatGroupName,
              style: AppStyles.styleSemiBold16,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: textFieldController,
              icon: AppIcons.groupIcon,
              hintText: S.of(context).updatGroupNameHint,
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 38),
            Center(
              child: InkWell(
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  await context
                      .read<AdminSettingsCubit>()
                      .updateGroupName(_selectedCode, textFieldController.text);
                  context.read<AdminSettingsCubit>().resetState();

                  _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).updateGroupButton,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.deleteAdminIcon,
          sheetSize: 0.35,
          sheetTitle: S.of(context).deleteGroupHeader,
          textFields: [
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedCode,
              items: dropdownItems!.map(_buildDropdownItem).toList(),
              onChanged: (value) async {
                setState(() => _selectedCode = value.toString());
                print('ss:$_selectedCode');
              },
            ),
            const SizedBox(height: 38),
            Center(
              child: InkWell(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  await context.read<AdminSettingsCubit>().deleteGroupName(
                        _selectedCode!,
                      );
                  context.read<AdminSettingsCubit>().resetState();
                  // _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).deletGroupButton,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }

  Column userSettingsBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).group, style: AppStyles.styleReguler16W600),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          iconSize: 24,
          icon: AppIcons.dropDownMenuIcon,
          decoration: _dropdownDecoration(),
          hint: Text(S.of(context).selectGroup),
          value: _selectedCode,
          items: dropdownItems!.map(_buildDropdownItem).toList(),
          onChanged: (value) async {
            setState(() => _selectedCode = value);
            await context
                .read<AdminSettingsCubit>()
                .updateUserGroup(_selectedCode);
          },
        ),
      ],
    );
  }

  void _clearFields() {
    textFieldController.clear();

    setState(() {
      _selectedCode = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }
}

InputDecoration _dropdownDecoration({Icon? icon}) {
  return InputDecoration(
    enabledBorder: TextFieldDecoration.groupEnabledBorder(),
    focusedBorder: TextFieldDecoration.groupFocusedBorder(),
    prefixIcon: icon ?? AppIcons.groupIcon,
  );
}

DropdownMenuItem<String> _buildDropdownItem(String code) {
  return DropdownMenuItem<String>(
    value: code,
    child: Text(code),
  );
}
