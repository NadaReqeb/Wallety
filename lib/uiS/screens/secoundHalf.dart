import 'package:flutter/material.dart';
import 'package:wallety/widgets/app_style_text.dart';

class SecoundScreen extends StatelessWidget {
  final String result;

  SecoundScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:AppTextStyle(name: '$result',fontSize:25),
    );
  }
}
