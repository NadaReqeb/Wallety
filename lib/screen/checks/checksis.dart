
import 'package:flutter/material.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/checks/newChecksScreen.dart';

class Checksis extends StatefulWidget {
  const Checksis({Key? key}) : super(key: key);

  @override
  State<Checksis> createState() => _ChecksisState();
}

class _ChecksisState extends State<Checksis>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  initTabController() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
  }

  @override
  void initState() {
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff1565C0),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(
          'Cheques protfolio',
        ),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TabBar(
            // isScrollable: true,
            labelColor:Color(0xff1565C0),
            unselectedLabelColor: Color.fromARGB(255, 114, 114, 114),
            indicatorColor: Color(0xff1565C0),
            controller: tabController,
            tabs: [
              Tab(
                text: 'واردة',
              ),
              Tab(
                text: 'صادرة',
              ),
            ],
          ),
          SizedBox(
            height: 550,
          ),

        ],
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:Color(0xff1565C0),
        child: Icon(Icons.add),
        onPressed: () {
          RouterClass.routerClass.routingToSpecificWidgetWithoutPop(newChecksScreen());

        },
      ),
    );
  }
}
