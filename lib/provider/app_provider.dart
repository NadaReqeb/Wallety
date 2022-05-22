import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallety/firebase/auth_helper.dart';
import 'package:wallety/firebase/firestore_helper.dart';
import 'package:wallety/model/account.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/register/login_screen.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/entry_data.dart';


  class AppProvider extends ChangeNotifier {

    WUser? loggedUser;

  TextEditingController salary = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController incomCont = TextEditingController();
  TextEditingController current_balance = TextEditingController();

    DateTime? pickedDateValue;
    String? pickedDate;


  register(WUser wUser) async {
  try {
  String? userId = await AuthHelper.authHelper
      .createNewAccount(wUser.email, wUser.password);
  wUser.id = userId;
  await FirestoreHelper.firestoreHelper.createUserInFs(wUser);
  this.loggedUser = wUser;
  } on Exception catch (e) {
  // TODO
  }
  }

  login(String email, String password) async {
  try {
  UserCredential userCredential =
  await AuthHelper.authHelper.signIn(email, password);
  await getUserFromFirebase();
  RouterClass.routerClass.routingToSpecificWidgetWithoutPop(entry_data());
  } on Exception catch (e) {
  // TODO
  }
  }
    // addAccount() async {
    //       AccountUser accountUser = AccountUser(
    //       Current_salary: num.parse(incomCont.text),
    //         current_balance: num.parse(current_balance.text),
    //       // month_start: date.getTime(pickedDate.text)
    //       );
    //   await FirestoreHelper.firestoreHelper.addNewAccount(accountUser);
    //   Navigator.of(RouterHelper.routerHelper.routerKey.currentState!.context)
    //       .pop();
    // }
  getUserFromFirebase() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  this.loggedUser =
  await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
  notifyListeners();
  }

  logOut() async {
  this.loggedUser = null;
  await AuthHelper.authHelper.logout();

  RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
  }
}
