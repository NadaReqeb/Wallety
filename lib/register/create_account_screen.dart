import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallety/firebase/fb_auth_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/user.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/entry_data.dart';
import 'package:wallety/widgets/app_button_main.dart';
import 'package:wallety/widgets/app_text_field.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController _email;
  late TextEditingController _password;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        physics: NeverScrollableScrollPhysics(),
        children: [

          SizedBox(
            height: 10,
          ),
          AppTextField1(
            hint: 'Email',
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
              await performSignIn();

            },
            title: "Login",
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/ForgetPassword'),
            child: Text('FORGET PASSWORD?'),
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
              'Login with Facebook',
              style: TextStyle(color :Color(0xff1565C0),fontFamily: 'NotoNaskhArabic'),
            ),

            onPressed: () async {
              // await facebookLogin();
            },

          ),
        ],
      ),
    );
  }

  Future<void> performSignIn() async {
    if (checkData()) {
      await signIn();
    }
  }

  bool checkData() {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data!');
    return false;
  }

  Future<void> signIn() async {
    bool status = await FbAuthController().signIn(context,
        email: _email.text,
        password: _password.text);
    if (status) {
      Navigator.pushReplacementNamed(context, '/entry_data');
    }
  }


}
