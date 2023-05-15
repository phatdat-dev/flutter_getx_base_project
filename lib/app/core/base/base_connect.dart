import 'dart:async';
import 'dart:convert';

import 'package:flutter_getx_base_project/app/core/config/api_url.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '/app/core/base/base_model.dart';
import '/app/core/utils/utils.dart';
import '/app/custom/widget/loadding_widget.dart';
import '/app/modules/authentication/controllers/authentication_controller.dart';
import '../constants/app_constant.dart';

// ignore: constant_identifier_names
enum RequestMethod { GET, POST, PUT, DELETE }

class BaseConnect extends GetConnect {
  int get requestAgainSecond => 10; //neu request loi~ thi` se tu dong goi call api sau khoang thoi gian nao` do'
  int get timeOutSecond => 60;
  bool isShowLoading = true;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = ApiUrl.base_url;
    httpClient.timeout = Duration(seconds: timeOutSecond);
    // httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  FutureOr<Request> requestInterceptor(Request request) async {
    request.headers['Authorization'] = 'Bearer ${AuthenticationController.userAccount?.token}';

    request.headers['Accept'] = 'application/json, text/plain, */*';
    request.headers['Charset'] = 'utf-8';
    // request.headers['Content-Type'] = 'application/json;charset=UTF-8';

    // tự động mở loadding khi Request
    if (isShowLoading) Loadding.show();
    Printt.yellow("${request.method}:  ${request.url.toString()}                           ------------request");
    return request;
  }

  FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
    // tự động tắt loadding khi có response
    Loadding.dismiss();

    if (response.hasError) {
      handleErrorStatus(response);
      return;
    }

    return response;
  }

  FutureOr<T> onTimeout<T>() {
    throw TimeoutException(
        'Không có phản hồi từ máy chủ trong ${httpClient.timeout.inSeconds} giây, yêu cầu có thể đã được gửi đi, xin hãy kiểm tra lại');
  }

  void handleErrorStatus(Response response) {
    switch (response.statusCode) {
      case 400:
      case 404:
      case 500:
        //
        final Map<String, dynamic> errorMessage = jsonDecode(response.bodyString!);

        String message = '';
        if (errorMessage.containsKey('error') || errorMessage.containsKey('message')) {
          if (errorMessage['error'] is Map) {
            //cho nay` bat' loi~ OpenAI
            message = errorMessage['error']['message'];
          } else {
            message = (errorMessage['message'] ?? errorMessage['error']).toString();
          }
        } else {
          errorMessage.forEach((key, value) {
            if (value is List) {
              message += '${value.join('\n')}\n';
            } else {
              message += value.toString();
            }
          });
        }
        HelperWidget.showToast('CODE (${response.statusCode}):\n$message');
        Printt.red(message);
        break;
      case 401:
        //401: Print token expired
        String message = 'CODE (${response.statusCode}):\n${response.statusText}';
        HelperWidget.showToast(message);
        Printt.red(message);
        AuthenticationController.userAccount = null;
        //Remove token
        Global.sharedPreferences.remove(StorageConstants.userAccount);
        Get.toNamed('/authentication');
        break;
      default:
        break;
    }
  }

  // -------------------------

  /// [body] gửi request cho các phương thức POST, PUT, PATCH
  /// 
  /// [queryParam] gửi request dạng queryParam cho các phương thức GET
  /// 
  /// [baseModel] dùng để parse dữ liệu mong muốn trả về
  Future<dynamic> onRequest<T extends BaseModel>(
    String url,
    RequestMethod method, {
    dynamic body,
    BaseModel<T>? baseModel, //muon tra ve kieu du lieu nao` ?, neu null thi` tra? ve` Response
    Map<String, dynamic>? queryParam,
    bool? isShowLoading,
  }) async {
    try {
      this.isShowLoading = isShowLoading ??= true;

      if (body is List<BaseModel>) {
        //cho no' theo kieu? nhu vay` [{},{},{}...]
        body = body.map((e) => e.toJson()).toList();
      } else if (body != null && body is BaseModel) {
        body = body.toJson();
      }

      if (body is FormData) {
        Printt.green(jsonEncode(Map.fromEntries(body.fields)));
      } else {
        Printt.green(jsonEncode(body));
      }

      final res = await request(
        url,
        method.name,
        body: body,
        query: queryParam?.map((key, value) => MapEntry(key, value.toString())),
        decoder: (data) {
          if (baseModel == null) return data; //return Response<dynamic>
          if (data is List) return data.map((e) => baseModel.fromJson(e)).toList();
          if (data is Map<String, dynamic>) return baseModel.fromJson(data);
          return null;
        },
      ).timeout(httpClient.timeout, onTimeout: onTimeout).then((value) {
        Printt.magenta(value.bodyString.toString());
        return value;
      });
      //
      return res.body;
    } on TimeoutException catch (_) {
      HelperWidget.showToast(_.message!);
      // catch timeout here..
    } catch (e) {
      //? tự động gọi lại api
      // return await Future.delayed(
      //     Duration(seconds: requestAgainSecond),
      //     () => onRequest(
      //           url,
      //           method,
      //           body: body,
      //           baseModel: baseModel,
      //           queryParam: queryParam,
      //           isShowLoading: isShowLoading,
      //         ));
    }
    return null;
  }
}
