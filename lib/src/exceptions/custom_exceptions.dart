class MyExceptions implements Exception {
  /// the associate error message
  final String message;

  ///{@macro login_with_email_and_password_failure }
  const MyExceptions([this.message = " An unknown exception occurred."]);

  /// create an authentication message
/// from a firebase authentication exception code

factory MyExceptions.fromCode(String code){
    switch (code){
      case 'email-already-in-use':
      return const MyExceptions('Email already exists.');
      case 'invalid-email':
      return const MyExceptions('Email is not valid or badly formatted.');
      case 'weak password':
      return const MyExceptions('Please enter a strong password.');
      case 'user-disabled':
      return const MyExceptions('This user has been disabled. please contact support for help.');
      case 'user-not-found':
      return const MyExceptions('Invalid Details, please create an account.');
      case 'wrong-password':
      return const MyExceptions('Incorrect password, please try again.');
      case 'too-many-request':
      return const MyExceptions('Too many request, service currently blocked.');
      case 'invalid-argument':
      return const MyExceptions('An invalid argument was provided to an Authentication method.');
      case 'invalid-password':
      return const MyExceptions('Incorrect password, please try again.');
      case 'invalid-phone-number':
      return const MyExceptions('The provided phone number is invalid.');
      case 'operator-not-allowed':
      return const MyExceptions('The provided sign-in provider is disabled for your firebase project.');
      case 'session-cookie-expired':
      return const MyExceptions('The provided firebase cookie session has expired.');
      case 'uid-already-exist':
      return const MyExceptions('The provided uid is already in use by another user.');
      default:
        return const MyExceptions('');
    }
}
}