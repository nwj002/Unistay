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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                left: 18,
                right: 18,
                bottom: 50,
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),