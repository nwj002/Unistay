class Myservicesrequest extends StatelessWidget {
  const Myservicesrequest({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Service> servicesList = [];
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final serviceListRaw = Provider.of<List<Service>?>(context);
    serviceListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid && element.status == 0) {
        servicesList.add(element);
      }
      ;