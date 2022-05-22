import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  late String _groupValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF273246),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ' Payment',
          style: TextStyle(
              fontSize: 28,
              // fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            'images/mastercard.png',
                          ),
                          width: 50,
                          height: 70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Credit card',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1234 **** **** 5642',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: RadioListTile(
                              value: 'A',
                              groupValue: _groupValue,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _groupValue = value;
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            'images/PayPal.png',
                          ),
                          width: 50,
                          height: 70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Credit card',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1234 **** **** 5642',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: RadioListTile(
                              value: 'B',
                              groupValue: _groupValue,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _groupValue = value;
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            'images/PayPal.png',
                          ),
                          width: 50,
                          height: 70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Credit card',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '1234 **** **** 5642',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: RadioListTile(
                              value: 'C',
                              groupValue: _groupValue,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _groupValue = value;
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(40),
                      topStart: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Items',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' 6.000',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Sub total',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' 21.00',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Delivery charge',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' 05.00',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff36596A),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Total',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffFF8236),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 230,
                            ),
                            Text(
                              ' 26.00',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffFF8236),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.centerStart,
                                  end: AlignmentDirectional.centerEnd,
                                  colors: [
                                    Color(0XFF273246),
                                    Color(0XFF181D29),
                                  ])),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/confirm_screen');
                            },
                            child: Text(
                              'Continue Payment',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                primary: Colors.transparent),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
