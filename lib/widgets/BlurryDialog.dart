import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallety/widgets/app_text_field.dart';

class BlurryDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;
  TextEditingController controller;
  BlurryDialog(this.title, this.content, this.continueCallBack,this.controller);
  TextStyle textStyle = TextStyle (color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child:  AlertDialog(
          title: new Text(title,style: textStyle,),
          content: AppTextField1(
            hint: 'Add Class Movements',
            // controller: provider.emailController,
            controller: controller,
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.add_box_outlined,
              color: Color(0XFFF303030).withOpacity(.50),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("SAVE"),
              onPressed: () {
                continueCallBack();
              },
            ),
            new FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}