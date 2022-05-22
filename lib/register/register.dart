import 'package:flutter/material.dart';
import 'package:wallety/register/create_account_screen.dart';
import 'package:wallety/register/login_screen.dart';

class registerControllerTab extends StatefulWidget {
  const registerControllerTab({Key? key}) : super(key: key);

  @override
  _registerControllerTabState createState() => _registerControllerTabState();
}

class _registerControllerTabState extends State<registerControllerTab> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 70),
        child: Container(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Image.asset('assets/images/register.png',height: 200,),
              DefaultTabController(
                  length:2, // length of tabs
                  initialIndex: 0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor:Color(0xff1565C0),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text('Register',
                            style: TextStyle(fontSize: 20),),

                          ),
                          Tab(
                            child: Text( 'Login',
                            style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 560, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                        child: TabBarView(children: <Widget>[
                          LoginScreen(),

                        CreateAccountScreen(),

                        ])
                    )
                  ])
              ),
            ]),
          ),
        ),
      ),

    );
  }




}
