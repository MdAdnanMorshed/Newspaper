import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/app/data/utils/dbhelper.dart';

class BookmarksListController extends GetxController {

  final count = 0.obs;
  final isLoadingData=false.obs;
  final bookMarkList=[];
  var mail = ''.obs;
  @override
  void onInit() {

    DBHelper.object.userMail().then((value) {
      mail.value = value.toString();
      if (kDebugMode) {
        print('mail >> $mail');
      }
    });

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
  getFireStoreDataBookMarks() async {
    final  db = FirebaseFirestore.instance;
    return  db.collection('abc@gmail.com').snapshots;



  }
}
