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
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text("Are you sure you want to delete ?"),
                            actions: [
                              TextButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                              TextButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  serviceProvider
                                      .deleteService(servicesList[index].id);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
               : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class MyServiceListModel extends StatelessWidget {
  MyServiceListModel(
      {required this.servicedate,
      required this.repaireddevicelist,
      required this.servicedesc,
      required this.deleteservice});
        DateTime servicedate;
  List repaireddevicelist;
  String servicedesc;
  Function deleteservice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color.fromARGB(157, 241, 241, 241),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 18, right: 18, bottom: 5),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Date ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                                Text(": "),
                              Text(
                                servicedate.day.toString() +
                                    '/' +
                                    servicedate.month.toString() +
                                    '/' +
                                    servicedate.year.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),