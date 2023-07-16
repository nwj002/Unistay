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