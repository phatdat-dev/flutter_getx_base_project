import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '/app/modules/authentication/controllers/authentication_controller.dart';
import '/generated/locales.g.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../views/authentication_view.dart';

class ForgotPasswordTapWidget extends GetView<AuthenticationController> {
  const ForgotPasswordTapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formForgotPasswordKey,
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        physics: const BouncingScrollPhysics(), //remove Glow effect
        children: <Widget>[
          FormBuilderTextField(
            name: 'email',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: CustomPrefixIconWidget(
                icon: SvgPicture.asset(
                  'assets/svg/google-plus.svg',
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                color: Colors.red,
              ),
              // suffixIcon: Icon(
              //   Icons.check_circle,
              //   color: Colors.black26,
              // ),
              labelText: LocaleKeys.Email.tr,
              // hintStyle: const TextStyle(color: Colors.yellow),
              filled: true,
              fillColor: Colors.lightBlueAccent.withOpacity(0.1),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 163.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () => controller.onForgotPassword(),
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}
