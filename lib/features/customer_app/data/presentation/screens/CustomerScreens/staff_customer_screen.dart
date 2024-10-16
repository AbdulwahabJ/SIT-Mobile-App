import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart'; // مكتبة رفع الصور
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // إضافة المكتبة الخاصة بالـ Bloc
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/validation.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_phone_field.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/customer_app/data/services/staff_service.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../logic/staff_cubit.dart';
import '../../widgets/StaffScreenWidgets/custom_image_upload_field.dart';

class StaffCustomerScreen extends StatelessWidget {
  const StaffCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffCubit(GetIt.I<StaffService>()),
      child: _SttafScreenBody(),
    );
  }
}

class _SttafScreenBody extends StatefulWidget {
  @override
  State<_SttafScreenBody> createState() => _SttafScreenBodyState();
}

class _SttafScreenBodyState extends State<_SttafScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PhoneController phoneNumberController =
      PhoneController(const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  XFile? _selectedImage;
  String? password;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Ahmed Mohammed',
        'date': 'arabic'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Khalid Ali',
        'date': 'arabic&english'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Malik Ahmed',
        'date': 'urdu'
      },
    ];

    return Scaffold(
      body: BlocConsumer<StaffCubit, StaffState>(
        listener: (context, state) {
          if (state is StaffAdded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            });
          } else if (state is StaffFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            });
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
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).staffScreenHeader,
                      style: AppStyles.styleSemiBold22
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true, // السماح بالتحكم في السحب
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              initialChildSize:
                                  0.78, // الحجم الابتدائي للنسبة من الشاشة
                              minChildSize: 0.3, // الحد الأدنى للنسبة من الشاشة
                              maxChildSize: 0.9, // الحد الأقصى للنسبة من الشاشة
                              expand: false, // السماح بالتمدد
                              builder: (context, scrollController) {
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: 50, // عرض الخط
                                              height: 5, // ارتفاع الخط
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .grey[300], // لون الخط
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10), // جعل الأطراف مستديرة
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 28),
                                          Text(
                                            S.of(context).newStaffMember,
                                            style:
                                                AppStyles.styleSemiBold20W600,
                                          ),
                                          const SizedBox(height: 20),
                                          CustomTextField(
                                            controller: nameController,
                                            hintText: S.of(context).Name,
                                            icon: AppIcons.fullNameIcon,
                                            validator: (value) =>
                                                Validation.validateInput(
                                                    InputType.name,
                                                    value,
                                                    context),
                                          ),
                                          const SizedBox(height: 14),
                                          CustomTextField(
                                            controller: emailController,
                                            hintText: AppTexts.mailHintText,
                                            icon: AppIcons.mailIcon,
                                            validator: (value) =>
                                                Validation.validateInput(
                                                    InputType.email,
                                                    value,
                                                    context),
                                          ),
                                          const SizedBox(height: 14),
                                          CustomPhoneField(
                                            controller: phoneNumberController,
                                          ),
                                          const SizedBox(height: 14),
                                          CustomTextField(
                                            controller: passwordController,
                                            hintText: S.of(context).Password,
                                            icon: AppIcons.passwordIcon,
                                            type: 'password',
                                            validator: (value) =>
                                                Validation.validateInput(
                                                    InputType.password,
                                                    value,
                                                    context),
                                            onChanged: (value) =>
                                                password = value,
                                          ),
                                          const SizedBox(height: 14),
                                          CustomTextField(
                                            controller: languagesController,
                                            hintText: S.of(context).languages,
                                            icon: AppIcons.langugeIcon,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return S
                                                    .of(context)
                                                    .languagesRequired;
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 14),
                                          CustomImageUploadWidget(
                                            icon: AppIcons.photoMemberIcon,
                                            onImageSelected: (XFile? image) {
                                              setState(() {
                                                _selectedImage = image;
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 38),
                                          Center(
                                            child: InkWell(
                                              onTap: _onAddStaffTap,
                                              child: CustomMainButton(
                                                isSuccess: state is StaffAdded,
                                                isLoading:
                                                    state is StaffLoading,
                                                buttonText: S.of(context).add,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: AppIcons.staffAddIcon,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        tileColor: AppColors.whaiteBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage(AppImages.umrahProgramImage),
                        ),
                        title: Text(
                          item['title']!,
                          style: AppStyles.styleSemiBold16,
                        ),
                        subtitle: Text(
                          item['date']!,
                          style: AppStyles.styleReguler13,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: AppIcons.staffSendIcon,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onAddStaffTap() {
    // print(_selectedImage?.name);
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() == true) {
      final phoneNumber = '+' +
          '${phoneNumberController.value!.countryCode}${phoneNumberController.value!.nsn}';
      // استخدام الـ Cubit لإضافة موظف جديد
      context.read<StaffCubit>().addmember(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phoneNumber: phoneNumber,
            languages: languagesController.text,
            image: _selectedImage,
          );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    languagesController.dispose();
    super.dispose();
  }
}
