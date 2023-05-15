typedef Condition = bool Function();

extension ListExtension<E> on List<E> {
  /// Provide access to the generic type at runtime.
  Type get subType => E;
  // Type typeOfElementsInList<T>(List<E> e) => T;

  //[100,5,2].reduce(plus);   //=107
  T plus<T extends num>(T first, T second) => (first + second) as T;
  //[100,5,2].reduce(minus);   //=97
  T minus<T extends num>(T first, T second) => (first - second) as T;
  //[100,5,2].reduce(multiphy);   //=1000
  T multiphy<T extends num>(T first, T second) => (first * second) as T;
  //[100,5,2].reduce(divide);   //=10
  T divide<T extends num>(T first, T second) {
    // ignore: unnecessary_type_check
    return ((first ~/ second) is int) ? (first ~/ second) as T : (first / second) as T;
  }
}
