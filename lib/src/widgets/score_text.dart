import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent {
  final ValueNotifier<int> score;

  ScoreText({
    required this.score,
    Vector2? position,
  }) : super(
    position: position ?? Vector2(10, 10),
    text: 'Score: 0',
    textRenderer: TextPaint(
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    anchor = Anchor.topLeft;
    score.addListener(_updateText);
  }

  void _updateText() {
    text = 'Score: ${score.value}';
  }

  @override
  void onRemove() {
    score.removeListener(_updateText);
    super.onRemove();
  }
}
