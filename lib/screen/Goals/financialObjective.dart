import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/Goals/newFinancialObjective.dart';

class FinancialObjective extends StatefulWidget {
  const FinancialObjective({Key ? key}) : super(key: key);

  @override
  State<FinancialObjective> createState() => _FinancialObjectiveState();
}

class _FinancialObjectiveState extends State<FinancialObjective> {
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
        title: Text('Financial Goals'),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 650,
          //   width: 500,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            'المتبقي 750\$                                                          سيارة'),
                        SizedBox(
                          height: 20,
                        ),
                        GFProgressBar(
                          percentage: 0.5,
                          lineHeight: 20,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text('50%', textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          backgroundColor: Colors.black26,
                          progressBarColor: GFColors.WARNING,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            'المبلغ 750\$                                                  الهدف 750\$'),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          RouterClass.routerClass
              .pushToSpecificScreenUsingWidget(newFinancialObjective());
        },
      ),

    );
  }
}
