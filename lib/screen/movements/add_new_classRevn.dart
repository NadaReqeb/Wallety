import 'package:flutter/material.dart';
import 'package:wallety/firebase/fb_store_controller.dart';
import 'package:wallety/helpers.dart';
import 'package:wallety/model/MovementModel.dart';
import 'package:wallety/model/catergory_expens.dart';
import 'package:wallety/model/catergory_revenues.dart';
import 'package:wallety/widgets/app_button_main.dart';
import 'package:wallety/widgets/app_text_field.dart';

class AddNewCalssRevn extends StatefulWidget {
  const AddNewCalssRevn({Key? key}) : super(key: key);

  @override
  State<AddNewCalssRevn> createState() => _AddNewCalssRevnState();
}

class _AddNewCalssRevnState extends State<AddNewCalssRevn>with Helpers {
  late TextEditingController _textAddClassMove = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff1565C0),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text('Add Category'),
      ),      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 50),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppTextField1(
              hint: 'Add Category',
              // controller: provider.emailController,
              controller: _textAddClassMove,
              textInputType: TextInputType.text,
              prefixIcon: Icon(
                Icons.monetization_on,
                color: Color(0XFFF303030).withOpacity(.50),
              ),
            ),
            SizedBox(height: 10),
            AppButtonMain(
              onPressed: () async{

                await performSave();
                Navigator.pop(context);

              },
              title: 'SAVE',
            ),
            SizedBox(height: 10),
            AppButtonMain(
              onPressed: ()async{
                // await addAccount();
                Navigator.pop(context);
              },
              title: 'CANCEL',
            ),
          ],
        ),
      ),
    );
  }
  // Future<void> addAccount() async {
  //   print('first');
  //   bool status = await FbStoreController().addNewMovement(movement: movement);
  //   if (status) {
  //     Navigator.pushReplacementNamed(context, '/Exp_Rev');
  //
  //     showSnackBar(context: context, content: 'Done add movement',error: false);
  //   } else {
  //     showSnackBar(context: context, content: 'Error to add movement', error: true);
  //   }
  // }
  // Movement get movement {
  //   Movement movement = Movement();
  //   movement.MovementClass =_textAddClassMove.text;
  //   return movement;
  // }

  Future<void>performSave()async{
    if(checkData()){
      await addCategory();

    }else {


    }

  }
  bool checkData(){
    if(_textAddClassMove.text.isNotEmpty){
      return true;
    }
    showSnackBar(context: context, content: 'please Enter the name of Category',error: true);

    return false;
  }


  Future<void>addCategory()async{
    bool status = await FbStoreController().addCategory2(revenues: category);
    if(status)
    {
      showSnackBar(context: context, content: 'Done');
    }else {
      showSnackBar(context: context, content: 'Error Happen!!',error:  true);

    }


  }

  CategoryRevenues get category {

    CategoryRevenues categoryRevenues = CategoryRevenues();
    categoryRevenues.name = _textAddClassMove.text;
    return categoryRevenues ;


  }

// addNewMovement
}
