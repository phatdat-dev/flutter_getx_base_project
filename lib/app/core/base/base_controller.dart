import 'package:flutter_getx_base_project/app/core/base/base_project.dart';
import 'package:get/get.dart';

export '../config/api_url.dart';

abstract class BaseController extends GetxController {
  BaseConnect get apiCall => Get.find<BaseConnect>();
}
