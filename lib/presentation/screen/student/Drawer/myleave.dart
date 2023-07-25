import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:provider/provider.dart';

class MyLeave extends StatelessWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> Leavelist = [];
    final leaveprovider = Provider.of<LeaveProvider>(context);
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid && element.status == 0) {
        Leavelist.add(element);
      }
      ;
    });
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "My Leaves Request",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
    body: Leavelist != []
    ? Padding(
    padding: EdgeInsets.all(8),
          child: ListView.builder(
          itemCount: Leavelist.length,
          itemBuilder: (context, index){
          return MyLeaveListModel(
              leavingdate: Leavelist[index].dateOfLeave,
              commingdate: Leavelist[index].dateOfComing,
              leavereason: Leavelist[index].leaveReason,
              totalday: Leavelist[index].totalDay,
              deleteleave: () {
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
                        ),
                        TextButton(
                            child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                            ),
                                  onPressed: () {
                                  leaveprovider.deleteLeave(Leavelist[index].id);
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
                         ),
                        );
                    }
                      }
class MyLeaveListModel extends StatelessWidget {
  MyLeaveListModel(
