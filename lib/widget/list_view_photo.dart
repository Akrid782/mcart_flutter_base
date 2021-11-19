import 'package:base/models/photos.dart';
import 'package:flutter/material.dart';

class ListViewPhoto extends StatelessWidget {
  final Photos photo;

  const ListViewPhoto({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            photo.url,
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
              child: Text(photo.title),
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
