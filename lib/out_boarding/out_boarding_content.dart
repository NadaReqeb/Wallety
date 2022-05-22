import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OutBoardingContent extends StatelessWidget {
  final int imageNumber;
  final String title;
  final String description;

  OutBoardingContent(
      {required this.imageNumber,
     required  this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/images/lf30_editor_wpalcv1g.png'),

          Lottie.asset('assets/animations/money$imageNumber.json',
              height: 400, width: 400),
          // Lottie.asset('assets/animations/money-in-your-wallet.json',
          //     height: 400, width: 400),

          // Image.asset('images/out_boarding_$imageNumber.png'),
          SizedBox(height: 30),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF23203F),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'NotoNaskhArabic',
              ),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            description,
            // maxLines: 1,
            // overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFF716F87),
                fontFamily: 'NotoNaskhArabic'),
          ),
        ],
      ),
    );
  }
}
