import 'package:get/get.dart';
import 'package:todoapp/presentation/home/view/home_view.dart';
import 'package:todoapp/presentation/splashscreen/view/splashscreen_view.dart';

class AppRoutes {
  AppRoutes._();
  static const home = '/home';
  static const splashscreen = '/splashscreen';
}

class AppPages {
  AppPages._();

  static List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.splashscreen, page: () => const SplashscreenView()),
  ];
}
