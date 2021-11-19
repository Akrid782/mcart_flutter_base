import 'package:flutter/material.dart';
import 'package:base/page/code_lab.dart';
import 'package:base/page/home.dart';
import 'package:base/page/square.dart';
import 'package:base/page/list_page.dart';
import 'package:base/page/async.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главная',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/laba': (context) => const Laba(),
        '/square': (context) => const Square(),
        '/list_color': (context) => const ListPage(),
        '/async': (context) => const AsyncRequest(),
      },
    );
  }
}
