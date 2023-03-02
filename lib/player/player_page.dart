import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platform_player_web.dart';
import 'shaka_player_interop.dart' as player;

class PlayerPage extends StatefulWidget {
  final String videoUrl;

  const PlayerPage({super.key, required this.videoUrl});

  @override
  State<StatefulWidget> createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  Completer<void> assetLoadingCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      player
          .initPlayer(widget.videoUrl)
          .then((value) => assetLoadingCompleter.complete());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event.logicalKey != LogicalKeyboardKey.enter) {
          Navigator.of(context).pop();
        }

        return KeyEventResult.handled;
      },
        child: Stack(children: [
      PlatformPlayerWeb(),
      FutureBuilder(
          future: assetLoadingCompleter.future,
          builder: (context, snaphot) {
            return Center(
                child: snaphot.connectionState == ConnectionState.done
                    ? const SizedBox()
                    : const CircularProgressIndicator());
          })
    ]));
  }
}
