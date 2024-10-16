// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sit_app/core/utils/app_styles.dart';
// import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
// import 'package:sit_app/features/customer_app/data/presentation/widgets/StaffScreenWidgets/custom_image_upload_field.dart';
// import 'package:sit_app/features/customer_app/logic/staff_cubit.dart';
// import 'package:sit_app/generated/l10n.dart';

// import '../constants/app_icons.dart';

// class CustomBottomSheet extends StatelessWidget {
//   final StaffState? state;
//   final GlobalKey<FormState> formKey;
//   final List<Widget> fields; // قائمة الحقول التي يتم تمريرها ديناميكياً
//   final Function() onTapButton;
//   final Function(XFile?) onImageSelected;
//   final String bottomSheetLabel;

//   CustomBottomSheet({
//     required this.state,
//     required this.formKey,
//     required this.fields,
//     required this.onTapButton,
//     required this.onImageSelected,
//     required this.bottomSheetLabel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.78, // الحجم الابتدائي
//       minChildSize: 0.3, // الحد الأدنى
//       maxChildSize: 0.9, // الحد الأقصى
//       expand: false, // السماح بالتمدد
//       builder: (context, scrollController) {
//         return SingleChildScrollView(
//           controller: scrollController,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 50, // عرض الخط
//                       height: 5, // ارتفاع الخط
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300], // لون الخط
//                         borderRadius:
//                             BorderRadius.circular(10), // جعل الأطراف مستديرة
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   Text(
//                     bottomSheetLabel,
//                     style: AppStyles.styleSemiBold20W600,
//                   ),
//                   const SizedBox(height: 20),
//                   // تمرير الحقول الديناميكية
//                   ...fields,
//                   const SizedBox(height: 14),
//                   CustomImageUploadWidget(
//                     icon: AppIcons.photoMemberIcon,
//                     onImageSelected: onImageSelected,
//                   ),
//                   const SizedBox(height: 38),
//                   Center(
//                     child: InkWell(
//                       onTap: onTapButton,
//                       child: CustomMainButton(
//                         isSuccess: state is StaffAdded,
//                         isLoading: state is StaffLoading,
//                         buttonText: S.of(context).add,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
