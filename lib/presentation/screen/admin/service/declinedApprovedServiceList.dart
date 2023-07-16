class DeclineApproveServiceList extends StatelessWidget {
  DeclineApproveServiceList(this.serviceStatus, {Key? key}) : super(key: key);
  int serviceStatus;

  @override
  Widget build(BuildContext context) {
    List<Service> complaintList = [];
    final complaintListRaw = Provider.of<List<Service>?>(context);

    complaintListRaw?.forEach(
      (element) {
        if (element.status == serviceStatus) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: serviceStatus == 1
              ? Text(
                  'Approved Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Declined Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
      body: complaintList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,
                        width: 0.1,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    complaintList[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                   Text('Room - ${complaintList[index].roomNo}'),
                                  Text(
                                    complaintList[index].time.day.toString() +
                                        '/' +
                                        complaintList[index]
                                            .time
                                            .month
                                            .toString() +
                                        '/' +
                                        complaintList[index]
                                            .time
                                            .year
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),