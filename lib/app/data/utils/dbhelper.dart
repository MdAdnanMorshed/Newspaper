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


/*  /// Local Login Save
  Future<bool> setUserData(loginResponse) async {
    print('userId >>> ${loginResponse['user_id']}');
    print('auth_status >>> ${loginResponse['auth_status']}');

    //var is_logged_in = loginResponse['auth_status'];
    var userId = loginResponse['user_id'];
    var token = loginResponse['token'];

    is_logged_in.$ = true;
    is_logged_in.save();

    user_id.$ = userId;
    user_id.save();

    access_token.$ = token;
    access_token.save();

    print('Local Store UserId With Is Logged ');
    print('${is_logged_in.$}');
    print('${user_id.$}');


    return true;
  }

  /// Local login clear
  clearUserData() {
    is_logged_in.$ = false;
    is_logged_in.save();
    access_token.$ = "";
    access_token.save();
    user_id.$ = '';
    user_id.save();
    user_name.$ = "";
    user_name.save();
    user_name.$ = "";
    user_name.save();
    user_phone.$ = "";
    user_phone.save();
    avatar_original.$ = "";
    avatar_original.save();
  }*/
}