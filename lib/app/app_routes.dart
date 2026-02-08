import 'package:get/get_navigation/get_navigation.dart';
import 'package:task_manager/app/app_pages.dart';
import 'package:task_manager/feature/screen/addItem/add_item_bindings.dart';
import 'package:task_manager/feature/screen/addItem/add_item_view.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_bindings.dart';
import 'package:task_manager/feature/screen/cancelled/cancelled_view.dart';
import 'package:task_manager/feature/screen/completed/completed_bindings.dart';
import 'package:task_manager/feature/screen/completed/completed_view.dart';
import 'package:task_manager/feature/screen/forgetPassword/forgetPassword_bindings.dart';
import 'package:task_manager/feature/screen/forgetPassword/forgetPassword_view.dart';
import 'package:task_manager/feature/screen/homeView/homeView_bindings.dart';
import 'package:task_manager/feature/screen/homeView/homeView_view.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_bindings.dart';
import 'package:task_manager/feature/screen/login_screen/login_screen_view.dart';
import 'package:task_manager/feature/screen/new/new_bindings.dart';
import 'package:task_manager/feature/screen/new/new_view.dart';
import 'package:task_manager/feature/screen/pinVerification/pin_verification_bindings.dart';
import 'package:task_manager/feature/screen/pinVerification/pinverification_view.dart';
import 'package:task_manager/feature/screen/progress/progress_bindings.dart';
import 'package:task_manager/feature/screen/progress/progress_view.dart';
import 'package:task_manager/feature/screen/setPassword/setPasswordView.dart';
import 'package:task_manager/feature/screen/setPassword/set_password_bindings.dart';
import 'package:task_manager/feature/screen/signUp/sign_up_bindings.dart';
import 'package:task_manager/feature/screen/signUp/sign_up_view.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_bindings.dart';
import 'package:task_manager/feature/screen/splash_screen/splash_screen_view.dart';

class AppRoutes{
  static final initialRoute =AppPages.splashScreen;
  static  List<GetPage> routes = [
    GetPage(name: AppPages.splashScreen, page:()=>SplashScreenView(),binding: SplashBindings()),
    GetPage(name: AppPages.loginScreen, page: ()=>LoginScreenView(),binding: LoginScreenBindings()),
    GetPage(name: AppPages.forgetPassword, page: ()=>ForgetPasswordView(),binding: ForgetBindings()),
    GetPage(name: AppPages.pinVerification, page: ()=>PinVerificationView(),binding: PinVerificationBindings()),
    GetPage(name: AppPages.setPassword, page: ()=>SetPasswordView(),binding: SetPasswordBindings()),
    GetPage(name: AppPages.signUp, page: ()=>SignUpView(),binding: SignUpBindings()),
    GetPage(name: AppPages.homeView, page: ()=>HomeViewView(),binding: HomeViewBindings()),
    GetPage(name: AppPages.newData, page: ()=>NewView(),binding: NewBindings()),
    GetPage(name: AppPages.completed, page: ()=>CompletedView(),binding: CompletedBindings()),
    GetPage(name: AppPages.cancelled, page: ()=>CancelledView(),binding: CancelBindings()),
    GetPage(name: AppPages.progress, page: ()=>ProgressView(),binding: ProgressBindings()),
    GetPage(name: AppPages.addItem, page: ()=>AddItemView(),binding: AddItemBindings()),





  ];
}