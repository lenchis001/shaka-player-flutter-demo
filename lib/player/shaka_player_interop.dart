import 'dart:js_util';

import 'package:js/js.dart';

@JS()
external dynamic jsInitPlayer(String manifestUrl);

Future initPlayer(String manifestUrl) {
  return promiseToFuture(jsInitPlayer(manifestUrl));
}