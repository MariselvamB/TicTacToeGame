// ignore_for_file: file_names

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoegame/screens/HomePage.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                ),
                child: const Center(
                  child: Text(" TIC TAC TOE ",
                      style: TextStyle(
                          fontSize: 40, color: Colors.white, letterSpacing: 2)),
                )),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: AvatarGlow(
                endRadius: 200,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
                  child: Image.asset(
                    "assets/tic-tac-toe-logo.jpg",
                    scale: 2.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 70, bottom: 50),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
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
                    ],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: const Text(
                    "PLAY GAME",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
