import 'dart:async';
import 'dart:math' as math;

import 'package:bucket_collect_balls_game/src/widgets/score_text.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './config.dart';
import 'components/components.dart';

/**
 * The game class.
 */
class BucketCollectBallsGame extends FlameGame
    with HasCollisionDetection, KeyboardEvents {
  BucketCollectBallsGame()
    : super(
        camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
        ),
      );

  final rand = math.Random();

  final ValueNotifier<int> score = ValueNotifier(0);

  double get width => size.x;

  double get height => size.y;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());

    world.add(
      Bucket(
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95),
        size: Vector2(bucketWidth, bucketHeight),
      ),
    );

    world.add(
      SpawnComponent(
        period: .2,
        selfPositioning: true,
        autoStart: true,
        factory: (index) {
          return Ball(
            radius: ballRadius,
            position: Vector2(
              new math.Random().nextDouble() * (width - 2 * ballRadius) +
                  ballRadius,
              ballRadius,
            ),
            velocity: Vector2(0, height * 0.2),
          );
        },
      ),
    );
    score.value = 0;
    world.add(ScoreText(score: score));

    this.debugMode = debugMode;
  }

  /// On key event. Just to move bucket.
  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        world.children.query<Bucket>().first.moveBy(-bucketShiftStep);
        break;
      case LogicalKeyboardKey.arrowRight:
        world.children.query<Bucket>().first.moveBy(bucketShiftStep);
        break;
      default:
        break;
    }
    return KeyEventResult.handled;
  }
}
