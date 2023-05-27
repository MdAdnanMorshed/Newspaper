import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
late SharedPreferences preferences;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  preferences = await SharedPreferences.getInstance();
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
