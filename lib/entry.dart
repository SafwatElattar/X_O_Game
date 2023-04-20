import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; // frist player
  List<String> displayExoh = ['', '', '', '', '', '', '', '', ''];

  int player_o = 0;
  // ignore: non_constant_identifier_names
  int player_x = 0;
  int filled_box = 0;

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: Column(
                  children: [
                    Text("Player O",
                        style: TextStyle(
                            color: Color.fromARGB(255, 240, 2, 2),
                            fontSize: 20)),
                    Text(player_o.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 236, 210),
                            fontSize: 20)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: Column(
                  children: [
                    Text("Player X",
                        style: TextStyle(
                            color: Color.fromARGB(255, 240, 2, 2),
                            fontSize: 20)),
                    Text(player_x.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 236, 210),
                            fontSize: 20)),
                  ],
                ),
              ),
            ],
          ))),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContextcontext, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(185, 17, 196, 246))),
                        child: Center(
                            child: Text(
                          displayExoh[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        )),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExoh[index] == "") {
        displayExoh[index] = "O";
        filled_box += 1;
      } else if (!ohTurn && displayExoh[index] == "") {
        displayExoh[index] = "X";
        filled_box += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // frist row
    if (displayExoh[0] == displayExoh[1] &&
        displayExoh[0] == displayExoh[2] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
    //second row
    if (displayExoh[3] == displayExoh[4] &&
        displayExoh[3] == displayExoh[5] &&
        displayExoh[3] != '') {
      _showWinDialog(displayExoh[3]);
    }
    if (displayExoh[6] == displayExoh[7] &&
        displayExoh[6] == displayExoh[8] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }
    if (displayExoh[0] == displayExoh[3] &&
        displayExoh[0] == displayExoh[6] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
    if (displayExoh[1] == displayExoh[4] &&
        displayExoh[1] == displayExoh[7] &&
        displayExoh[1] != '') {
      _showWinDialog(displayExoh[1]);
    }
    if (displayExoh[2] == displayExoh[5] &&
        displayExoh[2] == displayExoh[8] &&
        displayExoh[2] != '') {
      _showWinDialog(displayExoh[2]);
    }
    if (displayExoh[6] == displayExoh[4] &&
        displayExoh[6] == displayExoh[2] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }
    if (displayExoh[0] == displayExoh[4] &&
        displayExoh[0] == displayExoh[8] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    } else if (filled_box == 9) {
      Filled_square();
    }
  }

  void Filled_square() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("The game is locked  "),
            actions: <Widget>[
              FloatingActionButton(
                  child: Text(
                    "Play Agian? ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 239, 24, 4), fontSize: 13),
                  ),
                  onPressed: () {
                    clear_game();
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text(winner + " IS WINNER "),
            actions: <Widget>[
              FloatingActionButton(
                  child: Text(
                    "Play Agian? ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 227, 3, 70),
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () {
                    clear_game();
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
    if (winner == "O") {
      player_o += 1;
    } else if (winner == "X") {
      player_x += 1;
    }
  }

  void clear_game() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExoh[i] = "";
      }
      filled_box = 0;
    });
  }
}
