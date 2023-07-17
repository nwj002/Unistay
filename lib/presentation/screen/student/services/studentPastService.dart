class StudentPastServiceScreen extends StatelessWidget {
  StudentPastServiceScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();

 List<Service> serviceList = [];
    final serviceListRaw = Provider.of<List<Service>?>(context);

    serviceListRaw?.forEach(
      (element) {
        print(element);
        if (user.uid == element.studentUid &&
            (element.status == 1 || element.status == 2)) {
          serviceList.add(element);
        }
        ;
      },
    );