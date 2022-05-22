
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/expense.dart';


class addNewExpenses extends StatefulWidget {
  // late String idExpenses;
  //
  // addNewExpenses({required this.idExpenses});
  @override
  _CreateNoteScreenState createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<addNewExpenses> with Helpers {
  bool _noteStatus = false;
  DateTime? _pickedDateValue;
  String? _pickedDate;

  late TextEditingController _descriptionTextController;
  late TextEditingController _amountTextController;
  late TextEditingController _titleTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _titleTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _amountTextController.dispose();
    _descriptionTextController.dispose();
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'CREATE NEW EXPENSES',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [

            TextField(
              controller:_descriptionTextController,
              decoration: InputDecoration(
                  label: Text(
                    'Description',
                    // style: TextStyle(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),

            SizedBox(height: 10),
            TextField(
              controller:_amountTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text(
                    'Amount',
                    // style: TextStyle(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 10),
            TextField(
              controller:_titleTextController,
              decoration: InputDecoration(
                  label: Text(
                    'Description',
                    // style: TextStyle(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Date'),
              subtitle: Text('Select note data'),
              trailing: Text(_pickedDate ?? 'D/M/Y'),
              onTap: () async {
                await pickDate();
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
               await performSave();

              },
              child: Text('SAVE'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  double.infinity,
                  50,
                ),
              ),
            )
          ],
        ),
      ),
    );
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

  Future<void>performSave()async{
    if(checkData()){
      await addExpense();

    }else {


    }

  }
  bool checkData(){
    if(_descriptionTextController.text.isNotEmpty&&
        _amountTextController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context: context, content: 'please Enter data',error: true);

    return false;
  }


  Future<void>addExpense()async{
    bool status = await FbStoreController().addExpense(expense: expense);
    if(status)
    {
      showSnackBar(context: context, content: 'Done');
    }else {
      showSnackBar(context: context, content: 'Error Happen!!',error:  true);

    }


  }

  Expense get expense {
    Expense expense = Expense();
    expense.description = _descriptionTextController.text;
    expense.amount = _amountTextController.text;
    // expense.amount = _pickedDate;
    // expense.id_category = widget.idExpenses;
    expense.title = _titleTextController.text;

    return expense ;


  }

}
