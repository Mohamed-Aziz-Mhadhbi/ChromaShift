import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Components extends PositionComponent {
  Components({
    required super.position,
    required super.size,
    this.thickness = 8,
  }) : super(anchor: Anchor.center);

  final double thickness;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height),
      Paint()..color = Colors.blue,);
    super.render(canvas);
  }
}
