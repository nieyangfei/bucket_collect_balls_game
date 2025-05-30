import 'dart:async';

import 'package:bucket_collect_balls_game/bucket_collect_balls_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayArea extends RectangleComponent
    with HasGameReference<BucketCollectBallsGame> {
  PlayArea()
    : super(
        paint: Paint()..color = const Color(0xfff2e8cf),
        children: [RectangleHitbox()],
      );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}
