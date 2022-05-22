import 'package:flutter/material.dart';

  class AppButtonMain extends StatelessWidget {
  void Function() onPressed;
  String title;

  AppButtonMain({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'NotoNaskhArabic',
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
          primary: Color(0xff1565C0),

        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),),
    );
  }
}
