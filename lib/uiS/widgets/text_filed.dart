import 'package:flutter/material.dart';

class CurrencyTextFiled extends StatelessWidget {
  Function setTextFiled;

  CurrencyTextFiled(this.setTextFiled);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setTextFiled(value);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
