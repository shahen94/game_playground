import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/input.dart';

class AppButton extends PositionComponent with Tappable {
  final Vector2 _size = Vector2(100, 100);
  late final SpriteComponent _button;
  late final TextComponent _text;
  final VoidCallback onTap;

  AppButton({required this.onTap});

  @override
  Future<void>? onLoad() async {
    final image = await Flame.images.load("buttons/menu_button.png");

    _button = SpriteComponent.fromImage(image, size: _size);
    _text = TextComponent(text: "Start", anchor: Anchor.center);
    _button.anchor = Anchor.center;

    size = Vector2(100, 100);
    add(_button);
    add(_text);

    return super.onLoad();
  }

  @override
  bool onTapUp(TapUpInfo info) {
    onTap();
    return true;
  }
}
