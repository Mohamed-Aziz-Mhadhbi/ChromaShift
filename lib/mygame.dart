import 'package:chroma_shift/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player myPlayer;

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
    world.add(myPlayer = Player());
    debugMode = true;
    super.onMount();
  }

  @override
  void onTapDown(TapDownEvent event) {
    myPlayer.jump();
    super.onTapDown(event);
  }
}
