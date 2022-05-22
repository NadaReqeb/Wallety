//
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// class FacebookAuthController{
//   static final FacebookAuthController _authController =
//   FacebookAuthController();
//   factory FacebookAuthController(){
//     return _authController;
//   }
//   FacebookAuthController._();
//   AccessToken? accessToken;
//   late Map<String,dynamic> userData;
//   Future<void> facebookLogin() async {
//     final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
// // or FacebookAuth.i.login()
//     if (result.status == LoginStatus.success) {
//       // you are logged
//       final AccessToken accessToken = result.accessToken!;
//       var userData = await FacebookAuth.instance.getUserData();
//     }
//   }
//   Future<void> getUserData()async{
//     userData = await FacebookAuth.instance.getUserData();
//   }
//   Future<void> getAccessToken()async{
//     accessToken = await FacebookAuth.instance.accessToken;
//   }
//   bool get isLoggedIn => accessToken != null;
//   Future<void> logout() async{
//     await FacebookAuth.instance.logOut();
//   }
// }