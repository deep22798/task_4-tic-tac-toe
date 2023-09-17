import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task_4/controller/homecontroller.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final HomeController _homeController= Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    String choice = ModalRoute.of(context)?.settings.arguments as String;
    log(choice);
    if (choice == 'X') {
      _homeController.PlayersChoice.value = 'X';
      _homeController.opponent.value = 'O';
    } else if (choice == 'O') {
      _homeController.PlayersChoice.value = 'O';
      _homeController.opponent.value = 'X';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Tic Tac Toe',
            style: TextStyle(fontFamily: 'edu', fontSize: 20,color: Colors.green)),

      ),
      // backgroundColor: const Color.fromRGBO(22, 78, 99, 20),
      body: Column(
        children: [
          Obx(()=>buildTurn()),
          Obx(()=>buildPointsTable()),
          buildGrid(),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child:MaterialButton(
                  color: Colors.red,
                  onPressed: (){_homeController.clearBoard();},child: Text("Reset",style: TextStyle(color: Colors.white),),),
            ),
        ],
      ),
    );
  }

  // Build Grid
  Widget buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _homeController.xOrOList.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Obx(()=>GestureDetector(
            onTap: () {
              _homeController.tappedIndex(index,context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              child: Center(
                child:Text(
                    _homeController.xOrOList[index],
                    style: TextStyle(
                      color: _homeController.xOrOList[index] == "X" ? Colors.green : Colors.red,
                      fontSize: 40,
                      fontFamily: 'edu',
                    ),
                  ),
                ),
            ),
          ),
        );
      },
    );
  }



// Building the user's turn
  Widget buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          _homeController.turnOfO.value ? 'Turn of O' : 'Turn of X',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 25,
          ),
        ),
      ),
    );
  }


// Build The points table
  Widget buildPointsTable() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '${_homeController.PlayersChoice.value}:',
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.green,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _homeController.PlayersChoice.value == 'X'
                      ? _homeController.scoreX.value.toString()
                      : _homeController.scoreO.value.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.green,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '${_homeController.opponent.value}:',
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.red,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _homeController.opponent.value == 'O' ? _homeController.scoreO.value.toString() : _homeController.scoreX.value.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.red,
                    fontFamily: 'edu',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }



}
