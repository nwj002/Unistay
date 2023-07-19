//Error handling
class ErrorHangling {
   late String errorMessage;
  throwErrorMesg({required String errorCode}) {
    switch (errorCode) {
      //for same email
       case "email-already-in-use":
        errorMessage = "This e-mail address is already in use, please use a different e-mail address.";
        break;
        //for weak password
      case "weak-password":
        errorMessage = "Your password is too short !!";
        break;

        //for invalid email
      case "invalid-email":
        errorMessage = "Please enter valid E-mail.";
        break;
      case "wrong-password":
        errorMessage = "Please enter currect password.";
        break;
      case "user-not-found":
        errorMessage = "User not found.\nPlease Register yourself !";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      default:
        errorMessage = "Process failed. Please try again.";
    }
    return errorMessage;
  }
}