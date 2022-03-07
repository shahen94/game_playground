import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_playground/game/mixins/has_navigation.dart';
import 'package:flame_playground/game/screens.dart';
import 'package:flame_playground/game/screens/game/game.dart';
import 'package:flame_playground/game/screens/home/home.dart';

class AppGame extends FlameGame with HasTappables, HasNavigation {
  Screen _currentScreen = Screen.home;
  late Component _currentScreenInstance;

  @override
  Future<void>? onLoad() async {
    _currentScreenInstance = HomeScreen();

    emitter.onChange((screen) {
      remove(_currentScreenInstance);
      _currentScreen = screen;

      switch (_currentScreen) {
        case Screen.home:
          _currentScreenInstance = HomeScreen();
          break;
        case Screen.game:
          _currentScreenInstance = GameScreen();
          break;
      }

      add(_currentScreenInstance);
    });

    await super.onLoad();
    add(_currentScreenInstance);
  }
}
