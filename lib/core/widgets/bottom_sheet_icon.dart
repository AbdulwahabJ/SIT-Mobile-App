import 'package:flutter/material.dart';
import 'package:sit_app/core/utils/app_styles.dart';

class BottomSheetIcon extends StatelessWidget {
  const BottomSheetIcon({
    super.key,
    required this.sheetTitle,
    required this.textFields,
    required this.sheetSize,
    required this.icon,
  });
  final Icon icon;
  final String sheetTitle;
  final List textFields;
  final double sheetSize;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              initialChildSize: sheetSize,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildModalHeader(),
                        const SizedBox(height: 28),
                        Text(sheetTitle, style: AppStyles.styleSemiBold20W600),
                        const SizedBox(height: 20),
                        ...textFields,
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      icon: icon,
    );
  }

  // Widget _buildSubmitButton( state) {
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

  Widget _buildModalHeader() {
    return Center(
      child: Container(
        width: 50,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
