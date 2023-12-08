import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame {
  
  @override
  Color backgroundColor() => const Color(0xff444444);

  @override
  Future<void> onLoad() async{
    return super.onLoad();
  }
  
}
