import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(

    GetMaterialApp(
      theme:  ThemeData(useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
    ),
  );
}
