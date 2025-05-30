import 'package:bucket_collect_balls_game/bucket_collect_balls_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = BucketCollectBallsGame();
  runApp(GameWidget(game: game));
}
