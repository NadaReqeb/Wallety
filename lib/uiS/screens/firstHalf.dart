import 'package:flutter/material.dart';
import 'package:wallety/uiS/widgets/courrency_picker.dart';
import 'package:wallety/uiS/widgets/text_filed.dart';

class FirstScreen extends StatelessWidget {
  Function setfromCurrency;
  Function settoCurrency;
  Function setTextFiled;

  Map currencyMap;

  FirstScreen(this.setfromCurrency, this.settoCurrency, this.setTextFiled,
      this.currencyMap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: CurrencyPicker(setfromCurrency, currencyMap)),
        Expanded(child: CurrencyTextFiled(setTextFiled)),
        Expanded(child: CurrencyPicker(settoCurrency, currencyMap)),
      ],
    );
  }
}
