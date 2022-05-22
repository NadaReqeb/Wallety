import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wallety/model/task.dart';
import 'package:wallety/provider/database_provider.dart';



class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CheckboxListTile(
            value: task.isComplete,
            onChanged: (value) {
              Provider.of<DatabaseProvider>(context, listen: false)
                  .updateTask(task);
            },
            secondary: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<DatabaseProvider>(context, listen: false)
                        .deleteTask(task);
                  },
                ),
              ],
            ),
            title: Text(task.title),
          ),
        ));
  }
}
