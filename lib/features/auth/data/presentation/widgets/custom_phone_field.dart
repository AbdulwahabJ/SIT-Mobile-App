import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
    required this.controller,
  });

  final PhoneController controller;

  @override
  Widget build(BuildContext context) {
    return PhoneInput(
      controller: controller,
      key: const Key('phone-field'),
      // onChanged: (PhoneNumber? phone) {
      //   setState(() {
      //     _phoneNumber = phone?.completeNumber;
      //   });
      // },
      decoration: InputDecoration(
          enabledBorder: TextFieldDecoration.enabledBorder(),
          focusedBorder: TextFieldDecoration.focusedBorder(),
          errorBorder: TextFieldDecoration.errorBorder(),
          focusedErrorBorder: TextFieldDecoration.focusedErrorBorder(),
          prefixIcon: AppIcons.phoneIcon),
      validator: (value) {
        if (value == null || value.nsn.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
      countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
    );
  }
}
