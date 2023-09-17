import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:task_4/controller/splashcontroller.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final SplashController _splashController= Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/logo.json',width: MediaQuery.sizeOf(context).width/2),
            Text('Tic-Tac-Toe',style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}