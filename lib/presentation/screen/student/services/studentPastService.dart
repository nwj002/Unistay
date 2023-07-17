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
    return Scaffold(
      backgroundColor:
          serviceList.length != 0 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Past Service'),
      ),
       body: serviceList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    serviceList[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),