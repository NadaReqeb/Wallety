import 'package:flutter/material.dart';
import 'package:wallety/register/create_account_screen.dart';
import 'package:wallety/register/login_screen.dart';
import 'package:wallety/screen/movements/add_new_classExpen.dart';
import 'package:wallety/screen/movements/expenses_screen.dart';

import 'package:wallety/screen/movements/revenues_screen.dart';

class Exp_Rev extends StatefulWidget {
  const Exp_Rev({Key? key}) : super(key: key);

  @override
  State<Exp_Rev> createState() => _Exp_RevState();
}

class _Exp_RevState extends State<Exp_Rev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        child: Container(
          child: DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.blueAccent,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Expenses',
                          ),
                          Tab(
                            text: 'Revenues',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 560, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(children: <Widget>[
                        expensesScreen(),
                        revrnuesScreen(),
                      ]),
                    )
                  ])),
        ),
      ),
    );
  }
}
