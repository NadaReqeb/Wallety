import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/debts/all_tasks_screen.dart';
import 'package:wallety/screen/debts/complete_tasks_screen.dart';
import 'package:wallety/screen/debts/inComplete_tasks_screen.dart';
import 'package:wallety/screen/debts/new_task_screen.dart';

class TodoMainPage extends StatefulWidget {
  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  initTabController() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      String message = tabController.index == 0
          ? 'you are in the all Debt tab'
          : tabController.index == 1
              ? 'you are in the completed Debt tab'
              : 'ypu are in the incomplete Debt tab';
      log(message);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor:Color(0xff1565C0),
              child: Icon(Icons.add),
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(NewTaskScreen());
              },
            ),
            drawer: Drawer(
              child:Column(
                children: [

                  ListTile(
                    onTap: () {
                      tabController.animateTo(0);
                    },
                    title: Text('All Debt'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(1);
                    },
                    title: Text('Done Debt'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(2);
                    },
                    title: Text('Debt'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xff1565C0),

              title: Text('Debt'),
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.pink.shade100,
                indicatorColor:Color(0xffffffff) ,

                controller: tabController,
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                  Tab(
                    icon: Icon(Icons.done),
                  ),
                  Tab(
                    icon: Icon(Icons.cancel_outlined),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: index,
            //   onTap: (newindex) {
            //     setState(() {
            //       this.index = newindex;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(label: 'All', icon: Icon(Icons.list)),
            //     BottomNavigationBarItem(label: 'Complete', icon: Icon(Icons.done)),
            //     BottomNavigationBarItem(
            //         label: 'InComplete', icon: Icon(Icons.cancel)),
            //   ],
            // ),
            body: TabBarView(controller: tabController, children: [
              AllTasksScreen(),
              CompleteTasksScreen(),
              InCompleteTasksScreen(),
            ]))
        : Scaffold(
            appBar: AppBar(
              title: Text('Debt'),
            ),
            body: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('O'),
            ),
                          accountName: Text('Nada'),
                          accountEmail: Text('nada99@gmail.com')),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(0);
                        },
                        title: Text('All Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(1);
                        },
                        title: Text('Delivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(2);
                        },
                        title: Text('UnDelivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  AllTasksScreen(),
                  CompleteTasksScreen(),
                  InCompleteTasksScreen(),
                ]))
              ],
            ),
          );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('NadaReqeb'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return AppBar().preferredSize;
  }
}
