import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/model/expense.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/movements/add_new_classExpen.dart';
import 'package:wallety/screen/movements/add_new_expenses.dart';
import 'package:wallety/screen/movements/add_new_revenues.dart';

import '../../model/catergory_expens.dart';

class expensesScreen extends StatefulWidget {
  // late CategoryExpense categoryExpense;
  //
  // expensesScreen({required this.categoryExpense});

  @override
  State<expensesScreen> createState() => _expensesScreenState();
}

class _expensesScreenState extends State<expensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        right: 8,
        left: 5,
        bottom: 0,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FbStoreController().readCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  List<QueryDocumentSnapshot> data = snapshot.data!.docs;
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 3, bottom: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) {
                              //         ProductsScreen(
                              //           mainCategories: getMainCategories(
                              //               snapshot: data[index]),
                              //         ),
                              //       }
                              //       // SubCategoriesScreen(mainCategories:
                              //       // getMainCategories(snapshot: data[index]),),
                              //     ),
                              //   );
                              // },
                              child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.card_giftcard,
                                    color: Color.fromARGB(255, 179, 93, 87),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    data[index].get('name'),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                    ),
                                    iconSize: 35,
                                    color: Colors.grey,
                                    splashColor: Colors.blue,
                                    onPressed: () {
                                      RouterClass.routerClass
                                          .routingToSpecificWidgetWithoutPop(
                                          addNewExpenses());
                                      // ProductsScreen(mainCategories:
                                      //     getMainCategories(snapshot: data[index]),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                        itemCount: data.length),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning,
                          size: 85,
                        ),
                        Text(
                          ' لا بيانات',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                            fontFamily: 'NotoNaskhArabic',
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
          Padding(
            padding: const EdgeInsets.only(left: 300),
            child: FloatingActionButton(
              backgroundColor: Color(0xff1565C0),
              child: Icon(Icons.add, size: 35),
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(AddNewCalssMove());
              },
            ),
          ),
        ],
      ),
    );
  }

  CategoryExpense getCategoryExpense(QueryDocumentSnapshot snapshot) {
    CategoryExpense categoryExpense = CategoryExpense();
    categoryExpense.id = snapshot.id;
    categoryExpense.name = snapshot.get('name');
    // expense.id_category = widget.categoryExpense.id;

    return categoryExpense;
  }
  CategoryExpense getcategoryExpense(QueryDocumentSnapshot snapshot) {
    CategoryExpense categoryExpense = CategoryExpense();
    categoryExpense.id = snapshot.id;
    categoryExpense.name = snapshot.get('name');


  return categoryExpense;
}
}
