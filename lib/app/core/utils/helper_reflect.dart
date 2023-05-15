// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../custom/other/search_controller_custom.dart';
import '../base/base_project.dart'; //sort AZ

class HelperReflect {
  //muon su dung ham` nay` thi` phai co' reflectable moi xai dc
  static void search<T>(
      {required Iterable<T> listOrigin, required ValueNotifier<List<T>> listSearch, required String nameModel, required String keywordSearch}) {
    keywordSearch = keywordSearch.toLowerCase().trim();
    var newList = listOrigin.where((element) {
      String? insMirror;
      if ((element is SearchDelegateQueryName) && nameModel == 'queryName') {
        insMirror = element.queryName;
      } else {
        final splitt = nameModel.split('??');
        for (var s in splitt) {
          if (element is BaseModel) {
            insMirror = (element).toJson()[s.trim()] as String?;
          } else {
            insMirror = (element as dynamic).toJson()[s.trim()] as String?;
          }
          if (insMirror?.isNotEmpty ?? false) break;
        }
      }
      return insMirror?.toLowerCase().contains(keywordSearch) ?? false;
    }).toList();
    listSearch.value = newList;
  }

  static void sortAZ<T>({required ValueNotifier<bool> isSort, required String nameModelSortAZ, required ValueNotifier<List<T>> listSearch}) {
    (isSort.value)
        ? listSearch.value.sort((a, b) {
            final insMirrorA = (a as BaseModel).toJson()[nameModelSortAZ] as String;
            final insMirrorB = (b as BaseModel).toJson()[nameModelSortAZ] as String;
            return compareNatural(insMirrorA, insMirrorB);
          })
        : listSearch.value.sort((a, b) {
            final insMirrorA = (a as BaseModel).toJson()[nameModelSortAZ] as String;
            final insMirrorB = (b as BaseModel).toJson()[nameModelSortAZ] as String;
            return compareNatural(insMirrorB, insMirrorA);
          });
    isSort.value = !isSort.value;

    // listSearch.refresh();
  }
}
