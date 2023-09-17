import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {

  var scoreX = 0.obs;
  var scoreO = 0.obs;
  var turnOfO = false.obs;
  var PlayersChoice = ''.obs;
  var opponent = ''.obs;
  var filledBoxes = 0.obs;
  var X = 'X'.obs;
  var O = 'O'.obs;

  List<String> xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ].obs;

  // Tapping the index
  void tappedIndex(int index, context) {
        if (turnOfO.value && xOrOList[index] == '') {
          xOrOList[index] = 'O';
          filledBoxes += 1;
        } else if (!turnOfO.value && xOrOList[index] == '') {
          xOrOList[index] = 'X';
          filledBoxes += 1;
        }
        turnOfO.value = !turnOfO.value;
        checkWinner(context);
  }
// Clear the board
  void clearBoard() {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
        scoreO.value=0;
        scoreX.value=0;
    filledBoxes.value = 0;
  }
  void retry() {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
    filledBoxes.value = 0;
  }



  // Check winner
  void checkWinner(context) {
    // Checking first row
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second row
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      showWinDialog(context, 'You win', xOrOList[3]);
      return;
    }

    // checking third row
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      showWinDialog(context, 'You win', xOrOList[6]);
      return;
    }

    // checking first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second column
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      showWinDialog(context, 'You win', xOrOList[1]);
      return;
    }

    // checking third column
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    // Checking diagonally

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You Win', xOrOList[0]);
      return;
    }

    // Chceking diagonnaly

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      showWinDialog(context, 'Its A Draw', '');
      // retur
    }
  }

  // Show winning or draw dialog
  Future<void>? showWinDialog(
      BuildContext context,
      String title,
      String winner,
      ) {
    if (winner == 'O') {
      scoreO += 1;
    } else if(winner=='X') {
      scoreX += 1;
    }
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title,style: TextStyle(color: Colors.black)),
          content: winner == ''
              ? const Text('The Match ended in a Draw',style: TextStyle(color: Colors.black),)
              : Text(
              'The Winner is ${winner.toUpperCase()}',style: TextStyle(color: Colors.black)
          ),
          actions: [
            TextButton(
              onPressed: () {
                retry();
                Navigator.of(context).pop();
              },
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }


}