import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/model/catergory_revenues.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/movements/add_new_classExpen.dart';
import 'package:wallety/screen/movements/add_new_classRevn.dart';
import 'package:wallety/screen/movements/add_new_revenues.dart';

class revrnuesScreen extends StatefulWidget {
  const revrnuesScreen({Key? key}) : super(key: key);

  @override
  State<revrnuesScreen> createState() => _revrnuesScreenState();
}

class _revrnuesScreenState extends State<revrnuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        right: 15,
        left: 15,
        bottom: 13,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FbStoreController().readCategory2(),
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
                                      Text( data[index].get('name'),),
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
                                              .pushToSpecificScreenUsingWidget(addNewRevenues());
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
child: Icon(Icons.add,  size: 35),
onPressed: () {
RouterClass.routerClass
    .pushToSpecificScreenUsingWidget(AddNewCalssRevn());
},
),
),
        ],
      ),
    );
  }

  CategoryRevenues getCategoryRevenues(QueryDocumentSnapshot snapshot) {
    CategoryRevenues categoryRevenues = CategoryRevenues();
    categoryRevenues.id = snapshot.id;
    categoryRevenues.name = snapshot.get('name');
    // expense.id_category = widget.categoryExpense.id;

    return categoryRevenues;
  }
}
