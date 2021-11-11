import 'package:flutter/material.dart';
import 'package:base/page/code_lab.dart';
import 'package:base/page/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'База',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/laba': (context) => const Laba()
      },
    );
  }
}
