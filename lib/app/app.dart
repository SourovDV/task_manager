import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/appColor.dart';
import 'package:task_manager/app/app_routes.dart';
import 'package:task_manager/l10n/app_localizations.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
        supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
    ],
      locale: Locale("en"),
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge:TextStyle(
              fontSize: 25,fontWeight: FontWeight.w800
          ),
          titleSmall: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold,color:AppColor.greenColor
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500 ,fontSize: 18
          )
        ),
        inputDecorationTheme: InputDecorationThemeData(

            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),

      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
