import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:wallety/firebase/fb_auth_controller.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/model/user_model.dart';
import 'package:wallety/provider/app_provider.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/entry_data.dart';
import 'package:wallety/widgets/app_button_main.dart';
import 'package:wallety/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  late TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),

      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: Container(
            child: Column(
              children: [

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(children: <Widget>[
                //     Expanded(
                //       child: FaIcon(
                //         FontAwesomeIcons.facebook,
                //         color: Colors.blueAccent,
                //         size: 40,
                //       ),
                //     ),
                //     Expanded(
                //       child: FaIcon(
                //         FontAwesomeIcons.google,
                //         color: Colors.blueAccent,
                //         size: 40,
                //       ),
                //     ),
                //     Expanded(
                //       child: FaIcon(
                //         FontAwesomeIcons.twitter,
                //         color: Colors.blueAccent,
                //         size: 40,
                //       ),
                //     ),
                //   ]),
                // ),

                AppTextField1(
                  hint: 'User Name',
                  // controller: provider.emailController,
                  controller: _name,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0XFFF303030).withOpacity(.50),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextField1(
                  hint: 'Email',
                  // controller: provider.emailController,
                  controller: _email,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0XFFF303030).withOpacity(.50),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                AppTextField1(
                  hint: 'Password',
                  controller: _password,
                  obscure: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0XFFF303030).withOpacity(.50),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                AppButtonMain(
                  onPressed: () async {
                    await performCreateAccount();
                    // await FbStoreController()
                    //     .save(wUser: wUser, collectionName: 'users');

                    // RouterClass.routerClass.routingToSpecificWidgetWithoutPop(entry_data());

                  },

                  title: "Create Account",
                ),

                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Color(0xff1565C0),
                      height: 40,
                    ),
                  ),
                  Text("or"),
                  Expanded(
                    child: Divider(
                      color: Color(0xff1565C0),
                      height: 50,
                    ),
                  ),
                ]),
                ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.white,

                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),),
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,
                  ),
                  label: Text(
                    'Sign Up with Facebook',
                    style: TextStyle(color :Color(0xff1565C0),fontFamily: 'NotoNaskhArabic'),
                  ),

                  onPressed: () async {
                    await facebookLogin();
                  },

                ),

              ],
            ),
          ),
        );
      }),
    );
  }
  Future<void> facebookLogin() async {
//     final LoginResult result = await FacebookAuth.instance.login(); // b y default we request the email and the public profile
// // or FacebookAuth.i.login()
//     if (result.status == LoginStatus.success) {
//       // you are logged
//       final AccessToken accessToken = result.accessToken!;
//       var userData = await FacebookAuth.instance.getUserData();
    }


  Future<void> performCreateAccount() async {
    if (checkData()) {
      await createAccount();
    }

  }

  bool checkData() {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter email & password');
    return false;
  }
  Future<void> createAccount() async {
    bool status = await FbAuthController()
        .createAccount(context, email: _email.text, password: _password.text);

    if (status) Navigator.pushNamed(context,'/entry_data');
  }
  WUser get wUser {
    WUser wUser = WUser();
    wUser.email = _email.text;
    wUser.password = _password.text;
    return wUser;
  }

  }

