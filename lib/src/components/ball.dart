import 'package:bucket_collect_balls_game/src/bucket_collect_balls_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// Ball class.
class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BucketCollectBallsGame> {
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
  }) : super(
         radius: radius,
         anchor: Anchor.center,
         paint:
             Paint()
               ..color = const Color(0xff1e6091)
               ..style = PaintingStyle.fill,
         children: [CircleHitbox()],
       );
  final Vector2 velocity;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();
    game.score.value++;
  }
}
