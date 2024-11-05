import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/MomentsScreenWidgets/custom_images_upload_field.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/MomentsScreenWidgets/moment_images_list_view.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';

import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/widgets/bottom_sheet_icon.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../auth/data/presentation/widgets/text_field_decoration.dart';
import '../../../../logic/AdminSettingsCubit/admin_settings_state.dart';

class MomentsItem extends StatefulWidget {
  const MomentsItem({
    super.key,
    required this.sectionText,
    required this.imagesList,
  });
  final String sectionText;
  final List<dynamic> imagesList;

  @override
  State<MomentsItem> createState() => _MomentsItemState();
}

class _MomentsItemState extends State<MomentsItem> {
  bool isAdmin = false;
  final dropdownItems = ['Holy Mosques', 'Mazarat', 'Religious Lectures'];
  String? selectedSection;
  List<XFile> selectedImages = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
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
    return Column(
      children: [
        Row(
          children: [
            const Image(image: AssetImage(AppImages.stteperImage)),
            const SizedBox(width: 8),
            Text(
              widget.sectionText,
              style: AppStyles.styleSemiBold16,
            ),
            const Expanded(child: SizedBox()),
            isAdmin && widget.sectionText == 'Holy Mosques' ||
                    isAdmin && widget.sectionText == 'الحرمين الشريفين'
                ? BlocListener<AdminSettingsCubit, AdminSettingsState>(
                    listener: (context, state) {
                      if (state is UploadAllMomentsSuccesse) {
                        _showSnackBar(state.message);
                        // context.read<AdminSettingsCubit>().resetState();
                        context.read<AdminSettingsCubit>().getMoments();
                      } else if (state is AdminSettingsFailure) {
                        //
                        Navigator.pop(context);
                        _showSnackBar(state.message);
                        //
                      }
                    },
                    child: BottomSheetIcon(
                      icon: AppIcons.addMomentIcon,
                      sheetSize: 0.5,
                      sheetTitle: S.of(context).addMomentsHeader,
                      textFields: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                iconSize: 24,
                                icon: AppIcons.dropDownMenuIcon,
                                decoration: _dropdownDecoration(),
                                hint: Text(S.of(context).selectSection),
                                value: selectedSection,
                                items: dropdownItems
                                    .map(_buildDropdownItem)
                                    .toList(),
                                onChanged: (value) {
                                  setState(() => selectedSection = value);
                                  // print('ss:$_selectedGroup');
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomImagesUploadWidget(
                                onImageSelected: (images) {
                                  selectedImages = images;
                                },
                                icon: AppIcons.uploadImage,
                              ),
                              const SizedBox(height: 38),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState!.validate() &&
                                        selectedSection != null) {
                                      context
                                          .read<AdminSettingsCubit>()
                                          .uploadMomentsImages(
                                            selectedSection.toString(),
                                            selectedImages,
                                          );
                                      Navigator.pop(context);
                                      _clearFields();
                                    } else {
                                      Navigator.of(context).pop();
                                      _showSnackBar(
                                          S.of(context).formValidation);
                                      _clearFields();
                                    }

                                    // print('${selectedSection}   ${selectedImages.}');
                                  },
                                  child: CustomMainButton(
                                    isSuccess: false,
                                    isLoading: false,
                                    buttonText: S.of(context).Upload,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(width: 15),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: isArabic()
                  ? const EdgeInsets.only(right: 8.0)
                  : const EdgeInsets.only(left: 8.0),
              child: const SizedBox(
                height: 120,
                child: VerticalDivider(
                  color: AppColors.primaryColor,
                  thickness: 2,
                  // endIndent: 1,
                  // indent: 0,
                ),
              ),
            ),
            Expanded(
                child: MomentImagesListView(
              imagesList: widget.imagesList,
            ))
          ],
        )
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _clearFields() {
    setState(() {
      selectedSection = null;
    });
  }
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
