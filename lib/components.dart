import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ComponentsGame extends PositionComponent with CollisionCallbacks {
  ComponentsGame({
    required Vector2 position,
    required Vector2 size,
    Color? paint,
    this.thickness = 40,
  })  : assert(size.y == size.x),
        paint = paint ??
            Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            ),
        super(
          position: position,
          size: size,
          anchor: Anchor.center,
        ) {
    _generateRandomColor();
  }

  final double thickness;

  late Color paint;

  @override
  void onLoad() {
    super.onLoad();
    add(CircleHitbox(
      position: size / 2,
      radius: 2,
      anchor: anchor,
      collisionType: CollisionType.active,
    ));
  }

  void _generateRandomColor() {
    paint = Color.fromARGB(
      255,
      (Random().nextDouble() * 256).toInt(),
      (Random().nextDouble() * 256).toInt(),
      (Random().nextDouble() * 256).toInt(),
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, thickness, thickness),
      Paint()..color = paint,
    );
    super.render(canvas);
  }
}
