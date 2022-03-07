import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HomeBackground extends Component with HasGameRef {
  SpriteComponent? _sprite;

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
  }

  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load('backgrounds/grass.jpeg');
    _sprite = SpriteComponent.fromImage(
      image,
      position: Vector2(0, 0),
      size: gameRef.size,
    );

    add(_sprite!);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
