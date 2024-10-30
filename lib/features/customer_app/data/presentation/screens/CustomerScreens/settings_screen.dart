import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/customer_screen.dart';
import 'package:sit_app/core/widgets/bottom_sheet_icon.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';
import '../../../../../../core/constants/app_colors.dart';
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
  List<String>? allPrograms = ['Umrah', 'Dars', 'Mazarat'];
  List<dynamic> allProgramsForGroup = [];

  String? _selectedGroup;
  String? _selectedGroupUser;

  String? selectedProgram;
  String? selectedProgramIdForUpdate;

  String? updatedProgram;
  String? updatedTime;
  String? updatedDate;
  String? selectedProgramId;

  String? selectedTimeFromPicker;
  String? selectedDateFromPicker;
  bool isAdmin = false;
  String? ifUserHaveGroupName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  _initializeData() async {
    await _loadGroups();
    await isUserhaveGroup();
    _ifUserAdmin();
  }

  _loadGroups() async {
    await context.read<AdminSettingsCubit>().getGroup();
    setState(() {
      dropdownItems =
          context.read<AdminSettingsCubit>().allGroups?.cast<String>();
    });
    print('Loaded groups: $dropdownItems');
  }

  isUserhaveGroup() async {
    String? userGroupName = await isUserHaveGroup();
    setState(() {
      ifUserHaveGroupName = userGroupName;
    });
    print('User group: $ifUserHaveGroupName');
  }

  _ifUserAdmin() async {
    isAdmin = await isUserAdmin();
    setState(() {});
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

            //
          } else if (state is UpdateUserGroupSuccess) {
            //
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();
            context.read<AdminSettingsCubit>().resetState();

            //
          } else if (state is UpdateGroupNameSuccess) {
            //
            Navigator.pop(context);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            _clearFields();
            _loadGroups();
            context.read<AdminSettingsCubit>().resetState();
//
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
                        : userSettingsBody(context),
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
          children: [
            AppIcons.groupAdminIcon,
            const SizedBox(width: 20),
            Text(S.of(context).groups, style: AppStyles.styleSemiBold20W600),
            const Spacer(flex: 7),
            adminGroupSettings(context, state),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            AppIcons.programIcon,
            const SizedBox(width: 20),
            Text(S.of(context).programs, style: AppStyles.styleSemiBold20W600),
            const Spacer(flex: 7),
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
          sheetSize: 0.53,
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
        const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.editAdminIcon,
          sheetSize: 0.65,
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
        const SizedBox(width: 20),
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
                        } else {
                          Navigator.of(context).pop();
                          _clearFields();

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
        const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.editAdminIcon,
          sheetSize: 0.5,
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
        const SizedBox(width: 20),
        BottomSheetIcon(
          icon: AppIcons.deleteAdminIcon,
          sheetSize: 0.35,
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
                  // _clearFields();
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

  Column userSettingsBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).group, style: AppStyles.styleReguler16W600),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          iconSize: 24,
          icon: AppIcons.dropDownMenuIcon,
          decoration: _dropdownDecoration(),
          hint: Text(S.of(context).selectGroup),
          value: ifUserHaveGroupName != null && ifUserHaveGroupName!.isNotEmpty
              ? ifUserHaveGroupName
              : _selectedGroupUser,
          // value: ifUserHaveGroupName != null && ifUserHaveGroupName!.isNotEmpty
          //    \ ? ifUserHaveGroupName
          //     : _selectedGroupUser,
          items: dropdownItems!.map(_buildDropdownItem).toList(),
          onChanged: (value) async {
            setState(() => _selectedGroupUser = value);
            await context
                .read<AdminSettingsCubit>()
                .updateUserGroup(_selectedGroupUser);

            // await context
            //     .read<AdminSettingsCubit>()
            //     .getProgramsForToday(_selectedGroupUser);

            // _clearFields();
          },
        ),
      ],
    );
  }

