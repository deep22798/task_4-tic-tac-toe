import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_4/controller/homecontroller.dart';
import 'package:task_4/views/game.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController= Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(65, 203, 191, 20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/logo.json',width: MediaQuery.sizeOf(context).width/2),
          Center(
            child: Text(
              'Tic- Tac- Toe',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
            width: 20,
          ),
          Center(
            child: Text(
              'choose Your Symbol',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
            width: 20,
          ),
          Center(
            child: MaterialButton(
                color: Colors.green.shade600,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Game(),
                      settings: RouteSettings(arguments: _homeController.X.value.toString()),
                    ),
                  );
                },
                child: const Text(
                  'X',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'edu',
                  ),
                )),
          ),
          SizedBox(
            height: 30,
            width: 20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.green.shade800,
              onPressed: () {
                _homeController.turnOfO.value=true;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Game(),
                    settings: RouteSettings(arguments: _homeController.O.value.toString()),
                  ),
                );
              },
              child: Text(
                'O',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'edu',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
