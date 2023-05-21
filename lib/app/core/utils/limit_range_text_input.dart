import 'package:flutter/services.dart';

import '/app/core/utils/extension/app_extension.dart';

class LimitRangeTextInput extends TextInputFormatter {
  LimitRangeTextInput({
    required this.minRange,
    required this.maxRange,
  }) : assert(minRange <= maxRange);

  final double minRange;
  final double maxRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int count = 0;
    for (int i = 0; i < newValue.text.length; i++) {
      if (newValue.text[i] == '.') {
        count++;
      }
      if (count == 2) return oldValue;
    }

    //neu nhap dau' thap phan (.) giua~ chung` ma` phia' sau ko co' so' thi` tra? ve` dau' . con` nguyen vi tri' ko thay doi?
    final arrayS = newValue.text.split('.');

    if (arrayS.last.isEmpty) return newValue;
    //ep' kieu?, format so'

    var value = newValue.text.toDouble();
    if (value < minRange) return TextEditingValue(text: '$minRange');

    // return value > maxRange ? oldValue : newValue;
    if (value > maxRange) {
      final format = maxRange.formatNumber();
      return oldValue.copyWith(text: format, selection: TextSelection.collapsed(offset: format.length));
    }
    String format;
    try {
      format = value.formatNumber();
    } catch (e) {
      format = '';
    }
    return newValue.copyWith(text: format, selection: TextSelection.collapsed(offset: format.length));
  }
}
