import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_playground/game/game.dart';
import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(
      game: AppGame(),
    ),
  );
}
