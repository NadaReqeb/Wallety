import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallety/model/account.dart';
import 'package:wallety/model/user.dart';

import '../model/expense.dart';




  class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  WUser? wUser;
  createUserInFs(WUser wUser) async {
  firebaseFirestore.collection('users').doc(wUser.id).set(wUser.toMap());
  }

  Future<WUser> getUserFromFs(String id) async {
  DocumentSnapshot<Map<String, dynamic>> document =
  await firebaseFirestore.collection('users').doc(id).get();
  Map<String, dynamic>?  userData = document.data();
  userData!['id'] = document.id;
  WUser wUser = WUser.fromMap(userData);
  return wUser;
  }


  Future<List<Expense>> getAllbook() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
    await firebaseFirestore.collection('uExpense').get();

    List<Expense> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      // documentMap['id'] = e.id;
      Expense product = Expense.fromMap(documentMap);
      log('${product.amount}');
      return product;
    }).toList();
    log('allbook');
    log('${allProducts}');
    return allProducts;
  }
  // addNewAccount(AccountUser accountUser) async {
  // DocumentReference<Map<String, dynamic>> doc =
  // await firebaseFirestore.collection('users').doc(accountUser.aid)
  //     .collection('accountUser').add(accountUser.toMap());
  // }
  // Stream<QuerySnapshot> readAccount() async*{
  //   yield* firebaseFirestore.collection('ItemCart').doc('users').collection('accountUser').snapshots();
  // }
  // Stream<QuerySnapshot> read({required String collectionName}) async* {
  //   yield* firebaseFirestore.collection(collectionName).snapshots();
  // }
  // addNewAccount(AccountUser accountUser) async {
  // DocumentReference<Map<String, dynamic>> doc =
  // await firebaseFirestore.collection('users').doc(accountUser.aid)
  //     .collection('accountUser').add(accountUser.toMap());
  // }

  //
  // editProduct(Product newProduct) async {
  // await firebaseFirestore
  //     .collection('products')
  //     .doc(newProduct.id)
  //     .update(newProduct.toMap());
  // }
  //
  // deleteProruct(String productId) async {
  // await firebaseFirestore.collection('products').doc(productId).delete();
  // }
  //
  // Future<Product> getOneProduct(String productId) async {
  // DocumentSnapshot<Map<String, dynamic>> productSnapshot =
  // await firebaseFirestore.collection('products').doc(productId).get();
  // Map<String, dynamic> productMap = productSnapshot.data();
  // productMap['id'] = productSnapshot.id;
  // Product product = Product.fromMap(productMap);
  // return product;
  // }
  //
  // Future<List<Product>> getAllProducts() async {
  // QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
  // await firebaseFirestore.collection('products').get();
  //
  // List<Product> allProducts = allProductsSnapshot.docs.map((e) {
  // Map documentMap = e.data();
  // documentMap['id'] = e.id;
  // Product product = Product.fromMap(documentMap);
  // return product;
  // }).toList();
  // return allProducts;
  // }

  }
