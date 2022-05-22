
import 'package:flutter/material.dart';
import 'package:wallety/out_boarding/out_boarding_content.dart';
import 'package:wallety/out_boarding/out_boarding_indicator.dart';
import 'package:wallety/register/register.dart';
import 'package:wallety/router.dart';
import 'package:wallety/screen/home_screen.dart';
import 'package:wallety/widgets/Bottom_Navigation.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key ? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;

    late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage != 2,
                replacement: TextButton(
                  onPressed: () =>
                      RouterClass.routerClass.routingToSpecificWidgetWithoutPop(registerControllerTab()),
                  child: Text(
                    'skip',
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 121, 206),
                      fontFamily: 'NotoNaskhArabic',
                      fontSize: 16,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 121, 206),
                      fontFamily: 'NotoNaskhArabic',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  print('Page: $page');
                  setState(() {
                    _currentPage = page;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  OutBoardingContent(
                      imageNumber: 1, title: 'Welcome to Your Finance Tracker App',
                      description: 'Take care of your finance, \n spend wisely,'),
                  OutBoardingContent(
                      imageNumber: 2,
                      title: 'One place to track all your finances',
                      description:
                          'Add all of your income and expenses,  and access daily,\n'
                              ' weekly, and monthly reports'),
                  OutBoardingContent(
                      imageNumber: 3,
                      title: '  You\'re one-step away from reaching \n               your financial goals!',
                      description: ' '),
                ],
              ),
            ),
            SizedBox(height: 51),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                    marginEnd: 14, selected: _currentPage == 0),
                OutBoardingIndicator(
                    marginEnd: 14, selected: _currentPage == 1),
                OutBoardingIndicator(selected: _currentPage == 2),
              ],
            ),
            SizedBox(height: 39),
            Visibility(
              visible: _currentPage == 2,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () =>
                      RouterClass.routerClass.routingToSpecificWidgetWithoutPop(registerControllerTab()),
                  child: Text(
                    'Start',
                    style: TextStyle(fontFamily: 'Scheherazade',fontWeight: FontWeight.bold,fontSize:16),
                  ),
                  style: ElevatedButton.styleFrom(

                      minimumSize: Size(double.infinity, 53),
                      primary: Color.fromARGB(255, 17, 121, 206),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26))),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _currentPage != 0,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Visibility(
                  visible: _currentPage != 2,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
