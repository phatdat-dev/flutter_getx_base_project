import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

// https://flutter.github.io/samples/web/material_3_demo/#/
class ThemeConfig with ColorConstants {
  ThemeData get lightTheme => ThemeData.light().copyWith(
        // useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: ColorConstants.pink800,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorConstants.pink500,
        ),

        popupMenuTheme: const PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //side: const BorderSide(color: Colors.pink)
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //side: const BorderSide(color: Colors.pink)
          ),
          //shadowColor: MaterialStateProperty.all<Color>(Colors.red),
          //elevation: MaterialStateProperty.all<double>(0),
          // backgroundColor: ColorConstants.pink800, //background
        )),
      );

  ThemeData get dartTheme => ThemeData.dark(
      // useMaterial3: true,
      );
}
