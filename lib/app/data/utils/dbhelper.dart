import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  static DBHelper object = DBHelper._();

  DBHelper._();

  static SharedPreferences? localStore;
  static ProgressDialog? pr;
  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    pr!.style(
        message: "Wait for a few seconds ...",
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: const EdgeInsets.all(10),
          child:  CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.green,
          ),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }

   Future<bool>  isLogged()async{
    print('NewsDetailsView._fetchData >>> ');
    localStore= await SharedPreferences.getInstance();
    final  List<String>? items = localStore!.getStringList('items');
    print('AuthenticationController.signInByFirebaseAPI ${items![2]}');

   return false;

  }

  Future<String>  userMail()async{

    localStore= await SharedPreferences.getInstance();
    final  List<String>? items = localStore!.getStringList('items');
    print('AuthenticationController.signInByFirebaseAPI Mail ${items![0]}');

    return items[0];

  }

}