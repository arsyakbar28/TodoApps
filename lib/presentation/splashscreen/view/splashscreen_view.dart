import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/core.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => SplashscreenController();
}

class SplashscreenController extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation_loading.json',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 10),
            const Text(
              'Todo Apps',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
                decoration: TextDecoration.none, // Menghilangkan underline
              ),
            ),
          ],
        ),
      ),
    );
  }
}
