import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_playground/game/components/button/button.dart';
import 'package:flame_playground/game/mixins/has_navigation.dart';
import 'package:flame_playground/game/screens.dart';
import 'package:flame_playground/game/screens/home/background.dart';

class HomeScreen extends Component with HasNavigation {
  final PositionComponent _btnPosition = PositionComponent();

  @override
  Future<void>? onLoad() async {
    _btnPosition.add(AppButton(onTap: _onStart));
    add(HomeBackground());
    add(_btnPosition);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    _btnPosition.position = gameSize / 2;
    _btnPosition.size = gameSize;

    super.onGameResize(gameSize);
  }

  void _onStart() {
    emitter.push(Screen.game);
  }
}
