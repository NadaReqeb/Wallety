import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallety/out_boarding/out_boarding.dart';
import 'package:wallety/provider/app_provider.dart';
import 'package:wallety/register/login_screen.dart';
import 'package:wallety/router.dart';
import 'package:wallety/widgets/Bottom_Navigation.dart';
import 'dart:async';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

// User? user = FirebaseAuth.instance.currentUser;
// if (user == null) {
// RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
// } else {
// Provider.of<AppProvider>(context, listen: false).getUserFromFirebase();
// RouterHelper.routerHelper.routingToSpecificWidget(BottomNavigation());
// }
// });
class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((v) {
      Navigator.pushReplacementNamed(context, '/OutBoardingScreen');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Image(
          image: AssetImage('assets/images/wallet.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
