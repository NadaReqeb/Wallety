import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:wallety/firebase/local_notification_helper.dart';
import 'package:wallety/preferences/app_preferences.dart';
import 'package:wallety/provider/LanguageProvider.dart';
import 'package:wallety/provider/app_provider.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/Goals/financialObjective.dart';
import 'package:wallety/screen/checks/checksis.dart';
import 'package:wallety/screen/home_screen.dart';
import 'package:wallety/screen/movements/expenses_revenuess.dart';
import 'package:wallety/uiS/screens/homePage.dart';
import 'package:wallety/widgets/list_tile_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../screen/debts/todo_main_page.dart';

Drawer buildDrawer(BuildContext context) {
  // bool _darkMode = true;

  return Drawer(
    child: Padding(
      padding: const EdgeInsets.all(33),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          ListTile(
            // UserAccountsDrawerHeader(
            //     currentAccountPicture: CircleAvatar(
            //       backgroundColor: Colors.white,
            //       child: Text('O'),
            //     ),
            //     accountName: Text('Omar'),
            //     accountEmail: Text('omar@gmail.com')),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
            title: Text(
              'Marah',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'NotoNaskhArabic',
                fontWeight: FontWeight.w700,
              ),
            ),

          ),

          SizedBox(
            height: 20,
          ),
          Divider(
            indent: 0,
            endIndent: 50,
            thickness: 1,
            color: Colors.grey.shade300,
          ),

          DrawerListTile(
            title: AppLocalizations.of(context)!.convert,
            iconData: Icons.change_circle,
            onTab: () {
              RouterClass.routerClass.routingToSpecificWidgetWithoutPop(
                  MyHomePage());
            },
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: AppLocalizations.of(context)!.checks,
            iconData: Icons.article,
            onTab: () {
              RouterClass.routerClass.routingToSpecificWidgetWithoutPop(
                  Checksis());
            },
          ),

          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: 'Goal',
            iconData: Icons.local_offer,
            onTab: () {
              RouterClass.routerClass.routingToSpecificWidgetWithoutPop(
                  FinancialObjective());
            },
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: 'Debt',
            iconData: Icons.message,
            onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoMainPage()));
            },
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: AppLocalizations.of(context)!.language,
            iconData: Icons.language,
            onTab: () {
              String newLanguage = AppPreferences().language == 'en'
                  ? 'ar'
                  : 'en';
              // MyApp.changeLanguage(context, Locale(newLanguage));
              Provider.of<LanguageProvider>(context, listen: false)
                  .changeLanguage(newLanguage);
            },
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            title: AppLocalizations.of(context)!.language,
            iconData: Icons.lightbulb,
            onTab: () {
              LocalNotificationHelper.localNotificationHelper
                  .showNotification('title', 'body', 'payload');
            },
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
              title: AppLocalizations.of(context)!.theme,
              iconData: Icons.lightbulb,
              onTab: () {
                // Consumer(
                //   builder: (context, ThemeModal themeNotifier, child) {
                //     return SwitcherButton(
                //       value: themeNotifier.isDark ? false : true,
                //       onChange: (value) {
                //         themeNotifier.isDark
                //             ? themeNotifier.isDark = false
                //             : themeNotifier.isDark = true;
                //       },
                //     );
                //   },
                // );
              }),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
              iconData: Icons.logout,
              title: AppLocalizations.of(context)!.logout,
              onTab: () async {
                // Provider.of<AppProvider>(context, listen: false).logOut();

                // await logout();
                // showSnackBar(
                //     context: context, content: 'Logout successfully');
              }),

        ],
      ),
    ),
  );
}
