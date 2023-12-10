import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ComponentsGame extends PositionComponent {
  ComponentsGame({
    required super.position,
    required super.size,
    this.thickness = 8,
  })  : assert(size!.y == size.x),
        super(anchor: Anchor.center);

  final double thickness;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x / 2, height),
      Paint()..color = Colors.blue,
    );
    super.render(canvas);
  }
}
