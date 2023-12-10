import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ComponentsGame extends PositionComponent {
  ComponentsGame({
    required Vector2 position,
    required Vector2 size,
    Color? paint, // Allow the paint color to be specified during construction
    this.thickness = 8,
  })  : assert(size.y == size.x),
        paint = paint ?? Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
        super(
          position: position,
          size: size,
          anchor: Anchor.center,
        );

  final double thickness;

  final Color paint; // Remove 'final' here

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, Random().nextDouble() * (size.x / 2),
          Random().nextDouble() * (size.y / 2)),
      Paint()..color = paint,
    );
    super.render(canvas);
  }
}
