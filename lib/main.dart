import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introscreen_provider_sp/screen/home/view/home_screen.dart';
import 'package:introscreen_provider_sp/screen/intro/provider/intro_provider.dart';
import 'package:introscreen_provider_sp/screen/intro/view/intro_screen.dart';
import 'package:introscreen_provider_sp/screen/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IntroProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          'intro_screen': (context) => IntroScreen(),
          'home_screen': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
