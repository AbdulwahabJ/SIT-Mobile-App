class AppTexts {
  //Auth
  static const String signInHeader = 'Sign in';
  static const String signUpHeader = 'Sign up';
  static const String verfiyHeader = 'Verfiy';
  static const String resetPasswordHeader = 'Reset Password';

  static const String signInTextButton = 'SIGN IN';
  static const String signUpTextButton = 'SIGN UP';
  static const String verfiyTextButton = 'Verfiy';
  static const String saveTextButton = 'Save';

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
}
