import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent {
  Player({this.playerRadius = 15});

  final _velocity = Vector2.zero();
  final _gravity = 980.0;
  final _jumpSpeed = 350.0;
  bool _jumpingRight = true;

  final double playerRadius;

  @override
  void onMount() {
    position = Vector2(0, 0);
    size = Vector2.all(playerRadius * 2);
    anchor = Anchor.topLeft;
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
    _velocity.y += _gravity * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
      const Offset(0, 0) + (size / 2).toOffset(),
      playerRadius,
      Paint()..color = Colors.yellow,
    );
  }

  void jump() {
    if (_jumpingRight) {
      _velocity.y = -_jumpSpeed;
      _velocity.x = _jumpSpeed;
    } else {
      _velocity.y = -_jumpSpeed;
      _velocity.x = -_jumpSpeed;
    }
    _jumpingRight = !_jumpingRight;
  }
}
