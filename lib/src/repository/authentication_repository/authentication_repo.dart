// Import Firebase Authentication and Core
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowchat_app/src/exceptions/custom_exceptions.dart';
// Import custom exception handler for sign-up errors
import 'package:flowchat_app/src/exceptions/signup_password_email_failure.dart';
import 'package:flowchat_app/src/features/authentication/mail_verification/mail_verification.dart';
// Import GetX for state management and navigation
import 'package:get/get.dart';
import '../../features/core/screens/homepage.dart';
import '../../features/core/screens/welcome_page.dart';

// Create a controller for managing authentication
class AuthenticationRepo extends GetxController {
  // Singleton pattern to easily access the instance from anywhere
  static AuthenticationRepo get instance => Get.find();
  // Firebase authentication instance
  final _auth = FirebaseAuth.instance;
  // Reactive variable to listen to user authentication changes
  late final Rx<User?> _firebaseUser;
  // Observable string to store verification ID (used for OTP mail_verification)
  var verificationId = "".obs;
  // Loading state (e.g., for showing spinners)
  var isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading =false.obs;

  /// getters
User? get firebaseUser => _firebaseUser.value;
String get getUserID => firebaseUser?.uid ?? "";
String get getUserEmail => firebaseUser?.email ?? "";

  /// load when the app   lunches fro the main.dart
  @override
  void onReady() {
    // Initialize reactive firebase user and bind to mail_verification state changes
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(_firebaseUser.value);
    // Automatically set initial screen depending on login state
    // ever(firebaseUser, _setInitialScreen);
  }

  // Navigates the user to WelcomePage or Homepage based on login state(if the user is logged in or logged out)
  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomePage())  // Not logged in
        : user.emailVerified ? Get.offAll(() => const Homepage()): Get.offAll(MailVerification());   // Logged in
  }

  /// [Email verificaiton] - Register
  // Creates a new user with email and password
  Future<String?> createUserWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate based on whether user creation was successful
      _firebaseUser.value != null
          ? Get.offAll(() => const Homepage())
          : Get.offAll(() => const WelcomePage());

    } on FirebaseAuthException catch (e) {
      // Handle Firebase exceptions and convert to user-friendly message
      final ex = SignupWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      // Fallback for unexpected exceptions
      var ex = SignupWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
    }
    return null;
  }


  /// [Email verificaiton] - Verification
Future<void> sendEmailVerification() async{
    try {
     await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // Handle Firebase exceptions and convert to user-friendly message
      final ex = MyExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      // Fallback for unexpected exceptions
      const ex = MyExceptions();
      throw ex.message;
    }
}


  /// [Email verificaiton] - login
  // Logs in existing user with email and password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the appropriate screen after login
      _firebaseUser.value != null
          ? Get.offAll(() => const Homepage())
          : Get.offAll(() => const WelcomePage());

    } on FirebaseAuthException {
      // Handle login-specific Firebase errors here (currently ignored)
    } catch (_) {
      // Fallback for unexpected errors (currently ignored)
    }
  }

  // Start phone authentication by sending an OTP
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo, // Phone number to verify

      // Auto verification success (e.g., when OTP auto-retrieved)
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },

      // Handle errors during phone verification
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The provided phone number is not valid");
        } else {
          Get.snackbar("Error", "$e");
        }
      },

      // Called when the OTP has been successfully sent
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },

      // Called when the OTP auto-retrieval times out
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  // Verifies the OTP entered by the user
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp, // User-entered OTP
      ),
    );

    // Return true if login was successful
    return credentials.user != null ? true : false;
  }




  // Logs out the currently authenticated user
  Future<void> logout() async => await _auth.signOut();
}
