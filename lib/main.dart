import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallety/firebase/firestore_helper.dart';
import 'package:wallety/out_boarding/out_boarding.dart';
import 'package:wallety/preferences/app_preferences.dart';
import 'package:wallety/provider/LanguageProvider.dart';
import 'package:wallety/provider/app_provider.dart';
import 'package:wallety/provider/database_provider.dart';
import 'package:wallety/provider/todo_provider.dart';
import 'package:wallety/register/forget_password_screen.dart';
import 'package:wallety/register/login_screen.dart';
import 'package:wallety/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallety/screen/debts/todo_main_page.dart';
import 'package:wallety/screen/entry_data.dart';
import 'package:wallety/screen/launch_screen.dart';
import 'package:wallety/screen/movements/expenses_revenuess.dart';
import 'package:wallety/widgets/Bottom_Navigation.dart';

import 'firebase/fcm_helper.dart';
import 'firebase/local_notification_helper.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  LocalNotificationHelper.localNotificationHelper.showNotification(
      message.notification!.title.toString(),
      message.notification!.body.toString(),
      message.notification!.body.toString());
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  LocalNotificationHelper.localNotificationHelper.initLocalNotification();
  await Firebase.initializeApp();
  await FcmHelper.fcmHelper.runFcmInTheForeground();
  await AppPreferences().initPreferences();

  // await FacebookAuthController().getAccessToken();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoProvider>(
        create: (context) {
          return TodoProvider();
        },
      ),
      ChangeNotifierProvider<DatabaseProvider>(
        create: (context) {
          return DatabaseProvider();
        },
      ),
      ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider()),
      ChangeNotifierProvider<AppProvider>(create: (context) => AppProvider()),
    ],

    child: MyApp(),
  ));
}

// ChangeNotifierProvider<AppProvider>(
// create: (context) => AppProvider(),
// child: EasyLocalization(
// supportedLocales: [Locale('en'), Locale('ar')],
// path: 'assets/langs', // <-- change the path of the translation files
// fallbackLocale: Locale('en'),
// child: MyApp(),
// ),
// ),
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FirestoreHelper.firestoreHelper.getAllbook();
    bool _darkMode = true;

    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(411, 820),
        minTextAdapt: true,
        builder: () => MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar'),
              Locale('en'),
            ],
            // locale: Locale(Provider.of<LanguageProvider>(context).languageCode),
            locale: Locale(Provider.of<LanguageProvider>(context).languageCode),
            debugShowCheckedModeBanner: false,
            navigatorKey: RouterClass.routerClass.navKey,
            home: LaunchScreen(),
            // theme: ThemeData(
            //   brightness: _darkMode ? Brightness.dark : Brightness.light,
            // ),
            initialRoute: '/Launch_screen',
            routes: {
              '/Launch_screen': (context) => LaunchScreen(),
              '/create_account_screen': (context) => LoginScreen(),
              '/bouttomBar': (context) => BottomNavigation(),
              '/OutBoardingScreen': (context) => OutBoardingScreen(),
              '/ForgetPassword': (context) => ForgetPassword(),
              '/entry_data': (context) => entry_data(),
              '/Exp_Rev': (context) => Exp_Rev(),
              '/TodoMainPage': (context) => TodoMainPage(),
            }
            // routes: RouterClass.routerClass.map,

            ));
  }
}
