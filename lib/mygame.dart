import 'dart:math';

import 'package:chroma_shift/components.dart';
import 'package:chroma_shift/ground.dart';
import 'package:chroma_shift/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame
    with TapCallbacks, HasCollisionDetection, HasGameRef<MyGame> {
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
  Future<void> onLoad() async {
    await super.onLoad();
    world.add(Ground(position: Vector2(0, 100)));
    world.add(myPlayer = Player());
    debugMode = true;
    generateGameComponent();
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
void generateGameComponent() async {
  var componentSize = Vector2(40, 40);
  const minDistanceX = 50.0;
  const maxDistanceX = 200.0;
  const minDistanceY = 50.0;
  const maxDistanceY = 200.0;

  Ground ground = gameRef.findByKeyName(Ground.keyname)!;
  
  final groundPosition = ground.position;
  final groundHeight = ground.height;

  while (true) {
    final distanceX = Random().nextDouble() * (maxDistanceX - minDistanceX) + minDistanceX;
    final distanceY = Random().nextDouble() * (maxDistanceY - minDistanceY) + minDistanceY;

    final rows = (groundHeight / distanceY).floor();
    final cols = (600 / distanceX).floor();

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        world.add(
          ComponentsGame(
            position: Vector2(
              groundPosition.x + col * distanceX,
              groundPosition.y - groundHeight - row * distanceY,
            ),
            size: componentSize,
          ),
        );
      }
    }

    // Adjust the delay based on your desired spawn rate
    await Future.delayed(const Duration(seconds: 1));
  }
}


}
