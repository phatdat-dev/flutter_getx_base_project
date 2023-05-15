import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../constants/app_constant.dart';

// get generate locales assets/translations
//nguồn: https://viblo.asia/p/getx-flutter-multiple-language-support-with-getx-part-3-GrLZDDqBZk0
class TranslationService extends Translations {
  // locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static Locale? locale = Get.deviceLocale;
  // fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('en', 'US');
  // các Locale được support
  static const locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
    Locale('ja', 'JP'),
  ];

  // function change language
  static void changeLocale(Locale localeee) {
    Get.updateLocale(localeee);
    locale = localeee;
    Global.sharedPreferences.setString(StorageConstants.langCode, localeee.languageCode);
  }

  static Future<Locale?> getLocaleFromLanguage() async {
    final langCode = Global.sharedPreferences.getString(StorageConstants.langCode);

    if (langCode == null) return Get.deviceLocale;

    for (int i = 0; i < locales.length; i++) {
      if (langCode == locales[i].languageCode) return locales[i];
    }

    return Get.deviceLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
