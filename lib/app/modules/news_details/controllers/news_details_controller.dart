import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newspaper_app/app/data/models/newspaper_model.dart';

class NewsDetailsController extends GetxController {
  //TODO: Implement NewsDetailsController

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

  addNewsFormBookMark(NewsPaperModel data, userAddress) async {
    if (kDebugMode) {
      print(userAddress);
    }
    final db = FirebaseFirestore.instance;
    final docRef = db.collection(userAddress.toString()).doc();
    await docRef.set(data.toJson()).then((value) {
      Get.snackbar('Alert', 'bookmark has successful!',
          backgroundColor: Colors.green, colorText: Colors.white);
    },
        onError: (e) => Get.snackbar('Wrong', 'Error is $e',
            backgroundColor: Colors.red, colorText: Colors.white));
  }
}
