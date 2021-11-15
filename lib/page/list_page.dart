import 'dart:math';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final Random rnd = Random();
  final _items = <Color>[];

  List<Color> generateList() {
    int rengeColor = 255;

    return List<Color>.generate(
      1000,
      (index) => Color.fromARGB(
        rnd.nextInt(rengeColor),
        rnd.nextInt(rengeColor),
        rnd.nextInt(rengeColor),
        rnd.nextInt(rengeColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цветной список'),
      ),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _items.clear();
            _items.addAll(generateList());
          });
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

  Widget _buildListView() {
    _items.addAll(generateList());
    return ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: _items.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(i);
        });
  }

  Widget _buildRow(int i) {
    return Container(
      color: _items[i],
      height: 71,
      margin: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
    );
  }
}
