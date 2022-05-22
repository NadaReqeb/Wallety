//
// import 'package:flutter/material.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:wallety/firebase/fb_store_controller.dart';
// import 'package:wallety/model/expense.dart';
//
// class ReportScreen extends StatefulWidget {
//   const ReportScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ReportScreen> createState() => _ReportScreenState();
// }
//
// class _ReportScreenState extends State<ReportScreen> {
//   late List<charts.Series<Expense, String>> _seriesPieData;
//   late List<Expense> mydata;
//   _generateData(mydata) {
//     // _seriesPieData = List<charts.Series>();
//     _seriesPieData.add(
//       charts.Series(
//         domainFn: (Expense expense, _) => expense.amount,
//         measureFn: (Expense expense, _) => expense.sum,
//         // colorFn: (Expense expense, _) =>
//         //     charts.ColorUtil.fromDartColor(Color(int.parse(expense.)
//         //     )),
//         id: 'expense',
//         data: mydata,
//         labelAccessorFn: (Expense row, _) => "${row.id}",
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tasks')),
//       body: _buildBody(context),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FbStoreController().read(collectionName: 'uExpense'),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return LinearProgressIndicator();
//         } else {
//           // List<Expense> expense = snapshot.data!.docs
//           //     .map((docs) => Expense.fromMap(docs))
//           //     .toList();
//           // return _buildChart(context, expense);
//         }
//       }
//     );
//   }
//   Widget _buildChart(BuildContext context, List<Expense> expense) {
//     mydata = expense;
//     _generateData(mydata);
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Container(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               Text(
//                 'Time spent on daily tasks',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Expanded(
//                 child: charts.PieChart(_seriesPieData,
//                     animate: true,
//                     animationDuration: Duration(seconds: 5),
//                     behaviors: [
//                       new charts.DatumLegend(
//                         outsideJustification:
//                         charts.OutsideJustification.endDrawArea,
//                         horizontalFirst: false,
//                         desiredMaxRows: 2,
//                         cellPadding:
//                         new EdgeInsets.only(right: 4.0, bottom: 4.0,top:4.0),
//                         entryTextStyle: charts.TextStyleSpec(
//                             color: charts.MaterialPalette.purple.shadeDefault,
//                             fontFamily: 'Georgia',
//                             fontSize: 18),
//                       )
//                     ],
//                     defaultRenderer: new charts.ArcRendererConfig(
//                         arcWidth: 100,
//                         arcRendererDecorators: [
//                           new charts.ArcLabelDecorator(
//                               labelPosition: charts.ArcLabelPosition.inside)
//                         ])),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }