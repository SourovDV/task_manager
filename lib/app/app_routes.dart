import 'package:get/get_navigation/get_navigation.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_bindings.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_view.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_bindings.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_view.dart';

class AppRoutes{
  static final initialRoute =AppPages.splashScreen;
  static  List<GetPage> routes = [
    GetPage(name: AppPages.splashScreen, page:()=>SplashScreenView(),binding: SplashBindings()),
    GetPage(name: AppPages.loginScreen, page: ()=>LoginScreenView(),binding: LoginScreenBindings()),
  ];
}