import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyPicker extends StatelessWidget {
  Function setCurrency;
  Map mainMap;
//  List w2;
  CurrencyPicker(this.setCurrency, this.mainMap);

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        itemExtent: 30,
        onSelectedItemChanged: (index) {
          setCurrency(mainMap.keys.toList()[index]);
        },
        children: mainMap.keys.toList().map((e) => Text(e)).toList());
  }
}
