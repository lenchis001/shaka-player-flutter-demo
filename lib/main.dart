import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'web-player',
      (int viewId) => html.VideoElement()
        ..id = 'video-element'
        ..muted = true);

  runApp(MaterialApp(
    home: Scaffold(body: HomePage()),
  ));
}