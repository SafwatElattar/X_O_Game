import 'package:flutter/material.dart';
import 'entry.dart';
import 'main.dart';

void main() {
  runApp(MyGame());
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryScreen(),
    );
  }
}

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 149, 205),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 50),
              child: Text(
                'TIC TAC TOE',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 5, 5),
                ),
              ),
            ),
            Column(
              children: [
                const ClipRRect(
                    child: Image(
                  image: AssetImage("images/xo.png"),
                )),
                Column(
                  children: [
                    SafeArea(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 200),
                              Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Color.fromARGB(255, 5, 5, 5),
                                ),
                                child: TextButton(
                                    child:const  Text(
                                      'START GAME',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 228, 0, 0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return HomePage();
                                      }));
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "By Safwat Mahmoud  ",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
