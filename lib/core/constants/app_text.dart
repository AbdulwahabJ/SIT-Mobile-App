class AppTexts {
  //sign in Screen
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
  static const String codeHintText = "Code";

  static const String forgetPassword = 'Forget Password?';
  static const String dontHaveAccount = "Don't have an account?";

  //api constants
  static const String loginApi = '/login';
  static const String registerApi = '/register';
  static const String verfiyEmailApi = '/verify_email';
  static const String resetPasswordApi = '/reset_password';

  //handle Exceptions texts
  static const String noInternetException =
      'No internet connection. Please check your connection and try again.';
  static const String timeOutException =
      'The connection timed out. Please try again later.';
  static const String dontHaveAccountException =
      'it\'s looks you don\'t have an account.please sign up first';
  static const String wrongPasswordException =
      'password wrong .try write the correct password';
  static const String verfiyEmailException =
      'The entered email does not exist.try sign up first';
  static const String generalException =
      'An unknown error occurred,sorry we will fix the error as soon as possible';
}
