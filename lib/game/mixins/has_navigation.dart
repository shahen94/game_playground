import 'package:flame_playground/events/navigation_emitter.dart';

mixin HasNavigation {
  final NavigationEmitter emitter = NavigationEmitter.instance;
}
