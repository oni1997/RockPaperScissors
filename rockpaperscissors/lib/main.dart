import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random random = Random();
  int userChoice = 0;
  int computerChoice = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose your move:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => playGame(0),
                    child: Text('Rock'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => playGame(1),
                    child: Text('Paper'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => playGame(2),
                    child: Text('Scissors'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void playGame(int choice) {
    setState(() {
      userChoice = choice;
      computerChoice = random.nextInt(3);
      result = getResult();
    });
  }

  String getResult() {
    String computerMove = '';
    switch (computerChoice) {
      case 0:
        computerMove = 'Rock';
        break;
      case 1:
        computerMove = 'Paper';
        break;
      case 2:
        computerMove = 'Scissors';
        break;
    }

    if (userChoice == computerChoice) {
      return 'Draw!! Computer chose $computerMove';
    } else if ((userChoice == 0 && computerChoice == 2) ||
        (userChoice == 1 && computerChoice == 0) ||
        (userChoice == 2 && computerChoice == 1)) {
      return 'You Win! Computer chose $computerMove';
    } else {
      return 'You Lose! Computer chose $computerMove';
    }
  }
}
