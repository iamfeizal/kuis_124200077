import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:kuis_124200077/home.dart';
import 'package:kuis_124200077/listGroc.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ); // Material App
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.green,
      splash: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              "assets/images/grocery.png",
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              "KUIS",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "Imam Agus Faisal",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              "124200077",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              "Prak Mobile SI-C",
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
      nextScreen: const Home(),
      splashIconSize: 350,
      duration: 1000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
