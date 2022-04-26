class Event<T> {
  factory Event(T rawEvent) {
    return Event._(rawEvent, false);
  }

  factory Event.initialize() {
    return const Event._(null, true);
  }

  const Event._(this._rawEvent, this._isInitial);

  final T? _rawEvent;
  final bool _isInitial;

  void call(void Function(T rawEvent) invoke) {
    if (!_isInitial) invoke(_rawEvent as T);
  }
}
