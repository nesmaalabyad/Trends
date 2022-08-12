import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => signUp())));



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,

      body: Center(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(child: Icon(Icons.trending_up, size: 200, color: Colors.white,)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Trends", style: TextStyle(color: Colors.white, fontSize: 50), textAlign: TextAlign.center,),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text("Made by  Nesma Alabyad", style: TextStyle(color: Colors.white, fontSize: 16,fontStyle: FontStyle.italic), textAlign: TextAlign.end,),
            ),
          ],
        ),

      ),
    );
  }
}



