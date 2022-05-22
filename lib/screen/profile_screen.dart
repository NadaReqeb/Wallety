import 'package:flutter/material.dart';
import 'package:wallety/router.dart';
import 'package:wallety/widgets/Bottom_Navigation.dart';
import 'package:wallety/widgets/app_button_main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Edit You Income '),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: AppButtonMain(
                  onPressed: () {
                    RouterClass.routerClass
                        .routingToSpecificWidgetWithoutPop(BottomNavigation());
                  },
                  title: 'SAVE',
                )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: AppButtonMain(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'CANCEL',
                )),
          ],
        ),
      ),
    );
  }
}
