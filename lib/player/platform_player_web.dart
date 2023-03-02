import 'package:flutter/material.dart';

class PlatformPlayerWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: HtmlElementView(
        viewType: 'web-player',
      ),
    );
  }
}
