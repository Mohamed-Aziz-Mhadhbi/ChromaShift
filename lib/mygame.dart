import 'package:chroma_shift/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player myPlayer;
  MyGame() : super(camera: CameraComponent()) {
    final screenSize =
        MediaQueryData.fromView(WidgetsBinding.instance.window).size;

    camera = CameraComponent.withFixedResolution(
      width: screenSize.width,
      height: screenSize.height,
    );
  }

  @override
  Color backgroundColor() => const Color(0xff444444);

  @override
  void onMount() {
    world.add(myPlayer = Player());
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
}
