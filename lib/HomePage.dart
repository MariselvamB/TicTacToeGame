// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tictactoegame/logoScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  bool ohTurn = true;
  List<String> displayExOh = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: const Center(
                child: Text("Scoreboard",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text("Player - X  ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(exScore.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text("Player - O ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(ohScore.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700),
                          color: Colors.grey.shade800,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade800,
                                offset: const Offset(6.0, 0.0),
                                blurRadius: 15,
                                spreadRadius: 2),
                            const BoxShadow(
                                color: Colors.black,
                                offset: Offset(-6.0, -6.0),
                                blurRadius: 50,
                                spreadRadius: 2),
                            BoxShadow(
                                blurStyle: BlurStyle.inner,
                                color: Colors.grey.shade800,
                                offset: const Offset(6.0, 0.0),
                                blurRadius: 15,
                                spreadRadius: 2),
                          ]),
                      child: Center(
                        child: Text(displayExOh[index],
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                  ),
                  child: const Center(
                    child: Text("Tic Tac Toe",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn) {
        displayExOh[index] = "O";
        filledBoxes += 1;
      } else {
        displayExOh[index] = "X";
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showWinDialog(displayExOh[3]);
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showWinDialog(displayExOh[1]);
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showWinDialog(displayExOh[2]);
    }
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('DRAW',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Play Again!',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Exit',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogoScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: Colors.grey.shade800,
            shape: const RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Padding(
              padding: EdgeInsets.all(20),
              child: Text(' WINNER IS      -    $winner',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Play Again!',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Exit',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogoScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    if (winner == "O") {
      ohScore += 1;
    } else if (winner == "X") {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = "";
      }
    });
    filledBoxes = 0;
  }
}
