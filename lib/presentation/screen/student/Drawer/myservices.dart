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
      });
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text(
              "My Service Request",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
            body: servicesList != []
            ? Padding(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return MyServiceListModel(
                       servicedate: servicesList[index].time,
                      repaireddevicelist: servicesList[index].repairDeviceList,
                      servicedesc: servicesList[index].serviceDes,
                      deleteservice: () {
                        showDialog(