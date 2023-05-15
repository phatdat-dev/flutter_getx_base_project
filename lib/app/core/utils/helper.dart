import 'dart:convert';
import 'dart:math';

// import 'package:collection/collection.dart'; //sort AZ
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Helper {
  static String tryFormatDateTime(String dateString) {
    if (dateString.isEmpty) {
      return '';
    }
    var inputDate = DateTime.tryParse(dateString);
    if (inputDate == null) return dateString;
    String output = DateFormat('dd-MM-yyyy').format(inputDate);
    return output;
  }

  //limitShowList
  static void limitShowList(List list, [int limit = 5]) => (list.length > limit) ? list.removeRange(limit, list.length) : null;

  static Color get randomColor => Colors.primaries[Random().nextInt(Colors.primaries.length)];
  // static Color get randomColorAccents => Colors.accents[Random().nextInt(Colors.accents.length)];
  static num randomNumber({num min = 0, required num max}) {
    if (max is double || min is double) {
      return min.toDouble() + Random().nextDouble() * (max.toDouble() - min.toDouble());
    }
    return min.toInt() + Random().nextInt(max.toInt() - min.toInt());
  }

  //List.separated count,generator,separator
  //input: cout=> 7, generator=> 1 , separator=> 0
  //output: [1,0,1,0,1,0,1]
  static List<T> listGenerateSeparated<T>(int count, {required T Function(int index) generator, required T Function(int index) separator}) {
    final List<T> list = [];
    for (int i = 0; i < count; i++) {
      list.add(generator(i));
      if (i < count - 1) {
        list.add(separator(i));
      }
    }
    return list;
  }

  static Future<dynamic> readFileJson(String assets) async => jsonDecode(await rootBundle.loadString(assets));

  static bool containsToLowerCase(String? source, String? target) {
    if (source == null || target == null) return false;
    return source.toLowerCase().contains(target.toLowerCase());
  }

  static String generateIdFromDateTimeNow() => DateFormat('yyyyMMddHHmmssSSS').format(DateTime.now());

  static List<Map<String, dynamic>> convertToListMap(List<dynamic> list) =>
      List<Map<String, dynamic>>.from(list.map((e) => Map<String, dynamic>.from(e)));
}
