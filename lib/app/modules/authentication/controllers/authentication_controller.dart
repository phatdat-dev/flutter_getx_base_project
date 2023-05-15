import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../core/base/base_project.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../models/users_model.dart';

class AuthenticationController extends BaseController {
  static UsersModel? userAccount;
  final formSignInKey = GlobalKey<FormBuilderState>();
  final formSignUpKey = GlobalKey<FormBuilderState>();
  final formForgotPasswordKey = GlobalKey<FormBuilderState>();
  bool isRememberPassword = true;

  @override
  void onInit() {
    super.onInit();
    onInitData();
  }

  Future<void> onInitData() async {
    final userAccountString = Global.sharedPreferences.getString(StorageConstants.userAccount);
    if (userAccountString != null) {
      userAccount = UsersModel().fromJson(jsonDecode(userAccountString));
      //set field username, password
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        formSignInKey.currentState?.fields['email']?.didChange(userAccount?.email);
        formSignInKey.currentState?.fields['password']?.didChange(userAccount?.password);
      });
    }
  }

  void onSignIn() {
    if (formSignInKey.currentState?.saveAndValidate() ?? false) {
      apiCall
          .onRequest(
        ApiUrl.post_auth_login(),
        RequestMethod.POST,
        body: formSignInKey.currentState?.value,
        baseModel: UsersModel(),
      )
          .then((result) {
        if (result == null) return;
        userAccount = result as UsersModel;
        //luu lai username, password
        _saveRememberPassword(userAccount!..password = formSignInKey.currentState?.value['password']);

        Get.toNamed('/home');
      });
    }
    // else {
    //   Printt.white(formSignInKey.currentState?.value.toString());
    //   Printt.white('validation failed');
    // }
  }

  void onSignUp() {
    if (formSignUpKey.currentState?.saveAndValidate() ?? false) {
      apiCall.onRequest(
        ApiUrl.post_auth_register(),
        RequestMethod.POST,
        body: {
          ...formSignUpKey.currentState!.value,
        },
      ).then((result) {
        if (result == null) return;
        HelperWidget.showSnackBar(message: result['message']);
      });
    }
  }

  void onSignOut() {
    saveAccount(null);
    Get.toNamed('/authentication');
  }

  void onTryApp() {
    Get.toNamed('/home');
  }

  void saveAccount(UsersModel? user) {
    (user == null)
        ? Global.sharedPreferences.remove(StorageConstants.userAccount)
        : Global.sharedPreferences.setString(StorageConstants.userAccount, jsonEncode(user.toJson()));
  }

  void _saveRememberPassword(UsersModel user) {
    isRememberPassword ? saveAccount(user) : saveAccount(null);
  }

  void onForgotPassword() {
    if (formForgotPasswordKey.currentState?.saveAndValidate() ?? false) {}
  }
}
