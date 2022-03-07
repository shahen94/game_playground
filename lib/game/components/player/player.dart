import 'dart:async' show Timer;

import 'package:flame/components.dart'
    show
        Component,
        HasGameRef,
        SpriteAnimationComponent,
        Sprite,
        SpriteAnimation,
        Vector2;

class Player extends Component with HasGameRef {
  final _playerRunAssets = [
    'game/player/1/run/1.png',
    'game/player/1/run/2.png',
    'game/player/1/run/3.png',
    'game/player/1/run/4.png',
    'game/player/1/run/5.png',
  ];

  final _playerShootingAssets = [
    'game/player/1/run/1.png',
    'game/player/1/run/2.png',
    'game/player/1/run/3.png',
    'game/player/1/run/4.png',
    'game/player/1/run/5.png',
  ];

  final _playerJumpAssets = [
    'game/player/1/jump/1.png',
    'game/player/1/jump/2.png',
    'game/player/1/jump/3.png',
    'game/player/1/jump/4.png',
    'game/player/1/jump/5.png',
    'game/player/1/jump/6.png',
    'game/player/1/jump/7.png',
    'game/player/1/jump/8.png',
  ];

  int currentActiveAnimationIndex = 0;
  final List<SpriteAnimationComponent> spriteAnimationComponents = [];

  shooting() {}

  jump() {
    final jumpAnimation = spriteAnimationComponents[1];
    remove(spriteAnimationComponents[0]);

    add(jumpAnimation);

    jumpAnimation.playing = true;
    jumpAnimation.animation!.reset();

    Timer(
      Duration(seconds: jumpAnimation.animation!.totalDuration().floor()),
      () {
        remove(jumpAnimation);
        add(spriteAnimationComponents[0]);
        jumpAnimation.playing = false;
      },
    );
  }

  loadRun() async {
    List<Sprite> _sprites = [];

    for (var path in _playerRunAssets) {
      final sprite = await Sprite.load(path);
      _sprites.add(sprite);
    }

    final animation = SpriteAnimation.spriteList(
      _sprites,
      stepTime: .15,
      loop: true,
    );

    final component =
        SpriteAnimationComponent(animation: animation, size: Vector2(40, 80));

    spriteAnimationComponents.add(component);
  }

  loadJump() async {
    List<Sprite> _sprites = [];

    for (var path in _playerJumpAssets) {
      final sprite = await Sprite.load(path);
      _sprites.add(sprite);
    }

    final animation = SpriteAnimation.spriteList(
      _sprites,
      stepTime: .15,
      loop: false,
    );

    final component =
        SpriteAnimationComponent(animation: animation, size: Vector2(40, 80));
    component.playing = false;
    spriteAnimationComponents.add(component);
  }

  @override
  Future<void>? onLoad() async {
    await loadRun();
    await loadJump();

    final activeComponent =
        spriteAnimationComponents[currentActiveAnimationIndex];

    add(activeComponent);

    return super.onLoad();
  }
}
