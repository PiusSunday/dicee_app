import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dicee',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.teal.shade600,
        ),
        backgroundColor: Colors.teal.shade700,
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  
  String dice = "click on dice to roll";

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Function to roll the dice
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  
  // Function to Reset the dice to default
  void resetDice() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    rollDice();
                    dice = "Left dice clicked!";
                  },
                  child: Image.asset(
                    'images/dice$leftDiceNumber.png',
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    rollDice();
                    dice = "Right dice clicked!";
                  },
                  child: Image.asset(
                    'images/dice$rightDiceNumber.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            dice,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(
                  color: Colors.teal,
                  width: 3,
                ),
              ),
              backgroundColor: Colors.red.shade50,
              primary: Colors.purple.shade600,
            ),
            onPressed: () {
              resetDice();
              dice = "click on dice to roll";
            },
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
