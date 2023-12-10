import 'dart:math';

import 'package:chroma_shift/components.dart';
import 'package:chroma_shift/ground.dart';
import 'package:chroma_shift/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with TapCallbacks, HasCollisionDetection {
  late Player myPlayer;
  late double screenWidth;
  late double screenHeight;

  MyGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000,
          ),
        );

  @override
  Color backgroundColor() => const Color(0xff444444);

  @override
  void onMount() {
    world.add(Ground(position: Vector2(0, 100)));
    world.add(myPlayer = Player());
    debugMode = true;
    generateGameComponent();
    super.onMount();
  }

  @override
  void update(double dt) {
    final cameraY = camera.viewfinder.position.y;
    final playerY = myPlayer.position.y;
    if (playerY < cameraY) {
      camera.viewfinder.position = Vector2(0, playerY);
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    myPlayer.jump();
    super.onTapDown(event);
  }

  void generateGameComponent() {
    for (int i = 0; i < 100; i++) {
      world.add(
        ComponentsGame(
          position: Vector2(
            Random().nextDouble() * (600 - 200),
            Random().nextDouble() * (1000 - 200),
          ),
          size: Vector2(200, 200),
        ),
      );
    }
  }
}
