import 'dart:math';

import 'package:flame/components.dart';

class Zombie extends Component with HasGameRef {
  final _zombieAssets = [
    'game/zombies/1/walk/1.png',
    'game/zombies/1/walk/2.png',
    'game/zombies/1/walk/3.png',
    'game/zombies/1/walk/4.png',
    'game/zombies/1/walk/5.png',
  ];

  final List<Sprite> _sprites = [];

  @override
  Future<void>? onLoad() async {
    for (var path in _zombieAssets) {
      final sprite = await Sprite.load(path);
      _sprites.add(sprite);
    }

    final animation = SpriteAnimation.spriteList(
      _sprites,
      stepTime: .15,
      loop: true,
    );

    final frame = 1 + Random().nextInt(_zombieAssets.length - 1);

    animation.currentIndex = frame;

    final component =
        SpriteAnimationComponent(animation: animation, size: Vector2(40, 80));

    add(component);

    return super.onLoad();
  }
}
