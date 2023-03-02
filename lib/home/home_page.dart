import 'package:flutter/material.dart';
import 'package:shaka_player_flutter_demo/player/player_page.dart';

import 'focusable.dart';
import 'grid_tile.dart';

class HomePage extends StatelessWidget {
  List<_TileModel> tileModels = [
    _TileModel(
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/07/Why-The-Orville-Isnt-Just-a-Star-Trek-Ripoff-feature.jpg',
        'The key, scrollDirection, reverse, controller, primary, physics, and shrinkWrap properties on GridView map directly to the identically named properties on CustomScrollView.',
        'https://storage.googleapis.com/shaka-demo-assets/angel-one/dash.mpd'),
    _TileModel(
        'https://www.protocol.com/media-library/big-buck-bunny.png?id=28250459&width=1245&height=700&quality=85&coordinates=0%2C0%2C0%2C0',
        'The CustomScrollView.slivers property should be a list containing just a SliverGrid.',
        'https://storage.googleapis.com/shaka-demo-assets/bbb-dark-truths/dash.mpd'),
    _TileModel(
        'https://showmax.akamaized.net/i/0bf4d937-753b-47b5-9ea6-ebf3d452201e/format=webp/q=70/850x',
        'The childrenDelegate property on GridView corresponds to the SliverGrid.delegate property, and the gridDelegate property on the GridView corresponds to the SliverGrid.gridDelegate property.',
        'https://storage.googleapis.com/shaka-demo-assets/sintel/dash.mpd'),
    _TileModel(
        'https://thumbs.dreamstime.com/b/isolated-hand-gestures-signals-asian-female-child-hand-multiple-options-includes-clipping-path-isolated-hand-gestures-178625423.jpg',
        'This example shows a custom implementation of ListTile selection in a GridView or ListView. Long press any ListTile to enable selection mode.',
        'https://storage.googleapis.com/shaka-demo-assets/heliocentrism/heliocentrism.mpd'),
    _TileModel(
        'https://media.istockphoto.com/illustrations/breaking-news-live-stream-test-pattern-illustration-id1256320858',
        'The GridView, GridView.count, and GridView.extent constructors children arguments correspond to the childrenDelegate being a SliverChildListDelegate with that same argument. ',
        'https://livesim.dashif.org/dash/vod/testpic_2s/img_subs.mpd'),
    _TileModel(
        'https://i0.wp.com/www.thebioneer.com/wp-content/uploads/2021/04/Parkour-Workout-Vault.jpg?fit=1234%2C851&ssl=1',
        'The GridView.builder constructors itemBuilder and childCount arguments correspond to the childrenDelegate being a SliverChildBuilderDelegate with the matching arguments.',
        'https://bitdash-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd'),
    _TileModel(
        'https://i0.wp.com/www.thebioneer.com/wp-content/uploads/2021/04/Parkour-Workout-Vault.jpg?fit=1234%2C851&ssl=1',
        'The GridView.count and GridView.extent constructors create custom grid delegates, and have equivalently named constructors on SliverGrid to ease the transition: SliverGrid.count and SliverGrid.extent respectively.',
        'https://bitdash-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd'),
    _TileModel(
        'https://i0.wp.com/www.thebioneer.com/wp-content/uploads/2021/04/Parkour-Workout-Vault.jpg?fit=1234%2C851&ssl=1',
        'By default, GridView will automatically pad the limits of the gridss scrollable to avoid partial obstructions indicated by MediaQuerys padding. To avoid this behavior, override with a zero padding property.',
        'https://bitdash-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd')
  ];

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6),
            itemCount: 2000,
            itemBuilder: (context, index) {
              final model = getTileModel(index);
              return Focusable(
                  (isFocused) => Tile(model.imageUrl, model.title, isFocused),
                  () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(videoUrl: model.videoUrl),
                  ),
                );
              });
            }));
  }

  _TileModel getTileModel(int index) {
    return tileModels[index % tileModels.length];
  }
}

class _TileModel {
  String imageUrl;
  String title;
  String videoUrl;

  _TileModel(this.imageUrl, this.title, this.videoUrl);
}