import 'dart:math';

import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  final Random rnd = Random();
  static const double width = 150;
  static const double height = 150;
  static const double marge = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fgh'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(marge),
                  color: Color.fromARGB(
                    rnd.nextInt(255),
                    rnd.nextInt(255),
                    rnd.nextInt(255),
                    rnd.nextInt(255),
                  ),
                  width: width,
                  height: height,
                ),
                Container(
                  margin: const EdgeInsets.all(marge),
                  color: Colors.amber,
                  width: width,
                  height: height,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(marge),
                  color: Colors.red,
                  width: width,
                  height: height,
                ),
                Container(
                  margin: const EdgeInsets.all(marge),
                  color: Colors.amber,
                  width: width,
                  height: height,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
