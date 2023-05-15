import 'package:flutter/material.dart';


extension TextEditingControllerExtension on TextEditingController {
  void selectionAll() {
    if (selection.extentOffset != text.length) selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}