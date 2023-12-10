import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ComponentsGame extends PositionComponent {
  ComponentsGame({
    required Vector2 position,
    required Vector2 size,
    this.thickness = 8,
  })  : assert(size.y == size.x),
        super(
          position: position,
          size: size,
          anchor: Anchor.center,
        );

  final double thickness;

  final randomColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, Random().nextDouble() * (size.x / 2),
          Random().nextDouble() * (size.y / 2)),
      Paint()..color = randomColor,
    );
    super.render(canvas);
  }
}
