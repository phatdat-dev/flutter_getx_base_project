//Searching List<List<T>> in Dart
extension FlattenFind<T extends Comparable> on Iterable<Iterable<T>> {
  bool containsElement(T value) {
    for (final arr in this) {
      if (arr.contains(value)) return true;
    }
    return false;
  }
}