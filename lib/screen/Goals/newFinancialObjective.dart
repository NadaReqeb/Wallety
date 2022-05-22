import 'package:flutter/material.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/Goals/financialObjective.dart';
import 'package:wallety/widgets/app_button_main.dart';

class newFinancialObjective extends StatelessWidget {
  const newFinancialObjective({Key? key}) : super(key: key);

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
        title: Text('Add Financial Goals'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                    // controller:
                    //     Provider.of<DatabaseProvider>(context).taskTitleController,
                    decoration: InputDecoration(
                        label: Text('اسم الهدف'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller:
                    //     Provider.of<DatabaseProvider>(context).taskTitleController,
                    decoration: InputDecoration(
                        label: Text(
                          'المبلغ المطلوب',
                          // style: TextStyle(color: Colors.blue),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller:
                    //     Provider.of<DatabaseProvider>(context).taskTitleController,
                    decoration: InputDecoration(
                        label: Text('المبلغ المدخر للهدف'),
                        hintText: 'إذا كنت بدأت فعلاُ للتوفير لهذا الهدف',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller:
                    //     Provider.of<DatabaseProvider>(context).taskTitleController,
                    decoration: InputDecoration(
                        label: Text('تاريخ البدء'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller:
                    //     Provider.of<DatabaseProvider>(context).taskTitleController,
                    decoration: InputDecoration(
                        label: Text('المبلغ المستقطع'),
                        hintText:
                            'المبلغ الذي تريد استقطاعه من راتبك لتحقيق الهدف',
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
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 204, 204, 204)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 15,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 120,
                              height: 50,
                              // color: Colors.green,
                              child: TextButton(
                                onPressed: () {
                                  RouterClass.routerClass
                                      .routingToSpecificWidgetWithoutPop(
                                          FinancialObjective());
                                },
                                child: Text(
                                  'حفظ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                            child: AppButtonMain(
                          onPressed: () {
                            RouterClass.routerClass
                                .routingToSpecificWidgetWithoutPop(
                                    FinancialObjective());
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
                      ],
                    ),
                  )
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
