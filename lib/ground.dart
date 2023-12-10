import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ground extends PositionComponent {
  Ground({required super.position})
      : super(
          size: Vector2(100, 1),
        );
  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, width, height),
      Paint()..color = Colors.red,
    );
    super.render(canvas);
  }
}
