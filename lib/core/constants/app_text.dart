// ignore_for_file: constant_identifier_names

import '../utils/app_images.dart';

class AppTexts {
  //Auth
  static const String signInHeader = 'Sign in';
  static const String signUpHeader = 'Sign up';
  static const String verfiyHeader = 'Verfiy';
  static const String resetPasswordHeader = 'Reset Password';
  static const String settingsHeader = 'Settings';
  static const String staffHeader = 'Sara Staff Here For you';
  static const String momentsHeader =
      'The Great Moments \nDeserve Preservation';

  static const String signInTextButton = 'SIGN IN';
  static const String signUpTextButton = 'SIGN UP';

  static const String verfiyTextButton = 'Verfiy';
  static const String saveTextButton = 'Save';

  //
  static const String groupDropDown = 'Group';

  static const String mailHintText = 'example@gmail.com';
  static const String fullNameHintText = 'Full name';
  static const String passwordHintText = "Your password";
  static const String confirmPasswordHintText = "Rewrite the password";

  static const String groupHintText = "write group code if you have one ";

  static const String forgetPassword = 'Forget Password?';
  static const String dontHaveAccount = "Don't have an account?";

  //api constants
  static const String loginApi = '/login';
  static const String registerApi = '/register';
  static const String verfiyEmailApi = '/verify_email';
  static const String resetPasswordApi = '/reset_password';
  static const String logoutApi = '/logout';
  static const String staffLogoutApi = '/staff_logout';
  static const String getStaffApi = '/get_staff';
  static const String addGroupApi = '/add_group';
  static const String getGroupApi = '/get_group';
  static const String updateUserGroupApi = '/update_user_group';
  static const String updateGroupNameApi = '/update-group-name';
  static const String deleteGroupNameApi = '/delete-group-name';
//program
  static const String addProgramApi = '/add_program';
  static const String getProgramApi = '/get_program';
  static const String getAllProgramsForGroupApi = '/get-all-programs';
  static const String getProgramsForTodayApi = '/get-programs-for-today';
  static const String updateProgramForGroupApi = '/update-program';
  static const String deleteProgramApi = '/delete-program';

  // static const String addStaffApi = '/addStaff';

  //handle Exceptions
  static const String noInternetException =
      'No internet connection. Please check your connection and try again.';
  static const String timeOutException =
      'The connection timed out. Please try again later.';
  static const String dontHaveAccountException =
      'try correct your email please';
  static const String wrongPasswordException =
      'password wrong .try write the correct password';
  static const String verfiyEmailException =
      'The entered email does not exist.try to correct the email or sign up ';
  static const String generalException =
      'An unknown error occurred,sorry we will fix the error as soon as possible';
  static const String unUniqueEmailException =
      'email already exist, try write another email';
  static const String noStaffAddedException =
      'staff will be shown when trip started';
  static const String cantAddGroupException =
      'Cannot add a group now. Try again later, or contact the application administrator';
  static const String groupNameExistException =
      'Group already exist,write another name';
  static const String unAuthrizedUserException =
      'You must be an admin, you are not authorized';

  static const String noInternetException_ar =
      'لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.';
  static const String timeOutException_ar =
      'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى لاحقًا.';
  static const String dontHaveAccountException_ar =
      'يرجى تصحيح بريدك الإلكتروني.';
  static const String wrongPasswordException_ar =
      'كلمة المرور خاطئة. يرجى كتابة كلمة المرور الصحيحة.';
  static const String verfiyEmailException_ar =
      'البريد الإلكتروني المدخل غير موجود. يرجى تصحيح البريد الإلكتروني أو التسجيل.';
  static const String generalException_ar =
      'حدث خطأ غير معروف، نعتذر وسنقوم بإصلاح الخطأ في أقرب وقت ممكن.';
  static const String unUniqueEmailException_ar =
      'البريد الإلكتروني موجود بالفعل، يرجى كتابة بريد إلكتروني آخر.';
  static const String noStaffAddedException_ar =
      'سيتم اضافة الفريق عند بدأ الرحلة ';
  static const String cantAddGroupException_ar =
      'لايمكن اضافة مجموعة الان حاول لاحقا, او تواصل مع مشرف التطبيق';
  static const String groupNameExistException_ar =
      'اسم المجموعة موجود بالفعل ,حاول كتباة اسم اخر';
  static const String unAuthrizedUserException_ar =
      'يجب ان تكون الادمن ,غير مصرح لك';

