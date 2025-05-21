import 'package:flutter/material.dart';
import 'package:todoapp/core.dart';
import 'package:get/get.dart';

class SplashscreenController extends State<SplashscreenView> {
  static late SplashscreenController instance;
  late SplashscreenView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    Future.delayed(Duration(seconds: 3), () {
      // Redirect ke Home setelah 2 detik
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
