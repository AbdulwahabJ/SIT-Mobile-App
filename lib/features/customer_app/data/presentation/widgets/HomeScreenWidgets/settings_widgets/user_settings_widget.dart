import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';
import 'package:sit_app/generated/l10n.dart';

class UserSettingsWidget extends StatefulWidget {
  const UserSettingsWidget({super.key});

  @override
  State<UserSettingsWidget> createState() => _UserSettingsWidgetState();
}

class _UserSettingsWidgetState extends State<UserSettingsWidget> {
  String? ifUserHaveGroupName;
  List<String>? dropdownItems = [''];
  String? _selectedGroupUser;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _loadGroups();
    await isUserhaveGroup();
  }

  Future<void> _loadGroups() async {
    await context.read<AdminSettingsCubit>().getGroup();
  }

  Future<void> isUserhaveGroup() async {
    String? userGroupName = await isUserHaveGroup();
    setState(() {
      ifUserHaveGroupName = userGroupName;
    });
    print('User group: $ifUserHaveGroupName');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminSettingsCubit, AdminSettingsState>(
      listener: (context, state) {
        if (state is GroupsUploadedSuccess) {
          setState(() {
            dropdownItems =
                context.read<AdminSettingsCubit>().allGroups?.cast<String>() ??
                    [];
            context.read<AdminSettingsCubit>().resetState();
          });
        } else if (state is UpdateUserGroupSuccess) {
          //
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          context.read<AdminSettingsCubit>().resetState();
          // Navigator.pop(context);
          //
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).group, style: AppStyles.styleReguler16W600),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            iconSize: 24,
            icon: AppIcons.dropDownMenuIcon,
            decoration: _dropdownDecoration(),
            hint: Text(S.of(context).selectGroup),
            value: ifUserHaveGroupName ?? _selectedGroupUser,
            items: dropdownItems!.map(_buildDropdownItem).toList(),
            onChanged: (value) async {
              setState(() => _selectedGroupUser = value);
              await context.read<AdminSettingsCubit>().updateUserGroup(value);
            },
          ),
        ],
      ),
    );
  }

  InputDecoration _dropdownDecoration({Icon? icon}) {
    return InputDecoration(
      enabledBorder: TextFieldDecoration.groupEnabledBorder(),
      focusedBorder: TextFieldDecoration.groupFocusedBorder(),
      errorBorder: TextFieldDecoration.errorBorder(),
      prefixIcon: icon ?? AppIcons.groupIcon,
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String code) {
    return DropdownMenuItem<String>(
      value: code,
      child: Text(code),
    );
  }
}
