import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';

class CustomTimeFieldPicker extends StatefulWidget {
  const CustomTimeFieldPicker({
    super.key,
    required this.textLabel,
    required this.onTimeSelected,
    this.oldTime,
  });

  final String textLabel;
  final String? oldTime;
  final Function(TimeOfDay) onTimeSelected;

  @override
  State<CustomTimeFieldPicker> createState() => _CustomTimeFieldPickerState();
}

class _CustomTimeFieldPickerState extends State<CustomTimeFieldPicker> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.onTimeSelected(selectedTime!); // استدعاء callback وتمرير القيمة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
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
            // نص الوقت
            Text(
              widget.oldTime != null && selectedTime == null
                  ? widget.oldTime.toString()
                  : selectedTime != null
                      ? '${(selectedTime!.hourOfPeriod == 0 ? 12 : selectedTime!.hourOfPeriod).toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')} ${selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                      : widget.textLabel,
            ),
            // أيقونة الساعة
            const Icon(Icons.access_time,
                color: AppColors.primaryColor, size: 24),
          ],
        ),
      ),
    );
  }
}
