import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:wallety/firebase/local_notification_helper.dart';
import 'package:wallety/model/bn_screen.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/Reports/reportScreen.dart';
import 'package:wallety/screen/home_screen.dart';
import 'package:wallety/screen/movements/expenses_revenuess.dart';
import 'package:wallety/screen/profile_screen.dart';
import 'package:wallety/uiS/screens/homePage.dart';
import 'package:wallety/widgets/Drawer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  TutorialCoachMark ? tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyBottomNavigation1 = GlobalKey();
  GlobalKey keyBottomNavigation2 = GlobalKey();
  GlobalKey keyBottomNavigation3 = GlobalKey();
  GlobalKey keyBottomNavigation4 = GlobalKey();


  int _currentIndex = 0;
List<BnScreen> _bnScreen = <BnScreen>[
  BnScreen(title: 'Home', widget: HomeScreen()),
  BnScreen(title: 'Reports', widget: HomeScreen()),
  BnScreen(title: 'Movements', widget: Exp_Rev()),
  BnScreen(title: 'profite', widget: ProfileScreen()),
];
  // void _handleIndexChanged(int index) {
  //   setState(() {
  //     this._currentIndex = index;
  //   });
  // }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar:AppBar(
        backgroundColor: Color(0xff1565C0),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(
          _bnScreen[_currentIndex].title,
        ),
      ),
       drawer: buildDrawer(context),

       bottomNavigationBar:  Stack(
         children: [

           Container(
             height: 50,
             child: Row(
               children: [
                 Expanded(
                     child: Center(
                       child: SizedBox(
                         key: keyBottomNavigation1,
                         height: 40,
                         width: 40,
                       ),
                     )),
                 Expanded(
                     child: Center(
                       child: SizedBox(
                         key: keyBottomNavigation2,
                         height: 40,
                         width: 40,
                       ),
                     )),
                 Expanded(
                   child: Center(
                     child: SizedBox(
                       key: keyBottomNavigation3,
                       height: 40,
                       width: 40,
                     ),
                   ),
                 ),
               ],
             ),
           ),
           DotNavigationBar(
           backgroundColor: Colors.grey[300],

           margin: EdgeInsets.only(left: 10, right: 10),
            // currentIndex: _currentIndex,
            dotIndicatorColor: Colors.white,
            unselectedItemColor:Colors.grey[500],
            // enableFloatingNavBar: false,
           onTap: (int selectedItemIndex){
              setState(() {
                      _currentIndex=selectedItemIndex;
              });
      },
          currentIndex: _currentIndex,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: Icon(Icons.home),
                selectedColor: Color(0xff1565C0),

              ),


              DotNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                selectedColor:Color(0xff1565C0),
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon(Icons.monetization_on),
                selectedColor: Color(0xff1565C0),

              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.person),
                selectedColor: Color(0xff1565C0),


              ),
            ],
          ),
      ] ),
      body: _bnScreen[_currentIndex].widget,
    );
  }
  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      // لون التغبيش الي مظلل باقي الصفحة
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    )..show();
  }
  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyBottomNavigation2,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation3",
        keyTarget: keyBottomNavigation3,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation3",
        keyTarget: keyBottomNavigation3,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
}

}
