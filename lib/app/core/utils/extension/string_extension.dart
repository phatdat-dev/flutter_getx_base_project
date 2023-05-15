import 'dart:convert';
import 'dart:math';

extension StringExtension on String {
  bool get isHexColor => RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(this);

  int toInt() => int.tryParse(replaceAll(',', '')) ?? 0;

  double toDouble() => double.tryParse(replaceAll(',', '')) ?? 0;

  num? toNumber() => num.tryParse(replaceAll(',', ''));
  //random String
  static String randomString(int length) {
    var random = Random();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64UrlEncode(values);
  }

  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
