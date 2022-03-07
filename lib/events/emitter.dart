typedef EmitterCallback<T> = void Function(T);

class EventEmitter<T> {
  final Map<String, List<EmitterCallback<T>>> _registry = {};

  void on(String event, EmitterCallback<T> listener) {
    print("Registered event " + event);
    if (_registry.containsKey(event)) {
      _registry[event]!.add(listener);
      return;
    }
    _registry[event] = [listener];
  }

  void emit(String event, T data) {
    print("Emitted event: " + event);
    if (!_registry.containsKey(event)) {
      return;
    }
    for (var cb in _registry[event]!) {
      cb(data);
    }
  }
}
