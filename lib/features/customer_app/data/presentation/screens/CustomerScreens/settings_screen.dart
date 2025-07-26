import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/customer_screen.dart';
import 'package:sit_app/core/widgets/bottom_sheet_icon.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/settings_widgets/user_settings_widget.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/helper/user_info.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../auth/data/presentation/widgets/text_field_decoration.dart';
import '../../widgets/HomeScreenWidgets/custome_date_field_picker.dart';
import '../../widgets/HomeScreenWidgets/custome_time_field_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //
  final TextEditingController textFieldController = TextEditingController();
  List<String>? dropdownItems = [''];
  List<String>? allPrograms = [
    'Umrah',
    'Dars',
    'Mazarat',
    'Departure to Makkah',
    'Departure to Madina'
  ];
  List<dynamic> allProgramsForGroup = [];

  String? _selectedGroup;

  String? selectedProgram;
  String? selectedProgramIdForUpdate;

  String? updatedProgram;
  String? updatedTime;
  String? updatedDate;
  String? selectedProgramId;

  String? selectedTimeFromPicker;
  String? selectedDateFromPicker;
  bool isAdmin = false;
  double bottomSheettSize = 0.65;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _ifUserAdmin();
    await _loadGroups();
  }

  Future<void> _loadGroups() async {
    await context.read<AdminSettingsCubit>().getGroup();
  }

  Future<void> _ifUserAdmin() async {
    bool respons = await isUserAdmin();
    setState(() {
      isAdmin = respons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: Directionality.of(context) == TextDirection.LTR ? 8.0 : 0.0,
            right: Directionality.of(context) == TextDirection.RTL ? 8.0 : 0.0,
            top: 16,
          ),
          // ? const EdgeInsets.only(right: 8.0, top: 16)
          // : const EdgeInsets.only(left: 8.0, top: 16),
          child: IconButton(
            icon: AppIcons.backIcon,
            onPressed: () {
              // Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerScreen(),
                ),
              );
            },
          ),
        ),
      ),
      body: BlocConsumer<AdminSettingsCubit, AdminSettingsState>(
        listener: (context, state) {
          //admin states
          if (state is AdminSettingsSuccess) {
            //

            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();

            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is AdminSettingsFailure) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
          } else if (state is GroupsUploadedSuccess) {
            setState(() {
              dropdownItems = context
                      .read<AdminSettingsCubit>()
                      .allGroups
                      ?.cast<String>() ??
                  [];
              context.read<AdminSettingsCubit>().resetState();
            });
          }
          //admin settings
          else if (state is UpdateGroupNameSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();
            context.read<AdminSettingsCubit>().resetState();
            //
          } else if (state is DeleteGroupNameSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();
            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is DataProgramForUpdateSuccess) {
            //
            setState(() {
              bottomSheettSize = 0.8;
              updatedProgram = state.dataForUpdate[0].toString();
              updatedDate = state.dataForUpdate[1].toString();
              updatedTime = state.dataForUpdate[2].toString();
            });

            // context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is GetAllProgramsForGroupSuccess) {
            setState(() {
              allProgramsForGroup = state.allPrograms;
            });
          } else if (state is DeleteProgramSuccesse) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();
            context.read<AdminSettingsCubit>().resetState();
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
                const SizedBox(height: 28),
                Text(
                  S.of(context).settings,
                  style: AppStyles.styleSemiBold22
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    isAdmin
                        ? adminSettingsBody(context, state)
                        : UserSettingsWidget()
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column adminSettingsBody(BuildContext context, AdminSettingsState state) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppIcons.groupAdminIcon,
                const SizedBox(width: 20),
                Text(S.of(context).groups, style: AppStyles.styleSemiBold18),
              ],
            ),
            adminGroupSettings(context, state),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppIcons.programIcon,
                const SizedBox(width: 20),
                Text(S.of(context).programs, style: AppStyles.styleSemiBold18),
              ],
            ),
            // const Spacer(flex: 7),
            adminProgramSettings(context, state),
          ],
        ),
      ],
    );
  }

  Row adminProgramSettings(BuildContext context, AdminSettingsState state) {
    return Row(
      children: [
        BottomSheetIcon(
          icon: AppIcons.addAdminIcon,
          sheetSize: 0.58,
          sheetTitle: S.of(context).addProgramHeader,
          textFields: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    iconSize: 24,
                    icon: AppIcons.dropDownMenuIcon,
                    decoration: _dropdownDecoration(),
                    hint: Text(S.of(context).selectGroup),
                    value: _selectedGroup,
                    items: dropdownItems!.map(_buildDropdownItem).toList(),
                    onChanged: (value) {
                      setState(() => _selectedGroup = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    iconSize: 24,
                    icon: AppIcons.dropDownMenuIcon,
                    decoration:
                        _dropdownDecoration(icon: AppIcons.programFieldIcon),
                    hint: Text(S.of(context).selectProgram),
                    value: selectedProgram,
                    items: allPrograms!.map(_buildDropdownItem).toList(),
                    onChanged: (value) {
                      setState(() => selectedProgram = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDateFieldPicker(
                          onDateSelected: (DateTime date) {
                            setState(() {
                              selectedDateFromPicker =
                                  DateFormat('yyyy-MM-dd').format(date);
                            });
                          },
                          textLabel: S.of(context).chooseDateHint),
                      CustomTimeFieldPicker(
                        textLabel: S.of(context).chooseTimeHint,
                        onTimeSelected: (TimeOfDay time) {
                          setState(() {
                            selectedTimeFromPicker =
                                '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const SizedBox(height: 38),
                  Center(
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate() &&
                            selectedDateFromPicker != null &&
                            selectedTimeFromPicker != null &&
                            _selectedGroup != null &&
                            selectedProgram != null) {
                          context.read<AdminSettingsCubit>().addProgram(
                                _selectedGroup,
                                selectedProgram,
                                selectedDateFromPicker,
                                selectedTimeFromPicker,
                              );
                          _loadGroups();
                          _clearFields();
                          // Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(S.of(context).formValidation)));
                          _clearFields();
                        }
                      },
                      child: CustomMainButton(
                        isSuccess: state is AdminSettingsSuccess,
                        isLoading: state is AdminSettingsLoading,
                        buttonText: S.of(context).add,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
        // const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.editAdminIcon,
          sheetSize: 0.72,
          sheetTitle: S.of(context).editProgramHeader,
          textFields: [
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedGroup,
              items: dropdownItems!.map(_buildDropdownItem).toList(),
              onChanged: (value) {
                setState(() => _selectedGroup = value);
                context.read<AdminSettingsCubit>().getAllProgramsForGroup(
                      _selectedGroup,
                    );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
              builder: (context, state) {
                if (state is AdminSettingsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DropdownButtonFormField<String>(
                  iconSize: 24,
                  icon: AppIcons.dropDownMenuIcon,
                  decoration: _dropdownDecoration(),
                  hint: Text(S.of(context).selectProgram),
                  value: selectedProgramIdForUpdate,
                  items: allProgramsForGroup
                      .map<DropdownMenuItem<String>>((program) {
                    //

                    //
                    // String? uniqueValue = "${program['name']}_${program['id']}";
                    return DropdownMenuItem<String>(
                      value: program['id'],
                      child: Text(program['displayText'].toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProgramIdForUpdate = value;
                    });

                    context.read<AdminSettingsCubit>().getProgramDataForUpdate(
                          _selectedGroup,
                          selectedProgramIdForUpdate,
                        );
                  },
                );
              },
            ),
            BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
              builder: (context, state) {
                if (state is DataProgramForUpdateSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(S.of(context).updatProgramName,
                          style: AppStyles.styleSemiBold18),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        iconSize: 24,
                        icon: AppIcons.dropDownMenuIcon,
                        decoration: _dropdownDecoration(
                            icon: AppIcons.programFieldIcon),
                        hint: Text(S.of(context).selectProgram),
                        value: updatedProgram,
                        items: allPrograms!.map(_buildDropdownItem).toList(),
                        onChanged: (value) {
                          setState(() {
                            updatedProgram = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomDateFieldPicker(
                              oldDate: updatedDate,
                              onDateSelected: (DateTime date) {
                                setState(() {
                                  selectedDateFromPicker =
                                      DateFormat('yyyy-MM-dd').format(date);
                                });
                              },
                              textLabel: S.of(context).chooseDateHint),
                          CustomTimeFieldPicker(
                            oldTime: updatedTime,
                            textLabel: S.of(context).chooseTimeHint,
                            onTimeSelected: (TimeOfDay time) {
                              setState(() {
                                selectedTimeFromPicker =
                                    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 38),
                      Center(
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            context
                                .read<AdminSettingsCubit>()
                                .updateProgramForGroup(
                                  selectedProgramIdForUpdate,
                                  updatedProgram,
                                  selectedDateFromPicker,
                                  selectedTimeFromPicker,
                                );
                            context.read<AdminSettingsCubit>().resetState();

                            // Navigator.of(context).pop();
                            _clearFields();
                          },
                          child: CustomMainButton(
                            isSuccess: state is AdminSettingsSuccess,
                            isLoading: state is AdminSettingsLoading,
                            buttonText: S.of(context).updateGroupButton,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                    child: Text('choose the group and program to update'));
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
        // const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.deleteAdminIcon,
          sheetSize: 0.45,
          sheetTitle: S.of(context).deleteProgramHeader,
          textFields: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    iconSize: 24,
                    icon: AppIcons.dropDownMenuIcon,
                    decoration: _dropdownDecoration(),
                    hint: Text(S.of(context).selectGroup),
                    value: _selectedGroup,
                    items: dropdownItems!.map(_buildDropdownItem).toList(),
                    onChanged: (value) {
                      setState(() => _selectedGroup = value);
                      context.read<AdminSettingsCubit>().getAllProgramsForGroup(
                            _selectedGroup,
                          );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
                    builder: (context, state) {
                      if (state is AdminSettingsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return DropdownButtonFormField<String>(
                        iconSize: 24,
                        icon: AppIcons.dropDownMenuIcon,
                        decoration: _dropdownDecoration(),
                        hint: Text(S.of(context).selectProgram),
                        value: selectedProgram,
                        items: allProgramsForGroup
                            .map<DropdownMenuItem<String>>((program) {
                          return DropdownMenuItem<String>(
                            value: program['id'],
                            child: Text(program['displayText'].toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedProgramIdForUpdate = value;
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  const SizedBox(height: 38),
                  Center(
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate() &&
                            _selectedGroup != null &&
                            selectedProgramIdForUpdate != null) {
                          context.read<AdminSettingsCubit>().deleteProgram(
                                selectedProgramIdForUpdate,
                              );
                          _loadGroups();
                          _clearFields();
                          context.read<AdminSettingsCubit>().resetState();
                        } else {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(S.of(context).formValidation)));
                          _clearFields();
                        }
                      },
                      child: CustomMainButton(
                        isSuccess: state is AdminSettingsSuccess,
                        isLoading: state is AdminSettingsLoading,
                        buttonText: S.of(context).deletGroupButton,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row adminGroupSettings(BuildContext context, AdminSettingsState state) {
    return Row(
      children: [
        BottomSheetIcon(
          icon: AppIcons.addAdminIcon,
          sheetSize: 0.4,
          sheetTitle: S.of(context).addGroupHeader,
          textFields: [
            CustomTextField(
              controller: textFieldController,
              icon: AppIcons.groupIcon,
              hintText: S.of(context).groupName,
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 38),
            Center(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  context
                      .read<AdminSettingsCubit>()
                      .addGroup(textFieldController.text);
                  context.read<AdminSettingsCubit>().resetState();

                  _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).add,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        // const SizedBox(width: 10),
        BottomSheetIcon(
          icon: AppIcons.editAdminIcon,
          sheetSize: 0.56,
          sheetTitle: S.of(context).editGroupHeader,
          textFields: [
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedGroup,
              items: dropdownItems!.map(_buildDropdownItem).toList(),
              onChanged: (value) async {
                setState(() => _selectedGroup = value);
              },
            ),
            const SizedBox(height: 30),
            Text(
              S.of(context).updatGroupName,
              style: AppStyles.styleSemiBold16,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: textFieldController,
              icon: AppIcons.groupIcon,
              hintText: S.of(context).updatGroupNameHint,
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 38),
            Center(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  context.read<AdminSettingsCubit>().updateGroupName(
                      _selectedGroup, textFieldController.text);
                  context.read<AdminSettingsCubit>().resetState();

                  _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).updateGroupButton,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        // const SizedBox(width: 10),
        BottomSheetIcon(
          icon: AppIcons.deleteAdminIcon,
          sheetSize: 0.38,
          sheetTitle: S.of(context).deleteGroupHeader,
          textFields: [
            DropdownButtonFormField<String>(
              iconSize: 24,
              icon: AppIcons.dropDownMenuIcon,
              decoration: _dropdownDecoration(),
              hint: Text(S.of(context).selectGroup),
              value: _selectedGroup,
              items: dropdownItems!.map(_buildDropdownItem).toList(),
              onChanged: (value) {
                setState(() => _selectedGroup = value);
                print('ss:$_selectedGroup');
              },
            ),
            const SizedBox(height: 38),
            Center(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.read<AdminSettingsCubit>().deleteGroupName(
                        _selectedGroup!,
                      );
                  context.read<AdminSettingsCubit>().resetState();
                  _clearFields();
                },
                child: CustomMainButton(
                  isSuccess: state is AdminSettingsSuccess,
                  isLoading: state is AdminSettingsLoading,
                  buttonText: S.of(context).deletGroupButton,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }

  void _clearFields() {
    textFieldController.clear();
    setState(() {
      _selectedGroup = null;
      selectedProgram = null;
      selectedDateFromPicker = null;
      selectedTimeFromPicker = null;
      selectedProgramIdForUpdate = null;
      allProgramsForGroup.clear();
    });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
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
