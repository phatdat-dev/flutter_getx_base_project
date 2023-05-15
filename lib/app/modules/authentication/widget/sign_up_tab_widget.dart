part of '../views/authentication_view.dart';

class SignUpTapWidget extends GetView<AuthenticationController> {
  const SignUpTapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formSignUpKey,
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        physics: const BouncingScrollPhysics(), //remove Glow effect
        children: <Widget>[
          ...buildTextField_UserNamePassWord(),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: 'confirmPassword',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: CustomPrefixIconWidget(
                icon: const Icon(Icons.vpn_key, color: Colors.white),
                color: Colors.blueAccent.withOpacity(0.5),
              ),
              // suffixIcon: Icon(
              //   Icons.check_circle,
              //   color: Colors.black26,
              // ),
              labelText: LocaleKeys.ConfirmPassword.tr,
              // hintStyle: const TextStyle(color: Colors.yellow),
              filled: true,
              fillColor: Colors.lightBlueAccent.withOpacity(0.1),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(height: 15.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () => controller.onSignUp(),
              child: Text(LocaleKeys.SignUp.tr),
            ),
          ),
        ],
      ),
    );
  }
}
