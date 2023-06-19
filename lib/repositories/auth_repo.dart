abstract class AuthRepo{
  void loginAsAdmin({
    required String email,
    required String password});



   void forgotPassword({
    
    required String email
  });


}