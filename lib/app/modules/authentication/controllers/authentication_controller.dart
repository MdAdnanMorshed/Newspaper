import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/app/routes/app_pages.dart';

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
}
