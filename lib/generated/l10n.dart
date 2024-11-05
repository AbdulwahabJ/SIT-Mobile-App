// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `have a nice day`
  String get have_a_nice_day {
    return Intl.message(
      'have a nice day',
      name: 'have_a_nice_day',
      desc: '',
      args: [],
    );
  }

  /// `Today Program`
  String get todayProgram {
    return Intl.message(
      'Today Program',
      name: 'todayProgram',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Urdu`
  String get Urdu {
    return Intl.message(
      'Urdu',
      name: 'Urdu',
      desc: '',
      args: [],
    );
  }

  /// `Umrah Guied`
  String get umrahGuiedLabel {
    return Intl.message(
      'Umrah Guied',
      name: 'umrahGuiedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Madina Guied`
  String get madinaGuiedLabel {
    return Intl.message(
      'Madina Guied',
      name: 'madinaGuiedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Mazarat Guied`
  String get mazaratGuiedLabel {
    return Intl.message(
      'Mazarat Guied',
      name: 'mazaratGuiedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Select Group`
  String get selectGroup {
    return Intl.message(
      'Select Group',
      name: 'selectGroup',
      desc: '',
      args: [],
    );
  }

  /// `Select Program`
  String get selectProgram {
    return Intl.message(
      'Select Program',
      name: 'selectProgram',
      desc: '',
      args: [],
    );
  }

  /// `Select Section`
  String get selectSection {
    return Intl.message(
      'Select Section',
      name: 'selectSection',
      desc: '',
      args: [],
    );
  }

  /// `SIGN`
  String get sign {
    return Intl.message(
      'SIGN',
      name: 'sign',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Verfiy`
  String get verfiy {
    return Intl.message(
      'Verfiy',
      name: 'verfiy',
      desc: '',
      args: [],
    );
  }

  /// `Verfiy`
  String get verf {
    return Intl.message(
      'Verfiy',
      name: 'verf',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUp {
    return Intl.message(
      'SIGN UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signInButton {
    return Intl.message(
      'SIGN IN',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// ` name`
  String get Name {
    return Intl.message(
      ' name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phoneNumber {
    return Intl.message(
      'phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` password`
  String get Password {
    return Intl.message(
      ' password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `rewrite your password`
  String get confirmYourPassword {
    return Intl.message(
      'rewrite your password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `write group code if you have one`
  String get writeGroupCode {
    return Intl.message(
      'write group code if you have one',
      name: 'writeGroupCode',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Dont't have an account?`
  String get dontHaveaccount {
    return Intl.message(
      'Dont\'t have an account?',
      name: 'dontHaveaccount',
      desc: '',
      args: [],
    );
  }

  /// `Sara Staff Here For You`
  String get staffScreenHeader {
    return Intl.message(
      'Sara Staff Here For You',
      name: 'staffScreenHeader',
      desc: '',
      args: [],
    );
  }

  /// `The Great Moments \nDeserve Preservation`
  String get momentsScreenHeader {
    return Intl.message(
      'The Great Moments \nDeserve Preservation',
      name: 'momentsScreenHeader',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. \nPlease check your connection and try again.`
  String get noInternetException {
    return Intl.message(
      'No internet connection. \nPlease check your connection and try again.',
      name: 'noInternetException',
      desc: '',
      args: [],
    );
  }

  /// `The connection timed out.\n Please try again later.`
  String get timeOutException {
    return Intl.message(
      'The connection timed out.\n Please try again later.',
      name: 'timeOutException',
      desc: '',
      args: [],
    );
  }

  /// `Try correcting your email please.`
  String get dontHaveAccountException {
    return Intl.message(
      'Try correcting your email please.',
      name: 'dontHaveAccountException',
      desc: '',
      args: [],
    );
  }

  /// `Password wrong. \nTry writing the correct password.`
  String get wrongPasswordException {
    return Intl.message(
      'Password wrong. \nTry writing the correct password.',
      name: 'wrongPasswordException',
      desc: '',
      args: [],
    );
  }

  /// `The entered email does not exist.\n Try to correct the email or sign up.`
  String get verfiyEmailException {
    return Intl.message(
      'The entered email does not exist.\n Try to correct the email or sign up.',
      name: 'verfiyEmailException',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.\n Sorry, we will fix the error as soon as possible.`
  String get generalException {
    return Intl.message(
      'An unknown error occurred.\n Sorry, we will fix the error as soon as possible.',
      name: 'generalException',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists, \ntry writing another email.`
  String get unUniqueEmailException {
    return Intl.message(
      'Email already exists, \ntry writing another email.',
      name: 'unUniqueEmailException',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name.`
  String get nameRequired {
    return Intl.message(
      'Please enter your full name.',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name.`
  String get nameInvalid {
    return Intl.message(
      'Please enter a valid name.',
      name: 'nameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Your name is too short.`
  String get nameTooShort {
    return Intl.message(
      'Your name is too short.',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email.`
  String get emailRequired {
    return Intl.message(
      'Please enter your email.',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email.`
  String get emailInvalid {
    return Intl.message(
      'Please enter a valid email.',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Email must be in English.`
  String get emailEnglishOnly {
    return Intl.message(
      'Email must be in English.',
      name: 'emailEnglishOnly',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password.`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password.',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `8 letters and numbers at lest.`
  String get passwordInvalid {
    return Intl.message(
      '8 letters and numbers at lest.',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `phone number required`
  String get phoneNumberRequired {
    return Intl.message(
      'phone number required',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `languages required`
  String get languagesRequired {
    return Intl.message(
      'languages required',
      name: 'languagesRequired',
      desc: '',
      args: [],
    );
  }

  /// ` phone number invalid`
  String get phoneNumberInvalid {
    return Intl.message(
      ' phone number invalid',
      name: 'phoneNumberInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get PasswordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'PasswordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Login successful:`
  String get loginSuccess {
    return Intl.message(
      'Login successful:',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login failed: `
  String get loginFailure {
    return Intl.message(
      'Login failed: ',
      name: 'loginFailure',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful: `
  String get signUpSuccess {
    return Intl.message(
      'Sign up successful: ',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failed: Could not create account.`
  String get signUpFailure {
    return Intl.message(
      'Sign up failed: Could not create account.',
      name: 'signUpFailure',
      desc: '',
      args: [],
    );
  }

  /// `Email verified successfully.`
  String get verificationSuccess {
    return Intl.message(
      'Email verified successfully.',
      name: 'verificationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed: `
  String get verificationFailure {
    return Intl.message(
      'Verification failed: ',
      name: 'verificationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successful.`
  String get resetPasswordSuccess {
    return Intl.message(
      'Password reset successful.',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Password reset failed: `
  String get resetPasswordFailure {
    return Intl.message(
      'Password reset failed: ',
      name: 'resetPasswordFailure',
      desc: '',
      args: [],
    );
  }

  /// `Sign out successful.`
  String get signOutSuccess {
    return Intl.message(
      'Sign out successful.',
      name: 'signOutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign out failed: `
  String get signOutFailure {
    return Intl.message(
      'Sign out failed: ',
      name: 'signOutFailure',
      desc: '',
      args: [],
    );
  }

  /// `photo required`
  String get photoRequired {
    return Intl.message(
      'photo required',
      name: 'photoRequired',
      desc: '',
      args: [],
    );
  }

  /// `New Staff Member`
  String get newStaffMember {
    return Intl.message(
      'New Staff Member',
      name: 'newStaffMember',
      desc: '',
      args: [],
    );
  }

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `upload member photo`
  String get memberPhoto {
    return Intl.message(
      'upload member photo',
      name: 'memberPhoto',
      desc: '',
      args: [],
    );
  }

  /// `upload photos`
  String get momentsPhoto {
    return Intl.message(
      'upload photos',
      name: 'momentsPhoto',
      desc: '',
      args: [],
    );
  }

  /// `image selected`
  String get imageSelected {
    return Intl.message(
      'image selected',
      name: 'imageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get Upload {
    return Intl.message(
      'Upload',
      name: 'Upload',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updateGroupButton {
    return Intl.message(
      'Update',
      name: 'updateGroupButton',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deletGroupButton {
    return Intl.message(
      'Delete',
      name: 'deletGroupButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editProgramButton {
    return Intl.message(
      'Edit',
      name: 'editProgramButton',
      desc: '',
      args: [],
    );
  }

  /// `What an honor it is to serve the guests of Allah\n isn't it?`
  String get staffMessage {
    return Intl.message(
      'What an honor it is to serve the guests of Allah\n isn\'t it?',
      name: 'staffMessage',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Programs`
  String get programs {
    return Intl.message(
      'Programs',
      name: 'programs',
      desc: '',
      args: [],
    );
  }

  /// `New Group`
  String get addGroupHeader {
    return Intl.message(
      'New Group',
      name: 'addGroupHeader',
      desc: '',
      args: [],
    );
  }

  /// `Edit Group`
  String get editGroupHeader {
    return Intl.message(
      'Edit Group',
      name: 'editGroupHeader',
      desc: '',
      args: [],
    );
  }

  /// `Delete Group`
  String get deleteGroupHeader {
    return Intl.message(
      'Delete Group',
      name: 'deleteGroupHeader',
      desc: '',
      args: [],
    );
  }

  /// `New Program`
  String get addProgramHeader {
    return Intl.message(
      'New Program',
      name: 'addProgramHeader',
      desc: '',
      args: [],
    );
  }

  /// `Edit Program`
  String get editProgramHeader {
    return Intl.message(
      'Edit Program',
      name: 'editProgramHeader',
      desc: '',
      args: [],
    );
  }

  /// `Delete Program`
  String get deleteProgramHeader {
    return Intl.message(
      'Delete Program',
      name: 'deleteProgramHeader',
      desc: '',
      args: [],
    );
  }

  /// `update program`
  String get updatProgramName {
    return Intl.message(
      'update program',
      name: 'updatProgramName',
      desc: '',
      args: [],
    );
  }

  /// `Group Name`
  String get groupName {
    return Intl.message(
      'Group Name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `update group name`
  String get updatGroupName {
    return Intl.message(
      'update group name',
      name: 'updatGroupName',
      desc: '',
      args: [],
    );
  }

  /// `new name`
  String get updatGroupNameHint {
    return Intl.message(
      'new name',
      name: 'updatGroupNameHint',
      desc: '',
      args: [],
    );
  }

  /// `choose date`
  String get chooseDateHint {
    return Intl.message(
      'choose date',
      name: 'chooseDateHint',
      desc: '',
      args: [],
    );
  }

  /// `choose time`
  String get chooseTimeHint {
    return Intl.message(
      'choose time',
      name: 'chooseTimeHint',
      desc: '',
      args: [],
    );
  }

  /// `New Moments`
  String get addMomentsHeader {
    return Intl.message(
      'New Moments',
      name: 'addMomentsHeader',
      desc: '',
      args: [],
    );
  }

  /// `complete all field please`
  String get formValidation {
    return Intl.message(
      'complete all field please',
      name: 'formValidation',
      desc: '',
      args: [],
    );
  }

  /// `Holy Mosques`
  String get holyMosques {
    return Intl.message(
      'Holy Mosques',
      name: 'holyMosques',
      desc: '',
      args: [],
    );
  }

  /// `Mazarat`
  String get mazarat {
    return Intl.message(
      'Mazarat',
      name: 'mazarat',
      desc: '',
      args: [],
    );
  }

  /// `Religious Lectures`
  String get religiousLectures {
    return Intl.message(
      'Religious Lectures',
      name: 'religiousLectures',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Deletion`
  String get dialogDeleteHeader {
    return Intl.message(
      'Confirm Deletion',
      name: 'dialogDeleteHeader',
      desc: '',
      args: [],
    );
  }

  /// `sure you want to delete?`
  String get dialogDeleteQuestion {
    return Intl.message(
      'sure you want to delete?',
      name: 'dialogDeleteQuestion',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get dialogYesButton {
    return Intl.message(
      'yes',
      name: 'dialogYesButton',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get dialogCancelButton {
    return Intl.message(
      'cancel',
      name: 'dialogCancelButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
