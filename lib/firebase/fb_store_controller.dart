import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallety/model/MovementModel.dart';
import 'package:wallety/model/account.dart';
import 'package:wallety/model/catergory_expens.dart';
import 'package:wallety/model/catergory_revenues.dart';
import 'package:wallety/model/expense.dart';
import 'package:wallety/model/revenues.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/model/user_model.dart';

class FbStoreController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  Future<bool> addNewAccount({required AccountUser accountUser}) async {
    return await _firebaseFirestore
        .collection('accountUser')
        .doc(firebaseUser!.uid).set(accountUser.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  // Future<bool> addNewMovement({required Movement movement}) async {
  //   return await _firebaseFirestore
  //       .collection('User')
  //       .doc(firebaseUser!.uid).collection('Movement').add(movement.toMap())
  //
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }


  Future<bool> addCategory({required CategoryExpense expense}) async {
    return await _firebaseFirestore
        .collection('Category')
        .doc(firebaseUser!.uid).collection('Expense').add(expense.toMap())
        .then((value) async {
      bool status = await updateCategoryId(id: value.id);
      return status;
    })
        .catchError((error) => false);
  }

  Future<bool> addCategory2({required CategoryRevenues revenues}) async {
    return await _firebaseFirestore
        .collection('Category')
        .doc(firebaseUser!.uid).collection('Revenues').add(revenues.toMap())
        .then((value) async {
      bool status = await updateCategoryId(id: value.id);
      return status;
    })
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readCategory() async* {
    yield*_firebaseFirestore.collection('Category')
        .doc(firebaseUser!.uid)
        .collection('Expense')
        .snapshots();
  }

  Stream<QuerySnapshot> readCategory2() async* {
    yield*_firebaseFirestore.collection('Category')
        .doc(firebaseUser!.uid)
        .collection('Revenues')
        .snapshots();
  }

  Future<bool> addExpense({required Expense expense}) async {
    return await _firebaseFirestore
        .collection('uExpense')
        .doc(firebaseUser!.uid).set(expense.toMap())
        .then((value) async {
      // bool status = await updateCategoryId(id: value.id);
      return true;
    })
        .catchError((error) => false);
  }

  Future<bool> addRevenues({required Revenues revenues}) async {
    return await _firebaseFirestore
        .collection('revenues')
        .doc(firebaseUser!.uid).set(revenues.toMap())
        .then((value) async {
      // bool status = await updateCategoryId(id: value.id);
      return true;
    })
        .catchError((error) => false);
  }

  Future<bool> updateCategoryId({required String id }) async {
    return await _firebaseFirestore
        .collection('Category')
        .doc(firebaseUser!.uid).collection('Expense').doc(id)
        .update({"id": id})
        .then((value) => true)
        .catchError((error) => false);
  }


  Stream<QuerySnapshot> readDataAccount() async* {
    yield*_firebaseFirestore.collection('accountUser')
        .where(firebaseUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> read({required String collectionName}) async* {
    yield* _firebaseFirestore.collection(collectionName).snapshots();
  }

  readExpenseCard() async {
    var querySnapshot =
    await _firebaseFirestore.collection('uExpense').doc(
        'jV221KY1A9b0msChsusCI2fX4Eq1').get();
  }
  Future<Expense> getExpenseFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document = await _firebaseFirestore
        .collection('uExpense')
        .doc('jV221KY1A9b0msChsusCI2fX4Eq1')
        .get();
    Map<String, dynamic>? userData = document.data();
    userData!['id'] = document.id;
    Expense wUser = Expense.fromMap(userData);
    return wUser;
  }
// List<Model name> nameList = await MethodName ();
// int result = 0;
//
// for (int i = 0; i < nameList .length; i++) {
// result+= nameList[i].الراتب ;
// }
}