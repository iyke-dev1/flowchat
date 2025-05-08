
class SignupWithEmailAndPasswordFailure{
  final String message;

SignupWithEmailAndPasswordFailure([this.message = "An unknown error occurred"]);

factory SignupWithEmailAndPasswordFailure.code(String code){
   switch(code){
       case "weak-password":
       return SignupWithEmailAndPasswordFailure("please enter a stronger password.");
       case "invalid-email":
       return SignupWithEmailAndPasswordFailure("Email is not valid or badly formatted");
       case "email-already-in-use":
       return SignupWithEmailAndPasswordFailure("An account already exists for this email");
       case "operation-not-allowed":
       return SignupWithEmailAndPasswordFailure("Operation is not allowed, please contact support");
       case "user-disabled":
       return SignupWithEmailAndPasswordFailure("This user has been disabled");
       default:
       return SignupWithEmailAndPasswordFailure();
   }
}
}