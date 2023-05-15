import 'list_extension.dart';

extension SetExtension<E> on Set<E> {
  // from GetX

  /// Add [item] to [List<E>] only if [item] is not null.
  // void addNonNull(E item) {
  //   if (item != null) add(item);
  // }

  /// Add [Iterable<E>] to [List<E>] only if [Iterable<E>] is not null.
  // void addAllNonNull(Iterable<E> item) {
  //   if (item != null) addAll(item);
  // }

  /// Add [item] to [List<E>] only if [condition] is true.
  void addIf(dynamic condition, E item) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) add(item);
  }

  /// Adds [Iterable<E>] to [List<E>] only if [condition] is true.
  void addAllIf(dynamic condition, Iterable<E> items) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) addAll(items);
  }

  /// Replaces all existing items of this list with [item]
  void assign(E item) {
    clear();
    add(item);
  }

  /// Replaces all existing items of this list with [items]
  void assignAll(Iterable<E> items) {
    clear();
    addAll(items);
  }
}
