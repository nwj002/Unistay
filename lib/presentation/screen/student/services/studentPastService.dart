class StudentPastServiceScreen extends StatelessWidget {
  StudentPastServiceScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
