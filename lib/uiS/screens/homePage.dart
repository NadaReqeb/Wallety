import 'package:flutter/material.dart';
import 'package:wallety/constant.dart';
import 'package:wallety/uiS/screens/firstHalf.dart';
import 'package:wallety/uiS/screens/floatingActionButton.dart';
import 'package:wallety/uiS/screens/secoundHalf.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '0';

  String fromCurrency = 'USD';

  String toCurrency = 'USD';

  int value = 0;
  Map mainMap = currencyMap;

  getMap(Map value) {
    this.mainMap = value;
    setState(() {});
  }

  setfromCurrency(String value1) {
    this.fromCurrency = value1;
    calculate();
  }

  settoCurrency(String value1) {
    this.toCurrency = value1;
    calculate();
  }

  setTextFiled(String value1) {
    this.value = int.parse(value1);
  }

  calculate() {
    result = '${(mainMap[fromCurrency] / mainMap[toCurrency]) * value}';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print(currencyMap[fromCurrency]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Unit Converter')),
          backgroundColor:Color(0xff1565C0),
          centerTitle: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )),
           toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical:200),
          child: Column(
            children: <Widget>[

              FirstScreen(
                  setfromCurrency, settoCurrency, setTextFiled, currencyMap),
              SizedBox(height: 50,),
              SecoundScreen(result),
            ],
          ),
        ),

    );
  }
}
