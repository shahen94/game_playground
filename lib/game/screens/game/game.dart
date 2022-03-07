import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_playground/game/components/player/player.dart';
import 'package:flame_playground/game/components/zombie/zombie.dart';
import 'package:flame_playground/game/screens/game/background.dart';
import 'package:flutter/material.dart';

class GameScreen extends PositionComponent with HasGameRef, Tappable {
  final List<PositionComponent> _positioned = [];
  final playerPosition = PositionComponent();
  final player = Player();

  final kMaxZombieCount = 10;
  final kMinZombieCount = 1;

  bool shooting = false;

  @override
  Future<void>? onLoad() {
    position = Vector2(0, 0);
    size = gameRef.size;

    add(GameBackground());

    playerPosition.add(player);
    playerPosition.position = Vector2(10, gameRef.size.y - 100);

    for (var i = 0; i < kMaxZombieCount; i++) {
      final position = PositionComponent()
        ..add(Zombie())
        ..flipHorizontally()
        ..position =
            Vector2(gameRef.size.x - 20 - (i + 1) * 40, gameRef.size.y - 100)
        ..size = Vector2(100, 100);

      _positioned.add(position);
      add(position);
    }

    add(playerPosition);

    return super.onLoad();
  }

  @override
  bool onTapDown(TapDownInfo details) {
    player.jump();
    return true;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
  }
}
