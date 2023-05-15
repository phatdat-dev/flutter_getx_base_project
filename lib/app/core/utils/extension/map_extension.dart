import 'list_extension.dart';

extension MapExtension<K, V> on Map<K, V> {
  Iterable<MapEntry<K, V>> _filterr(bool Function(MapEntry<K, V> entry) f) sync* {
    for (final entry in entries) {
      if (f(entry)) yield entry;
    }
  }

  //get list value with key
  List<V> getValues(List<K> keys) => keys.map((key) => this[key]!).toList();
  //get map value with key
  Map<K, V> getMap(List<K> keys) => Map.fromEntries(_filterr((entry) => keys.contains(entry.key)));

  //filter
  Map<K, V> filter(bool Function(K key, V value) test) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (test(entry.key, entry.value)) result[entry.key] = entry.value;
    }
    return result;
  }

  //insert index
  void insert({required int index, required K key, required V value}) {
    final result = <K, V>{};
    var i = 0;
    for (final entry in entries) {
      if (i == index) result[key] = value;
      result[entry.key] = entry.value;
      i++;
    }
    clear();
    addAll(result);
  }

  /// * if [addNew] is true, add new key
  ///
  /// * if [noCopyIfIsEmpty] is true, not copy if value is empty
  ///
  /// example:
  /// ```dart
  /// final map = {"1": "key1", "2": "key2"};
  /// final copy = {"1": "newKey1", "3": "addNewKey","empty":""};
  /// final result1 = map.copyWith(copy, addNew: true, noCopyIfIsEmpty: true);
  /// // {"1": "newKey1", "2": "key2", "3": "addNewKey"}
  /// final result2 = map.copyWith(copy, addNew: false, noCopyIfIsEmpty: true);
  /// // {"1": "newKey1", "2": "key2"}
  /// final result3 = map.copyWith(copy, addNew: true, noCopyIfIsEmpty: false);
  /// // {"1": "newKey1", "2": "key2", "3": "addNewKey", "empty": ""}
  /// final result4 = map.copyWith(copy, addNew: false, noCopyIfIsEmpty: false);
  /// // {"1": "newKey1", "2": "key2"}
  /// ```
  ///
  Map<K, V> copyWith(Map<K, V> copy, {bool addNew = false, bool noCopyIfIsEmpty = false}) {
    final result = Map<K, V>.from(this);
    for (final entry in copy.entries) {
      if (!(noCopyIfIsEmpty && (entry.value == null || entry.value == '')) && (containsKey(entry.key) || addNew)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  /// return key of element index
  /// ```dart
  /// final mapData = {
  ///   "index1": "value1",
  ///   "index2": "value2",
  ///   "index3": "value3",
  ///   "index4": "value4",
  ///   "index5": "value5",
  /// };
  /// // swap data
  /// final keyOfIndex = mapData.keyOfIndex(3); //"index4"
  /// final removeIndex = mapData.remove(keyOfIndex!); //"value4"
  /// final newInsert = mapData.insert(index: 0, key: keyOfIndex, value: removeIndex!); //
  /// print(newInsert);// {"index4": "value4", "index1": "value1", "index2": "value2", "index3": "value3", "index5": "value5"}
  ///  ```
  K? keyOfIndex(int index) {
    if (index < 0 || index >= length) return null;
    return keys.elementAt(index);
  }

  // from GetX

  void addIf(dynamic condition, K key, V value) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) {
      this[key] = value;
    }
  }

  void addAllIf(dynamic condition, Map<K, V> values) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) addAll(values);
  }

  void assign(K key, V val) {
    clear();
    this[key] = val;
  }

  void assignAll(Map<K, V> val) {
    if (this == val) return;
    clear();
    addAll(val);
  }
}
