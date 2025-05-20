import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core.dart';
import 'package:todoapp/core/routes/app_get.dart';
import 'package:todoapp/presentation/splashscreen/view/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      // initialRoute: '/splashscreen',
      debugShowCheckedModeBanner: false,
      home: SplashscreenView(),
      getPages: AppPages.pages,
    );
  }
}
