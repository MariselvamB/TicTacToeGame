// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tictactoegame/screens/logoScreen.dart';
import 'package:tictactoegame/units/App_Units.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => appCloseButtenPressed(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
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
                            child: Text(AppUnits.exScore.toString(),
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
                            child: Text(AppUnits.ohScore.toString(),
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
                          child: Text(AppUnits.displayExOh[index],
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
      ),
    );
  }

  void _tapped(int index) {
    if (AppUnits.displayExOh[index].isEmpty) {
      setState(() {
        if (AppUnits.ohTurn) {
          AppUnits.displayExOh[index] = "O";
          AppUnits.filledBoxes += 1;
        } else {
          AppUnits.displayExOh[index] = "X";
          AppUnits.filledBoxes += 1;
        }
        AppUnits.ohTurn = !AppUnits.ohTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    if (AppUnits.displayExOh[0] == AppUnits.displayExOh[1] &&
        AppUnits.displayExOh[0] == AppUnits.displayExOh[2] &&
        AppUnits.displayExOh[0] != "") {
      _showWinDialog(AppUnits.displayExOh[0]);
    }
    if (AppUnits.displayExOh[3] == AppUnits.displayExOh[4] &&
        AppUnits.displayExOh[3] == AppUnits.displayExOh[5] &&
        AppUnits.displayExOh[3] != "") {
      _showWinDialog(AppUnits.displayExOh[3]);
    }
    if (AppUnits.displayExOh[6] == AppUnits.displayExOh[7] &&
        AppUnits.displayExOh[6] == AppUnits.displayExOh[8] &&
        AppUnits.displayExOh[6] != "") {
      _showWinDialog(AppUnits.displayExOh[6]);
    }
    if (AppUnits.displayExOh[0] == AppUnits.displayExOh[3] &&
        AppUnits.displayExOh[0] == AppUnits.displayExOh[6] &&
        AppUnits.displayExOh[0] != "") {
      _showWinDialog(AppUnits.displayExOh[0]);
    }
    if (AppUnits.displayExOh[1] == AppUnits.displayExOh[4] &&
        AppUnits.displayExOh[1] == AppUnits.displayExOh[7] &&
        AppUnits.displayExOh[1] != "") {
      _showWinDialog(AppUnits.displayExOh[1]);
    }
    if (AppUnits.displayExOh[2] == AppUnits.displayExOh[5] &&
        AppUnits.displayExOh[2] == AppUnits.displayExOh[8] &&
        AppUnits.displayExOh[2] != "") {
      _showWinDialog(AppUnits.displayExOh[2]);
    }
    if (AppUnits.displayExOh[6] == AppUnits.displayExOh[4] &&
        AppUnits.displayExOh[6] == AppUnits.displayExOh[2] &&
        AppUnits.displayExOh[6] != "") {
      _showWinDialog(AppUnits.displayExOh[6]);
    }
    if (AppUnits.displayExOh[0] == AppUnits.displayExOh[4] &&
        AppUnits.displayExOh[0] == AppUnits.displayExOh[8] &&
        AppUnits.displayExOh[0] != "") {
      _showWinDialog(AppUnits.displayExOh[0]);
    } else if (AppUnits.filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
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
            content: const Padding(
              padding: EdgeInsets.all(20),
              child: Text('DRAW',
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
                        _clearBoard();
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
              padding: const EdgeInsets.all(20),
              child: Text(' WINNER IS      -    $winner',
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Play Again !',
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
                        _clearBoard();
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
      AppUnits.ohScore += 1;
    } else if (winner == "X") {
      AppUnits.exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        AppUnits.displayExOh[i] = "";
      }
    });

    AppUnits.ohTurn = true;

    AppUnits.filledBoxes = 0;
  }

  appCloseButtenPressed(BuildContext context) async {
    bool exitApp = await appCloseShowDialog(context);
    return exitApp;
  }

  Future<dynamic> appCloseShowDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: Colors.grey.shade800,
            shape: const RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Really ??',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            content: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Do you want to close the app ??',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('No',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text('Yes',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
