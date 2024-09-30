import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhoneInput(
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
      ),

      validator: (value) {
        if (value == null) {
          return 'Please enter your phone number';
        }
        // if (!RegExp(r'^\d+$').hasMatch(value.nsn)) {
        //   return 'phone number must contain only numbers.';
        // }

        return null;
      },
      countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
    );
  }
}
