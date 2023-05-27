import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/app/data/repositories/news_repo.dart';
import 'package:newspaper_app/app/data/utils/dbhelper.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  final userNameController = TextEditingController();
  final userMailAddressController = TextEditingController();
  final userPasswordController = TextEditingController();

  final isRegister = true.obs;
  final auth = 'Sign In'.obs;
  final formKey = GlobalKey<FormState>();

  final userName = '';
  final userMail = '';
  final userPass = '';

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // working not need now
  signIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    print('AuthenticationController.signIn');
    final userName = userNameController.text;
    final userMail = userMailAddressController.text;
    final userPass = userPasswordController.text;

    print('Name : $userName');
    print('mail : $userMail');
    print('Password : $userPass');
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: userMail.toString(), password: userPass.toString());
      final User user = userCredential.user!;
      if (user.uid != '') {
        print('AuthenticationController.signIn sucess');
        Get.offNamedUntil(Routes.HOME, (route) => false);
      } else {
        print('AuthenticationController.signIn not success');
      }
      print('AuthenticationController.signIn uid ${user.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // working not need now
  signUp() async {
    print('AuthenticationController.signUp');
    final userName = userNameController.text;
    final userMail = userMailAddressController.text;
    final userPass = userPasswordController.text;

    print('Name : $userName');
    print('mail : $userMail');
    print('Password : $userPass');
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userMail.toString(),
        password: userPass.toString(),
      );
      final User user = userCredential.user!;
      if (user.uid != '') {
        Get.snackbar('Alert', 'Register has successful!');
      } else {
        Get.snackbar('Alert', 'Register has successful!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInByFirebaseAPI() async {
    try {
      final ProgressDialog progressDialog =
          DBHelper.loadingDialog(Get.overlayContext!);
      progressDialog.show();
      SharedPreferences localStore = await SharedPreferences.getInstance();
      var response = await NewsRepo().signInAuth(
          userMailAddressController.text, userPasswordController.text);
      userMailAddressController.clear();
      userPasswordController.clear();
      var data = jsonDecode(response.body);
      var statusCode = response.statusCode.toString();
      print('statusCode >>> $statusCode');
      print('data >>> $data');
      if (statusCode == '200' || statusCode == '201' || statusCode == '202') {
        print('if');
        progressDialog.hide();
        var email = data['email'];
        print(email);
        var idToken = data['idToken'];
        print(idToken);
        var isLogged = true;
        await localStore
            .setStringList('items', <String>[email, idToken, 'true']);
        final List<String>? items = localStore.getStringList('items');
        print('AuthenticationController.signInByFirebaseAPI ${items![0]}');
        print('AuthenticationController.signInByFirebaseAPI ${items![2]}');

        Get.offNamedUntil(Routes.HOME, (route) => false);
      } else {
        progressDialog.hide();
        var message = data['error']['message'];
        var code = data['error']['code'];
        var isLogged = false;
        Get.snackbar('Alert', message,
            backgroundColor: Colors.deepOrange, colorText: Colors.white);
      }
      progressDialog.hide();
    } catch (e) {}
  }

  signUpByFirebaseAPI() async {
    try {
      final ProgressDialog progressDialog =
          DBHelper.loadingDialog(Get.overlayContext!);
      progressDialog.show();
      var res = await NewsRepo().signUpAuth(
          userMailAddressController.text, userPasswordController.text);
      userMailAddressController.clear();
      userPasswordController.clear();

      var response = jsonDecode(res.body);
      var statusCode = res.statusCode;
      print(
          'AuthenticationController.signUpByFirebaseAPI ${statusCode.toString()}');
      if (statusCode.toString() == '200' ||
          statusCode.toString() == '201' ||
          statusCode.toString() == '202') {
        progressDialog.hide();
        Get.snackbar('Alert', 'Register has been successful!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        progressDialog.hide();
        Get.snackbar('Error', 'Register has wrong!',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      progressDialog.hide();
    } catch (e) {}
  }
}