  // validation
  static const String nameRequired = 'Please enter your full name';
  static const String nameInvalid = 'Please enter a valid name';
  static const String nameTooShort = 'Your name is too short';
  static const String emailRequired = 'Please enter your email';
  static const String emailInvalid = 'Please enter a valid email';
  static const String emailEnglishOnly = 'Email must be in English';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordInvalid =
      'Password must contain at least 8 characters, including letters and numbers';

  // الإنجليزية
  static const String loginSuccess = 'Login successful:';
  static const String loginFailure = 'Login failed: ';
  static const String signUpSuccess = 'Sign up successful: ';
  static const String signUpFailure =
      'Sign up failed: Could not create account.';
  static const String verificationSuccess = 'Email verified successfully.';
  static const String verificationFailure = 'Verification failed: ';
  static const String resetPasswordSuccess = 'Password reset successful.';
  static const String resetPasswordFailure = 'Password reset failed: ';
  static const String signOutSuccess = 'Sign out successful.';
  static const String signOutFailure = 'Sign out failed: ';

  // العربية
  static const String loginSuccess_ar = 'تسجيل الدخول بنجاح:';
  static const String loginFailure_ar = 'فشل تسجيل الدخول: ';
  static const String signUpSuccess_ar = 'تم التسجيل بنجاح: ';
  static const String signUpFailure_ar =
      'فشل التسجيل: لم يتمكن من إنشاء الحساب.';
  static const String verificationSuccess_ar =
      'تم التحقق من البريد الإلكتروني بنجاح.';
  static const String verificationFailure_ar = 'فشل التحقق: ';
  static const String resetPasswordSuccess_ar =
      'تم إعادة تعيين كلمة المرور بنجاح.';
  static const String resetPasswordFailure_ar = 'فشل إعادة تعيين كلمة المرور: ';
  static const String signOutSuccess_ar = 'تسجيل الخروج بنجاح.';
  static const String signOutFailure_ar = 'فشل تسجيل الخروج: ';

//staff
  static const String staffAddSuccess = 'member added successfuly';
  static const String staffAddFailure = 'failed to add member ';

  static const String staffAddFailure_ar = 'فشل اضافة العضو ';
  static const String staffAddSuccess_ar = 'تم تسجيل العضو بنجاح';

  //

  //support
  static const String supportNumber = '966530869297';
  static const String supoortText = 'Hi, I need help plz';

  //guied section
  static const String umrahGuiedLabel = 'Umrah Guide';
  static const String madinaGuiedLabel = 'Madina Guide';
  static const String mazaratGuiedLabel = 'Mazarat Guide';
  static const String umrahGuiedLinke =
      'https://media1.haj.gov.sa/storage/uploads/EN-105.pdf';
  static const String madinaGuiedLinke =
      'https://media1.haj.gov.sa/storage/uploads/EN-106.pdf';
  static const String mazaratGuiedLinke =
      'https://media1.haj.gov.sa/storage/uploads/EN-109.pdf';
  //
  static const List<Map<String, String>> guiedItems = [
    {
      'image': AppImages.umrahGuiedImage,
      'label': umrahGuiedLabel,
      'link': umrahGuiedLinke,
    },
    {
      'image': AppImages.madinGuiedImage,
      'label': madinaGuiedLabel,
      'link': madinaGuiedLinke,
    },
    {
      'image': AppImages.mazaratGuiedImage,
      'label': mazaratGuiedLabel,
      'link': mazaratGuiedLinke,
    },
  ];
}
