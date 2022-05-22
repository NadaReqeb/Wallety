import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallety/coin_data.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/account.dart';
import 'package:wallety/provider/app_provider.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/home_screen.dart';
import 'package:wallety/widgets/Bottom_Navigation.dart';
import 'package:wallety/widgets/app_button_main.dart';
import 'package:wallety/widgets/app_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class entry_data extends StatefulWidget {
  const entry_data({Key? key}) : super(key: key);

  @override
  State<entry_data> createState() => _entry_dataState();
}

class _entry_dataState extends State<entry_data> with Helpers{
  DateTime? _pickedDateValue;
  String? _pickedDate;
  String selectedCurrency = 'AUD';
  TextEditingController Current_salary = TextEditingController();
  TextEditingController current_balance = TextEditingController();

  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );

  }
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/images/Saving_mone.png',height: 250,),
              Text( 'Wallety',style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xff1565C0),
                fontSize: 30,
                fontFamily: 'NotoNaskhArabic',
              ),),
              SizedBox(
                height: 10,
              ),
              Text( 'Add your finance data to start',style: TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.white38,
                fontSize: 30,
                fontFamily: 'NotoNaskhArabic',
              ),),
              AppTextField1(
                hint: 'Monthly income',
                controller: Current_salary,
                textInputType: TextInputType.number,
                prefixIcon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0XFFF303030).withOpacity(.50),
                ),
              ),
              SizedBox(height: 10,),
              AppTextField1(
                hint: 'current balance',
                controller: current_balance,
                textInputType: TextInputType.number,
                prefixIcon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0XFFF303030).withOpacity(.50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 10),
                child: Row(
                    children: [
                      Text(
                        "Enter the currency",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      androidDropdownButton(),
                    ],
                  ),
              ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 12),
                  child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Date'),
                      subtitle: Text('Select salary data'),
                      trailing: Text(_pickedDate ?? 'D/M/Y'),
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021, 1, 1),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (dateTime != null) {
                          _pickedDateValue = dateTime;
                          var format = DateFormat.yMd('en');
                          // provider.pickedDate = format.format(dateTime);
                        }
                      }),
                ),
                AppButtonMain(
                onPressed: () async {
await addAccount();
                  // Provider.of<AppProvider>(context, listen: false).addAccount();
                  // RouterClass.routerClass.routingToSpecificWidgetWithoutPop(BottomNavigation());

                  // provider.registerNewUser();
                },
                title: "Add Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
  //ToDo: check is empty for text

  Future<void> addAccount() async {
    print('first');
    bool status = await FbStoreController().addNewAccount(accountUser: accountUser);
    if (status) {
      Navigator.pushReplacementNamed(context, '/bouttomBar');

      showSnackBar(context: context, content: 'Done add account',error: false);
    } else {
      showSnackBar(context: context, content: 'Error to add account', error: true);
    }
  }
  AccountUser get accountUser {
    AccountUser accountUser = AccountUser();
    // accountUser.Current_salary =num.parse(Current_salary.text);
    accountUser.current_balance = num.parse(current_balance.text);
    accountUser.spending = 0;
    accountUser.incom = num.parse(Current_salary.text);
    return accountUser;
  }
  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      _pickedDate = format.format(dateTime);
    }
  }
}
