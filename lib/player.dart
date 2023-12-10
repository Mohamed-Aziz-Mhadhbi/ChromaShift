import 'package:chroma_shift/ground.dart';
import 'package:chroma_shift/mygame.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent with HasGameRef<MyGame> {
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
    anchor = Anchor.center;
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
    Ground ground = gameRef.findByKeyName(Ground.keyname)!;
    if (positionOfAnchor(Anchor.bottomCenter).y > ground.position.y) {
      _velocity.setValues(0, 0);
      position = ground.position - (size / 2);
    } else {
      _velocity.y += _gravity * dt;
    }
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
