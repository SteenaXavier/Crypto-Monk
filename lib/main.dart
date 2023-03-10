import 'dart:io';

import 'package:crypto_price_prediction/pages/home_page.dart';
import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:crypto_price_prediction/pages/splash_screen.dart';
import 'package:crypto_price_prediction/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(canvasColor: Colors.transparent),
        getPages: [
          GetPage(name: "/splash", page: () =>  SplashScreen()),
          GetPage(name: "/welcome", page: () => WelcomePage()),
          GetPage(name: "/home", page: () => HomePage()),
          GetPage(name: "/chart", page: () => Chart(coin: 'BITCOIN'))
        ],
        initialRoute: "/splash");
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