// ifUserHaveGroup != null && ifUserHaveGroup!.isNotEmpty
//              \ ? ifUserHaveGroup
//               : _selectedGroup,
  void _clearFields() {
    textFieldController.clear();

    setState(() {
      _selectedGroup = null;
      _selectedGroupUser = null;
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


  // showModalBottomSheet(
  //                                 context: context,
  //                                 isScrollControlled: true,
  //                                 builder: (context) {
  //                                   return DraggableScrollableSheet(
  //                                     initialChildSize: 0.4,
  //                                     minChildSize: 0.3,
  //                                     maxChildSize: 0.9,
  //                                     expand: false,
  //                                     builder: (context, scrollController) {
  //                                       return SingleChildScrollView(
  //                                         controller: scrollController,
  //                                         child: Padding(
  //                                           padding: const EdgeInsets.all(16.0),
  //                                           child: Column(
  //                                             crossAxisAlignment:
  //                                                 CrossAxisAlignment.start,
  //                                             children: [
  //                                               Center(
  //                                                 child: Container(
  //                                                   width: 50,
  //                                                   height: 5,
  //                                                   decoration: BoxDecoration(
  //                                                     color: Colors.grey[300],
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             10),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               const SizedBox(height: 20),
  //                                               Text(
  //                                                   S
  //                                                       .of(context)
  //                                                       .updatProgramName,
  //                                                   style: AppStyles
  //                                                       .styleSemiBold20W600),
  //                                               const SizedBox(height: 20),
  //                                               DropdownButtonFormField<String>(
  //                                                 iconSize: 24,
  //                                                 icon:
  //                                                     AppIcons.dropDownMenuIcon,
  //                                                 decoration:
  //                                                     _dropdownDecoration(
  //                                                         icon: AppIcons
  //                                                             .programFieldIcon),
  //                                                 hint: Text(S
  //                                                     .of(context)
  //                                                     .selectProgram),
  //                                                 value: updatedProgram,
  //                                                 items: allPrograms!
  //                                                     .map(_buildDropdownItem)
  //                                                     .toList(),
  //                                                 onChanged: (value) {
  //                                                   setState(() {
  //                                                     updatedProgram = value;
  //                                                   });
  //                                                 },
  //                                               ),
  //                                               const SizedBox(height: 20),
  //                                               Row(
  //                                                 mainAxisAlignment:
  //                                                     MainAxisAlignment
  //                                                         .spaceBetween,
  //                                                 children: [
  //                                                   CustomDateFieldPicker(
  //                                                       oldDate: updatedDate,
  //                                                       onDateSelected:
  //                                                           (DateTime date) {
  //                                                         setState(() {
  //                                                           selectedDateFromPicker =
  //                                                               DateFormat(
  //                                                                       'yyyy-MM-dd')
  //                                                                   .format(
  //                                                                       date);
  //                                                         });
  //                                                       },
  //                                                       textLabel: S
  //                                                           .of(context)
  //                                                           .chooseDateHint),
  //                                                   CustomTimeFieldPicker(
  //                                                     oldTime: updatedTime,
  //                                                     textLabel: S
  //                                                         .of(context)
  //                                                         .chooseTimeHint,
  //                                                     onTimeSelected:
  //                                                         (TimeOfDay time) {
  //                                                       setState(() {
  //                                                         selectedTimeFromPicker =
  //                                                             '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
  //                                                       });
  //                                                     },
  //                                                   ),
  //                                                 ],
  //                                               ),
  //                                               const SizedBox(height: 30),
  //                                               Center(
  //                                                 child: InkWell(
  //                                                   onTap: () {},
  //                                                   child: CustomMainButton(
  //                                                     isSuccess: state
  //                                                         is AdminSettingsSuccess,
  //                                                     isLoading: state
  //                                                         is AdminSettingsLoading,
  //                                                     buttonText: S
  //                                                         .of(context)
  //                                                         .updateGroupButton,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       );
  //                                     },
  //                                   );
  //                                 },
  //                               );


  //  IconButton(
  //                 onPressed: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     isScrollControlled: true,
  //                     builder: (context) {
  //                       return BlocBuilder<AdminSettingsCubit,
  //                           AdminSettingsState>(
  //                         builder: (context, state) {
  //                           return DraggableScrollableSheet(
  //                             initialChildSize: 0.4,
  //                             minChildSize: 0.3,
  //                             maxChildSize: 0.9,
  //                             expand: false,
  //                             builder: (context, scrollController) {
  //                               return SingleChildScrollView(
  //                                 controller: scrollController,
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(16.0),
  //                                   child: Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       Center(
  //                                         child: Container(
  //                                           width: 50,
  //                                           height: 5,
  //                                           decoration: BoxDecoration(
  //                                             color: Colors.grey[300],
  //                                             borderRadius:
  //                                                 BorderRadius.circular(10),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       const SizedBox(height: 20),
  //                                       Text(
  //                                         S.of(context).updatProgramName,
  //                                         style: AppStyles.styleSemiBold20W600,
  //                                       ),
  //                                       const SizedBox(height: 20),
  //                                       DropdownButtonFormField<String>(
  //                                         iconSize: 24,
  //                                         icon: AppIcons.dropDownMenuIcon,
  //                                         decoration: _dropdownDecoration(),
  //                                         hint: Text(S.of(context).selectGroup),
  //                                         value: _selectedGroup,
  //                                         items: dropdownItems!
  //                                             .map(_buildDropdownItem)
  //                                             .toList(),
  //                                         onChanged: (value) {
  //                                           setState(
  //                                               () => _selectedGroup = value);
  //                                         },
  //                                       ),
  //                                       DropdownButtonFormField<String>(
  //                                         iconSize: 24,
  //                                         icon: AppIcons.dropDownMenuIcon,
  //                                         decoration: _dropdownDecoration(
  //                                             icon: AppIcons.programFieldIcon),
  //                                         hint:
  //                                             Text(S.of(context).selectProgram),
  //                                         value: _selectedProgram,
  //                                         items: allPrograms!
  //                                             .map(_buildDropdownItem)
  //                                             .toList(),
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             _selectedProgram = value;
  //                                           });
  //                                           context
  //                                               .read<AdminSettingsCubit>()
  //                                               .getProgramDataForUpdate(
  //                                                 _selectedGroup,
  //                                                 _selectedProgram,
  //                                               );
  //                                         },
  //                                       ),
  //                                       const SizedBox(height: 20),
  //                                       DropdownButtonFormField<String>(
  //                                         iconSize: 24,
  //                                         icon: AppIcons.dropDownMenuIcon,
  //                                         decoration: _dropdownDecoration(
  //                                             icon: AppIcons.programFieldIcon),
  //                                         hint:
  //                                             Text(S.of(context).selectProgram),
  //                                         value: updatedProgram,
  //                                         items: allPrograms!
  //                                             .map(_buildDropdownItem)
  //                                             .toList(),
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             updatedProgram = value;
  //                                           });
  //                                         },
  //                                       ),
  //                                       const SizedBox(height: 30),
  //                                       Center(
  //                                         child: InkWell(
  //                                           onTap: () {
  //                                             // إضافة منطق التحديث هنا إذا لزم الأمر
  //                                           },
  //                                           child: CustomMainButton(
  //                                             isSuccess: state
  //                                                 is DataProgramForUpdateSuccess,
  //                                             isLoading:
  //                                                 state is AdminSettingsLoading,
  //                                             buttonText: S
  //                                                 .of(context)
  //                                                 .updateGroupButton,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               );
  //                             },
  //                           );
  //                         },
  //                       );
  //                     },
  //                   );
  //                 },
  //                 icon: const Icon(Icons.abc, color: Colors.amber),
  //               ),