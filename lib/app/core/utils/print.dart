// ignore_for_file: avoid_print
//https://stackoverflow.com/questions/54018071/how-to-call-print-with-colorful-text-to-android-studio-console-in-flutter
import 'dart:developer';

class Printt {
  static void defaultt(Object? object) => log('$object');
  static void black(Object? object) => log('\x1B[30m$object\x1B[0m');
  static void red(Object? object) => log('\x1B[31m$object\x1B[0m');
  static void green(Object? object) => log('\x1B[32m$object\x1B[0m');
  static void yellow(Object? object) => log('\x1B[33m$object\x1B[0m');
  static void blue(Object? object) => log('\x1B[34m$object\x1B[0m');
  static void magenta(Object? object) => log('\x1B[35m$object\x1B[0m');
  static void cyan(Object? object) => log('\x1B[36m$object\x1B[0m');
  static void white(Object? object) => log('\x1B[37m$object\x1B[0m');
  static void reset(Object? object) => log('\x1B[38m$object\x1B[0m');
}
