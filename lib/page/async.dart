import 'dart:convert';

import 'package:base/widget/list_view_photo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:base/models/photos.dart';

class AsyncRequest extends StatefulWidget {
  const AsyncRequest({Key? key}) : super(key: key);

  @override
  _AsyncRequestState createState() => _AsyncRequestState();
}

class _AsyncRequestState extends State<AsyncRequest> {
  final _photos = <Photos>[];
  late int _page = 0;
  final int _limit = 50;

  /// Парсер json данных
  ///
  /// String [json] - json строка
  ///
  /// Возвращается список моделей данных о фотографиях
  List<Photos> parsePhotos(String json) {
    final parsed = jsonDecode(json).cast<Map<String, dynamic>>();

    return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
  }

  void _getImages() async {
    _page++;

    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?_limit=$_limit&_page=$_page'));

    final arResult = parsePhotos(response.body);

    setState(() {
      _photos.addAll(arResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Асинхронный запрос'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        itemCount: _photos.length,
        itemBuilder: (BuildContext _context, i) {
          final int index = (_photos.length) ~/ 2;

          if (i >= index) {
            _getImages();
          }

          return ListViewPhoto(photo: _photos[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImages();
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: const Icon(
          Icons.create_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
