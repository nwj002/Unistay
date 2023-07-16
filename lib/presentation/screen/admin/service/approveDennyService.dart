class ApproveDennyServiceSceen extends StatelessWidget {
  ApproveDennyServiceSceen(this.service, {Key? key}) : super(key: key);
  Service service;

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    const tablepadding = EdgeInsets.all(15);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Approve/Denny Service' , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),)
      ),