import 'dart:math';

import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  const Square({Key? key}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  final Random rnd = Random();

  Widget _buildBlock() {
    const double width = 150;
    const double height = 150;
    const double marge = 5;
    int rengeColor = 255;

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(marge),
        color: Color.fromARGB(
          rnd.nextInt(rengeColor),
          rnd.nextInt(rengeColor),
          rnd.nextInt(rengeColor),
          rnd.nextInt(rengeColor),
        ),
      ),
      width: width,
      height: height,
    );
  }

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
              children: [_buildBlock(), _buildBlock()],
            ),
            Column(
              children: [_buildBlock(), _buildBlock()],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(
          Icons.create_outlined,
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
