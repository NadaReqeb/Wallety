import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/checks/checksis.dart';
import 'package:wallety/widgets/app_button_main.dart';

class newChecksScreen extends StatelessWidget {
  const newChecksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1565C0),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text('Add New Cheque'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),

                TextField(
                  // controller:
                  //     Provider.of<DatabaseProvider>(context).taskTitleController,
                  decoration: InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:
                  //     Provider.of<DatabaseProvider>(context).taskTitleController,
                  decoration: InputDecoration(
                      label: Text(
                        'Cheque number',
                        // style: TextStyle(color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:
                  //     Provider.of<DatabaseProvider>(context).taskTitleController,
                  decoration: InputDecoration(
                      label: Text('amount'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:
                  //     Provider.of<DatabaseProvider>(context).taskTitleController,
                  decoration: InputDecoration(
                      label: Text('data'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),

                // CheckboxListTile(
                //   value: Provider.of<DatabaseProvider>(context).isComplete,
                //   onChanged: (value) {
                //     Provider.of<DatabaseProvider>(context, listen: false)
                //         .changeIsCompleteOnNewTaskScreen();
                //   },
                //   title: Text('I have done this order'),
                // ),
                // InkWell(
                //   onTap: () async {
                //     await Provider.of<DatabaseProvider>(context, listen: false)
                //         .insertNewTask();
                //     Navigator.pop(context);
                //   },
                // child:
                SizedBox(
                  height: 60,
                ),
                Center(
                    child: AppButtonMain(
                  onPressed: () {
                    RouterClass.routerClass
                        .routingToSpecificWidgetWithoutPop(Checksis());
                  },
                  title: 'SAVE',
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: AppButtonMain(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'CANCEL',
                )),
              ]

                  // )

                  ),
            ),
          ],
        ),
      ),
    );
  }
}
