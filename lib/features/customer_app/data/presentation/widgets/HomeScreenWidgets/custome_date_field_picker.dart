import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';

class CustomDateFieldPicker extends StatefulWidget {
  const CustomDateFieldPicker(
      {super.key, required this.textLabel, required this.onDateSelected});

  final String textLabel;
  final Function(DateTime) onDateSelected;

  @override
  State<CustomDateFieldPicker> createState() => _CustomDateFieldPickerState();
}

class _CustomDateFieldPickerState extends State<CustomDateFieldPicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: ScreenUtil.getWidth(context, 0.43),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.unSelectedNavBarIconColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? widget.textLabel
                  : DateFormat('dd/MM/yyyy').format(selectedDate!),
              // style: const TextStyle(fontSize: 16),
            ),
            const Icon(
              Icons.calendar_today,
              color: AppColors.primaryColor,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
