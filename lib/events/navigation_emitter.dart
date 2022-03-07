import 'package:flame_playground/events/emitter.dart';
import 'package:flame_playground/game/screens.dart';

typedef NavigationCallback = void Function(Screen);

const kNavigationEvent = '@@__NAVIGATION_EVENT__@@';

class NavigationEmitter extends EventEmitter<Screen> {
  static NavigationEmitter instance = NavigationEmitter._();

  final List<Screen> _stack = [Screen.home];

  NavigationEmitter._();

  Screen get currentScreen => _stack.last;

  onChange(NavigationCallback callback) {
    on(kNavigationEvent, callback);
  }

  push(Screen screen) {
    if (_stack.last == screen) {
      return;
    }

    _stack.add(screen);

    emit(kNavigationEvent, currentScreen);
  }

  pop() {
    if (_stack.length == 1) {
      return;
    }
    _stack.removeLast();

    emit(kNavigationEvent, currentScreen);
  }
}
