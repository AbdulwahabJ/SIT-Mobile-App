// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
<<<<<<< HEAD
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{};
=======
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "English": MessageLookupByLibrary.simpleMessage("English"),
        "Name": MessageLookupByLibrary.simpleMessage(" name"),
        "Password": MessageLookupByLibrary.simpleMessage(" password"),
        "PasswordsNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "Upload": MessageLookupByLibrary.simpleMessage("Upload"),
        "Urdu": MessageLookupByLibrary.simpleMessage("Urdu"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addGroupHeader": MessageLookupByLibrary.simpleMessage("New Group"),
        "addMomentsHeader": MessageLookupByLibrary.simpleMessage("New Moments"),
        "addProgramHeader": MessageLookupByLibrary.simpleMessage("New Program"),
        "chooseDateHint": MessageLookupByLibrary.simpleMessage("choose date"),
        "chooseTimeHint": MessageLookupByLibrary.simpleMessage("choose time"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage(
            "Please confirm your password"),
        "confirmYourPassword":
            MessageLookupByLibrary.simpleMessage("rewrite your password"),
        "deletGroupButton": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteGroupHeader":
            MessageLookupByLibrary.simpleMessage("Delete Group"),
        "deleteProgramHeader":
            MessageLookupByLibrary.simpleMessage("Delete Program"),
        "dialogCancelButton": MessageLookupByLibrary.simpleMessage("cancel"),
        "dialogDeleteHeader":
            MessageLookupByLibrary.simpleMessage("Confirm Deletion"),
        "dialogDeleteQuestion":
            MessageLookupByLibrary.simpleMessage("sure you want to delete?"),
        "dialogDeleteQuestionStaff": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to remove this employee?"),
        "dialogYesButton": MessageLookupByLibrary.simpleMessage("yes"),
        "dontHaveAccountException": MessageLookupByLibrary.simpleMessage(
            "Try correcting your email please."),
        "dontHaveaccount":
            MessageLookupByLibrary.simpleMessage("Dont\'t have an account?"),
        "editGroupHeader": MessageLookupByLibrary.simpleMessage("Edit Group"),
        "editProgramButton": MessageLookupByLibrary.simpleMessage("Edit"),
        "editProgramHeader":
            MessageLookupByLibrary.simpleMessage("Edit Program"),
        "emailEnglishOnly":
            MessageLookupByLibrary.simpleMessage("Email must be in English."),
        "emailInvalid":
            MessageLookupByLibrary.simpleMessage("Please enter a valid email."),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your email."),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget Password?"),
        "formValidation":
            MessageLookupByLibrary.simpleMessage("complete all field please"),
        "generalException": MessageLookupByLibrary.simpleMessage(
            "An unknown error occurred.\n Sorry, we will fix the error as soon as possible."),
        "group": MessageLookupByLibrary.simpleMessage("Group"),
        "groupName": MessageLookupByLibrary.simpleMessage("Group Name"),
        "groups": MessageLookupByLibrary.simpleMessage("Groups"),
        "have_a_nice_day":
            MessageLookupByLibrary.simpleMessage("have a nice day"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "holyMosques": MessageLookupByLibrary.simpleMessage("Holy Mosques"),
        "imageSelected": MessageLookupByLibrary.simpleMessage("image selected"),
        "languages": MessageLookupByLibrary.simpleMessage("languages"),
        "languagesRequired":
            MessageLookupByLibrary.simpleMessage("languages required"),
        "loginFailure": MessageLookupByLibrary.simpleMessage("Login failed: "),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login successful:"),
        "madinaGuiedLabel":
            MessageLookupByLibrary.simpleMessage("Madina Guied"),
        "mazarat": MessageLookupByLibrary.simpleMessage("Mazarat"),
        "mazaratGuiedLabel":
            MessageLookupByLibrary.simpleMessage("Mazarat Guied"),
        "memberPhoto":
            MessageLookupByLibrary.simpleMessage("upload member photo"),
        "momentsPhoto": MessageLookupByLibrary.simpleMessage("upload photos"),
        "momentsScreenHeader": MessageLookupByLibrary.simpleMessage(
            "The Great Moments \nDeserve Preservation"),
        "nameInvalid":
            MessageLookupByLibrary.simpleMessage("Please enter a valid name."),
        "nameRequired": MessageLookupByLibrary.simpleMessage(
            "Please enter your full name."),
        "nameTooShort":
            MessageLookupByLibrary.simpleMessage("Your name is too short."),
        "newStaffMember":
            MessageLookupByLibrary.simpleMessage("New Staff Member"),
        "noInternetException": MessageLookupByLibrary.simpleMessage(
            "No internet connection. \nPlease check your connection and try again."),
        "passwordInvalid": MessageLookupByLibrary.simpleMessage(
            "8 letters and numbers at lest."),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your password."),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("phone number"),
        "phoneNumberInvalid":
            MessageLookupByLibrary.simpleMessage(" phone number invalid"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("phone number required"),
        "photoRequired": MessageLookupByLibrary.simpleMessage("photo required"),
        "programs": MessageLookupByLibrary.simpleMessage("Programs"),
        "religiousLectures":
            MessageLookupByLibrary.simpleMessage("Religious Lectures"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordFailure":
            MessageLookupByLibrary.simpleMessage("Password reset failed: "),
        "resetPasswordSuccess":
            MessageLookupByLibrary.simpleMessage("Password reset successful."),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectGroup": MessageLookupByLibrary.simpleMessage("Select Group"),
        "selectProgram": MessageLookupByLibrary.simpleMessage("Select Program"),
        "selectSection": MessageLookupByLibrary.simpleMessage("Select Section"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "sign": MessageLookupByLibrary.simpleMessage("SIGN"),
        "signInButton": MessageLookupByLibrary.simpleMessage("SIGN IN"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "signOutFailure":
            MessageLookupByLibrary.simpleMessage("Sign out failed: "),
        "signOutSuccess":
            MessageLookupByLibrary.simpleMessage("Sign out successful."),
        "signUp": MessageLookupByLibrary.simpleMessage("SIGN UP"),
        "signUpFailure": MessageLookupByLibrary.simpleMessage(
            "Sign up failed: Could not create account."),
        "signUpSuccess":
            MessageLookupByLibrary.simpleMessage("Sign up successful: "),
        "signin": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signup": MessageLookupByLibrary.simpleMessage("Sign up"),
        "staffMessage": MessageLookupByLibrary.simpleMessage(
            "What an honor it is to serve the guests of Allah\n isn\'t it?"),
        "staffScreenHeader":
            MessageLookupByLibrary.simpleMessage("Sara Staff Here For You"),
        "support": MessageLookupByLibrary.simpleMessage("Support"),
        "timeOutException": MessageLookupByLibrary.simpleMessage(
            "The connection timed out.\n Please try again later."),
        "todayProgram": MessageLookupByLibrary.simpleMessage("Today Program"),
        "umrahGuiedLabel": MessageLookupByLibrary.simpleMessage("Umrah Guied"),
        "unUniqueEmailException": MessageLookupByLibrary.simpleMessage(
            "Email already exists, \ntry writing another email."),
        "updatGroupName":
            MessageLookupByLibrary.simpleMessage("update group name"),
        "updatGroupNameHint": MessageLookupByLibrary.simpleMessage("new name"),
        "updatProgramName":
            MessageLookupByLibrary.simpleMessage("update program"),
        "updateGroupButton": MessageLookupByLibrary.simpleMessage("Update"),
        "verf": MessageLookupByLibrary.simpleMessage("Verfiy"),
        "verfiy": MessageLookupByLibrary.simpleMessage("Verfiy"),
        "verfiyEmailException": MessageLookupByLibrary.simpleMessage(
            "The entered email does not exist.\n Try to correct the email or sign up."),
        "verificationFailure":
            MessageLookupByLibrary.simpleMessage("Verification failed: "),
        "verificationSuccess": MessageLookupByLibrary.simpleMessage(
            "Email verified successfully."),
        "writeGroupCode": MessageLookupByLibrary.simpleMessage(
            "write group code if you have one"),
        "wrongPasswordException": MessageLookupByLibrary.simpleMessage(
            "Password wrong. \nTry writing the correct password.")
      };
>>>>>>> 47338f986d4f1bc1ef8249f63083fb3e07f4ad93
}
