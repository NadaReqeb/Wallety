import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:wallety/provider/database_provider.dart';
import 'package:wallety/widgets/task_widget.dart';



class InCompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DatabaseProvider>(builder: (context, nada, x) {
      return nada.inCompleteTasks.length == 0
          ? Center(
            child: Lottie.asset('assets/animations/done-button.json'),
            )
          : ListView.builder(
              itemCount: nada.inCompleteTasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  nada.inCompleteTasks.toList()[index],
                );
              });
    });
  }
}
