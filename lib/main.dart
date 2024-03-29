import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

// This List is to prevent if User repeat click button that have icon, prevent from altering the result 
  List<bool> keySafe_1 = [false, false, false];
  List<bool> keySafe_2 = [false, false, false];
  List<bool> keySafe_3 = [false, false, false];

// A list of svg available in assets
  final String cross_svg = "assest/cross.svg"; 
  final String circle_svg = "assest/circle.svg"; 
  final String blank_svg = "assest/blank.svg";

// Determine who's turn
  bool firstTurn = true; 

  // x-axis 
  List<String?> xaxis_1 = [null,null,null]; 
  List<String?> xaxis_2 = [null,null,null]; 
  List<String?> xaxis_3 = [null,null,null]; 

  bool checkMatch() {
    // Check rows for a match:
    for (var row in [xaxis_1, xaxis_2, xaxis_3]) {
      if (row.every((cell) => cell == row[0]) && row[0] != null) {
        return true;
      }
    }

    // Check columns for a match:
    for (var i = 0; i < 3; i++) {
      if (xaxis_1[i] != null &&
        xaxis_1[i] == xaxis_2[i] &&
        xaxis_2[i] == xaxis_3[i]) {
          return true;
      }
    }

    // Check diagonals for a match:
    if (xaxis_1[0] != null &&
      xaxis_1[0] == xaxis_2[1] &&
      xaxis_2[1] == xaxis_3[2]) {
        return true;
    }

    if (xaxis_1[2] != null &&
      xaxis_1[2] == xaxis_2[1] &&
      xaxis_2[1] == xaxis_3[0]) {
        return true;
    }

    // No match found
    return false;
  }

  gameOver() {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Game Over!'),
        actions: [TextButton.icon(
          onPressed: () {
            setState(() {
              xaxis_1 = [null, null, null];
              xaxis_2 = [null, null, null];
              xaxis_3 = [null, null, null];
            });
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.replay), 
          label: const Text("Try Again"),
        )],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tic-tac-Toe"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            defaultColumnWidth: const FlexColumnWidth(5.0),
            children: [
              TableRow(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                    child: IconButton(
                      onPressed: keySafe_3[0]? null : () {
                        setState(() {
                          if (firstTurn) {
                            xaxis_3[0] = cross_svg; 
                            firstTurn = false; 
                          }else {
                            xaxis_3[0] = circle_svg; 
                            firstTurn = true; 
                          }
                          keySafe_3[0] = true;
                        });
                        if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_3[0] ?? blank_svg),
                                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_3[1]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_3[1] = cross_svg; 
                          firstTurn = false; 
                        } else{ 
                          xaxis_3[1] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_3[1] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_3[1] ?? blank_svg),
                  ),
                ), 
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_3[2]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_3[2] = cross_svg; 
                          firstTurn = false; 
                        } else {
                          xaxis_3[2] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_3[2] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_3[2] ?? blank_svg),
                  ),
                ),
                ]
              ), 
              // xaxis_2 
            TableRow(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                    child: IconButton(
                      onPressed: keySafe_2[0]? null : () {
                        setState(() {
                          if (firstTurn) {
                            xaxis_2[0] = cross_svg; 
                            firstTurn = false; 
                          }else {
                            xaxis_2[0] = circle_svg; 
                            firstTurn = true; 
                          }
                          keySafe_2[0] = true;
                        });
                        if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_2[0] ?? blank_svg),
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_2[1]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_2[1] = cross_svg; 
                          firstTurn = false; 
                        } else{ 
                          xaxis_2[1] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_2[1] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_2[1] ?? blank_svg),
                  ),
                ), 
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_2[2]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_2[2] = cross_svg; 
                          firstTurn = false; 
                        } else {
                          xaxis_2[2] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_2[2] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_2[2] ?? blank_svg),
                  ),
                ),
                ]
              ), 
              // xaxis_1 
            TableRow(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                    child: IconButton(
                      onPressed: keySafe_1[0]? null : () {
                        setState(() {
                          if (firstTurn) {
                            xaxis_1[0] = cross_svg; 
                            firstTurn = false; 
                          }else {
                            xaxis_1[0] = circle_svg; 
                            firstTurn = true; 
                          }
                          keySafe_1[0] = true;
                        });
                        if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_1[0] ?? blank_svg),
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_1[1]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_1[1] = cross_svg; 
                          firstTurn = false; 
                        } else{ 
                          xaxis_1[1] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_1[1] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_1[1] ?? blank_svg),
                  ),
                ), 
                SizedBox(
                  height: MediaQuery.of(context).size.height/5,
                  child: IconButton(
                    onPressed: keySafe_1[2]? null : () {
                      setState(() {
                        if (firstTurn) {
                          xaxis_1[2] = cross_svg; 
                          firstTurn = false; 
                        } else {
                          xaxis_1[2] = circle_svg; 
                          firstTurn = true; 
                        }
                        keySafe_1[2] = true; 
                      });
                      if (checkMatch()) {gameOver();}
                    }, 
                    icon: SvgPicture.asset(xaxis_1[2] ?? blank_svg),
                  ),
                ),
                ]
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
