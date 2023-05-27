import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookmarksListController extends GetxController {

  final count = 0.obs;
  final isLoadingData=false.obs;
  final bookMarkList=[];
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
  getFireStoreDataBookMarks() async {
    final  db = FirebaseFirestore.instance;
    return  db.collection('abc@gmail.com').snapshots;



  }
}
