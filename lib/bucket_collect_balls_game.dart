import 'dart:async';

import 'package:bucket_collect_balls_game/components/components.dart';
import 'package:bucket_collect_balls_game/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

/**
 * The game class.
 */
class BucketCollectBallsGame extends FlameGame {
  BucketCollectBallsGame()
    : super(
        camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
        ),
      );

  double get width => size.x;

  double get height => size.y;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());
  }
}
