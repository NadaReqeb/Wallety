import 'package:flutter/cupertino.dart';

import '../../model/expense.dart';

class ListExpenses extends StatefulWidget {
  late Expense expense;
  ListExpenses({required this.expense});
  @override
  State<ListExpenses> createState() => _ListExpensesState();
}

class _ListExpensesState extends State<ListExpenses> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
