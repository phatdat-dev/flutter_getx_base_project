import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../controllers/authentication_controller.dart';
import '../widget/forgot_password_tab_widget.dart';

part '../widget/custom_prefix_icon_widget.dart';
part '../widget/sign_in_tab_widget.dart';
part '../widget/sign_up_tab_widget.dart';
part '../widget/social_icon_widget.dart';
part '../widget/wave_clipper.dart';
part '../widget/wave_draw_clippath_widget.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> with SingleTickerProviderStateMixin {
  late final AuthenticationController controller;
  late final TabController tabController;
  late final List<Tab> listTabBar;

  @override
  void initState() {
    // Printt.white("init AuthenticationView");
    listTabBar = [
      Tab(text: LocaleKeys.SignIn.tr),
      Tab(text: LocaleKeys.SignUp.tr),
      Tab(text: LocaleKeys.ForgotPassword.tr),
    ];
    tabController = TabController(length: listTabBar.length, vsync: this);
    //
    controller = Get.find<AuthenticationController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 10.0;
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            // FractionallySizedBox(
            //   heightFactor: 0.5,
            //   child: Container(
            //     color: Theme.of(context).colorScheme.primary,
            //   ),
            // ),
            const WaveDrawClipPathWidget(title: 'Authenication'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(borderRadius), boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade50,
                        offset: const Offset(5, 5),
                        blurRadius: 10,
                        // spreadRadius: 5,
                        // blurStyle: BlurStyle.normal,
                      )
                    ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(borderRadius),
                              topRight: Radius.circular(borderRadius),
                            ),
                          ),
                          child: TabBar(
                            // onTap: (index) {},
                            isScrollable: true,
                            controller: tabController,
                            indicatorColor: Colors.green,
                            indicatorSize: TabBarIndicatorSize.label,
                            //duong` vien`
                            // indicator: BoxDecoration(
                            //   color: ColorConstants.blue100,
                            //   borderRadius: BorderRadius.circular(100),
                            //   border: Border.all(color: ColorConstants.blue100),
                            // ),
                            labelColor: Theme.of(context).colorScheme.primary,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            unselectedLabelColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5),
                            tabs: listTabBar,
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: TabBarView(
                            controller: tabController,
                            children: const [
                              SignInTabWidget(),
                              SignUpTapWidget(),
                              ForgotPasswordTapWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.DoYouWantToTryIt.tr, style: const TextStyle(fontSize: 12)),
                      TextButton(
                        child: Text(LocaleKeys.TryNow.tr, style: const TextStyle(fontSize: 14)),
                        onPressed: () => controller.onTryApp(),
                      ),
                    ],
                  ),
                  const OrDivider(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialIcon(
                          colors: const [
                            Color(0xFF102397),
                            Color(0xFF187adf),
                            Color(0xFF00eaf8),
                          ],
                          iconURL: 'assets/svg/facebook.svg',
                          onPressed: () async {},
                        ),
                        SocialIcon(
                          colors: const [
                            Color(0xFF17ead9),
                            Color(0xFF6078ea),
                          ],
                          iconURL: 'assets/svg/twitter.svg',
                          onPressed: () {
                            print('twitter');
                          },
                        ),
                        SocialIcon(
                          colors: const [
                            Color(0xFFff4f38),
                            Color(0xFFff355d),
                          ],
                          iconURL: 'assets/svg/google-plus.svg',
                          onPressed: () async {},
                        ),
                        SocialIcon(
                          colors: const [
                            Color(0xFF00c6fb),
                            Color(0xFF005bea),
                          ],
                          iconURL: 'assets/svg/github.svg',
                          onPressed: () {
                            print('github');
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width * 0.8,
      child: const Row(
        children: [
          Expanded(
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
