import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String _image;
  final String _title;
  final bool _isFocused;

  Tile(this._image, this._title, this._isFocused);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        color: _isFocused ? Colors.red : Colors.green,
        child: Stack(children: [
          Image.network(_image),
          Center(
              child: Image.network(
            'https://cdn2.iconfinder.com/data/icons/thick-outlines-online-project-basics/128/20-blue_media-movie-player-vod-512.png',
            width: 100,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: const Color.fromRGBO(20, 20, 20, 0.5),
              child: Text(
                _title,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          )
        ]));
  }
}
