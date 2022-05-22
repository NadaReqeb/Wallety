import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  late TextEditingController controller;
  late void Function(String value) onChange;
  late void Function() onPressed;

  AppTextField(
      {required this.controller,
      required this.onChange,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          fillColor: Color(0XFF666C79),
          filled: true,
          suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: onPressed),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontFamily: 'NotoNaskhArabic',
            fontSize: 15,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0XFF666C79),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0XFF666C79),
            ),
          )),
    );
  }
}
