import 'package:get/get.dart';

import '/app/core/base/base_project.dart';

export '../config/api_url.dart';

abstract class BaseController extends GetxController {
  BaseConnect get apiCall => Get.find<BaseConnect>();
}
