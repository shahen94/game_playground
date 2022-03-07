import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class GameBackground extends Component with HasGameRef {
  final background = [
    ParallaxImageData('game/night/background/1.png'),
    ParallaxImageData('game/night/background/2.png'),
    ParallaxImageData('game/night/background/3.png'),
    ParallaxImageData('game/night/background/4.png'),
    ParallaxImageData('game/night/background/5.png'),
  ];

  @override
  Future<void>? onLoad() async {
    final bg = await gameRef.loadParallaxComponent(
      background,
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    add(bg);

    return super.onLoad();
  }
}
