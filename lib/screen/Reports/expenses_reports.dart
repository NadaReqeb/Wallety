import 'package:flutter/material.dart';

class ExpensesReports extends StatefulWidget {
  const ExpensesReports({Key ?key}) : super(key: key);

  @override
  State<ExpensesReports> createState() => _ExpensesReportsState();
}

class _ExpensesReportsState extends State<ExpensesReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: implement build
        // return Consumer<DatabaseProvider>(builder: (context, providerInstance, x) {
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: Color.fromARGB(255, 179, 93, 87),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('الهدايا'),
                          Spacer(),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Color.fromARGB(255, 207, 187, 9),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('إيجار بيت'),
                          Spacer(),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Color.fromARGB(255, 46, 161, 50),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('تسوق'),
                          Spacer(),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.car_rental,
                            color: Color.fromARGB(255, 197, 35, 23),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('مصاريف سيارة'),
                          Spacer(),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_basket,
                            color: Color.fromARGB(255, 247, 67, 127),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('ملابس'),
                          Spacer(),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                ],
              );

              // TaskWidget(
              //   providerInstance.allTasks[index],
              // );
            }));
  }
}
