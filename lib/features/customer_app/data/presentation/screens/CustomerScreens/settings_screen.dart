import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_styles.dart';

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

class _SettingsScreenState extends State<SettingsScreen> {
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
      body: Padding(
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
            Text(S.of(context).group, style: AppStyles.styleReguler16W600),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedCode,
              items: _dropdownItems.map(_buildDropdownItem).toList(),
              onChanged: (value) => setState(() => _selectedCode = value),
            ),
          ],
        ),
      ),
    );
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
