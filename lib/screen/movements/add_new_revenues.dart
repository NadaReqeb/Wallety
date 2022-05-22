
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/catergory_revenues.dart';
import 'package:wallety/model/revenues.dart';
import 'package:wallety/widgets/app_button_main.dart';

class addNewRevenues extends StatefulWidget {
  // late String idMainCategories;
  // addNewRevenues({required this.idMainCategories});

  @override
  _CreateNoteScreenState createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<addNewRevenues> with Helpers {
  bool _noteStatus = false;
  DateTime? _pickedDateValue;
  String? _pickedDate;

  late TextEditingController _titleTextController;
  late TextEditingController _descriptionTextController;
  late TextEditingController _amountController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    _amountController.dispose();
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
          'CREATE NEW REVENUES',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: Column(
          children: [
            TextField(
              controller: _titleTextController,
              keyboardType: TextInputType.text,
              maxLength: 30,
              decoration: InputDecoration(hintText: 'Title', counterText: ''),
            ),
            TextField(
              controller: _descriptionTextController,
              keyboardType: TextInputType.text,
              maxLength: 30,
              decoration: InputDecoration(hintText: 'Description', counterText: ''),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              maxLength: 30,
              decoration: InputDecoration(hintText: 'Amount', counterText: ''),
            ),
            SizedBox(height: 10),
            // SwitchListTile(
            //   contentPadding: EdgeInsets.zero,
            //   title: Text('Status'),
            //   subtitle: Text('Set note status'),
            //   value: _noteStatus,
            //   onChanged: (bool value) {
            //     setState(() {
            //       _noteStatus = value;
            //     });
            //   },
            // ),
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
            AppButtonMain(
              onPressed: ()async{
               await performSave();
              },
              title: 'SAVE',
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
      String _pickedDate  = dateTime.toString().substring(0,10);
      var format = DateFormat.yMd('en');
      _pickedDate = format.format(dateTime);
    }
  }


  Future<void>performSave()async{
    if(checkData()){
      await addRevenues();

    }else {


    }

  }
  bool checkData(){
    if(_descriptionTextController.text.isNotEmpty&&
        _amountController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context: context, content: 'please Enter data',error: true);

    return false;
  }


  Future<void>addRevenues()async{
    bool status = await FbStoreController().addRevenues(revenues: revenues);
    if(status)
    {
      showSnackBar(context: context, content: 'Done');
    }else {
      showSnackBar(context: context, content: 'Error Happen!!',error:  true);

    }


  }

  Revenues get revenues {
    Revenues revenues = Revenues();
    // revenues.date = _pickedDate.text;
    revenues.amount = _amountController.text;
    revenues.description = _descriptionTextController.text;
    revenues.title = _titleTextController.text;

    // revenues.idMainCategories = widget.idMainCategories;

    return revenues;
  }
}
