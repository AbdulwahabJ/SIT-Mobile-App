import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/helper/validation.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_phone_field.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import 'package:sit_app/features/auth/logic/auth_state.dart';
import 'package:sit_app/features/customer_app/data/services/staff_service.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../logic/StaffCubit/staff_cubit.dart';
import '../../widgets/HomeScreenWidgets/staff_list_view_customer.dart';
import '../../widgets/StaffScreenWidgets/custom_image_upload_field.dart';

class StaffCustomerScreen extends StatefulWidget {
  const StaffCustomerScreen({super.key});

  @override
  State<StaffCustomerScreen> createState() => _StaffCustomerScreenState();
}

class _StaffCustomerScreenState extends State<StaffCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffCubit(GetIt.I<StaffService>()),
      child: const _StaffScreenBody(),
    );
  }
}

class _StaffScreenBody extends StatefulWidget {
  const _StaffScreenBody({Key? key}) : super(key: key);

  @override
  State<_StaffScreenBody> createState() => _StaffScreenBodyState();
}

class _StaffScreenBodyState extends State<_StaffScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PhoneController phoneNumberController =
      PhoneController(const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  XFile? _selectedImage;
  String? password;
  bool isAdmin = false;

  void initState() {
    super.initState();
    _ifUserAdmin();
  }

  _ifUserAdmin() async {
    isAdmin = await isUserAdmin();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pop(context);
            // debugPrint("Staff added successfully");
            context.read<StaffCubit>().getStaff();

            _showSnackBar(state.message);
            // setState(() {});
          } else if (state is AuthFailure) {
            _showSnackBar(state.error);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.authScreensPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  _buildHeader(context, state),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const StaffListViewCustomer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(context, AuthState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).staffScreenHeader,
          style:
              AppStyles.styleSemiBold22.copyWith(color: AppColors.primaryColor),
        ),
        isAdmin
            ? Expanded(
                child: IconButton(
                  onPressed: () {
                    _clearFields();

                    _showAddStaffBottomSheet(context, state);
                  },
                  icon: AppIcons.staffAddIcon,
                ),
              )
            : Container(),
      ],
    );
  }

  void _showAddStaffBottomSheet(context, AuthState state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.78,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildModalHeader(),
                      const SizedBox(height: 28),
                      Text(S.of(context).newStaffMember,
                          style: AppStyles.styleSemiBold20W600),
                      const SizedBox(height: 20),
                      _buildTextField(nameController, S.of(context).Name,
                          AppIcons.fullNameIcon, InputType.name),
                      const SizedBox(height: 14),
                      _buildTextField(emailController, AppTexts.mailHintText,
                          AppIcons.mailIcon, InputType.email),
                      const SizedBox(height: 14),
                      CustomPhoneField(controller: phoneNumberController),
                      const SizedBox(height: 14),
                      _buildTextField(
                          passwordController,
                          S.of(context).Password,
                          AppIcons.passwordIcon,
                          InputType.password,
                          type: 'password',
                          onChanged: (value) => password = value),
                      const SizedBox(height: 14),
                      _buildTextField(
                          languagesController,
                          S.of(context).languages,
                          AppIcons.langugeIcon,
                          InputType.languages,
                          required: true),
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
                      _buildSubmitButton(state),
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
  }

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

  Widget _buildTextField(TextEditingController controller, String hintText,
      icon, InputType inputType,
      {String? type, Function(String)? onChanged, bool required = false}) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      icon: icon,
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return S.of(context).languagesRequired;
        }
        return Validation.validateInput(inputType, value, context);
      },
      type: type,
      onChanged: onChanged,
    );
  }

  Widget _buildSubmitButton(AuthState state) {
    return Center(
      child: InkWell(
        onTap: _onAddStaffTap,
        child: CustomMainButton(
          isSuccess: state is StaffSuccess,
          isLoading: state is StaffLoading,
          buttonText: S.of(context).add,
        ),
      ),
    );
  }

  void _onAddStaffTap() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() == true) {
      final phoneNumber = '+'
          '${phoneNumberController.value!.countryCode}${phoneNumberController.value!.nsn}';
      // استخدام الـ Cubit لإضافة موظف جديد

      context.read<AuthCubit>().signUp(
            nameController.text,
            emailController.text,
            passwordController.text,
            phoneNumber,
            null,
            'staff',
            languagesController.text,
            _selectedImage,
          );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    phoneNumberController.value =
        const PhoneNumber(isoCode: IsoCode.US, nsn: ''); // تصفية الهاتف
    passwordController.clear();
    languagesController.clear();
    // setState(() {
    //   _selectedImage = null;
    // });
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
