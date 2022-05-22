import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallety/provider/database_provider.dart';


class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Debt'),
        backgroundColor:  Color(0xff1565C0),

      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
                  Provider.of<DatabaseProvider>(context).taskTitleController,
              decoration: InputDecoration(
                  label: Text('Debt Name') ,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
              Provider.of<DatabaseProvider>(context).amountTitleController,
              decoration: InputDecoration(
                  label: Text('Amount') ,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
              Provider.of<DatabaseProvider>(context).dataTitleController,
              decoration: InputDecoration(
                  label: Text('Data') ,
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
            InkWell(
              onTap: () async {
                await Provider.of<DatabaseProvider>(context, listen: false)
                    .insertNewTask();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Add your Debt',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff1565C0),
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
