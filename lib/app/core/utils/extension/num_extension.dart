import 'package:intl/intl.dart';

extension NumExtension on num {
  // Vietnam
  // NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 2).format(10000) //10.000,00 ₫
  // NumberFormat.simpleCurrency(name: 'VND', decimalDigits: 2).format(10000) //₫10,000.00

  // String formatNumberMoney([String? symbol]) => NumberFormat.currency(customPattern: '#,### \u00a4', symbol: symbol, decimalDigits: 5).format(this);
  String formatNumber() => NumberFormat('#,###', 'en_US').format(this);
  String formatNumberCompact() => NumberFormat.compact(locale: 'en_US').format(this);
}
