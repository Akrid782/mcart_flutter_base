import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:base/models/photos.dart';

class SyncRequest extends StatefulWidget {
  const SyncRequest({Key? key}) : super(key: key);

  @override
  _SyncRequestState createState() => _SyncRequestState();
}

class _SyncRequestState extends State<SyncRequest> {
  final _photos = <Photos>[];
  late int _page = 0;
  final int _limit = 5;

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

    setState(() {
      _photos.addAll(parsePhotos(response.body));
    });
  }

  Widget _buildContentListView(Photos _photo) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Image.network(
            _photo.url,
            fit: BoxFit.cover,
            height: 271,
            width: MediaQuery.of(context).size.width,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              return loadingProgress == null
                  ? child
                  : Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
            },
          ),
          Positioned(
            bottom: 0,
            height: 64,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(_photo.title),
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
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
          if ((i + 1) >= _photos.length) {
            _getImages();
          }

          return _buildContentListView(_photos[i]);
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
