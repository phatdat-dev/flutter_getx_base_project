part of '../views/authentication_view.dart';

class SignInTabWidget extends GetView<AuthenticationController> {
  const SignInTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formSignInKey,
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        physics: const BouncingScrollPhysics(), //remove Glow effect
        children: <Widget>[
          ...buildTextField_UserNamePassWord(),
          const SizedBox(height: 15.0),
          StatefulBuilder(
              builder: (context, setState) => CheckboxListTile(
                    activeColor: Colors.green,
                    title: Text(LocaleKeys.RememberPassword.tr),
                    value: controller.isRememberPassword,
                    onChanged: (value) => setState(() => controller.isRememberPassword = value!),
                  )),
          const SizedBox(height: 15.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () => controller.onSignIn(),
              child: Text(LocaleKeys.SignIn.tr),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildTextField_UserNamePassWord() {
  bool isVisiblePassword = true;
  return [
    FormBuilderTextField(
      name: 'email',
      initialValue: 'email@gmail.com', //
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: CustomPrefixIconWidget(
          icon: const Icon(Icons.email, color: Colors.green),
          color: Colors.greenAccent.withOpacity(0.5),
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
      // style: TextStyle(color: Theme.of(context).colorScheme.primary),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    ),
    const SizedBox(height: 15.0),
    StatefulBuilder(
        builder: (context, setState) => FormBuilderTextField(
              name: 'password',
              initialValue: 'password',
              obscureText: isVisiblePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: CustomPrefixIconWidget(
                  icon: const Icon(Icons.key, color: Colors.pinkAccent),
                  color: Colors.yellowAccent.withOpacity(0.5),
                ),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => isVisiblePassword = !isVisiblePassword),
                  icon: Icon(
                    isVisiblePassword ? Icons.visibility : Icons.visibility_off,
                    size: 24.0,
                  ),
                ),
                labelText: LocaleKeys.Password.tr,
                // hintStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.lightBlueAccent.withOpacity(0.1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            )),
  ];
}
