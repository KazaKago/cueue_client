extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }

  Iterable<R> mapNotNull<R>(R? Function(T) f) sync* {
    for (final item in this) {
      final result = f(item);
      if (result != null) {
        yield result;
      }
    }
  }
}
