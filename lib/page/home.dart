import 'package:flutter/material.dart';
import 'package:base/widget/button_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const <Widget>[
            ButtonNavigation('4 квадрата', '/square'),
            ButtonNavigation('Цветной список', '/list_color'),
            ButtonNavigation('CodeLab', '/laba'),
            ButtonNavigation('Асинхронный запрос', '/async'),
          ],
        ),
      ),
    );
  }
}
